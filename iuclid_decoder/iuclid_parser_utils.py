
import xml.etree.ElementTree as ET
import pandas as pd
import numpy as np
from typing import List, Dict, Tuple, Set
import structlog
import os
from zipfile import ZipFile
import tqdm
import xml.dom.minidom as minidom
from io import StringIO
from collections import defaultdict
import warnings
import math
import sqlite3
from sqlite3 import Error

log = structlog.get_logger()

warnings.filterwarnings("ignore", category=DeprecationWarning)

def unzip_i6z_files(path: str):
    """
    Unzips .i6z files in the specified directory. Extracted files are placed in a path + '_unzipped' folder 
    with a corresponding subfolder for each .i6z file.
    """
    dir_list: List[str] = os.listdir(path)
    for z in tqdm.tqdm(dir_list):
        if ".i6z" not in z:
            log.warn("Not a zip file: ", file=z)
            continue
        joined_path = os.path.join(path, z)
        with ZipFile(joined_path, "r") as zObject:
            folder_name = z.replace(".i6z", "")
            zObject.extractall(path=os.path.join(path + "_unzipped", folder_name))


def check_if_exists(elements: List) -> str:
    """
    Checks if a list of XML elements is not empty, and if so, returns the text of the first element.
    Returns an empty string if the list is empty.
    """
    if elements:
        return str(elements[0].text)
    return ""


def find_info_in_manifest_per_doc(document: ET.Element, name_space: Dict[str, str]) -> List[str]:
    """
    Extracts specific chemical information (name, IUPAC-name, CAS-number, inventory-number) from the given document.
    """
    infos_names = ["name", "IUPAC-name", "CAS-number", "inventory-number"]
    infos: List[str] = ["", "", "", ""]
    representation = document.findall("manifest:representation", name_space)[0]
    parent = representation.findall("manifest:parent", name_space)
    if not parent:
        return infos
    infos[0] = check_if_exists(parent[0].findall("manifest:name", name_space)) # Find the name of the substance
    ref_substance_lst = representation.findall("manifest:reference-substance", name_space)
    if not ref_substance_lst:
        return infos
    ref_substance = ref_substance_lst[0] # Get the reference substance
    for i, info_name in enumerate(infos_names):
        if i == 0:
            continue
        infos[i] = check_if_exists(ref_substance.findall(f"manifest:{info_name}", name_space)) # For the reference substance find the IUPAC-name, CAS-number, inventory-number
    return infos


def find_info_in_manifest_per_doc_reference(document: ET.Element, name_space: Dict[str, str]) -> List[str]:
    """
    Extracts reference-specific chemical information (IUPAC-name, CAS-number, inventory-number) 
    from the given document.
    """
    infos_names = ["IUPAC-name", "CAS-number", "inventory-number"]
    infos: List[str] = ["", "", ""]
    representation = document.findall("manifest:representation", name_space)[0]
    if len(representation)==0:
        return infos
    for i, info_name in enumerate(infos_names):
        infos[i] = check_if_exists(representation.findall(f"manifest:{info_name}", name_space))
    return infos


def create_manifest_df(dir_name: str, name_space: Dict[str, str], subtype: str) -> pd.DataFrame:
    """
    Creates a DataFrame containing information provided in the manifest file. The unzipped reach study results 
    contain a folder for each substance and each folder contains a manifest XML file. The manifest file 
    contains top-level metadata for a substance and contains a table of contents of all the data files that 
    are available in the folder.
    """
    manifest_col_to_values: Dict[str, List] = defaultdict(list)
    tree = ET.parse(dir_name) # Parse the manifest XML file
    contained_docs = tree.findall("manifest:contained-documents", name_space)[0] # Get the metadata of all the documents and attachments included in the folder
    for doc in contained_docs:
        subtypes = doc.findall("manifest:subtype", name_space)
        for st in subtypes:
            # Find information (name, IUPAC-name, CAS-number, inventory-number, references) in the manifest for a given subtype
            if st.text == subtype:
                manifest_col_to_values["subtype"].append(str(st.text))
                long_id = doc.findall("manifest:name", name_space)
                manifest_col_to_values["long_id"].append(str(long_id[0].get("{http://www.w3.org/1999/xlink}href")))
                infos = find_info_in_manifest_per_doc(document=doc, name_space=name_space)
                col_names = ["chemical_name", "iupac_name", "cas", "inventory_num"]
                for i, col_name in enumerate(col_names):
                    manifest_col_to_values[col_name].append(infos[i])
                links = doc.findall("manifest:links", name_space)
                sublink = links[0].findall("manifest:link", name_space)
                refs: List[str] = []
                for elem in sublink:
                    reftype = elem.findall("manifest:ref-type", name_space)[0].text
                    if reftype == "REFERENCE":
                        reference = elem.findall("manifest:ref-uuid", name_space)[0].text
                        refs.append(str(reference))
                manifest_col_to_values["reference"].append(refs)
    # For each reference we retrieve the ref_uuids which are the references to documents containing information on 
    # test_material_information (references are references to all related documents)
    for references in manifest_col_to_values["reference"]:
        uuids: List[str] = []
        for ref in references:
            for doc in contained_docs:
                if (
                    doc.get("id") == ref
                    and doc.findall("manifest:type", name_space)[0].text == "TEST_MATERIAL_INFORMATION"
                ):
                    links = doc.findall("manifest:links", name_space)[0].findall("manifest:link", name_space)
                    for link in links:
                        reftype = link.findall("manifest:ref-type", name_space)[0].text
                        if reftype == "REFERENCE":
                            uuid = str(link.findall("manifest:ref-uuid", name_space)[0].text)
                            uuids.append(uuid)
        manifest_col_to_values["ref_uuids"].append(uuids)
    # For each ref_uuid (so for each reference substance) we get the IUPAC-name, CAS-number, and inventory-number
    for uuids in manifest_col_to_values["ref_uuids"]:
        ref_infos_lsts: List[List[str]] = [[], [], []]
        if len(uuids) > 0:
            for uuid in uuids:
                for doc in contained_docs:
                    if (
                        doc.get("id") == uuid
                        and doc.findall("manifest:type", name_space)[0].text == "REFERENCE_SUBSTANCE"
                    ):
                        ref_infos = find_info_in_manifest_per_doc_reference(document=doc, name_space=name_space)
                        for i, ref_infos_lst in enumerate(ref_infos_lsts):
                            ref_infos_lst.append(ref_infos[i])
        col_names = ["ref_iupac_name", "ref_cas", "ref_inventory_num"]
        for i, col_name in enumerate(col_names):
            result = ", ".join(ref_infos_lsts[i])
            manifest_col_to_values[col_name].append(result)
    manifest_df = pd.DataFrame.from_dict(manifest_col_to_values)
    return manifest_df


def check_tag_of_children(input: ET.Element) -> List[str]:
    """Returns a list of child tags from a given XML element"""
    return [child.tag.split("}")[1] for child in input]


def get_topics(results: Dict[str, List[str]]) -> List[str]:
    """Extracts unique topics from the result keys by splitting them at the first underscore."""
    return list({key.split("_")[0] for key in list(results.keys())})


def get_values(
    previous_element: List[ET.Element],
    name_space: Dict[str, str],
    nspace: str,
    tags: List[str],
    code_to_decoded: Dict[str, str],
    sub_col_name_decode: List[str],
    prev_element_str: str,
    results: Dict[str, List[str]],
    subtype: str,
) -> Dict[str, List[str]]:
    """
    Recursively navigates through a nested XML element tree to extract values based on specified tags. The values 
    are stored and returned in the results dictionary.
    """
    prev_element_str = prev_element_str + "_" + str(previous_element).split("}")[1].split("'")[0]
    if len(tags) == 0: # If there are no tags left to process, return the current results
        return results
    for tag in set(tags):
        element = previous_element[0].findall(f"{nspace}:{tag}", name_space) # Find all child elements matching the current tag
        if len(element) == 0:  # If the element is empty, return the given results
            return results
        elif len(element) > 1:  # If we have multiple children we need to iterate over them recursively
            for elem in element:
                tags = check_tag_of_children(elem)
                results = get_values( # Recursively call get_values for each child element
                    previous_element=[elem],
                    name_space=name_space,
                    nspace=nspace,
                    tags=tags,
                    code_to_decoded=code_to_decoded,
                    sub_col_name_decode=sub_col_name_decode,
                    prev_element_str=prev_element_str,
                    results=results,
                    subtype=subtype,
                )
        elif element[0]: # If a single element is found, continue processing its children
            tags = check_tag_of_children(element[0])
            results = get_values( # Recursion
                previous_element=element,
                name_space=name_space,
                nspace=nspace,
                tags=tags,
                code_to_decoded=code_to_decoded,
                sub_col_name_decode=sub_col_name_decode,
                prev_element_str=prev_element_str,
                results=results,
                subtype=subtype,
            )
        else:  # If we've reached an element without children, process the key and value in the results dictionary
            replace = [f"_ENDPOINT_STUDY_RECORD.{subtype}_", "_entry", "_value"]
            for item in replace:
                prev_element_str = prev_element_str.replace(item, "")
            key = (prev_element_str + "_" + tag).lower()
            value = str(element[0].text)

            # If we have multiple results for a given key of a topic, make sure that the lists of values are all of equal length
            if key not in list(results.keys()):
                results[key] = [value]
            else:
                results[key].append(value)
    return results


def get_code_to_decode(dir_list: List[str], subtype: str, directory_to_folders: str) -> Tuple[Dict[str, str], List[str]]:
    """
    The information in the different .i6d files is encoded. For example, instead of listing "guinea pig" 
    as the test element, it says "1952". These encodings are provided for each subtype in the 
    ENDPOINT_STUDY_RECORD-{subtype}.xsl file. This function extracts the decodeings for a given 
    directory list and subtype. The function processes the file to produce a dictionary mapping 
    code to their decoded values and identifies columns that need special decoding. It returns the 
    code-to-decoded dictionary and column names requiring special decoding.
    """
    sub_col_name_decode: List[str] = []
    for d in dir_list:
        code_to_decoded: Dict[str, str] = {}
        current_dir = os.path.join(directory_to_folders, d, f"ENDPOINT_STUDY_RECORD-{subtype}.xsl")

        # Check if the file exists in the directory
        if os.path.exists(current_dir):
            tree = ET.parse(current_dir)
        else:
            continue

        root = tree.getroot()

        # Convert the XSL to a text file
        rough_string = ET.tostring(root, "utf-8")
        reparsed = minidom.parseString(rough_string)
        pretty = reparsed.toprettyxml(indent="\t")
        text_file = StringIO()
        text_file.write(pretty)
        text_file.seek(0)
        data = text_file.read()

        # Process the data to extract a list of code-to-decode mappings
        data_into_list = data.replace("\t", "").split("\n")
        data_lst = [s.strip() for s in data_into_list]
        data_lst = list(filter(None, data_lst))
        data_lst_when = [item for item in data_lst if any(sub in item for sub in ["when"])]
        data_lst_when = [sub.replace("\xa0", " ") for sub in data_lst_when]
        to_remove = [
            '<ns0:when test="',
            "name(.) = '",
            "</ns0:when>",
            ". = '",
            "./i6:value = '",
            "'",
            "./unitCode =",
            "./i6:unitCode =",
        ]
        for item_to_remove in to_remove:
            data_lst_when = [sub.replace(item_to_remove, "") for sub in data_lst_when]
        for item in data_lst_when:
            split = item.split('">')
            if len(split) == 1:
                continue
            code_to_decoded[split[0].lstrip()] = split[1].lstrip()
        nones = ["None", "NaN", "nan"]
        for n in nones:
            code_to_decoded[n] = ""
        
        # Find column names for which we should decode problematic codes - for the other columns we shouldn't decode values below 100
        number_keys = [key for key in list(code_to_decoded.keys()) if key.isdigit()]
        problematic_keys = [key for key in number_keys if int(key) < 100]
        data_template_match_split = data.split("template match=")
        indices: Set[int] = set()
        for problematic_key in problematic_keys:
            search = "'" + '">' + code_to_decoded[problematic_key] + "<"
            item_with_key = [s for s in data_template_match_split if search in s]
            if (len(item_with_key) > 0):
                index_with_key = data_template_match_split.index(item_with_key[0])
                indices.add(index_with_key)
        sub_col_name_decode: List[str] = []
        for index in indices:
            data_match = data_template_match_split[index].split("<tr>")
            data_match_str = data_match[0]
            to_replace_match = ["//xt:", '"', ">", "\t", "\n"]
            for string in to_replace_match:
                data_match_str = data_match_str.replace(string, "")
            data_match_list = data_match_str.split(" | ")
            data_match_list = [s.strip() for s in data_match_list]
            data_match_list = [s.lower() for s in data_match_list]
            sub_col_name_decode = sub_col_name_decode + data_match_list
        return code_to_decoded, sub_col_name_decode 
    return code_to_decoded, sub_col_name_decode


def get_values_for_dir(
    manifest_df: pd.DataFrame,
    name_space: Dict[str, str],
    dir: str,
    directory_to_folders: str,
    subtype: str,
    code_to_decoded: Dict[str, str],
    sub_col_name_decode: List[str],
) -> pd.DataFrame:
    """
    Extracts and decodes data in a specified directory using the manifest DataFrame.
    Returns a DataFrame containing the extracted data for the specified subtype.
    """
    df = pd.DataFrame()
    if subtype not in str(manifest_df["subtype"].values): # Check if the subtype is present in the manifest DataFrame and otherwise return an empty DataFrame
        return df
    
    # Iterate over indices of rows in manifest_df that match the specified subtype
    parameter_indices = manifest_df.index[manifest_df["subtype"] == subtype].tolist()
    for indx in parameter_indices:
        manifest_info = manifest_df[manifest_df.index == indx].to_dict("records")[0]
        id = manifest_df.at[indx, "long_id"] # Get the 'long_id' from the manifest DataFrame
        dir_name = os.path.join(directory_to_folders, dir, id) # Construct the path to the directory containing the XML file with the long_id
        if os.path.exists(dir_name):
            tree = ET.parse(dir_name)
        else:
            continue

        # Extract content for the given subtype from the XML tree
        content = tree.findall("parameter:Content", name_space)
        results_discussion = content[0].findall(f"study_record:ENDPOINT_STUDY_RECORD.{subtype}", name_space)
        tags = check_tag_of_children(results_discussion[0])
        if results_discussion:
            nspace = "study_record"
            results = get_values(
                previous_element=results_discussion,
                name_space=name_space,
                nspace=nspace,
                tags=tags,
                code_to_decoded=code_to_decoded,
                sub_col_name_decode=sub_col_name_decode,
                prev_element_str="",
                results={},
                subtype=subtype,
            )

            # If there are multiple results for a given study, we concatenate the results and other relevant 
            # information into comma seperated strings
            topics = get_topics(results)
            if "resultsanddiscussion" not in topics:
                continue
            keys_in_rad = [key for key in results.keys() if "resultsanddiscussion" in key]
            keys_other = [key for key in results.keys() if "resultsanddiscussion" not in key]
            topics.remove("resultsanddiscussion")
            length_dict = {key: len(value) for key, value in results.items()}
            results_rad = dict((k, results[k]) for k in keys_in_rad if k in results) # create a results dictionary specifically for "resultsanddiscussion"
            length_dict_rad = {key: len(value) for key, value in results_rad.items()}
            max_len_rad = max(length_dict_rad.values())
            keys_with_max_len = [key for key in keys_in_rad if length_dict[key] == max_len_rad]
            keys_with_other_len = [
                key
                for key in list(results.keys())
                if (((length_dict[key] != max_len_rad) & (key in keys_in_rad)) | (key not in keys_in_rad))
                & (length_dict[key] > 1)
            ]
            for k in keys_with_other_len:
                results[k] = [
                    ", ".join([str(elem) for elem in results[k] if elem != "other: "])
                ]  # Sometimes the value is just "other: " so we can remove it
            keys_in_rad_with_len_1 = [key for key in keys_in_rad if length_dict[key] == 1]
            keys_other = keys_other + keys_in_rad_with_len_1
            if max_len_rad > 1:
                results_lst: List[Dict] = []
                for i in range(max_len_rad):
                    current_results = {key: results[key] for key in keys_other}
                    for key in keys_with_max_len:
                        current_results[key] = [results[key][i]]
                    results_lst.append(current_results)
                df_lst: List[pd.DataFrame] = []
                for res in results_lst:
                    df_res = pd.DataFrame(res)
                    df_lst.append(df_res)
                df_index = pd.concat(df_lst, ignore_index=True)
            else:
                df_index = pd.DataFrame(results)
            for col in ["reference", "ref_uuids"]:
                del manifest_info[col]
            manifest_info_df = pd.DataFrame([manifest_info])
            if len(manifest_info_df) != len(df_index):
                manifest_info_df = pd.concat([manifest_info_df] * len(df_index), ignore_index=True)
            df_index = pd.concat([manifest_info_df, df_index], axis=1, join="inner")
        
        # Concatenate the current DataFrame with the accumulated DataFrame
        if len(df) == 0:
            df = df_index
        else:
            df = pd.concat([df, df_index])
    return df


def create_manifest(directory_to_folders: str, name_space: Dict[str, str], dir: str, subtype: str) -> pd.DataFrame:
    """
    Creates a manifest DataFrame by parsing the 'manifest.xml' file in the given directory.
    """
    dir_name = os.path.join(directory_to_folders, dir, "manifest.xml")
    manifest_df = create_manifest_df(dir_name=dir_name, name_space=name_space, subtype=subtype)
    return manifest_df


def get_values_for_dir_list(
    name_space: Dict[str, str],
    dir_list: List[str],
    directory_to_folders: str,
    subtype: str,
) -> pd.DataFrame:
    """
    Iterates over a list of directories, extracts and decodes data from XML files,
    and returns a DataFrame containing all relevant data for the specified subtype.
    """
    list_of_dfs: List[pd.DataFrame] = []
    df = pd.DataFrame()
    code_to_decoded, sub_col_name_decode = get_code_to_decode(dir_list=dir_list, subtype=subtype, directory_to_folders=directory_to_folders) # Get the code-to-decoded mapping and the list of columns that require decoding
    # Iterate over each directory in the list, create a manifest DataFrame for the current directory, and get the values for the directory
    for dir in tqdm.tqdm(dir_list):
        manifest_df = create_manifest(
            dir=dir,
            name_space=name_space,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
        if len(manifest_df) != 0:
            df = get_values_for_dir(
                name_space=name_space,
                dir=dir,
                directory_to_folders=directory_to_folders,
                manifest_df=manifest_df,
                subtype=subtype,
                code_to_decoded=code_to_decoded,
                sub_col_name_decode=sub_col_name_decode,
            )
            list_of_dfs.append(df)

    if len(list_of_dfs) > 0:
        df = pd.concat(list_of_dfs, ignore_index=True) # Concatenate the DataFrames of each directory into a single DataFrame
        df.reset_index(inplace=True, drop=True)

    # Decode the values in the specified columns
    sub_col_name_decode.append("unitcode")
    for col in df.columns:
        for sub_col_decode in set(sub_col_name_decode):
            if (("_" + sub_col_decode) in col) or ((sub_col_decode + "_") in col):
                # Replace all values in the column with their decoded values
                def decode_value(value, mapping):
                    if isinstance(value, str):
                        values = value.split(', ')
                        decoded_values = [mapping.get(val.strip(), val) for val in values]
                        return ', '.join(decoded_values)
                    else:
                        return mapping.get(value, value)
                df[col] = df[col].apply(lambda x: decode_value(x, code_to_decoded))
                continue
    return df


def rename_cols(df: pd.DataFrame) -> pd.DataFrame:
    """
    Rename the columns that were originally named based on the recursion so that they are shorter and better to understand.
    """
    replace = {
        "effectlevels_effectlevel": "effectlevels",
        "durationofadsorptionequilibration": "duration_of_adsorption_equilibration",
        "relatedinformation": "related_info",
        "interpretationofresults": "interpretation_of_results",
        "durationofexposure": "duration_of_exposure",
        "glpcompliancestatement_value": "glp_compliance_statement",
        "limittest_value": "limit_test",
        "testanimals": "test_animals",
        "testmaterials_testmaterialinformation": "testmaterial_info",
        "testmaterialinformation": "testmaterial_info",
        "testtype": "test_type",
        "basedon": "based_on",
        "routeofadministration": "route_of_administration",
        "typeofinhalationexposure": "type_of_inhalation_exposure",
        "exposureduration": "exposure_duration",
        "unitcode": "unit",
        "validitycriteriafulfilled": "validity_criteria_fulfilled",
        "methodtype": "method_type",
        "initialconcmeasured": "initial_conc_measured",
        "concofadsorbedtestmat": "conc_of_adsorbed_test_mat",
        "percentageoforganiccarbon": "percentage_of_organic_carbon",
        "adsorptioncoefficient": "adsorption_coefficient",
        "adsorptionother": "adsorption_other",
        "orgcarbon": "org_carbon",
        "autoflammability": "auto_flammability",
        "atmpressure": "atm_pressure",
        "relativeselfignitiontemperaturesolids_keyresult": "relative_selfignition_temperature_solids_key_result",
        "relativeselfignitiontemperature": "relative_selfignition_temperature",
        "selfignitiontemperatureofdustaccumulation_keyresult": "selfignition_temperature_of_dust_accumulation_key_result",
        "selfignitiontemperatureofdustaccumulation": "selfignition_temperature_of_dust_accumulation",
        "durationofdesorptionequilibration": "duration_of_desorption_equilibration",
        "temperaturesolids": "temperature_solids",
        "objectiveofstudypick": "objective_of_study_pick",
        "metabolitecharacterisationstudies": "metabolite_characterisation_studies",
        "metabolitesidentified": "metabolites_identified",
        "pharmacokineticstudies": "pharmacokinetic_studies",
        "toxicokineticparameters_toxicokineticparameters": "toxicokinetic_parameters",
        "toxicokineticparameters": "toxicokinetic_parameters",
        "transferintoorgans": "transfer_into_organs",
        "totaldepurationduration": "total_depuration_duration",
        "totalexposureuptakeduration": "total_exposure_uptake_duration",
        "watermediatype": "water_media_type",
        "referencesubstancepositivecontrol": "reference_substance_positive_control",
        "testorganismsspecies": "testorganisms_species",
        "calculationbasis": "calculation_basis",
        "concinenvironmentdose": "conc_in_environment_dose",
        "initialtestsubstanceconcentration": "initial_testsubstance_conc",
        "inoculumortestsystem": "inoculum_or_test_system",
        "durationoftestcontacttime": "duration_of_test_contacttime",
        "initialtestsubstanceconcentration": "initial_testsubstance_conc",
        "halflifeofparentcompound50disappearancetimedt50": "halflife_of_parent_compound_50_disappearance_timed_t50",
        "meantotalrecovery": "mean_total_recovery",
        "mineralizationrateinco2": "mineralization_rate_in_co2",
        "boilingpoint_boilingpoint": "boilingpoint",
        "decompositiontemp": "decomposition_temp",
        "effectlevels_efflevel_effectlevel": "effectlevel",
        "effectlevels_efflevel": "effectlevel",
        "targetsystemorgantoxicity_targetsystemorgantoxicity": "targetsystem_organ_toxicity",
        "criticaleffectsobserved": "critical_effects_observed",
        "doseresponserelationship": "doseresponse_relationship",
        "lowesteffectivedoseconc": "lowest_effective_dose_conc",
        "relevantforhumans": "relevant_for_humans",
        "treatmentrelated": "treatment_related",
        "dissociatingproperties": "dissociating_properties",
        "dissociationconstant": "dissociation_constant",
        "percentdistributioninmedia": "percent_distribution_in_media",
        "resultsoftestseriesforexplosives": "results_of_testseries_for_explosives",
        "resultsoftestseriesforexplosives": "results_of_testseries_for_explosives",
        "smallscalepreliminarytests": "smallscale_preliminary_tests",
        "resultsofexvivoinvitrostudy": "results_of_exvivo_invitro_study",
        "irritationcorrosionresults": "irritation_corrosion_results",
        "irritationparameter": "irritation_parameter",
        "negativecontrolsvalid": "negative_controls_valid",
        "positivecontrolsvalid": "positive_controls_valid",
        "vehiclecontrolsvalid": "vehicle_controls_valid",
        "flammablegaseslowerandupperexplosionlimit": "flammable_gases_lower_and_upper_explosion_limit",
        "flammablesolids": "flammable_solids",
        "pyrophoricliquids": "pyrophoric_liquids",
        "relativeairhumidity": "relative_air_humidity",
        "selfheatingsubstancesmixtures": "selfheating_substances_mixtures",
        "inductiontimeh": "induction_time_h",
        "maxtempreached": "max_temp_reached",
        "substancesmixtureswhichincontactwithwateremitflammablegases": "substances_mixtures_which_in_contact_with_water_emit_flammable_gases",
        "identityofevolvedgas": "identity_of_evolved_gas",
        "maxrateofgasrelease": "max_rate_of_gas_release",
        "sustainingcombustibility": "sustaining_combustibility",
        "substancephysicalstate": "substance_physical_state",
        "negcontrvalid": "neg_contr_valid",
        "poscontrvalid": "pos_contr_valid",
        "vehcontrvalid": "veh_contr_valid",
        "metactindicator": "meta_ct_indicator",
        "typeofdistribution": "type_of_distribution",
        "typeofparticletested": "type_of_particle_tested",
        "aerodynamicdiameter": "aerodynamic_diameter",
        "geometricstandarddeviation": "geometric_standard_deviation",
        "particlesizedistribution_distribution": "particlesize_distribution",
        "particlesizedistribution": "particlesize_distribution",
        "henryslawconstanth": "henrys_law_constant_h",
        "dissipationhalflifeofparentcompound": "dissipation_halflife_of_parent_compound",
        "hydrolysisrateconstant": "hydrolysis_rate_constant",
        "totalrecoveryoftestsubstance": "total_recovery_of_test_substance",
        "testorganisms_testorganisms": "testorganisms",
        "effectconcentrations_effectconc": "effect_conc",
        "effectconcentrations": "effect_conc",
        "meltingpoint_meltingpoint": "meltingpoint",
        "testresultoxidisinggases": "testresul_toxidising_gases",
        "testresultsoxidisingliquids": "testresults_oxidising_liquids",
        "testresultsoxidisingsolids": "testresults_oxidising_solids",
        "partitioncoefficienttype": "partitioncoefficient_type",
        "lightspectrumwavelengthinnm": "lightspectrum_wavelength_in_nm",
        "relativelightintensity": "relative_light_intensity",
        "sensitiserforindirectphotolysis": "sensitiser_for_indirect_photolysis",
        "concentrationofsensitiser": "concentration_of_sensitiser",
        "typeofsensitiser": "type_of_sensitiser",
        "dissipationparentcompound": "dissipation_parent_compound",
        "spectrumofsubstance": "spectrum_of_substance",
        "durationoftestatgiventestcondition": "duration_of_test_at_given_test_condition",
        "degradationrateconstant": "degradation_rateconstant",
        "degradation_degradationpercent": "degradation_percent",
        "dissipationhalflife_halflife": "dissipation_halflife",
        "dissipationhalflife": "dissipation_halflife",
        "durationoftreatmentexposure": "duration_of_treatment_exposure",
        "inchemicotestsystem": "in_chemico_test_system",
        "positivecontrol": "positive_control",
        "negativecontrol": "negative_control",
        "detailstestsystem": "details_test_system",
        "vehiclesolventcontrol": "vehicle_solvent_control",
        "vehiclesolvent": "vehicle_solvent",
        "studydesigninvivononllna": "study_design_invivo_non_llna",
        "invitroinchemico": "in_vitro_in_chemico",
        "predictionmodeloutcome": "prediction_model_outcome",
        "atconcentration": "at_concentration",
        "traditionalsensitisationtest": "traditional_sensitisation_test",
        "hoursafterchallenge": "hours_after_challenge",
        "nowithreactions": "no_with_reactions",
        "totalnoingroup": "total_no_in_group",
        "solubilityorganic_solubility": "solubility_organic",
        "solubilityorganic": "solubility_organic",
        "surfacetension_tension": "surface_tension",
        "surfacetension": "surface_tension",
        "testorganismsinoculum": "testorganisms_inoculum",
        "vapourpressureat50cifrelevantforclassificationofgasunderpressure_vapourpressure": "vapourpressure_at_50c_if_relevant_for_classification_of_gas_under_pressure",
        "vapourpressureat50cifrelevantforclassificationofgasunderpressure": "vapourpressure_at_50c_if_relevant_for_classification_of_gas_under_pressure",
        "viscosity_viscosity": "viscosity",
        "solubilityofmetalionsinaqueousmedia": "solubility_of_metalions_in_aqueous_media",
        "incubationduration": "incubation_duration",
        "loadingofaqueousphase": "loading_of_aqueous_phase",
        "meandissolvedconc": "mean_dissolved_conc",
    }
    remove = ["administrativedata_", 
              "applicantsummaryandconclusion_", 
              "materialsandmethods_", 
              "resultsanddiscussion_", 
              "administrationexposure_", 
              "_studydesign_batchequilibriumorothermethod",
              "_reasonpurpose",
              "_relativeselfignitiontemperaturesolids",
              "_selfignitiontemperature",
              "_batchequilibriumorothermethod",
    ]
    for old, new in replace.items():
        df.columns = [col.replace(old, new) for col in df.columns]
    
    for part in remove:
        df.columns = [col.replace(part, '') for col in df.columns]

    old_to_new_col = {
        "relative_selfignition_temperature_solids_relative_selfignition_temperature": "relative_selfignition_temperature_solids_temperature",
        "partcoeff_type_value": "partcoeff_partition_unit",
    }
    df = df.rename(columns=old_to_new_col)
    return df


def lower_upper_function(unit_col: str, col_lower: str, col_upper: str, row):
    """
    Extracts and processes unit, lower value, and upper value columns from a DataFrame row.
    Splits the comma-separated values, strips whitespace, and converts numeric values to numeric data types.
    Retrurns a list of units, a list of lower values as floats, a list of upper values as floats.
    """
    if pd.isna(col_lower) or pd.isna(col_upper):
        return [], [], []
    units = str(row[unit_col])
    vals_lower = str(row[col_lower])
    vals_upper = str(row[col_upper])
    unit_list = [unit.strip() for unit in units.split(',')]
    val_list_lower = [pd.to_numeric(value.strip(), errors='coerce') for value in vals_lower.split(',')]
    val_list_upper = [pd.to_numeric(value.strip(), errors='coerce') for value in vals_upper.split(',')]
    return unit_list, val_list_lower, val_list_upper

def value_function(unit_col: str, val_col: str, row):
    """
    Extracts and processes unit and value columns from a DataFrame row.
    Splits the comma-separated values, strips whitespace, and converts numeric values to numeric data types.
    Retrurns a list of values as floats and a list of units.
    """
    units = str(row[unit_col])
    values = str(row[val_col])
    unit_list = [unit.strip() for unit in units.split(',')]
    value_list = [pd.to_numeric(value.strip(), errors='coerce') for value in values.split(',')]
    return value_list, unit_list


def convert_units_given_unit_dicts(df: pd.DataFrame, value_col: str, unit_col: str, unit_to_calc: Dict[str, float], unit_to_new_unit: Dict[str, str]) -> pd.DataFrame:
    """
    Converts units and their corresponding values in a DataFrame based on provided conversion dictionaries.
    The conversion is applied to either lower/upper bound columns or a single value column.
    Returns a DataFrame with converted units and values.
    """
    col_lower = value_col + "_lowervalue"
    col_upper = value_col + "_uppervalue"
    if col_lower in df.columns: # Check if the DataFrame contains lower and upper value columns
        for idx, row in df.iterrows():
            unit_list, val_list_lower, val_list_upper = lower_upper_function(unit_col, col_lower, col_upper, row)
            # Convert values using the provided conversion factors
            for index, unit in enumerate(unit_list): 
                if unit in unit_to_calc: # Get the conversion factor for the unit
                    calc = unit_to_calc[unit]
                    if index < len(val_list_lower):
                        try:
                            np.seterr(over='raise')
                            val_list_lower[index] = val_list_lower[index] * calc
                        except FloatingPointError as e:
                            log.warn("Converting this value would lead to overflow. Therefore, the conversion was not executed!", value=val_list_lower[index], unit=unit)
                    if index < len(val_list_upper):
                        try:
                            np.seterr(over='raise')
                            val_list_upper[index] = val_list_upper[index] * calc
                        except FloatingPointError as e:
                            log.warn("Converting this value would lead to overflow. Therefore, the conversion was not executed!", value=val_list_upper[index], unit=unit)
                    unit_list[index] = unit_to_new_unit[unit] # Update the unit to the new unit name
            # Update the DataFrame with the converted values and units
            df[col_lower] = df[col_lower].astype(str)
            df[col_upper] = df[col_upper].astype(str)
            df.at[idx, col_lower] = ', '.join(map(str, val_list_lower))
            df.at[idx, col_upper] = ', '.join(map(str, val_list_upper))
            df.at[idx, unit_col] = ', '.join(unit_list)
    else: # If the DataFrame contains only one value column
        val_col = value_col + "_value"
        for idx, row in df.iterrows():
            value_list, unit_list = value_function(unit_col, val_col, row)
            # Convert values using the provided conversion factors
            for index, unit in enumerate(unit_list): 
                if unit in unit_to_calc: # Get the conversion factor for the unit
                    calc = unit_to_calc[unit]
                    try:
                        np.seterr(over='raise')
                        value_list[index] = value_list[index] * calc 
                    except FloatingPointError as e:
                        log.warn("Converting this value would lead to overflow. Therefore, the conversion was not executed!", value=value_list[index], unit=unit)
                    unit_list[index] = unit_to_new_unit[unit] # Update the unit to the new unit name
            # Update the DataFrame with the converted values and units
            df[val_col] = df[val_col].astype(str)
            df.at[idx, val_col] = ', '.join(map(str, value_list))
            df.at[idx, unit_col] = ', '.join(unit_list)
    return df


def convert_units(df: pd.DataFrame) -> pd.DataFrame:
    """
    This function processes a DataFrame to convert units for various columns based on specific unit 
    conversion rules. 
    """
    # Identify columns with unit suffixes and their corresponding value columns
    unitcode_cols1 = [col for col in df.columns if col.endswith('_unit')]
    unitcode_cols2 = [col for col in df.columns if col.endswith('_type_value')]
    value_cols1 = [col.replace('_unit', '') for col in unitcode_cols1]
    value_cols2 = [col.replace('_type_value', '_value') for col in unitcode_cols2]
    unitcode_cols = unitcode_cols1 + unitcode_cols2
    value_cols = value_cols1 + value_cols2

    # Iterate over each unit and corresponding value column to apply conversions
    for unit_col, value_col in zip(unitcode_cols, value_cols):

        # Check and convert partition coefficient units to their logarithmic forms
        if df[unit_col].isin(["Koc", "Kd", "Kow", "Pow", "Kp"]).any():
            value_lower = value_col + "_lowervalue"
            value_upper = value_col + "_uppervalue"
            if value_lower in df.columns:
                for idx, row in df.iterrows():
                    unit_list, val_list_lower, val_list_upper = lower_upper_function(unit_col, value_lower, value_upper, row)
                    for index, unit in enumerate(unit_list):
                        lower_value = pd.to_numeric(val_list_lower[index], errors='coerce')
                        upper_value = pd.to_numeric(val_list_upper[index], errors='coerce')
                        if lower_value <= 0 or upper_value <= 0:
                            unit_list[index] = 'wrong partition type'
                        else:
                            val_list_lower[index] = math.log(lower_value, 10)
                            val_list_upper[index] = math.log(upper_value, 10)
                            if unit == "Koc":
                                unit_list[index] = 'log Koc'
                            elif unit == "Kd":
                                unit_list[index] = 'log Kd'
                            elif unit == "Kow":
                                unit_list[index] = 'log Kow'     
                            elif unit == "Pow":
                                unit_list[index] = 'log Pow'     
                            elif unit == "Kp":
                                unit_list[index] = 'log Kp'
                    df[value_lower] = df[value_lower].astype(str)
                    df[value_upper] = df[value_upper].astype(str)
                    df.at[idx, value_lower] = ', '.join(map(str, val_list_lower))
                    df.at[idx, value_upper] = ', '.join(map(str, val_list_upper))
                    df.at[idx, unit_col] = ', '.join(unit_list)

        # Convert temperature units to Celsius (°C)
        elif df[unit_col].isin(["°C", "K", "°F"]).any():
            temperature_lower = value_col + "_lowervalue"
            temperature_upper = value_col + "_uppervalue"
            if temperature_lower in df.columns:
                for idx, row in df.iterrows():
                    unit_list, val_list_lower, val_list_upper = lower_upper_function(unit_col, temperature_lower, temperature_upper, row)
                    for index, unit in enumerate(unit_list):
                        if unit == "K":
                            val_list_lower[index] = val_list_lower[index] - 273.15
                            val_list_upper[index] = val_list_upper[index] - 273.15
                        elif unit == "°F":
                            val_list_lower[index] = (val_list_lower[index] - 32) * 5/9
                            val_list_upper[index] = (val_list_upper[index] - 32) * 5/9
                        unit_list[index] = '°C'
                    df[temperature_lower] = df[temperature_lower].astype(str)
                    df[temperature_upper] = df[temperature_upper].astype(str)
                    df.at[idx, temperature_lower] = ', '.join(map(str, val_list_lower))
                    df.at[idx, temperature_upper] = ', '.join(map(str, val_list_upper))
                    df.at[idx, unit_col] = ', '.join(unit_list)
            else:
                temperature_col = value_col + "_value"
                for idx, row in df.iterrows():
                    value_list, unit_list = value_function(unit_col, temperature_col, row)
                    for index, unit  in enumerate(unit_list):
                        if unit == "K":
                            value_list[index] = round(value_list[index] - 273.15, 2)
                        elif unit == "°F":
                            value_list[index] = round((value_list[index] - 32) * 5/9, 2)
                        unit_list[index] = '°C'
                    df[temperature_col] = df[temperature_col].astype(str)
                    df.at[idx, temperature_col] = ', '.join(map(str, value_list))
                    df.at[idx, unit_col] = ', '.join(unit_list)
        
        # Convert Henry's Law constants
        elif unit_col == "henrys_law_constant_h_h_unit":
            lower_value = "henrys_law_constant_h_h_lowervalue"
            upper_value = "henrys_law_constant_h_h_uppervalue"
            for idx, row in df.iterrows():
                unit_list, val_list_lower, val_list_upper = lower_upper_function(unit_col, lower_value, upper_value, row)
                temp_unit = row["henrys_law_constant_h_temp_unit"]
                if temp_unit == "°C":
                    temp_val = float(row["henrys_law_constant_h_temp_value"])
                else:
                    temp_val = 25
                for index, unit in enumerate(unit_list):
                    if unit == "Pa m³/mol":
                        if val_list_lower[index] <= 0 or val_list_upper[index] <= 0:
                            unit_list[index] = 'wrong unit'
                        else:
                            val_list_lower[index] = np.log10(val_list_lower[index] /(temp_val + 273.15)/ 8.314)
                            val_list_upper[index] = np.log10(val_list_upper[index] /(temp_val + 273.15)/ 8.314)
                            unit_list[index] = 'log10 [-]'
                    elif unit == "atm":
                        if val_list_lower[index] <= 0 or val_list_upper[index] <= 0:
                            unit_list[index] = 'wrong unit'
                        else:
                            val_list_lower[index] = np.log10(val_list_lower[index] * 1.01325 * 1.8 /(temp_val + 273.15)/ 8.314)
                            val_list_upper[index] = np.log10(val_list_upper[index] * 1.01325 * 1.8 /(temp_val + 273.15)/ 8.314)
                            unit_list[index] = 'log10 [-]'
                    elif unit == "atm m³/mol":
                        if val_list_lower[index] <= 0 or val_list_upper[index] <= 0:
                            unit_list[index] = 'wrong unit'
                        else:
                            val_list_lower[index] = np.log10(val_list_lower[index] * 101325 /(temp_val + 273.15)/ 8.314)
                            val_list_upper[index] = np.log10(val_list_upper[index] * 101325 /(temp_val + 273.15)/ 8.314)
                            unit_list[index] = 'log10 [-]'
                df[lower_value] = df[lower_value].astype(str)
                df[upper_value] = df[upper_value].astype(str)
                df.at[idx, lower_value] = ', '.join(map(str, val_list_lower))
                df.at[idx, upper_value] = ', '.join(map(str, val_list_upper))
                df.at[idx, unit_col] = ', '.join(unit_list)

        # Convert various time units to hours (h)
        elif df[unit_col].isin(["s", "min", "h", "d", "wk", "mo", "yr", "ms"]).any():
            unit_to_calc = {
                "ms": 1/(60*60*1000),
                "s": 1/(60*60),
                "min": 1/60,
                "h": 1,
                "d": 24,
                "wk": 24 * 7,
                "mo": 24 * 30,
                "yr": 24 * 30 * 12
            }
            unit_to_new_unit = {
                "ms": 'h',
                "s": 'h',
                "min": 'h',
                "h": 'h',
                "d": 'h',
                "wk": 'h',
                "mo": 'h',
                "yr": 'h',
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert specific mass concentration units
        elif df[unit_col].isin(["kg/ha d.w.", "g/ha d.w", "mg/kg soil d.w.", "g/kg soil d.w."]).any():
            unit_to_calc = {
                "g/ha d.w.": 1/1000,
                "g/kg soil d.w.": 1/1000
            }
            unit_to_new_unit = {
                "g/ha d.w.": 'kg/ha d.w.',
                "g/kg soil d.w.": 'mg/kg soil d.w.'
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert pressure units to Pascals (Pa)
        elif df[unit_col].isin(["mm Hg", "Pa", "PSI", "mBar", "kPa", "hPa", "Bar", "Torr", "atm"]).any():
            unit_to_calc = {
                "mm Hg": 133.322,
                "PSI": 6894.76,
                "mBar": 100,
                "kPa": 1000,
                "hPa": 100,
                "Bar": 10**5,
                "Torr": 133.322,
                "atm": 101325
            }
            unit_to_new_unit = {
                "mm Hg": 'Pa',
                "PSI": 'Pa',
                "mBar": 'Pa',
                "kPa": 'Pa',
                "hPa": 'Pa',
                "Bar": 'Pa',
                "Torr": 'Pa',
                "atm": 'Pa'
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert various concentration units
        elif df[unit_col].isin(["vol%", "g/cm³", "ppb", "kg/m³", "mg/100 g solvent"]).any(): # "mg/L", "g/L"
            unit_to_calc = {
                "mg/L": 10**3,
                "g/L": 10**6,
                "g/cm³": 10**9,
                "ppb": 10**-3,
                "kg/m³": 10**6,
                "mg/100 g solvent": 0.01,
            }
            unit_to_new_unit = {
                "mg/L": 'µg/L',
                "g/L": 'µg/L',
                "g/cm³": 'µg/cm³', 
                "ppb": 'ppm',
                "kg/m³": 'µg/cm³',
                "mg/100 g solvent": "g/kg solvent",
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert specific concentration units for food, sediment, and liquid solutions
        elif df[unit_col].isin(["mg/g food", "µg/kg sediment dw", "mg/kg sediment dw", "µg/g food", "ng/g food", "mmol/L", "migro g/L", "migro mol/L", "µmol/L", "ng/L", "mol/L", "µg/L"]).any(): # "g/L", "µg/L", "ng/L"
            unit_to_calc = {
                "g/L": 1000,
                "mg/g food": 1000,
                "µg/kg sediment dw": 1/1000,
                "µg/L": 1/1000,
                "ng/g food": 1/1000,
                "ng/L": 1/1000000,
                "mol/L": 1000,
                "µmol/L": 1/1000,
                "migro g/L": 10**-3,
                "migro mol/L": 10**-3,
            }
            unit_to_new_unit = {
                "g/L": 'mg/L',
                "mg/g food": 'µg/g food',
                "µg/kg sediment dw": 'mg/kg sediment dw',
                "µg/L": 'mg/L',
                "ng/g food": 'µg/g food',
                "ng/L": 'mg/L',
                "mol/L": 'mmol/L',
                "µmol/L": 'mmol/L',
                "migro g/L": 'mg/L',
                "migro mol/L": 'mmol/L',
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert units related to body weight (bw) and dry/wet weight
        elif df[unit_col].isin(["mg/kg bw d.w.", "µg/kg bw d.w.", "µg/kg bw w.w.",]).any():
            unit_to_calc = {
                "µg/kg bw d.w.": 1/1000,
                "µg/kg bw w.w.": 1/1000,
            }
            unit_to_new_unit = {
                "µg/kg bw d.w.": 'mg/kg bw d.w.',
                "µg/kg bw w.w.": 'mg/kg bw w.w.'
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert frequency units to per second (s⁻¹)
        elif df[unit_col].isin(["s-1", "min-1", "h-1", "d-1", "w-1", "a-1"]).any():
            unit_to_calc = {
                "min-1": 1/60,
                "h-1": 1/(60*60),
                "d-1": 1/(60*60*24),
                "w-1": 1/(60*60*24*7),
                "a-1": 1/(60*60*24*365)
            }
            unit_to_new_unit = {
                "min-1": 's-1',
                "h-1": 's-1',
                "d-1": 's-1',
                "w-1": 's-1',
                "a-1": 's-1'
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert oxygen content units
        elif df[unit_col].isin(["mg O2/g test mat.", "g O2/g test mat."]).any():
            unit_to_calc = {"g O2/g test mat.": 1000}
            unit_to_new_unit = {"g O2/g test mat.": 'mg O2/g test mat.'}
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert liquid flow rate units to hours (L/kg h)
        elif df[unit_col].isin(["L/kg min", "L/kg h"]).any():
            unit_to_calc = {"L/kg min": 60}
            unit_to_new_unit = {"L/kg min": 'L/kg h'}
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert size and concentration units to standardized units
        elif df[unit_col].isin(["µm", "nm", "mm", "1/cm dm³ 1/mol"]).any():
            unit_to_calc = {
                "nm": 0.001,
                "mm": 1000,
                "1/cm dm³ 1/mol": 1,
            }
            unit_to_new_unit = {
                "nm": 'µm',
                "mm": 'µm',
                "1/cm dm³ 1/mol": "L/(mol cm)",
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert micromolar units to millimolar 
        elif df[unit_col].isin(["mM", "µM"]).any():
            unit_to_calc = {"µM": 1/1000}
            unit_to_new_unit = {"µM": 'mM'}
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert milli-newton per meter to newton per meter
        elif df[unit_col].isin(["mN/m", "N/m"]).any():
            unit_to_calc = {"mN/m": 1/1000}
            unit_to_new_unit = {"mN/m": 'N/m'}
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert various soil and application rates units to standardized units
        elif df[unit_col].isin(["g/ha", "µg/kg soil dw", "mg/kg soil ww", "mg/kg soil dw", "ng/kg soil dw", "mg/cm²", "µg/kg soil ww", "µg per animal per day", "µg per animal", "g/kg soil dw", "mg/ha", "lbs/acre"]).any():
            unit_to_calc = {
                "mg/cm²": 0.001/(10**(-8)),
                "mg/ha": 1/1000,
                "kg/ha": 1000,
                "lbs/acre": 453.592/0.404686,
                "g/kg soil dw": 1000,
                "µg/kg soil dw": 1 / 1000,
                "µg/kg soil ww": 1 / 1000,
                "ng/kg soil dw": 1 / 1_000_000,
            }
            unit_to_new_unit = {
                "mg/cm²": "g/ha",
                "g/ha": 'g/ha',
                "kg/ha": 'g/ha',
                "lbs/acre": "g/ha", 
                "g/kg soil dw": "mg/kg soil dw",
                "µg/kg soil dw": 'mg/kg soil dw',
                "µg/kg soil ww": 'mg/kg soil ww',
                "ng/kg soil dw": "mg/kg soil dw",
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

        # Convert molecule flux units to standardized units
        elif df[unit_col].isin(['cm³ molecule-1 s-1', 'cm³ molecule-1 d-1', 'm³ molecule-1 d-1', 'm³ molecule-1 s-1']).any():
            unit_to_calc = {
                "cm³ molecule-1 d-1": 1/(24*3600),
                "m³ molecule-1 d-1": 10**6/(24*3600),
                "m³ molecule-1 s-1": 10**6,
            }
            unit_to_new_unit = {
                "cm³ molecule-1 d-1": "cm³ molecule-1 s-1",
                "m³ molecule-1 d-1": "cm³ molecule-1 s-1",
                "m³ molecule-1 s-1": "cm³ molecule-1 s-1",
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)
        
        # Convert percentage (%) to parts per million (ppm) if both are present in the unit column
        elif {'ppm', '%'}.issubset(df[unit_col].unique()):
            unit_to_calc = {
                "%": 10**4,
            }
            unit_to_new_unit = {
                "%": "ppm",
            }
            df = convert_units_given_unit_dicts(df=df, value_col=value_col, unit_col=unit_col, unit_to_calc=unit_to_calc, unit_to_new_unit=unit_to_new_unit)

    return df


def create_connection(db_file):
    """Create a database connection to the SQLite database specified by db_file."""
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)
    return conn



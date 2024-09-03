import sys
import os
import pandas as pd
import numpy as np
import tqdm
import math
import sqlite3
from typing import List, Dict
import xml.etree.ElementTree as ET
from collections import defaultdict

sys.path.append(os.path.join(os.path.dirname(__file__), ".."))
from parse_iuclid.xml_parse_utils import unzip_i6z_files
from parse_iuclid.xml_parse_utils import check_if_exists
from parse_iuclid.xml_parse_utils import find_info_in_manifest_per_doc
from parse_iuclid.xml_parse_utils import find_info_in_manifest_per_doc_reference
from parse_iuclid.xml_parse_utils import create_manifest_df
from parse_iuclid.xml_parse_utils import check_tag_of_children
from parse_iuclid.xml_parse_utils import get_topics
from parse_iuclid.xml_parse_utils import get_values
from parse_iuclid.xml_parse_utils import get_code_to_decode
from parse_iuclid.xml_parse_utils import get_values_for_dir
from parse_iuclid.xml_parse_utils import create_manifest
from parse_iuclid.xml_parse_utils import get_values_for_dir_list
from parse_iuclid.xml_parse_utils import rename_cols
from parse_iuclid.xml_parse_utils import lower_upper_function
from parse_iuclid.xml_parse_utils import value_function
from parse_iuclid.xml_parse_utils import convert_units_given_unit_dicts
from parse_iuclid.xml_parse_utils import convert_units
from parse_iuclid.xml_parse_utils import create_connection


def test_unzip_i6z_files():
    unzip_i6z_files("tests/reach_study_results_dossiers_23-05-2023_test")
    assert os.path.exists('tests/reach_study_results_dossiers_23-05-2023_test_unzipped')


class Element:
    def __init__(self, text):
        self.text = text

def test_check_if_exists():
    elements = [Element("test text")]
    assert check_if_exists(elements) == "test text"
    elements = []
    assert check_if_exists(elements) == ""
    elements = [Element(None)]
    assert check_if_exists(elements) == "None"


def test_find_info_in_manifest_per_doc():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x] 
    for dir in dir_list:
        dir_name = os.path.join(directory_to_folders, dir, "manifest.xml")
        manifest_col_to_values: Dict[str, List] = defaultdict(list)
        tree = ET.parse(dir_name) 
        contained_docs = tree.findall("manifest:contained-documents", name_space)[0] 
        for doc in contained_docs:
            subtypes = doc.findall("manifest:subtype", name_space)
            for st in subtypes:
                if st.text == subtype:
                    manifest_col_to_values["subtype"].append(str(st.text))
                    long_id = doc.findall("manifest:name", name_space)
                    manifest_col_to_values["long_id"].append(str(long_id[0].get("{http://www.w3.org/1999/xlink}href")))
                    infos = find_info_in_manifest_per_doc(document=doc, name_space=name_space)
    assert infos[0] == 'Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-'
    assert infos[1] == 'sodium (2R)-2-(4-hydroxyphenoxy)propanoate' 
    assert infos[2] == '133647-88-8'
    assert infos[3] == '603-758-6'


def test_find_info_in_manifest_per_doc_reference():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  
    for dir in dir_list:
        dir_name = os.path.join(directory_to_folders, dir, "manifest.xml")

        manifest_col_to_values: Dict[str, List] = defaultdict(list)
        tree = ET.parse(dir_name) 
        contained_docs = tree.findall("manifest:contained-documents", name_space)[0] 
        for doc in contained_docs:
            subtypes = doc.findall("manifest:subtype", name_space)
            for st in subtypes:
                
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
        ref_infos_dict = {}
        for uuids in manifest_col_to_values["ref_uuids"]:
            if len(uuids) > 0:
                for uuid in uuids:
                    for doc in contained_docs:
                        if (
                            doc.get("id") == uuid
                            and doc.findall("manifest:type", name_space)[0].text == "REFERENCE_SUBSTANCE"
                        ):
                            ref_infos = find_info_in_manifest_per_doc_reference(document=doc, name_space=name_space)
                            ref_infos_dict[uuid] = ref_infos
        assert ref_infos_dict['7f57bc4e-7fdb-4c9a-8057-86bd2629e86a/f6fbb0ad-2581-47be-b240-9a62480b1516'] == ['(R)-2-(4-Hydroxyphenoxy)propanoic acid', 'None', 'None']
        assert ref_infos_dict['5b39705a-26fd-4f92-a9cf-5be8ed3927f9/f6fbb0ad-2581-47be-b240-9a62480b1516'] == ['Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-', 'None', 'None']
        assert ref_infos_dict['73805da2-bb8d-48bf-a3ea-ebea4de31bd2/f6fbb0ad-2581-47be-b240-9a62480b1516'] == ['94050-90-5', '94050-90-5', 'None']
        assert ref_infos_dict['58ac5f04-b1b8-42c7-8aee-ba9fa003424f/f6fbb0ad-2581-47be-b240-9a62480b1516'] == ['407-960-3', 'None', '407-960-3']


def test_create_manifest_df():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  
    for dir in dir_list:
        dir_name = os.path.join(directory_to_folders, dir, "manifest.xml")
        manifest_df = create_manifest_df(dir_name=dir_name, name_space=name_space, subtype=subtype)
    column_list = [
        "subtype", 
        "long_id", 
        "chemical_name", 
        "iupac_name", 
        "cas", 
        "inventory_num", 
        "reference", 
        "ref_uuids", 
        "ref_iupac_name", 
        "ref_cas",
        "ref_inventory_num",
        ]
    assert all(col in manifest_df.columns for col in column_list)
    assert isinstance(manifest_df.iloc[0]['reference'], list)
    assert isinstance(manifest_df.iloc[0]['ref_uuids'], list)
    assert manifest_df.iloc[0]['subtype'] == "AcuteToxicityInhalation"
    assert manifest_df.iloc[0]['long_id'] == "fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d"
    assert manifest_df.iloc[0]['chemical_name'] == "Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-"
    assert manifest_df.iloc[0]['iupac_name'] == "sodium (2R)-2-(4-hydroxyphenoxy)propanoate"
    assert manifest_df.iloc[0]['cas'] == "133647-88-8"
    assert manifest_df.iloc[0]['inventory_num'] == "603-758-6"
    assert manifest_df.iloc[0]['reference'] == ['cb0b4e01-7c32-4d9b-a3db-22362d3e8034/f6fbb0ad-2581-47be-b240-9a62480b1516', 'b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert manifest_df.iloc[0]['ref_uuids'] == ['7f57bc4e-7fdb-4c9a-8057-86bd2629e86a/f6fbb0ad-2581-47be-b240-9a62480b1516', '5b39705a-26fd-4f92-a9cf-5be8ed3927f9/f6fbb0ad-2581-47be-b240-9a62480b1516', '73805da2-bb8d-48bf-a3ea-ebea4de31bd2/f6fbb0ad-2581-47be-b240-9a62480b1516', '58ac5f04-b1b8-42c7-8aee-ba9fa003424f/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert manifest_df.iloc[0]['ref_iupac_name'] == "(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3"
    assert manifest_df.iloc[0]['ref_cas'] == "None, None, 94050-90-5, None"
    assert manifest_df.iloc[0]['ref_inventory_num'] == "None, None, None, 407-960-3"


def test_check_tag_of_children(): 
    tags_list = []

    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  

    for dir in tqdm.tqdm(dir_list):
        manifest_df = create_manifest(
            dir=dir,
            name_space=name_space,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
        if len(manifest_df) != 0:
            df = pd.DataFrame()
            if subtype not in str(manifest_df["subtype"].values): 
                return df
            
            parameter_indices = manifest_df.index[manifest_df["subtype"] == subtype].tolist()
            for indx in parameter_indices:
                id = manifest_df.at[indx, "long_id"] 
                dir_name = os.path.join(directory_to_folders, dir, id) 
                if os.path.exists(dir_name):
                    tree = ET.parse(dir_name)
                else:
                    continue

                content = tree.findall("parameter:Content", name_space)
                results_discussion = content[0].findall(f"study_record:ENDPOINT_STUDY_RECORD.{subtype}", name_space)
                tags = check_tag_of_children(results_discussion[0])
                if results_discussion:
                    nspace = "study_record"
                    if len(tags) == 0: 
                        return {}
                    for tag in set(tags):
                        element = results_discussion[0].findall(f"{nspace}:{tag}", name_space) 
                        if len(element) == 0:  
                            return {}
                        elif len(element) > 1:  
                            for elem in element:
                                tags = check_tag_of_children(elem)
                        elif element[0]: 
                            tags = check_tag_of_children(element[0])
                        tags_list.append(tags)
    
    tags_list_correct = [['Reference'], ['Guideline', 'GLPComplianceStatement', 'TestType', 'LimitTest', 'TestMaterials', 'TestAnimals', 'AdministrationExposure'], ['InterpretationOfResults'], ['EffectLevels'], ['Endpoint', 'StudyResultType', 'PurposeFlag', 'Reliability']]
    assert sorted(tags_list) == sorted(tags_list_correct)


def test_get_topics(): 
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  

    df = pd.DataFrame()
    code_to_decoded, sub_col_name_decode = get_code_to_decode(dir_list=dir_list, subtype=subtype, directory_to_folders=directory_to_folders) # Get the code-to-decoded mapping and the list of columns that require decoding
    for dir in tqdm.tqdm(dir_list):
        manifest_df = create_manifest(
            dir=dir,
            name_space=name_space,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
        if len(manifest_df) != 0:
            df = pd.DataFrame()
            if subtype not in str(manifest_df["subtype"].values): 
                return df
            
            parameter_indices = manifest_df.index[manifest_df["subtype"] == subtype].tolist()
            for indx in parameter_indices:
                id = manifest_df.at[indx, "long_id"] 
                dir_name = os.path.join(directory_to_folders, dir, id) 
                if os.path.exists(dir_name):
                    tree = ET.parse(dir_name)
                else:
                    continue

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
                    topics = get_topics(results)

    assert sorted(topics) == sorted(['materialsandmethods', 'applicantsummaryandconclusion', 'administrativedata', 'resultsanddiscussion'])


def test_get_values(): 
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x] 

    df = pd.DataFrame()
    code_to_decoded, sub_col_name_decode = get_code_to_decode(dir_list=dir_list, subtype=subtype, directory_to_folders=directory_to_folders) # Get the code-to-decoded mapping and the list of columns that require decoding

    for dir in tqdm.tqdm(dir_list):
        manifest_df = create_manifest(
            dir=dir,
            name_space=name_space,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
        if len(manifest_df) != 0:

            df = pd.DataFrame()
            if subtype not in str(manifest_df["subtype"].values): 
                return df
            
            parameter_indices = manifest_df.index[manifest_df["subtype"] == subtype].tolist()
            for indx in parameter_indices:
                id = manifest_df.at[indx, "long_id"] 
                dir_name = os.path.join(directory_to_folders, dir, id) 
                if os.path.exists(dir_name):
                    tree = ET.parse(dir_name)
                else:
                    continue

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
    assert results['applicantsummaryandconclusion_interpretationofresults_value'] == ['2195']
    assert results['materialsandmethods_testanimals_strain_value'] == ['3574']
    assert results['materialsandmethods_testanimals_sex_value'] == ['2052']
    assert results['materialsandmethods_testanimals_species_value'] == ['3485']
    assert results['materialsandmethods_guideline_qualifier_value'] == ['1680', '1680', '1680']
    assert results['materialsandmethods_guideline_guideline_value'] == ['1251', '675', '599']
    assert results['materialsandmethods_guideline_deviation_value'] == ['2158', '2158', '2158']
    assert results['materialsandmethods_administrationexposure_routeofadministration_value'] == ['1993']
    assert results['materialsandmethods_administrationexposure_typeofinhalationexposure_value'] == ['2191']
    assert results['materialsandmethods_limittest_value'] == ['2480']
    assert results['materialsandmethods_testtype_value'] == ['1578']
    assert results['materialsandmethods_glpcompliancestatement_value'] == ['2480']
    assert results['materialsandmethods_testmaterials_testmaterialinformation'] == ['b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert results['resultsanddiscussion_effectlevels_sex_value'] == ['2052', '2052']
    assert results['resultsanddiscussion_effectlevels_basedon_value'] == ['1754', '1754']
    assert results['resultsanddiscussion_effectlevels_endpoint_value'] == ['922', '926']
    assert results['resultsanddiscussion_effectlevels_effectlevel_unitcode'] == ['2100', '2100']
    assert results['resultsanddiscussion_effectlevels_effectlevel_lowervalue'] == ['1.84', '1.84']
    assert results['resultsanddiscussion_effectlevels_keyresult'] == ['false', 'false']
    assert results['resultsanddiscussion_effectlevels_exposureduration_unitcode'] == ['1976', '1976']
    assert results['resultsanddiscussion_effectlevels_exposureduration_value'] == ['4', '4']
    assert results['resultsanddiscussion_effectlevels_effectlevel_lowerqualifier'] == ['>']
    assert results['administrativedata_studyresulttype_value'] == ['62035']
    assert results['administrativedata_purposeflag_value'] == ['921']
    assert results['administrativedata_endpoint_value'] == ['2677']
    assert results['administrativedata_reliability_value'] == ['18']


def test_get_code_to_decode(): 
    subtype="AcuteToxicityInhalation"
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  

    code_to_decoded, sub_col_name_decode = get_code_to_decode(dir_list=dir_list, subtype=subtype, directory_to_folders=directory_to_folders)

    sub_col_name_decode_correct = ['endpoint', 'studyresulttype', 'purposeflag', 'reliability', 'rationalreliability', 'datawaiving', 'reasonpurpose', 'reasonpurpose', 'dataaccess', 'dataprotectionclaimed', 'qualifier', 'guideline', 'deviation', 'glpcompliancestatement', 'testtype', 'limittest', 'species', 'strain', 'sex', 'routeofadministration', 'typeofinhalationexposure', 'vehicle', 'analyticalverificationoftestatmosphereconcentrations', 'controlanimals', 'sex', 'endpoint', 'basedon', 'remarksonresults', 'clinicalsigns', 'type', 'interpretationofresults']
    assert sorted(sub_col_name_decode) == sorted(sub_col_name_decode_correct)
    assert code_to_decoded['1976'] == 'h'
    assert code_to_decoded['2100'] == 'mg/L air (analytical)'
    assert code_to_decoded['2677'] == 'acute toxicity: inhalation'
    assert code_to_decoded['62035'] == 'migrated information: read-across from supporting substance (structural analogue or surrogate)'
    assert code_to_decoded['921'] == 'key study'
    assert code_to_decoded['18'] == '2 (reliable with restrictions)'
    assert code_to_decoded['2480'] == 'yes'
    assert code_to_decoded['1680'] == 'according to guideline'
    assert code_to_decoded['599'] == 'EPA OTS 798.1150 (Acute inhalation toxicity)'
    assert code_to_decoded['675'] == 'EU Method B.2 (Acute Toxicity (Inhalation))'
    assert code_to_decoded['1251'] == 'OECD Guideline 403 (Acute Inhalation Toxicity)'
    assert code_to_decoded['2158'] == 'no'
    assert code_to_decoded['1578'] == 'standard acute method'
    assert code_to_decoded['3485'] == 'rat'
    assert code_to_decoded['3574'] == 'Wistar'
    assert code_to_decoded['2052'] == 'male/female'
    assert code_to_decoded['1993'] == 'inhalation: dust'
    assert code_to_decoded['2191'] == 'nose only'
    assert code_to_decoded['922'] == 'LC0'
    assert code_to_decoded['926'] == 'LC50'
    assert code_to_decoded['1754'] == 'act. ingr.'
    assert code_to_decoded['2195'] == 'not classified'


def test_get_values_for_dir():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  
    list_of_dfs: List[pd.DataFrame] = []
    df = pd.DataFrame()
    code_to_decoded, sub_col_name_decode = get_code_to_decode(dir_list=dir_list, subtype=subtype, directory_to_folders=directory_to_folders) # Get the code-to-decoded mapping and the list of columns that require decoding
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
    assert list(df['subtype']) == ['AcuteToxicityInhalation', 'AcuteToxicityInhalation']
    assert list(df['long_id']) == ['fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d', 'fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d']
    assert list(df['chemical_name']) == ['Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-', 'Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-']
    assert list(df['iupac_name']) == ['sodium (2R)-2-(4-hydroxyphenoxy)propanoate', 'sodium (2R)-2-(4-hydroxyphenoxy)propanoate']
    assert list(df['cas']) == ['133647-88-8', '133647-88-8']
    assert list(df['inventory_num']) == ['603-758-6', '603-758-6']
    assert list(df['ref_iupac_name']) == ['(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3', '(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3']
    assert list(df['ref_cas']) == ['None, None, 94050-90-5, None', 'None, None, 94050-90-5, None']
    assert list(df['ref_inventory_num']) == ['None, None, None, 407-960-3', 'None, None, None, 407-960-3']
    assert list(df['materialsandmethods_limittest_value']) == ['2480', '2480']
    assert list(df['materialsandmethods_testmaterials_testmaterialinformation']) == ['b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516', 'b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert list(df['materialsandmethods_testtype_value']) == ['1578', '1578']
    assert list(df['materialsandmethods_administrationexposure_routeofadministration_value']) == ['1993', '1993']
    assert list(df['materialsandmethods_administrationexposure_typeofinhalationexposure_value']) == ['2191', '2191']
    assert list(df['materialsandmethods_glpcompliancestatement_value']) == ['2480', '2480']
    assert list(df['materialsandmethods_testanimals_sex_value']) == ['2052', '2052']
    assert list(df['materialsandmethods_testanimals_species_value']) == ['3485', '3485']
    assert list(df['materialsandmethods_testanimals_strain_value']) == ['3574', '3574']
    assert list(df['materialsandmethods_guideline_guideline_value']) == ['1251, 675, 599', '1251, 675, 599']
    assert list(df['materialsandmethods_guideline_qualifier_value']) == ['1680, 1680, 1680', '1680, 1680, 1680']
    assert list(df['materialsandmethods_guideline_deviation_value']) == ['2158, 2158, 2158', '2158, 2158, 2158']
    assert list(df['applicantsummaryandconclusion_interpretationofresults_value']) == ['2195', '2195']
    assert list(df['administrativedata_reliability_value']) == ['18', '18']
    assert list(df['administrativedata_purposeflag_value']) == ['921', '921']
    assert list(df['administrativedata_endpoint_value']) == ['2677', '2677']
    assert list(df['administrativedata_studyresulttype_value']) == ['62035', '62035']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_lowerqualifier']) == ['>', '>']
    assert list(df['resultsanddiscussion_effectlevels_keyresult']) == ['false', 'false']
    assert list(df['resultsanddiscussion_effectlevels_sex_value']) == ['2052', '2052']
    assert list(df['resultsanddiscussion_effectlevels_endpoint_value']) == ['922', '926']
    assert list(df['resultsanddiscussion_effectlevels_exposureduration_value']) == ['4', '4']
    assert list(df['resultsanddiscussion_effectlevels_exposureduration_unitcode']) == ['1976', '1976']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_lowervalue']) == ['1.84', '1.84']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_unitcode']) == ['2100', '2100']
    assert list(df['resultsanddiscussion_effectlevels_basedon_value']) == ['1754', '1754']


def test_create_manifest():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x] 
    for dir in dir_list:
        manifest_df = create_manifest(
            dir=dir,
            name_space=name_space,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
    column_list = [
        "subtype", 
        "long_id", 
        "chemical_name", 
        "iupac_name", 
        "cas", 
        "inventory_num", 
        "reference", 
        "ref_uuids", 
        "ref_iupac_name", 
        "ref_cas",
        "ref_inventory_num",
        ]
    assert all(col in manifest_df.columns for col in column_list)
    assert isinstance(manifest_df.iloc[0]['reference'], list)
    assert isinstance(manifest_df.iloc[0]['ref_uuids'], list)
    assert manifest_df.iloc[0]['subtype'] == "AcuteToxicityInhalation"
    assert manifest_df.iloc[0]['long_id'] == "fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d"
    assert manifest_df.iloc[0]['chemical_name'] == "Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-"
    assert manifest_df.iloc[0]['iupac_name'] == "sodium (2R)-2-(4-hydroxyphenoxy)propanoate"
    assert manifest_df.iloc[0]['cas'] == "133647-88-8"
    assert manifest_df.iloc[0]['inventory_num'] == "603-758-6"
    assert manifest_df.iloc[0]['reference'] == ['cb0b4e01-7c32-4d9b-a3db-22362d3e8034/f6fbb0ad-2581-47be-b240-9a62480b1516', 'b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert manifest_df.iloc[0]['ref_uuids'] == ['7f57bc4e-7fdb-4c9a-8057-86bd2629e86a/f6fbb0ad-2581-47be-b240-9a62480b1516', '5b39705a-26fd-4f92-a9cf-5be8ed3927f9/f6fbb0ad-2581-47be-b240-9a62480b1516', '73805da2-bb8d-48bf-a3ea-ebea4de31bd2/f6fbb0ad-2581-47be-b240-9a62480b1516', '58ac5f04-b1b8-42c7-8aee-ba9fa003424f/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert manifest_df.iloc[0]['ref_iupac_name'] == "(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3"
    assert manifest_df.iloc[0]['ref_cas'] == "None, None, 94050-90-5, None"
    assert manifest_df.iloc[0]['ref_inventory_num'] == "None, None, None, 407-960-3"


def test_get_values_for_dir_list():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x]  
    df = get_values_for_dir_list(
            name_space=name_space,
            dir_list=dir_list,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )
    column_list = [
        'subtype', 
        'long_id', 
        'chemical_name', 
        'iupac_name', 
        'cas',
        'inventory_num', 
        'ref_iupac_name', 
        'ref_cas', 
        'ref_inventory_num',
        'materialsandmethods_administrationexposure_typeofinhalationexposure_value',
        'materialsandmethods_administrationexposure_routeofadministration_value',
        'materialsandmethods_testanimals_sex_value',
        'materialsandmethods_testanimals_strain_value',
        'materialsandmethods_testanimals_species_value',
        'materialsandmethods_limittest_value',
        'materialsandmethods_testmaterials_testmaterialinformation',
        'materialsandmethods_guideline_guideline_value',
        'materialsandmethods_guideline_qualifier_value',
        'materialsandmethods_guideline_deviation_value',
        'materialsandmethods_glpcompliancestatement_value',
        'materialsandmethods_testtype_value',
        'administrativedata_purposeflag_value',
        'administrativedata_reliability_value',
        'administrativedata_endpoint_value',
        'administrativedata_studyresulttype_value',
        'applicantsummaryandconclusion_interpretationofresults_value',
        'resultsanddiscussion_effectlevels_effectlevel_lowerqualifier',
        'resultsanddiscussion_effectlevels_endpoint_value',
        'resultsanddiscussion_effectlevels_keyresult',
        'resultsanddiscussion_effectlevels_effectlevel_unitcode',
        'resultsanddiscussion_effectlevels_effectlevel_lowervalue',
        'resultsanddiscussion_effectlevels_sex_value',
        'resultsanddiscussion_effectlevels_exposureduration_unitcode',
        'resultsanddiscussion_effectlevels_exposureduration_value',
        'resultsanddiscussion_effectlevels_basedon_value'
        ]
    assert all(col in df.columns for col in column_list)
    assert list(df['subtype']) == ['AcuteToxicityInhalation', 'AcuteToxicityInhalation']
    assert list(df['long_id']) == ['fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d', 'fef04878-270d-40eb-9d42-61512bb6649d_f6fbb0ad-2581-47be-b240-9a62480b1516.i6d']
    assert list(df['chemical_name']) == ['Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-', 'Propanoic acid, 2-(4-hydroxyphenoxy)-, sodium salt (1:1), (2R)-']
    assert list(df['iupac_name']) == ['sodium (2R)-2-(4-hydroxyphenoxy)propanoate', 'sodium (2R)-2-(4-hydroxyphenoxy)propanoate']
    assert list(df['cas']) == ['133647-88-8', '133647-88-8']
    assert list(df['inventory_num']) == ['603-758-6', '603-758-6']
    assert list(df['ref_iupac_name']) == ['(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3', '(R)-2-(4-Hydroxyphenoxy)propanoic acid, Propanoic acid, 2-(4-hydroxyphenoxy)-, (2R)-, 94050-90-5, 407-960-3']
    assert list(df['ref_cas']) == ['None, None, 94050-90-5, None', 'None, None, 94050-90-5, None']
    assert list(df['ref_inventory_num']) == ['None, None, None, 407-960-3', 'None, None, None, 407-960-3']
    assert list(df['materialsandmethods_administrationexposure_typeofinhalationexposure_value']) == ['nose only', 'nose only']
    assert list(df['materialsandmethods_administrationexposure_routeofadministration_value']) == ['inhalation: dust', 'inhalation: dust']
    assert list(df['materialsandmethods_testanimals_sex_value']) == ['male/female', 'male/female']
    assert list(df['materialsandmethods_testanimals_strain_value']) == ['Wistar', 'Wistar']
    assert list(df['materialsandmethods_testanimals_species_value']) == ['rat', 'rat']
    assert list(df['materialsandmethods_limittest_value']) == ['yes', 'yes']
    assert list(df['materialsandmethods_testmaterials_testmaterialinformation']) == ['b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516', 'b85ee34c-a1d6-4937-9a7e-ab8383703d60/f6fbb0ad-2581-47be-b240-9a62480b1516']
    assert list(df['materialsandmethods_guideline_guideline_value']) == ['OECD Guideline 403 (Acute Inhalation Toxicity), EU Method B.2 (Acute Toxicity (Inhalation)), EPA OTS 798.1150 (Acute inhalation toxicity)', 'OECD Guideline 403 (Acute Inhalation Toxicity), EU Method B.2 (Acute Toxicity (Inhalation)), EPA OTS 798.1150 (Acute inhalation toxicity)']
    assert list(df['materialsandmethods_guideline_qualifier_value']) == ['according to guideline, according to guideline, according to guideline', 'according to guideline, according to guideline, according to guideline']
    assert list(df['materialsandmethods_guideline_deviation_value']) == ['no, no, no', 'no, no, no']
    assert list(df['materialsandmethods_glpcompliancestatement_value']) == ['yes', 'yes']
    assert list(df['materialsandmethods_testtype_value']) == ['standard acute method', 'standard acute method']
    assert list(df['administrativedata_purposeflag_value']) == ['key study', 'key study']
    assert list(df['administrativedata_reliability_value']) == ['2 (reliable with restrictions)', '2 (reliable with restrictions)']
    assert list(df['administrativedata_endpoint_value']) == ['acute toxicity: inhalation', 'acute toxicity: inhalation']
    assert list(df['administrativedata_studyresulttype_value']) == ['migrated information: read-across from supporting substance (structural analogue or surrogate)', 'migrated information: read-across from supporting substance (structural analogue or surrogate)']
    assert list(df['applicantsummaryandconclusion_interpretationofresults_value']) == ['not classified', 'not classified']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_lowerqualifier']) == ['>', '>']
    assert list(df['resultsanddiscussion_effectlevels_endpoint_value']) == ['LC0', 'LC50']
    assert list(df['resultsanddiscussion_effectlevels_keyresult']) == ['false', 'false']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_unitcode']) == ['mg/L air (analytical)', 'mg/L air (analytical)']
    assert list(df['resultsanddiscussion_effectlevels_effectlevel_lowervalue']) == ['1.84', '1.84']
    assert list(df['resultsanddiscussion_effectlevels_sex_value']) == ['male/female', 'male/female']
    assert list(df['resultsanddiscussion_effectlevels_exposureduration_unitcode']) == ['h', 'h']
    assert list(df['resultsanddiscussion_effectlevels_exposureduration_value']) == ['4', '4']
    assert list(df['resultsanddiscussion_effectlevels_basedon_value']) == ['act. ingr.', 'act. ingr.']


def test_rename_cols():
    subtype="AcuteToxicityInhalation"
    name_space = {
        "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
        "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
        "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
        "xsl": "http://www.w3.org/1999/XSL/Transform",
    }
    directory_to_folders = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped"
    dir_list = os.listdir(directory_to_folders)
    dir_list = [x for x in dir_list if "." not in x] 
    df = get_values_for_dir_list(
        name_space=name_space,
        dir_list=dir_list,
        directory_to_folders=directory_to_folders,
        subtype=subtype,
    )
    identifier_columns = df.columns[:9].tolist()
    unsorted_columns = df.columns[9:].tolist()
    sorted_columns = sorted(unsorted_columns)
    sorted_columns = identifier_columns + sorted_columns
    df = df[sorted_columns]

    df = rename_cols(df=df) 

    column_list  = list(df.columns)
    assert column_list == [
        'subtype', 
        'long_id', 
        'chemical_name', 
        'iupac_name', 
        'cas', 
        'inventory_num', 
        'ref_iupac_name', 
        'ref_cas', 
        'ref_inventory_num', 
        'endpoint_value', 
        'purposeflag_value', 
        'reliability_value', 
        'studyresulttype_value', 
        'interpretation_of_results_value', 
        'route_of_administration_value', 
        'type_of_inhalation_exposure_value', 
        'glp_compliance_statement', 
        'guideline_deviation_value', 
        'guideline_guideline_value', 
        'guideline_qualifier_value', 
        'limit_test', 
        'test_animals_sex_value', 
        'test_animals_species_value', 
        'test_animals_strain_value', 
        'testmaterial_info', 
        'test_type_value', 
        'effectlevels_based_on_value', 
        'effectlevels_lowerqualifier', 
        'effectlevels_lowervalue', 
        'effectlevels_unit', 
        'effectlevels_endpoint_value', 
        'effectlevels_exposure_duration_unit', 
        'effectlevels_exposure_duration_value', 
        'effectlevels_keyresult', 
        'effectlevels_sex_value'
    ]
    old_col_names = ['administrativedata_test1', 'materialsandmethods_test2', 'partcoeff_type_value', 'effectlevels_effectlevel', 'durationofadsorptionequilibration', 'relatedinformation', 'interpretationofresults', 'durationofexposure', 'glpcompliancestatement_value', 'limittest_value', 'testanimals', 'testmaterials_testmaterialinformation', 'testmaterialinformation', 'testtype', 'basedon', 'routeofadministration', 'typeofinhalationexposure', 'exposureduration', 'unitcode', 'validitycriteriafulfilled', 'methodtype', 'initialconcmeasured', 'concofadsorbedtestmat', 'percentageoforganiccarbon', 'adsorptioncoefficient', 'adsorptionother', 'orgcarbon', 'autoflammability', 'atmpressure', 'relativeselfignitiontemperaturesolids_keyresult', 'relativeselfignitiontemperature', 'selfignitiontemperatureofdustaccumulation_keyresult', 'selfignitiontemperatureofdustaccumulation', 'durationofdesorptionequilibration', 'temperaturesolids', 'objectiveofstudypick', 'metabolitecharacterisationstudies', 'metabolitesidentified', 'pharmacokineticstudies', 'toxicokineticparameters_toxicokineticparameters', 'toxicokineticparameters', 'transferintoorgans', 'totaldepurationduration', 'totalexposureuptakeduration', 'watermediatype', 'referencesubstancepositivecontrol', 'testorganismsspecies', 'calculationbasis', 'concinenvironmentdose', 'initialtestsubstanceconcentration', 'inoculumortestsystem', 'durationoftestcontacttime', 'halflifeofparentcompound50disappearancetimedt50', 'meantotalrecovery', 'mineralizationrateinco2', 'boilingpoint_boilingpoint', 'decompositiontemp', 'effectlevels_efflevel_effectlevel', 'effectlevels_efflevel', 'targetsystemorgantoxicity_targetsystemorgantoxicity', 'criticaleffectsobserved', 'doseresponserelationship', 'lowesteffectivedoseconc', 'relevantforhumans', 'treatmentrelated', 'dissociatingproperties', 'dissociationconstant', 'percentdistributioninmedia', 'resultsoftestseriesforexplosives', 'smallscalepreliminarytests', 'resultsofexvivoinvitrostudy', 'irritationcorrosionresults', 'irritationparameter', 'negativecontrolsvalid', 'positivecontrolsvalid', 'vehiclecontrolsvalid', 'flammablegaseslowerandupperexplosionlimit', 'flammablesolids', 'pyrophoricliquids', 'relativeairhumidity', 'selfheatingsubstancesmixtures', 'inductiontimeh', 'maxtempreached', 'substancesmixtureswhichincontactwithwateremitflammablegases', 'identityofevolvedgas', 'maxrateofgasrelease', 'sustainingcombustibility', 'substancephysicalstate', 'negcontrvalid', 'poscontrvalid', 'vehcontrvalid', 'metactindicator', 'typeofdistribution', 'typeofparticletested', 'aerodynamicdiameter', 'geometricstandarddeviation', 'particlesizedistribution_distribution', 'particlesizedistribution', 'henryslawconstanth', 'dissipationhalflifeofparentcompound', 'hydrolysisrateconstant', 'totalrecoveryoftestsubstance', 'testorganisms_testorganisms', 'effectconcentrations_effectconc', 'effectconcentrations', 'meltingpoint_meltingpoint', 'testresultoxidisinggases', 'testresultsoxidisingliquids', 'testresultsoxidisingsolids', 'partitioncoefficienttype', 'lightspectrumwavelengthinnm', 'relativelightintensity', 'sensitiserforindirectphotolysis', 'concentrationofsensitiser', 'typeofsensitiser', 'dissipationparentcompound', 'spectrumofsubstance', 'durationoftestatgiventestcondition', 'degradationrateconstant', 'degradation_degradationpercent', 'dissipationhalflife_halflife', 'dissipationhalflife', 'durationoftreatmentexposure', 'inchemicotestsystem', 'positivecontrol', 'negativecontrol', 'vehiclesolvent', 'detailstestsystem', 'vehiclesolventcontrol', 'studydesigninvivononllna', 'invitroinchemico', 'predictionmodeloutcome', 'atconcentration', 'traditionalsensitisationtest', 'hoursafterchallenge', 'nowithreactions', 'totalnoingroup', 'solubilityorganic_solubility', 'solubilityorganic', 'surfacetension', 'surfacetension_tension', 'testorganismsinoculum', 'vapourpressureat50cifrelevantforclassificationofgasunderpressure_vapourpressure', 'vapourpressureat50cifrelevantforclassificationofgasunderpressure', 'viscosity_viscosity', 'solubilityofmetalionsinaqueousmedia', 'incubationduration', 'loadingofaqueousphase', 'meandissolvedconc']
    new_col_names = ['test1', 'test2', 'partcoeff_partition_unit', 'effectlevels', 'duration_of_adsorption_equilibration', 'related_info', 'interpretation_of_results', 'duration_of_exposure', 'glp_compliance_statement', 'limit_test', 'test_animals', 'testmaterial_info', 'testmaterial_info', 'test_type', 'based_on', 'route_of_administration', 'type_of_inhalation_exposure', 'exposure_duration', 'unit', 'validity_criteria_fulfilled', 'method_type', 'initial_conc_measured', 'conc_of_adsorbed_test_mat', 'percentage_of_organic_carbon', 'adsorption_coefficient', 'adsorption_other', 'org_carbon', 'auto_flammability', 'atm_pressure', 'relative_selfignition_temperature_solids_key_result', 'relative_selfignition_temperature', 'selfignition_temperature_of_dust_accumulation_key_result', 'selfignition_temperature_of_dust_accumulation', 'duration_of_desorption_equilibration', 'temperature_solids', 'objective_of_study_pick', 'metabolite_characterisation_studies', 'metabolites_identified', 'pharmacokinetic_studies', 'toxicokinetic_parameters', 'toxicokinetic_parameters', 'transfer_into_organs', 'total_depuration_duration', 'total_exposure_uptake_duration', 'water_media_type', 'reference_substance_positive_control', 'testorganisms_species', 'calculation_basis', 'conc_in_environment_dose', 'initial_testsubstance_conc', 'inoculum_or_test_system', 'duration_of_test_contacttime', 'halflife_of_parent_compound_50_disappearance_timed_t50', 'mean_total_recovery', 'mineralization_rate_in_co2', 'boilingpoint', 'decomposition_temp', 'effectlevel', 'effectlevel', 'targetsystem_organ_toxicity', 'critical_effects_observed', 'doseresponse_relationship', 'lowest_effective_dose_conc', 'relevant_for_humans', 'treatment_related', 'dissociating_properties', 'dissociation_constant', 'percent_distribution_in_media', 'results_of_testseries_for_explosives', 'smallscale_preliminary_tests', 'results_of_exvivo_invitro_study', 'irritation_corrosion_results', 'irritation_parameter', 'negative_controls_valid', 'positive_controls_valid', 'vehicle_controls_valid', 'flammable_gases_lower_and_upper_explosion_limit', 'flammable_solids', 'pyrophoric_liquids', 'relative_air_humidity', 'selfheating_substances_mixtures', 'induction_time_h', 'max_temp_reached', 'substances_mixtures_which_in_contact_with_water_emit_flammable_gases', 'identity_of_evolved_gas', 'max_rate_of_gas_release', 'sustaining_combustibility', 'substance_physical_state', 'neg_contr_valid', 'pos_contr_valid', 'veh_contr_valid', 'meta_ct_indicator', 'type_of_distribution', 'type_of_particle_tested', 'aerodynamic_diameter', 'geometric_standard_deviation', 'particlesize_distribution', 'particlesize_distribution', 'henrys_law_constant_h', 'dissipation_halflife_of_parent_compound', 'hydrolysis_rate_constant', 'total_recovery_of_test_substance', 'testorganisms', 'effect_conc', 'effect_conc', 'meltingpoint', 'testresul_toxidising_gases', 'testresults_oxidising_liquids', 'testresults_oxidising_solids', 'partitioncoefficient_type', 'lightspectrum_wavelength_in_nm', 'relative_light_intensity', 'sensitiser_for_indirect_photolysis', 'concentration_of_sensitiser', 'type_of_sensitiser', 'dissipation_parent_compound', 'spectrum_of_substance', 'duration_of_test_at_given_test_condition', 'degradation_rateconstant', 'degradation_percent', 'dissipation_halflife', 'dissipation_halflife', 'duration_of_treatment_exposure', 'in_chemico_test_system', 'positive_control', 'negative_control', 'vehicle_solvent', 'details_test_system', 'vehicle_solvent_control', 'study_design_invivo_non_llna', 'in_vitro_in_chemico', 'prediction_model_outcome', 'at_concentration', 'traditional_sensitisation_test', 'hours_after_challenge', 'no_with_reactions', 'total_no_in_group', 'solubility_organic', 'solubility_organic', 'surface_tension', 'surface_tension', 'testorganisms_inoculum', 'vapourpressure_at_50c_if_relevant_for_classification_of_gas_under_pressure', 'vapourpressure_at_50c_if_relevant_for_classification_of_gas_under_pressure', 'viscosity', 'solubility_of_metalions_in_aqueous_media', 'incubation_duration', 'loading_of_aqueous_phase', 'mean_dissolved_conc']
    df_old_col_names = pd.DataFrame(columns=old_col_names)
    df_old_col_names = rename_cols(df=df_old_col_names) 
    assert list(df_old_col_names.columns) == new_col_names


def test_lower_upper_function(df_lower_upper):
    solution = {
        "units": [['kg'], ["lb"]],
        "col_lower": [[1.5, 2.0], [1.0]],
        "col_upper": [[2.5, 3.0], [2.0]],
    }

    for idx, row in df_lower_upper.iterrows():
        unit_col = 'unit_col'
        col_lower = 'col_lower'
        col_upper = 'col_upper'
        units, lower_values, upper_values = lower_upper_function(unit_col, col_lower, col_upper, row)
        assert units == solution['units'][idx]
        assert lower_values == solution['col_lower'][idx]
        assert upper_values == solution['col_upper'][idx]

        sample_row_with_na = row.copy()
        sample_row_with_na['col_lower'] = None
        sample_row_with_na['col_upper'] = None
        units, lower_values, upper_values = lower_upper_function(unit_col, col_lower, col_upper, sample_row_with_na)
        assert units == solution['units'][idx]
        assert np.isnan(lower_values[0]) 
        assert np.isnan(upper_values[0]) 

        sample_row_with_non_numeric = row.copy()
        sample_row_with_non_numeric['col_lower'] = 'a, b'
        sample_row_with_non_numeric['col_upper'] = 'x, y'
        units, lower_values, upper_values = lower_upper_function(unit_col, col_lower, col_upper, sample_row_with_non_numeric)
        assert units == solution['units'][idx]
        assert np.isnan(lower_values[0]) 
        assert np.isnan(lower_values[1]) 
        assert np.isnan(upper_values[0]) 
        assert np.isnan(upper_values[1]) 

        sample_row_with_spaces = row.copy()
        sample_row_with_spaces['col_lower'] = ' 1.5 ,  2.0 '
        sample_row_with_spaces['col_upper'] = ' 2.0 , 3.5 '
        units, lower_values, upper_values = lower_upper_function(unit_col, col_lower, col_upper, sample_row_with_spaces)
        assert units == solution['units'][idx]
        assert lower_values == [1.5, 2.0]
        assert upper_values == [2.0, 3.5]


def test_value_function(df_value):
    solution = {
        "units": [['kg', 'kg'], ["lb"]],
        "value_col": [[1.5, 2.0], [1.0]],
    }

    for idx, row in df_value.iterrows():
        unit_col = 'unit_col'
        value_col = 'value_col'
        value_list, unit_list = value_function(unit_col, value_col, row)
        assert unit_list == solution['units'][idx]
        assert value_list == solution['value_col'][idx]

        sample_row_with_na = row.copy()
        sample_row_with_na['units'] = None
        sample_row_with_na['value_col'] = None
        value_list, unit_list = value_function(unit_col, value_col, sample_row_with_na)
        assert unit_list == solution['units'][idx]
        assert np.isnan(value_list[0]) 

        sample_row_with_non_numeric = row.copy()
        sample_row_with_non_numeric['value_col'] = 'a, b'
        value_list, unit_list = value_function(unit_col, value_col, sample_row_with_non_numeric)
        assert unit_list == solution['units'][idx]
        assert np.isnan(value_list[0]) 
        assert np.isnan(value_list[1]) 

        sample_row_with_spaces = row.copy()
        sample_row_with_spaces['value_col'] = ' 1.5 ,  2.0 '
        value_list, unit_list = value_function(unit_col, value_col, sample_row_with_spaces)
        assert unit_list == solution['units'][idx]
        assert value_list == [1.5, 2.0]


def test_convert_units_given_unit_dicts(conversion_df, conversion_df_lower_upper):
    unit_to_calc = {'kg': 1000, 'lb': 0.453592, 'm': 100, 'cm': 10}
    unit_to_new_unit = {'kg': 'g', 'lb': 'kg', 'm': 'cm', 'cm': 'mm'}
    df = convert_units_given_unit_dicts(
        df=conversion_df, 
        value_col="value_col", 
        unit_col="unit_col", 
        unit_to_calc=unit_to_calc, 
        unit_to_new_unit=unit_to_new_unit)
    assert list(df["unit_col"]) == ['g, g', 'kg', 'cm', 'mm']
    assert list(df["value_col_value"]) == ['1000.0, 2000.0', '0.453592', '100', '10']

    df = convert_units_given_unit_dicts(
        df=conversion_df_lower_upper, 
        value_col="value_col", 
        unit_col="unit_col", 
        unit_to_calc=unit_to_calc, 
        unit_to_new_unit=unit_to_new_unit)
    assert list(df["unit_col"]) == ['g, g', 'kg', 'cm', 'mm']
    assert list(df["value_col_lowervalue"]) == ['1000.0, 2000.0', '0.453592', '100', '10']
    assert list(df["value_col_uppervalue"]) == ['2000.0, 3000.0', '0.907184', '300', '20']


def test_convert_units(df_conversion): 
    df_old = df_conversion.copy()
    df = convert_units(df_conversion)
    
    assert df["pc_unit"].tolist() == ["log Koc", "log Kd", "log Kow", "log Pow"]
    for pc_calc, pc_old in zip(df["pc_lowervalue"], df_old["pc_lowervalue"]):
        pc_old = pd.to_numeric(pc_old, errors='coerce')
        assert float(pc_calc) == math.log(pc_old, 10)
    
    assert df["temperature_unit"].tolist() == ["°C", "°C", "°C", "°C"]
    assert df["temperature_value"].tolist() == ['26.85', '25.0', '25.0', '0.0']
    
    assert df["henrys_law_constant_h_h_unit"].tolist() == ["log10 [-]", "log10 [-]", "log10 [-]", "log10 [-]"]
    assert df.loc[0, "henrys_law_constant_h_h_lowervalue"] == str(np.log10(df_old.loc[0, "henrys_law_constant_h_h_lowervalue"] /(df_old.loc[0, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[1, "henrys_law_constant_h_h_lowervalue"] == str(np.log10(df_old.loc[1, "henrys_law_constant_h_h_lowervalue"] * 1.01325 * 1.8 /(df_old.loc[1, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[2, "henrys_law_constant_h_h_lowervalue"] == str(np.log10(df_old.loc[2, "henrys_law_constant_h_h_lowervalue"] * 101325 /(df_old.loc[2, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[3, "henrys_law_constant_h_h_lowervalue"] == str(np.log10(df_old.loc[3, "henrys_law_constant_h_h_lowervalue"] /(df_old.loc[3, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[0, "henrys_law_constant_h_h_uppervalue"] == str(np.log10(df_old.loc[0, "henrys_law_constant_h_h_uppervalue"] /(df_old.loc[0, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[1, "henrys_law_constant_h_h_uppervalue"] == str(np.log10(df_old.loc[1, "henrys_law_constant_h_h_uppervalue"] * 1.01325 * 1.8 /(df_old.loc[1, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[2, "henrys_law_constant_h_h_uppervalue"] == str(np.log10(df_old.loc[2, "henrys_law_constant_h_h_uppervalue"] * 101325 /(df_old.loc[2, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    assert df.loc[3, "henrys_law_constant_h_h_uppervalue"] == str(np.log10(df_old.loc[3, "henrys_law_constant_h_h_uppervalue"] /(df_old.loc[3, "henrys_law_constant_h_temp_value"] + 273.15)/ 8.314))
    
    assert df["time_unit"].tolist() == ["h", "h", "h", "h"]
    assert df["time_value"].tolist() == ['1.0', '1.0', '1', '24']


def test_create_connection(tmpdir): 
    db_file = tmpdir.join("test.db")
    conn = create_connection(str(db_file))
    assert conn is not None
    assert isinstance(conn, sqlite3.Connection)
    conn.close()

    conn = create_connection("/invalid/path/to/db.db")
    assert conn is None





  


import os
import pandas as pd
import structlog
from typing import List
from .xml_parse_utils import unzip_i6z_files
from .xml_parse_utils import get_values_for_dir_list
from .xml_parse_utils import rename_cols
from .xml_parse_utils import convert_units
from .xml_parse_utils import create_connection

log = structlog.get_logger()

def retrieve_reach_study_results(
    path_dossiers: str,
    path_to_save: str,
    subtypes: List[str] = None,
    save_to_excel: bool = False
):
    if subtypes is None:
        subtypes = [
            "AcuteToxicityDermal",
            "AcuteToxicityInhalation",
            "AcuteToxicityOral",
            "AdditionalEcotoxicologicalInformation",
            "AdditionalPhysicoChemical",
            "AdditionalToxicologicalInformation",
            "AdsorptionDesorption",
            "AutoFlammability",
            "BasicToxicokinetics",
            "BioaccumulationAquaticSediment",
            "BiodegradationInWaterScreeningTests",
            "BiodegradationInSoil",
            "BiodegradationInWaterAndSedimentSimulationTests",
            "BoilingPoint",
            "Carcinogenicity",
            "Density",
            "DissociationConstant",
            "DistributionModelling",
            "EpidemiologicalData",
            "Explosiveness",
            "ExposureRelatedObservationsOther",
            "EyeIrritation",
            "Flammability",
            "FlashPoint",
            "GeneralInformation",
            "GeneticToxicityVitro",
            "GeneticToxicityVivo",
            "Granulometry",
            "HenrysLawConstant",
            "Hydrolysis",
            "LongTermToxicityToAquaInv",
            "LongTermToxToFish",
            "Melting",
            "ModeOfDegradationInActualUse",
            "OxidisingProperties",
            "Partition",
            "Phototransformation",
            "PhototransformationInAir",
            "PhotoTransformationInSoil",
            "RepeatedDoseToxicityInhalation",
            "RepeatedDoseToxicityOral",
            "SedimentToxicity",
            "SensitisationData",
            "ShortTermToxicityToAquaInv",
            "ShortTermToxicityToFish",
            "SkinIrritationCorrosion",
            "SkinSensitisation",
            "SolubilityOrganic",
            "SpecificInvestigations",
            "StabilityOrganic",
            "SurfaceTension",
            "ToxicityToAquaticAlgae",
            "ToxicityToMicroorganisms",
            "ToxicityToBirds",
            "ToxicityToMicroorganisms",
            "ToxicityToSoilMacroorganismsExceptArthropods",
            "ToxicityToSoilMicroorganisms",
            "ToxicityToTerrestrialArthropods",
            "ToxicityToTerrestrialPlants",
            "Vapour",
            "Viscosity",
            "WaterSolubility",
        ]

    dataframes = {}

    # Iterate over each subtype and retrieve the information from the IUCLID files. Process the data and save it to a SQL database.
    for subtype in subtypes:
        log.info(subtype)
        
        directory_to_folders = path_dossiers + "_unzipped"

        if not os.path.exists(directory_to_folders):
            log.info("Unzipping")
            unzip_i6z_files(path=path_dossiers)

        dir_list = os.listdir(directory_to_folders)
        dir_list = [x for x in dir_list if "." not in x]  # to eliminate files called ".DS_Store"

        # Define XML namespace mappings for parsing
        name_space = {
            "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
            "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
            "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
            "xsl": "http://www.w3.org/1999/XSL/Transform",
        }

        # Extract the information for the subtype from the XML files
        df = get_values_for_dir_list(
            name_space=name_space,
            dir_list=dir_list,
            directory_to_folders=directory_to_folders,
            subtype=subtype,
        )

        # Separate and sort columns: keep the first 9 columns unchanged and sort the rest
        identifier_columns = df.columns[:9].tolist()
        unsorted_columns = df.columns[9:].tolist()
        sorted_columns = sorted(unsorted_columns)
        sorted_columns = identifier_columns + sorted_columns
        df = df[sorted_columns]

        # Rename columns and convert units
        df = rename_cols(df=df) 
        df = convert_units(df=df)

        dataframes[subtype] = df
        
        # Save the dataframe to the SQLite database as a table named after the current subtype
        current_directory = os.path.dirname(os.path.abspath(__file__))
        database = os.path.join(current_directory, f"{path_to_save}.db")
        conn = create_connection(database)
        df.to_sql(subtype, conn, if_exists='replace', index=False)

    # Save the dataframe additionally to excel
    if save_to_excel:
        excel_path = os.path.join(path_to_save, f"{path_to_save}.xlsx")
        with pd.ExcelWriter(excel_path, engine='xlsxwriter') as writer:
            for subtype, df in dataframes.items():
                df.to_excel(writer, sheet_name=subtype, index=False)
            
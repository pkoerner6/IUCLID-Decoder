import sys
import os
import pandas as pd
import tqdm
# from collections import defaultdict
from typing import List, Dict, Tuple, Set
import xml.etree.ElementTree as ET

sys.path.append(os.path.join(os.path.dirname(__file__), ".."))
from xml_parse import unzip_i6z_files
from xml_parse import check_if_exists
from xml_parse import find_info_in_manifest_per_doc
from xml_parse import find_info_in_manifest_per_doc_reference
from xml_parse import create_manifest_df
from xml_parse import check_tag_of_children
from xml_parse import get_topics
from xml_parse import get_values
from xml_parse import get_code_to_decode


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
    # xml_manifest = "tests/reach_study_results_dossiers_23-05-2023_test_unzipped/f6fbb0ad-2581-47be-b240-9a62480b1516/manifest.xml"
    # tree = ET.parse(xml_manifest)
    # root = tree.getroot()
    # subtype = "BiodegradationInWaterScreeningTests"
    # name_space = {
    #     "manifest": "http://iuclid6.echa.europa.eu/namespaces/manifest/v1",
    #     "parameter": "http://iuclid6.echa.europa.eu/namespaces/platform-container/v1",
    #     "study_record": f"http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-{subtype}/7.0",
    #     "xsl": "http://www.w3.org/1999/XSL/Transform",
    # }
    # result = find_info_in_manifest_per_doc(root, name_space)
    # print(result)
    # assert result == ["Test Name", "Test IUPAC", "123-45-6", "789"]
    xml_str = '''<manifest:representation xmlns:manifest="manifest">
                    <manifest:parent>
                        <manifest:name>Test Name</manifest:name>
                    </manifest:parent>
                    <manifest:reference-substance>
                        <manifest:IUPAC-name>Test IUPAC</manifest:IUPAC-name>
                        <manifest:CAS-number>123-45-6</manifest:CAS-number>
                        <manifest:inventory-number>789</manifest:inventory-number>
                    </manifest:reference-substance>
                 </manifest:representation>'''
    document = ET.fromstring(xml_str)
    name_space = {"manifest": "manifest"}
    result = find_info_in_manifest_per_doc(document, name_space)
    assert result == ["Test Name", "Test IUPAC", "123-45-6", "789"]
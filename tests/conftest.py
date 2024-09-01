import pytest
import pandas as pd
import numpy as np
import os

def pytest_ignore_collect(path):
  return "reach_study_results" in str(path)

d = {
  "A": [1, 2, 3], 
  "B": [4, 5, 6]
}


@pytest.fixture
def xml_data() -> pd.DataFrame:
    df = pd.DataFrame.from_dict(d)
    return df


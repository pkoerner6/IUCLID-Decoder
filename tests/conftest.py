import pytest
import pandas as pd
import numpy as np
import os


d = {
  "A": [1, 2, 3], 
  "B": [4, 5, 6]
}


@pytest.fixture
def xml_data() -> pd.DataFrame:
    df = pd.DataFrame.from_dict(d)
    return df


import pytest
import pandas as pd
import numpy as np
import os



lower_upper_dict = {
    "unit_col": {
        0: "kg",
        1: "lb",
    },
    "col_lower": {
        0: "1.5, 2.0",
        1: "1.0",
    },
    "col_upper": {
        0: "2.5, 3.0",
        1: "2.0",
    },
}

value_dict = {
    "unit_col": {
        0: "kg, kg",
        1: "lb",
    },
    "value_col": {
        0: "1.5, 2.0",
        1: "1.0",
    },
}

conversion_dict = {
    "unit_col": {
        0: "kg, kg",
        1: "lb",
        2: "m",
        3: "cm",
    },
    "value_col_value": {
        0: "1.0, 2.0",
        1: "1.0",
        2: "1",
        3: "1",
    },
}



@pytest.fixture
def df_lower_upper():
    return pd.DataFrame(lower_upper_dict)

@pytest.fixture
def df_value():
    return pd.DataFrame(value_dict)

@pytest.fixture
def conversion_df():
    return pd.DataFrame(conversion_dict)


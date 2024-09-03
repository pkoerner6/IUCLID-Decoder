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

conversion_dict_lower_upper = {
    "unit_col": {
        0: "kg, kg",
        1: "lb",
        2: "m",
        3: "cm",
    },
    "value_col_lowervalue": {
        0: "1.0, 2.0",
        1: "1.0",
        2: "1",
        3: "1",
    },
    "value_col_uppervalue": {
        0: "2.0, 3.0",
        1: "2.0",
        2: "3",
        3: "2",
    },
}


convert_units_dict = {
    "pc_unit": ["Koc", "Kd", "Kow", "Pow"],
    "pc_lowervalue": [1000, 500, 2000, 10], 
    "pc_uppervalue": [1000, 500, 2000, 10], 
    "temperature_unit": ["K", "°C", "°F", "K"],
    "temperature_value": [300, 25, 77, 273.15],
    "henrys_law_constant_h_h_unit": ["Pa m³/mol", "atm", "atm m³/mol", "Pa m³/mol"],
    "henrys_law_constant_h_h_lowervalue": [1000, 1, 1, 1000],
    "henrys_law_constant_h_h_uppervalue": [2000, 2, 2, 2000],
    "henrys_law_constant_h_temp_value": [25, 25, 25, 25],
    "henrys_law_constant_h_temp_unit":["°C", "°C", "°C", "°C"],
    "time_unit": ["s", "min", "h", "d"],
    "time_value": [3600, 60, 1, 1],
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

@pytest.fixture
def conversion_df_lower_upper():
    return pd.DataFrame(conversion_dict_lower_upper)

@pytest.fixture
def df_conversion():
    return pd.DataFrame(convert_units_dict)
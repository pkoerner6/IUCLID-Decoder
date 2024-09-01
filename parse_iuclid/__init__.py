"""
This package provides functionality for retrieving the REACH study results form IUCLID format.
It allows you to retrieve data from REACH study dossiers and save the processed
data into an SQLite database or an Excel file.

Main Function:
---------------
- `retrieve_reach_study_results`: Main function to process REACH study results.

Usage:
------
To use this package, import the function `retrieve_reach_study_results` and
call it with the desired arguments.

Example:
---------
from retrieve_reach_study_results import retrieve_reach_study_results

retrieve_reach_study_results(
    path_dossiers="path/to/dossiers",
    path_to_save="path/to/save",
    subtypes = [
        "AcuteToxicityDermal",
        "AcuteToxicityInhalation",
    ], 
    save_to_excel=True
)
"""

from .core import retrieve_reach_study_results

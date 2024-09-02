# Parse IUCLID

## Overview

This package processes REACH study results and saves the data to an SQLite database and optionally an Excel file. Running this file requires you to first download the REACH study results dossiers from the [IUCLID website](https://iuclid6.echa.europa.eu). The REACH study results dossiers should be placed in the same directory as the code file where you intend to use the ```retrieve_reach_study_results``` function.

## Installation

To install this package, clone the repository and install it using `pip`:

```bash
git clone https://github.com/pkoerner6/parse_iuclid.git
cd parse_iuclid
pip3 install .
```

## Usage

To use the ```retrieve_reach_study_results``` function in your Python code, you first need to install the ```parse_iuclid``` package as described above. Ensure that the Python script where you intend to use the ```retrieve_reach_study_results``` function is in the same directory as the downloaded REACH study results dossiers.

### Function Arguments
The retrieve_reach_study_results function accepts four arguments—two required and two optional:

- ```path_dossiers``` (required): The path to the REACH study results dossiers as a string. The REACH study results dossiers should be in the same directory as the script where you're using the function.
- ```path_to_save``` (required): The directory where you want to save the resulting SQLite database and Excel file. You can also provide just a name for the SQLite database and Excel file; in that case, the files will be saved in the same directory as your script.
- ```subtypes``` (optional): By default, the function retrieves information for all subtypes. Subtypes represent specific study endpoints, such as *AcuteToxicityDermal* or *Hydrolysis*. If you want to retrieve data for specific subtypes only, you can provide a list of the desired subtypes.
- ```save_to_excel``` (optional): By default, this is set to ```False```. If you want to generate an Excel file in addition to the SQLite database, set this to ```True```. It should only be set to ```True``` if the ```subtypes``` argument is used with no more than 31 subtypes. Otherwise, only the first 31 subtypes will be saved to the Excel file. 


### Function Output
The function does not return any value. Instead, it saves the retrieved data from the REACH study results dossiers into an SQLite database and, optionally, an Excel file.

### Example Use
```bash
from parse_iuclid import retrieve_reach_study_results

retrieve_reach_study_results(
    path_dossiers = "reach_study_results/reach_study_results_dossiers_23-05-2023",
    path_to_save = "iuclid_data", 
    subtypes = [
        "AcuteToxicityDermal",
        "AcuteToxicityInhalation",
    ],
    save_to_excel = True
)
```

# Parse IUCLID

## Overview

This package processes REACH study results and saves the data to an SQLite database and Excel file. Running this file requires you to first download the REACH study results dossiers from the [IUCLID website](https://iuclid6.echa.europa.eu). The REACH study results dossiers should be placed in the same directory as the code file where you intend to use the retrieve_reach_study_results function.

## Installation

To install this package, clone the repository and install it using `pip`:

```bash
git clone https://github.com/pkoerner6/parse_iuclid.git
cd parse_iuclid
pip3 install .
```

## Usage
```bash
from parse_iuclid import retrieve_reach_study_results

retrieve_reach_study_results(
    path_dossiers="path/to/dossiers", # should be in same folder as the code file you use the function in (for example: "reach_study_results/reach_study_results_dossiers_23-05-2023")
    path_to_save="path/to/save", # for example "iuclid_data"
    save_to_excel=True
)
```

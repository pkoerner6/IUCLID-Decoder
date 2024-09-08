# IUCLID-Decoder

## Overview

This package processes REACH Study Results and saves the data to an SQLite database and optionally an Excel file. Using this package requires you to first download the REACH Study Results dossiers from the [IUCLID website](https://iuclid6.echa.europa.eu). The REACH Study Results dossiers should be placed in the same directory as the code file where you intend to use the ```decrypt_reach_results``` function.

## Statement of need

The REACH Study Results is a collection of non-confidential substance data that was submitted to the European Chemicals Agendy (ECHA) under the European Regulation on Registration, Evalutaiton, Authorization, and Restriction of Chemicals (REACH). The REACH Study Results contain results from studies that relate to physicohemical properties, environmental fate and pathways, and, ecotoxicology and toxicological information. The information for the currently more than 20 000 substances is stored in the REACH Study Results in over 4 million i6d-files. The IUCLID-Decoder package provided here enables the user to extract the information from the i6d-files and to compile it in a database (or optionally an excel file). In addition, the information that is available in the REACH Study Results as numerical code (including information on units, methods, reliability or study types) is converted into text. The units of the study results are standardised as far as possible.

It is recommended to check the IUCLID website regularly, as updated REACH Study Results are uploaded once or twice a year to the IUCLID website. This data can be easily transferred to a new (or updated) database using the IUCLID decoder.


## Installation

To install this package, clone the repository and install it using `pip`:

```bash
git clone https://github.com/pkoerner6/IUCLID-Decoder.git
cd IUCLID-Decoder
pip3 install .
```

## Usage

To use the ```decrypt_reach_results``` function in your Python code, you first need to install the ```iuclid_decoder``` package as described above. You may also consider to create a seperate environment. The structure of the directory should be e.g., reach_study_results/reach_study_results_dossier_xx_xx_xxx.i6z. Ensure that the Python script where you intend to use the ```decrypt_reach_results``` function is also in reach_study_results. 

If running the code under Windows, please unzip all files before running the function. The structure of the directory should be reach_study_results/reach_study_results_dossier_xx_xx_xxx_unzipped/unzipped_dossiers . Ensure that the Python script where you intend to use the ```decrypt_reach_results``` function is in reach_study_results. 

### Function Arguments
The ```decrypt_reach_results``` function accepts four arguments—two required and two optional:

- ```path_dossiers``` (required): The path to the REACH study results dossiers as a string. The REACH study results dossiers should be in the same directory as the script where you're using the function.
- ```path_to_save``` (required): The directory where you want to save the resulting SQLite database and Excel file. You can also provide just a name for the SQLite database and Excel file; in that case, the files will be saved in the same directory as your script.
- ```subtypes``` (optional): By default, the function retrieves information for all subtypes. Subtypes represent specific study endpoints, such as *AcuteToxicityDermal* or *Hydrolysis*. If you want to retrieve data for specific subtypes only, you can provide a list of the desired subtypes.
- ```save_to_excel``` (optional): By default, this is set to ```False```. If you want to generate an Excel file in addition to the SQLite database, set this to ```True```. It should only be set to ```True``` if the ```subtypes``` argument is used with no more than 31 subtypes. Otherwise, only the first 31 subtypes will be saved to the Excel file. 


### Function Output
The function does not return any value. Instead, it saves the retrieved data from the REACH study results dossiers into an SQLite database and, optionally, an Excel file.

### Example Usage
```bash
from iuclid_decoder import decrypt_reach_results

decrypt_reach_results(
    path_dossiers="reach_study_results/reach_study_results_dossiers_23-05-2023",
    subtypes = [
        "AcuteToxicityDermal",
        "AcuteToxicityInhalation",
    ],
    save_to_excel=True
)
```


## Community Guidelines
We welcome your contributions, feedback, and inquiries! Please follow these guidelines when engaging with our project.

### Contributing to the Software
We greatly appreciate code contributions and encourage you to submit new code through GitHub pull requests. This process helps maintain a clear record of code authorship, tracks and archives the code review workflow, and allows us to benefit from our continuous integration (CI) setup, which automates testing of newly added code.
- Code Submission: Submit your code via GitHub pull requests.
- Copyright and Licensing: By contributing code, you implicitly transfer copyright to the project. If you need an exception, please indicate this when creating a pull request.

### Reporting Issues
If you encounter any incorrect, unintuitive, or undocumented behavior, please report it using the GitHub issue tracker. This helps us address bugs and improve the software.
Clearly describe the issue, including steps to reproduce it, expected behavior, and any relevant logs or screenshots.

### Seeking Support
For questions about understanding, using, or extending ```iuclid_decoder```, we encourage you to use the GitHub Discussions feature. This platform is better suited for support queries than the issue tracker.


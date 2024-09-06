---
title: ‘IUCLID-Decoder: Python code to extract the chemical property data for the substances registered under REACH’
tags:
- Python
- IUCLID
- xml
- chemical property data
- REACH
authors:
- name: Paulina Körner  
 affiliation: 1
- name: Juliane Glüge
 orcid: 0000-0003-1997-2750
 affiliation: 1
 corresponding: true
affiliations:
- name: Institute of Biogeochemistry and Pollutant Dynamics, ETH Zurich, 8092 Zurich, Switzerland
- index: 1
date: 5 September 2024
bibliography: paper.bib

# Optional fields if submitting to a AAS journal too, see this blog post:
# https://blog.joss.theoj.org/2018/12/a-new-collaboration-with-aas-publishing
aas-doi: 10.3847/xxxxx <- update this with the DOI from AAS once you know it.
aas-journal: Astrophysical Journal <- The name of the AAS journal.
---

# Summary

The IUCLID-Decoder is a package in Ppython that enables users to extract chemical property data from REACH registration dossiers. The data is extracted from files that the European Chemicals Agency (ECHA) offers for download. These files, the so called ‘REACH Study Results’ contain more than 4 million i6d-files with study results. The ‘decrypt_reach_results’ function in the IUCLID Decoder package extracts and decodes the data and standardizes the units. The output is an SQLite database and (if set to ‘True’) an excel file with the database.

# Statement of need

ECHA publishes on its website `[@ECHA2024]` the non-confidential substance data that have been submitted by the registrants under the Regulation of Registration, Evaluation, Authorization and Restriction of Chemicals (REACH). However, ECHA reserves the right to block systematic automated data collection activities (including scraping, data mining, and extraction and re-utilization) of the whole or a substantial part of the website and the ECHA databases, where justified and subject to applicable law. To be still able to access the data, ECHA offers to download the ‘REACH Study Results’ via the IUCLID website `[@ECHA2024a]`. The REACH Study Results contain results from studies that relate to physicochemical properties, environmental fate and pathways, and ecotoxicology and toxicological information. As the data of the currently more than 20 000 substances come in over 4 million xml (i6d) files, a script is needed to import them into a database. The IUCLID-Decoder package provided here enables the user to extract the information from the i6d-files and to compile them into a database (or optionally an excel file). In addition, the information that is available in the REACH Study Results as numerical code (including information on units, methods, reliability or study types) is converted into text and the units of the study results are standardized as far as possible.

# Description
The REACH Study Results come as zipped i6z-file. When using Linux or Mac, the path to the unzipped i6z-file can be given to the decrypt_reach_results function and the function can be run without considering where to place it. Under Windows, all i6z-files should be unzipped before running the function und the decrypt_reach_results should be place in the same folder as the REACH Study Results (more information on the expected document structure is provided in the GitHub repository). 

The REACH Study Results contain one main folder per registered substance. This folder then contains the so-called ‘manifest’ as well as individual study results and the files that are needed to decode the results. The decrypt_reach_results function extracts the information property by property. To do this, it first opens the manifest of each substance and looks up the file ID for the property of interest. This property file is then opened and the data for the property of interest are read out. Before saving the data into a dataframe, the data are decoded, and the units are standardized.

It is recommended to check the IUCLID website regularly, as updated REACH Study Results are uploaded once or twice a year. This data can be easily transferred to a new (or updated) database using the IUCLID decoder package.

The decrypt_reach_results function has already been used in our previous work where we analyzed the physicochemcial property data [@Gluge2023a] and the bioconcentration data [@Gluge2022b] in the ECHA database. We have also used it in @Korner2024 to check certain REACH study results on ready-biodegradation.

# Acknowledgements
We thank Martin Scheringer for the initial idea of the project and Stefan Glüge for support in between. PK and JG acknowledge funding from the Swiss Federal Office for the Environment. 

# References

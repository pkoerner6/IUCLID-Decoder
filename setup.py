from setuptools import setup, find_packages

setup(
    name = 'retrieve_reach_study_results',
    version = '0.1.0',
    description = 'A package for downloading REACH study results',
    author = 'Paulina Körner, Juliane Glüge',
    packages=find_packages(),
    install_requires = [
        'defusedxml'==0.7.1,
        'et-xmlfile'==1.1.0,
        'nest-asyncio'==1.6.0,
        'numpy'==1.26.4,
        'openpyxl'==3.1.5,
        'pandas'==2.2.2,
        'structlog'==24.1.0,
        'tqdm'==4.66.4],
    include_package_data = True,
    python_requires = '>=3.6'
)
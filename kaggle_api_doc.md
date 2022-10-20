# Kaggle API Doc


### Requirements

- Install Kaggle API and take credentials
- Use Airflow BashOperator to download data
- Dump directly into MinIO - Data Lake.


### Kaggle API

 - `pip install kaggle` 
 - `export KAGGLE_USERNAME=datadinosaur`
 - `export KAGGLE_KEY=xxxxxxxxxxxxxx` from kaggle.json
 - Use Airflow Bash Operator to set environment variables before executing the download pipeline.


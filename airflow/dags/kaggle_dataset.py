from airflow.operators.bash import BashOperator
from datetime import datetime
from airflow import DAG
from utils import Minio

with DAG(
    'Kaggle_Download_Data',
    default_args = {
        "retries": 1,
        "description": "Download Kaggle Dataset from API commandline and dump to Data Lake",
        "tags": ["Extract"]
    }
) as dag: 

    t1 = BashOperator(
        task_id="sleep",
        bash_command="sleep 5",
        start_date=datetime(2022,11,15,11,37,0,0),
        retries=1
    ),



    t1
airflow-boot:
	docker-compose -f airflow/docker-compose.yaml up -d

airflow-wind-up:
	docker-compose -f airflow/docker-compose.yaml down

clickhouse-boot-server:
	docker start data-warehouse

clickhouse-wind-up-server:
	docker stop data-warehouse

minio-boot:
	docker start data-lake

minio-wind-up:
	docker stop data-lake

data-infra-start: airflow-boot clickhouse-boot-server minio-boot

data-infra-stop: airflow-wind-up clickhouse-wind-up-server minio-wind-up


airflow-init:
	curl -o ./airflow/docker-compose.yaml 'https://airflow.apache.org/docs/apache-airflow/2.4.1/docker-compose.yaml'

minio-init:
	docker run -d -p 9000:9000 -p 9090:9090 --user $(id -u):$(id -g) --name data-lake \
   -e "MINIO_ROOT_USER=selfadmin" \
   -e "MINIO_ROOT_PASSWORD=selfadmin" \
   -v ${HOME}/projects/Flipkart_Data_Analytic_Pipeline/minio/data:/data \
   quay.io/minio/minio server /data --console-address ":9090"

clickhouse-init:
	docker pull clickhouse/clickhouse-server
	docker run -d --name data-warehouse --ulimit nofile=262144:262144 clickhouse/clickhouse-server

data-infra-init: airflow-init minio-init clickhouse-init

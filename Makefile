airflow-boot:
	docker-compose -f airflow/docker-compose.yaml up -d

airflow-wind-up:
	docker-compose -f airflow/docker-compose.yaml down
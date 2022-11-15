import os
from dotenv import load_dotenv
from minio import Minio

load_dotenv()

class MinioDBConnection():

    def __init__(self) -> None:
        self.client = None

    def __enter__(self):
        self.client = Minio(
                os.getenv("MINIO_ENDPOINT"),
                access_key= os.getenv("MINIO_ACCESS_KEY"),
                secret_key= os.getenv("MINIO_SECRET_KEY"),
                secure=False,
            )

        return self.client
    
    def __exit__(self, exc_type, exc_value, exc_traceback):

        #Todo: How to close connection of Minio, no documentation found yet.
        try:
            response = self.client.get_object("firstlast", "Makefile")
        finally:

            response.close()
            response.release_conn() 


if __name__ == "__main__":

    with MinioDBConnection() as client:
        print(client.list_buckets())


    # Connection still open.
    print("Connection closed", client.list_buckets())
    


 



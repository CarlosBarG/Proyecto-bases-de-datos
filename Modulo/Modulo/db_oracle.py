import cx_Oracle
import os

def get_oracle_connection():
    """
   
    """
    try:
        dsn = cx_Oracle.makedsn(
            os.getenv("DB_HOST"),
            os.getenv("DB_PORT"),
            service_name=os.getenv("DB_SERVICE")
        )

        connection = cx_Oracle.connect(
            user = os.getenv("DB_USER"),
            password = os.getenv("DB_PASSWORD"),
            dsn = dsn
        )
        return connection
    
    except Exception as e:
        print("Error connectando a oracle database:", e)
    raise

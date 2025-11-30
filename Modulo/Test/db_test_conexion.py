"""Este Script prueba la conexión a la base de datos Oracle usando Django ORM, 
para ejecutarlo poner en la consola: python manage.py shell 
presionar enter y luego: exec(open('Test/db_test_conexion.py').read())
Finalmente se llama la funcion: test_database_connection()
"""

from django.db import connection

def test_database_connection():
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT USER FROM DUAL")
            print("Database connection successful. Current user:", cursor.fetchone()[0])
    except Exception as e:
        print("Database connection failed:", e)
    
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT table_name FROM user_tables")
            print("Test query executed successfully. Tables:", cursor.fetchall())
    except Exception as e:
        print("Test query failed:", e)

if __name__ == "__main__":
    test_database_connection()
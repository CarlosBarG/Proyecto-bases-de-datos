"""Este Script prueba que la conexión a la base de datos se haga mediante Oracle usando Django y no sqllite o otro motor, 
para ejecutarlo poner en la consola: python manage.py shell 
presionar enter y luego: exec(open('Test/db_full_oracle_connection.py').read())
Finalmente se llama la funcion: verify_full_oracle_connection()
"""
print("\n=== Comprobacion que se esta trabajando con Oracle puro (Django + oracledb) ===\n")

import django
django.setup()

from django.db import connections
import oracledb

def verify_full_oracle_connection():

    # 1. Verificar backend REAL
    backend = connections['default'].settings_dict.get("ENGINE", "")
    if backend == "django.db.backends.oracle":
        print("[OK] Django esta usando el backend Oracle:", backend)
    else:
        print("[ERROR] Django NO esta usando Oracle. Backend detectado:", backend)
        return

    # 2. Verificación de conexión real con SELECT
    try:
        with connections['default'].cursor() as cursor:
            cursor.execute("SELECT USER FROM DUAL")
            user = cursor.fetchone()[0]
            print(f"[OK] Conexión establecida. Usuario actual: {user}")
    except Exception as e:
        print("[ERROR] Fallo al ejecutar SELECT en Oracle:", e)
        return

    # 3. Verificar si oracledb está en modo THIN o THICK
    try:
        # Thick mode requiere cliente
        ver = oracledb.clientversion()
        print("[OK] oracledb esta en modo THICK. Cliente Oracle cargado.")
        print("     Versión del cliente:", ver)
    except Exception:
        print("[INFO] oracledb esta en modo THIN (sin cliente Oracle).")

    print("\nVerificación completada.\n")


if __name__ == "__main__":
    verify_full_oracle_connection()

from Modulo.db_oracle import get_oracle_connection
from appCliente.consultas_sql.cliente_insert import sql_insert_cliente as sql
from appCliente.consultas_sql.tipo_doc_select import sql_select_tipo_doc as sql_tpdoc
from appCliente.consultas_sql.cliente_select import sql_select_cliente as sql_selclie
from cx_Oracle import IntegrityError

def registrar_cliente(data):
    """ Esta funcion registra un nuevo cliente en la base de datos Oracle.
        Mediante una consulta INSERT """
    
    connection = get_oracle_connection()

    try:
        cursor = connection.cursor()
        cursor.execute(sql, [
            data["codcliente"],
            data["idtipodoc"],
            data["nomcliente"],
            data["apellcliente"],
            data["ndocumento"]
        ])
        connection.commit()
        return True
    
    except IntegrityError as ie:
        print("Error de Integridad al registrar el cliente:", ie)
        connection.rollback()
        raise
    
    except Exception as e:
        print("Error al registrar el cliente:", e)
        connection.rollback()
        raise

    finally:
        if cursor:
            cursor.close()
            connection.close()


def obtener_tipo_documento():

    connection = get_oracle_connection()
    tipos = []

    try:
        cursor = connection.cursor()
        cursor.execute(sql_tpdoc)
        rows = cursor.fetchall()

        for r in rows:
            tipos.append({
                "idtipodoc": r[0],
                "desctipodoc": r[1]
            })

            #print("Debug tipos:", tipos)

        return tipos
    
    except Exception as e:
        print("Error obteniendo tipos de documento:", e)
        return []
    
    finally:
        cursor.close()
        connection.close()
    
def buscar_cliente_por_codigo(codcliente):
    
    connection = get_oracle_connection()

    with connection.cursor() as cursor:
        cursor.execute(sql_selclie, {"codcliente": codcliente})
        row = cursor.fetchone()

        if row:
            return {
                "codcliente": row[0],
                "idtipodoc": row[1],
                "nomcliente": row[2],
                "apellcliente": row[3],
                "ndocumento": row[4]
            }
        else:
            return None
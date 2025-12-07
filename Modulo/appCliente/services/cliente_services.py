from Modulo.db_oracle import get_oracle_connection

def registrar_cliente(data):
    """ Esta funcion registra un nuevo cliente en la base de datos Oracle.
        Mediante una consulta INSERT """
    sql = """
    INSERT INTO CLIENTE (CODCLIENTE, IDTIPODOC, NOMCLIENTE, APELLCLIENTE, NDOCUMENTO))
    VALUES (:codcliente, :idtipodoc, :nomcliente, :apellcliente, :ndocumento)
    """
    connection = get_oracle_connection()
    cursor = connection.cursor()

    try:
        cursor.execute(sql, [
            data["codcliente"],
            data["idtipodoc"],
            data["nomcliente"],
            data["apellcliente"],
            data["ndocumento"]
        ])
        connection.commit()
        return True
    
    except Exception as e:
        print("Error registrando cliente:", e)
        connection.rollback()
        return False

    finally:
        cursor.close()
        connection.close()

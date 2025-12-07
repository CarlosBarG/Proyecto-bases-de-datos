

sql_insert_cliente = """
    INSERT INTO CLIENTE (CODCLIENTE, IDTIPODOC, NOMCLIENTE, APELLCLIENTE, NDOCUMENTO)
    VALUES (:codcliente, :idtipodoc, :nomcliente, :apellcliente, :ndocumento)
    """

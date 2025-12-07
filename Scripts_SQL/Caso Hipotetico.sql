-- 2.6 Caso Hipotetico

-- Cliente
INSERT INTO CLIENTE VALUES ('00010','CC', 'Juan','Perez','2512354');

-- Ciudad
-- en este caso no se inserta la ciudad de Bogota porque ya existen en la base de datos, debido a que en el punto 2.5 se nos solicito crear varios lugares,
-- en caso de que no existiera, se haria de la siguiente manera: 
-- INSERT INTO TIPOLUGAR VALUES ('')
--

--Abogado Penalista
INSERT INTO ABOGADO (CEDULA, NOMBRE, APELLIDO, NTARJETAPROFESIONAL) 
VALUES ('1235468529' ,'Harvey','Specter','62586');  

-- Especialización Penal en nuestro caso no se crea pues este ya existe en la base de datos, debido a que en el punto 2.3
-- se nos solicito crear varias especializaciones, en caso de que no existiera, se haria de la siguiente manera:
-- INSERT INTO ESPECIALIZACION (CODESPECIALIZACION, NOMESPECIALIZACION) 
-- VALUES ('PEN', 'PENAL');

-- se asigna la especializacion al abogado
INSERT INTO ESP___ABOGADO (CEDULA, CODESPECIALIZACION) VALUES ('1235468529', 'PEN');


-- Se radica el caso:
-- Especialización Penal en nuestro caso no se crea pues este ya existe en la base de datos, debido a que en el punto 2.3
-- se nos solicito crear varias especializaciones, en caso de que no existiera, se haria de la siguiente manera:
-- INSERT INTO ESPECIALIZACION (CODESPECIALIZACION, NOMESPECIALIZACION) 
-- VALUES ('PEN', 'PENAL');

INSERT INTO CASO (NOCASO, CODCLIENTE, CODESPECIALIZACION, FECHAINICIO, FECHAFIN, VALOR) 
VALUES (00010, '00010', 'PEN', TO_DATE('01/12/2010', 'DD/MM/YYYY'), TO_DATE('24/12/2010', 'DD/MM/YYYY'), '100000000');

-- Cada caso al momento de ser radicado por parte del cliente, se le asigna un número de expediente que lo identifica:
--creacion del expediente inicial:
-- el expediente requiere el codigo del lugar donde se lleva a cabo la etapa del caso, asi que agregamos el lugar:
INSERT INTO TIPOLUGAR (IDTIPOLUGAR, DESCTIPOLUGAR) VALUES ('EJUD','Entidad Judicial');

INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR) 
VALUES ('FGN', 'EJUD', 'BOGOT', 'Fiscalía General Nación', 'Ac. 24 #52-01', '018000912280', 'FiscaliaGeneral@entidadjudicialcolombia.com');

-- ============================================
-- ETAPA 1: INDAGACION
-- ============================================

-- se crea el expediente para la primer etapa del Caso(Indagacion):
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 1, 00010, 6528, 'FGN', '1235468529', TO_DATE('01/12/2010', 'DD/MM/YYYY')); 

-- Sucesos de la primer etapa del Caso(Indagacion):
-- procesos de la fiscalia general de la nacion
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)  
VALUES ('PEN', 1, 00010, 6528, 0001, 'Fiscalía recopila pruebas y abre investigación.');

-- procesos del abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO) 
VALUES ('PEN', 1, 00010, 6528, 0002, 'Defensor asesora, solicita pruebas y verifica legalidad.');

--resultado de la indagacion
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL) 
VALUES ('PEN', 1, 00010, 6528, 0001, 'El resultado de la etapa es la apertura investigación');

--Documentos etapa indagacion
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC) 
VALUES ('PEN', 1, 00010, 6528, 0001, 'FISCALIA.GOV.CO/INVESTIGACION/EXP1235468529');


-- ============================================
-- ETAPA 2: IMPUTACION DE CARGOS
-- ============================================

-- Siguiente etapa Imputacion de cargos, se crea el expediente para esta etapa
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR) 
VALUES ('JUCG', 'JUZG', 'BOGOT', 'JUZGADO CONTROL', 'CL 45 #23', '52357576', 'JUZGADOCONTROL@GMAIL.COM');  

-- se crea el expediente para la segunda etapa del Caso(Imputacion de cargos):
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 2, 00010, 6529, 'JUCG', '1235468529', TO_DATE('03/12/2010', 'DD/MM/YYYY')); 

-- Sucesos de la segunda etapa del Caso(Imputacion de cargos):
-- procesos entidad judicial
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 2, 00010, 6529, 0001, 'Fiscal imputa hurto agravado ante juez de control.');

-- procesos del abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 2, 00010, 6529, 0002, 'Defensa acompaña y se opone por falta de pruebas.');

--resultado de la imputacion de cargos
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 2, 00010, 6529, 0001, 'Con base en los sucesos ocurridos, Como Resultado Juan no acepta cargos');

-- Documentos etapa imputacion de cargos
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 2, 00010, 6529, 0002, 'JUZG.CONTROL.GOV.CO/IMPUTACION/EXP1235468529');


-- ============================================
-- ETAPA 3: ACUSACION
-- ============================================

-- Siguiente etapa Acusacion, se crea el expediente para esta etapa:
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR)
VALUES ('JUCO', 'JUZG', 'BOGOT', 'JUZGADO DE CONOCIMIENTO', 'CL 50 #17', '5235573', 'JUZGADODECONOCIMIENTO@GMAIL.COM');

-- se crea el expediente para la tercera etapa del Caso(Acusacion):
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 3, 00010, 6530, 'JUCO', '1235468529', TO_DATE('05/12/2010', 'DD/MM/YYYY'));

-- Sucesos de la tercera etapa del Caso(Acusacion):
-- procesos entidad judicial
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 3, 00010, 6530, 0001, 'Fiscal presenta acusación y anuncia pruebas para juicio');

-- procesos del abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 3, 00010, 6530, 0002, 'Defensa examina y pide excluir pruebas ilegales.');

-- presentacion de pruebas entidad judicial y abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 3, 00010, 6530, 0003, 'Partes presentan listas de pruebas y testigos.');

-- decicion del juez
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 3, 00010, 6530, 0004, 'Juez define pruebas a practicar en juicio.');

-- abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 3, 00010, 6530, 0005, 'Defensa solicita testigos y exclusión de pruebas ilegales.');

--resultado de la acusacion
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 3, 00010, 6530, 0001, 'Se admite la acusación y se fijan las pruebas que se practicarán en el juicio');

-- Documentos etapa acusacion
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 3, 00010, 6530, 0001, 'JUZG.CONOC.GOV.CO/ACUSACION/EXP1235468529');


-- ============================================
-- ETAPA 4: JUICIO
-- ============================================

-- Siguiente etapa Juicio, se crea el expediente para esta etapa:
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se usa el mismo juzgado de conocimiento

-- se crea el expediente para la cuarta etapa del Caso(Juicio):
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 4, 00010, 6531, 'JUCO', '1235468529', TO_DATE('10/12/2010', 'DD/MM/YYYY'));

-- Sucesos de la cuarta etapa del Caso(Juicio):
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 4, 00010, 6531, 0001, 'Se practican pruebas, testigos y alegatos; juez sentencia.');

-- abogado defensor
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 4, 00010, 6531, 0002, 'Defensa interroga y pide absolución por duda razonable.');

-- resultado del juicio
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 4, 00010, 6531, 0001, 'Como resultado de la etapa sentencia absolutoria, si no se demuestra la culpabilidad o sentencia condenatoria, si se prueba el hurto más allá de toda duda razonable');

-- Documentos etapa juicio
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 4, 00010, 6531, 0001, 'JUZG.CONOC.GOV.CO/JUICIO/EXP1235468529');


-- ============================================
-- ETAPA 5: SENTENCIA
-- ============================================

-- se crea el expediente para la quinta etapa del Caso (Sentencia):
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 5, 00010, 6532, 'JUCO', '1235468529', TO_DATE('15/12/2010', 'DD/MM/YYYY'));

-- Sucesos de la quinta etapa del Caso(Sentencia):
-- Se dicta sentencia
INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)  
VALUES ('PEN', 5, 00010, 6532, 0001, 'Juez dicta sentencia condenatoria por hurto probado.');

-- Resultado de la sentencia (Primera Instancia)
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL) 
VALUES ('PEN', 5, 00010, 6532, 0001, 'Sentencia condenatoria por hurto agravado');

-- Documentos etapa sentencia
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC) 
VALUES ('PEN', 5, 00010, 6532, 0001, 'JUZG.CONOC.GOV.CO/SENTENCIA/EXP1235468529');


-- ============================================
-- ETAPA 6: IMPUGNACIONES (INSTANCIAS JUDICIALES)
-- ============================================

-- Siguiente etapa Impugnaciones
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:

-- Impugnacion(Instancias judiciales)

-- Primer instancia de la impugnacion Sentencia
-- Se crea el juzgado penal del circuito 
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR)
VALUES ('JUPC', 'JUZG', 'BOGOT', 'JUZGADO PENAL DEL CIRCUITO', 'CL 55 #19', '5235599', 'JUZGADOPENALDELCIRCUITO@GMAIL.COM');

-- se crea el expediente para la impugnacion
INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 6, 00010, 6533, 'JUPC', '1235468529', TO_DATE('16/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 6, 00010, 6533, 0001, 'Sentencia inicial del Juez Penal del Circuito.');

-- Resultado primera instancia
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 6, 00010, 6533, 0001, 'Sentencia en primera instancia confirmada');

-- Documentos primera instancia
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 6, 00010, 6533, 0001, 'JUZG.PENALCIRC.GOV.CO/SENTENCIA/EXP1235468529');


-- ============================================
-- SEGUNDA INSTANCIA - APELACION
-- ============================================

-- Segunda instancia de la impugnacion Apelacion
-- Se crea el tribunal superior del distrito judicial
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR)
VALUES ('TSDJ', 'TRIB', 'BOGOT', 'Tribunal Superior D Judicial', 'CL 60 #25', '5235600', 'TRIBUNALSUPERIORDISTRITOJUDICIAL@GMAIL.COM');

INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 7, 00010, 6534, 'TSDJ', '1235468529', TO_DATE('20/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 7, 00010, 6534, 0001, 'Defensa apela; tribunal puede confirmar, modificar o revocar.');

-- Resultado segunda instancia
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 7, 00010, 6534, 0001, 'El Tribunal Superior confirma la sentencia condenatoria');

-- Documentos segunda instancia
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 7, 00010, 6534, 0001, 'TRIB.SUP.DIST.GOV.CO/APELACION/EXP1235468529');


-- ============================================
-- TERCERA INSTANCIA - CASACION
-- ============================================

-- Tercera instancia de la impugnacion Casación
-- Se crea la corte suprema de justicia
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR)
VALUES ('CSJ', 'TRIB', 'BOGOT', 'CORTE SUPREMA DE JUSTICIA', 'CL 70 #30', '5235610', 'CORTESUPREMAJUSTICIA@GMAIL.COM');

INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 8, 00010, 6535, 'CSJ', '1235468529', TO_DATE('22/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 8, 00010, 6535, 0001, 'Defensa interpone casación por errores graves de derecho.');

-- Resultado tercera instancia
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 8, 00010, 6535, 0001, 'La Corte Suprema casa la sentencia y ordena un nuevo juicio');

-- Documentos tercera instancia
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 8, 00010, 6535, 0001, 'CSJ.GOV.CO/CASACION/EXP1235468529');


-- ============================================
-- CUARTA INSTANCIA - REVISION CONSTITUCIONAL
-- ============================================

--- Cuarta instancia de la impugnacion Revisión
INSERT INTO LUGAR (CODLUGAR, IDTIPOLUGAR, LUG_CODLUGAR, NOMLUGAR, DIRELUGAR, TELLUGAR, EMAILLUGAR)
VALUES ('CCJ', 'TRIB', 'BOGOT', 'Corte Constitucional Justicia', 'CL 80 #35', '5235620', 'CORTECONSTITUCIONALDEJUSTICIA@GMAIL.COM');

INSERT INTO EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CODLUGAR, CEDULA, FECHAETAPA)
VALUES ('PEN', 9, 00010, 6536, 'CCJ', '1235468529', TO_DATE('24/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO, DESCSUCESO)
VALUES ('PEN', 9, 00010, 6536, 0001, 'Se presenta tutela por derechos vulnerados; Corte revisa caso.');

-- Resultado cuarta instancia
INSERT INTO RESULTADO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL, DESCRESUL)
VALUES ('PEN', 9, 00010, 6536, 0001, 'La Corte Constitucional revisa el caso y protege los derechos fundamentales');

-- Documentos cuarta instancia
INSERT INTO DOCUMENTO (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC, UBICADOC)
VALUES ('PEN', 9, 00010, 6536, 0001, 'CCJ.GOV.CO/REVISION/EXP1235468529');


-- ============================================
-- DATOS ADICIONALES DEL CASO
-- ============================================

-- Contactos del Cliente Juan Perez (CORREGIDO: nombres de columnas y NOTIFICACION agregada)
INSERT INTO CONTACTO (CODCLIENTE, CONSECONTACTO, IDTIPOCONTA, VALORCONTACTO, NOTIFICACION)
VALUES ('00010', 0001, 'CEL', '3105551234', 1);

INSERT INTO CONTACTO (CODCLIENTE, CONSECONTACTO, IDTIPOCONTA, VALORCONTACTO, NOTIFICACION)
VALUES ('00010', 0002, 'EMA', 'juan.perez@email.com', 1);

INSERT INTO CONTACTO (CODCLIENTE, CONSECONTACTO, IDTIPOCONTA, VALORCONTACTO, NOTIFICACION)
VALUES ('00010', 0003, 'DIR', 'Calle 45 #12-34, Bogotá', 1);

-- Pagos del caso (CORREGIDO: eliminado CODCLIENTE que no existe, agregado NTARJETA)
INSERT INTO PAGO (CONSECPAGO, NOCASO, IDFORMAPAGO, CODFRANQUICIA, FECHAPAGO, VALORPAGO, NTARJETA)
VALUES (0001, 00010, 'TAR', 'VIS', TO_DATE('01/12/2010', 'DD/MM/YYYY'), 50000000, 411111111111111);

INSERT INTO PAGO (CONSECPAGO, NOCASO, IDFORMAPAGO, CODFRANQUICIA, FECHAPAGO, VALORPAGO, NTARJETA)
VALUES (0002, 00010, 'EFE', NULL, TO_DATE('15/12/2010', 'DD/MM/YYYY'), 50000000, NULL);

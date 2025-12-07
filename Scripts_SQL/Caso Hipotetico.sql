-- 2.6 Caso Hipotetico

-- Cliente
INSERT INTO CLIENTE VALUES ('00010','CC', 'Juan','Perez','2512354154');

-- Ciudad
-- en este caso no se inserta la ciudad de Bogota porque ya existen en la base de datos, debido a que en el punto 2.5 se nos solicito crear varios lugares,
-- en caso de que no existiera, se haria de la siguiente manera: 
-- INSERT INTO TIPOLUGAR VALUES ('')
--

--Abogado Penalista
INSERT INTO ABOGADO VALUES ('1235468529' ,'Harvey','Specter','62586');  

-- Especialización Penal en nuestro caso nos e crea pues este ya existe en la base de datos, debido a que en el punto 2.3
-- se nos solicito crear varias especializaciones, en caso de que no existiera, se haria de la siguiente manera:
-- INSERT INTO ESPECIALIZACION (CODESPECIALIZACION, NOMESPECIALIZACION) 
-- VALUES ('PEN', 'PENAL');

-- se asgina la especializacion al abogado
INSERT INTO ESP___ABOGADO VALUES ('PEN', '1235468529');


-- Se radica el caso:
-- Especialización Penal en nuestro caso no se crea pues este ya existe en la base de datos, debido a que en el punto 2.3
-- se nos solicito crear varias especializaciones, en caso de que no existiera, se haria de la siguiente manera:
-- INSERT INTO ESPECIALIZACION (CODESPECIALIZACION, NOMESPECIALIZACION) 
-- VALUES ('PEN', 'PENAL');

INSERT INTO CASO VALUES (00010, 'PEN', '00010', TO_DATE('01/12/2010', 'DD/MM/YYYY'), TO_DATE('24/12/2010', 'DD/MM/YYYY'), '100.000.000');
-- Cada caso al momento de ser radicado por parte del cliente, se le asigna un número de expediente que lo identifica:
--creacion del expediente inicial:
-- el expediente requiere el codigo del lugar donde se lleva a caso la etapa del caso, asi que agregamso el lugar:
INSERT INTO TIPOLUGAR VALUES ('EJUD','Entidad Judicial');
INSERT INTO LUGAR VALUES ('FGN', 'EJUD', 'BOG', 'Fiscalía General de la Nación', 'Ac. 24 #52-01', '018000 912280', 'FiscaliaGeneral@entidadjudicialcolombia.com');
-- se crea el expediente para la primer etapa del Caso(Indagacion):
INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 1, 6528, '1235468529', 'FGN',  TO_DATE('01/12/2010', 'DD/MM/YYYY')); 

-- Sucesos de la primer etapa del Caso(Indagacion):
-- procesos de la fiscalia general de la nacion
INSERT INTO SUCESO VALUES (00010, 'PEN', 1, 6528, 0001, 'La fiscalía general de la Nación recopila pruebas como declaraciones, cámaras de seguridad, y antecedentes. Se abre una carpeta de investigación.');
-- procesos del abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 1, 6528, 0002, 'El abogado defensor Asesora a Juan Pérez sobre sus derechos y solicita la práctica de pruebas favorables (por ejemplo, testigos que confirmen que Juan no estaba en el lugar), verifica que la captura haya sido legal y que no se violen derechos fundamentales.');

--resultado de la indagacion
INSERT INTO RESULTADO VALUES (00010, 'PEN', 1, 6528, 0001, 'Con base en los sucesos ocurridos durante la indagación, El resultado de la atapa es la apertura investigación');


-- Siguiente etapa Imputacion de cargos, se crea el expediente para esta etapa
INSERT INTO LUGAR VALUES ('JUCG','JUZG','BOG','JUZGADO CONTROL','CL 45 #23', '52357576', 'JUZGADOCONTROL@GMAIL.COM');  
-- se crea el expediente para la segunda etapa del Caso(Imputacion de cargos):
INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 2, 6529, '1235468529', 'JUCG',  TO_DATE('03/12/2010', 'DD/MM/YYYY')); 
-- Sucesos de la segunda etapa del Caso(Imputacion de cargos):
-- procesos entidad judicial
INSERT INTO SUCESO VALUES (00010, 'PEN', 2, 6529, 0001, 'El fiscal presenta ante un Juez de control de garantías la imputación del delito de hurto agravado. Le comunica formalmente a Juan los cargos en su contra.');
-- procesos del abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 2, 6529, 0002, 'El abogado acompaña a Juan durante la audiencia, puede oponerse si considera que no hay pruebas o que el delito está mal tipificado y le explica a Juan las consecuencias de aceptar o no aceptar los cargos.');

--resultado de la imputacion de cargos
INSERT INTO RESULTADO VALUES (00010, 'PEN', 2, 6529, 0001, 'Con base en los sucesos ocurridos, Como Resultado Juan no acepta cargos');


-- Siguiente etapa Acusacion, se crea el expediente para esta etapa:
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:


-- se crea el expediente para la tercera etapa del Caso(Acusacion):
INSERT INTO LUGAR VALUES ('JUCO', 'JUZG', 'BOG', 'JUZGADO DE CONOCIMIENTO', 'CL 50 #17', '5235573', 'JUZGADODECONOCIMIENTO@GMAIL.COM');

INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 3, 6530, '1235468529', 'JUCO',  TO_DATE('05/12/2010', 'DD/MM/YYYY'));

-- Sucesos de la tercera etapa del Caso(Acusacion):
-- procesos entidad judicial
INSERT INTO SUCESO VALUES (00010, 'PEN', 3, 6530, 0001, 'El fiscal presenta la acusación formal ante el Juez de conocimiento, indicando las pruebas que usará en juicio');
-- procesos del abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 3, 6530, 0002, 'El abogado examina las pruebas de la Fiscalía, solicita excluir pruebas ilegales o no pertinentes y prepara la defensa técnica para el juicio.');
-- presentacion de pruebas entidad judicial y abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 3, 6530, 0003, 'Ambas partes (Fiscalía y defensa) presentan sus listas de pruebas, testigos y documentos.');
-- decicion del juez
INSERT INTO SUCESO VALUES (00010, 'PEN', 3, 6530, 0004, 'El juez define cuáles se practicarán en el juicio');
-- abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 3, 6530, 0005, 'El abogado solicita testigos y peritos que beneficien a Juan y pide que se excluyan pruebas obtenidas ilegalmente');


-- Siguiente etapa Juicio, se crea el expediente para esta etapa:
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:

-- se crea el expediente para la cuarta etapa del Caso(Juicio):
INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 4, 6531, '1235468529', 'JUCO',  TO_DATE('10/12/2010', 'DD/MM/YYYY'));

-- Sucesos de la cuarta etapa del Caso(Juicio):
INSERT INTO SUCESO VALUES (00010, 'PEN', 4, 6531, 0001, 'Se practican las pruebas, se escuchan testigos, peritos y alegatos finales. El juez evalúa los argumentos y dicta sentencia.');
-- abogado defensor
INSERT INTO SUCESO VALUES (00010, 'PEN', 4, 6531, 0002, 'El abogado Interroga y contrainterroga testigos, presenta los argumentos de defensa, puede pedir la absolución por falta de pruebas o duda razonable.');

-- resultado del juicio
INSERT INTO RESULTADO VALUES (00010, 'PEN', 4, 6531, 0001, 'Como resultado de la etapa sentencia absolutoria, si no se demuestra la culpabilidad o sentencia condenatoria, si se prueba el hurto más allá de toda duda razonable');


-- Siguiente etapa Impugnaciones
-- para crear el expediente se necesita el lugar donde se lleva a cabo la etapa, se crea el lugar:

-- Impugnacion(Instancias judiciales)





-- Primer instancia de la impugnacion Sentencia

-- Se crea el juzgado penal del circuito 

INSERT INTO LUGAR VALUES ('JUPC','JUZG','BOG','JUZGADO PENAL DEL CIRCUITO','CL 55 #19', '5235599', 'JUZGADOPENALDELCIRCUITO@GMAIL.COM');
-- se crea el expediente para la impugnacion
INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 6, 6532, '1235468529', 'JUPC',  TO_DATE('15/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO VALUES (00010, 'PEN', 6, 6532, 0001, 'La sentencia inicial la dicta el Juez Penal del Circuito (juez de conocimiento).');

-- Segunda instancia de la impugnacion Apelacion
-- Se crea el tribunal superior del distrito judicial

INSERT INTO LUGAR VALUES ('TSDJ','TRIB','BOG','TRIBUNAL SUPERIOR DEL DISTRITO JUDICIAL','CL 60 #25', '5235600', 'TRIBUNALSUPERIORDISTRITOJUDICIAL@GMAIL.COM');

INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 7, 6533, '1235468529', 'TSDJ',  TO_DATE('20/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO VALUES (00010, 'PEN', 7, 6533, 0001, 'Si el abogado no está de acuerdo presenta recurso de apelación. El tribunal superior puede confirmar modificar o revocar la sentencia');

-- Tercera instancia de la impugnacion Casación
-- Se crea la corte suprema de justicia

INSERT INTO LUGAR VALUES ('CSJ','TRIB','BOG','CORTE SUPREMA DE JUSTICIA','CL 70 #30', '5235610', 'CORTESUPREMAJUSTICIA@GMAIL.COM');

INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 8, 6534, '1235468529', 'CSJ',  TO_DATE('22/12/2010', 'DD/MM/YYYY'));
INSERT INTO SUCESO VALUES (00010, 'PEN', 8, 6534, 0001, ' Si persisten errores graves de derecho, el abogado puede interponer recurso extraordinario de casación ante la Corte Suprema');

--- Cuarta instancia de la impugnacion Revisión

INSERT INTO LUGAR VALUES ('CCJ','TRIB','BOG','CORTE CONSTITUCIONAL DE JUSTICIA','CL 80 #35', '5235620', 'CORTECONSTITUCIONALDEJUSTICIA@GMAIL.COM');

INSERT INTO EXPEDIENTE VALUES (00010, 'PEN', 9, 6535, '1235468529', 'CCJ',  TO_DATE('24/12/2010', 'DD/MM/YYYY'));

INSERT INTO SUCESO VALUES (00010, 'PEN', 9, 6535, 0001, 'Si hubo vulneración de derechos fundamentales, el abogado presenta una acción de tutela. La Corte Constitucional puede revisar el caso si lo selecciona para estudio');


--Vamos a generar una base de datos para simular una conexion remota y luego traer los Pasajeros que son Vips
--Creacion de la Base de Datos
CREATE DATABASE "Remota"

--Cracion de la Tabla
CREATE TABLE public."Vips"
(
    "Id" integer,
    fecha date
);    

--Insertar Un pasajero Vip
INSERT INTO public."Vips"(
	id, fecha)
	VALUES (50, '2010-01-01');
	
--Instalamos la extencion dblink que trae PostgreSQL
CREATE EXTENSION dblink;

--Chequeamos que se conecta a la base de datos remota
SELECT * FROM dblink('  dbname=Remota 
                        port=5432
                        host=127.0.0.1
                        user=postgres
                        password=root',
                    'SELECT "id", "fecha" FROM "Vips"')
                    AS datos_remotos ("Id" integer, "Fecha" date);
					
--Realizamos el Join con la tabla Pasajeros
SELECT * FROM "Pasajeros"
JOIN
 dblink('  dbname=Remota 
                        port=5432
                        host=127.0.0.1
                        user=postgres
                        password=root',
                    'SELECT "id", "fecha" FROM "Vips"')
                    AS datos_remotos ("Id" integer, "Fecha" date)
USING ("Id");

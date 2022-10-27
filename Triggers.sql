--Vamos a utilizar la funcion para contar los pasajeros cada vez que se inserte un nuevo pasajero
--Creamos la Tabla donde vamos a llevar la cantidad de pasajeros
CREATE TABLE public."contPasajeros"
(
    "Total" integer,
    "Tiempo" time with time zone,
    "Id" integer NOT NULL DEFAULT nextval('"contPasajeros_Id_seq"'::regclass),
    CONSTRAINT "contPasajeros_pkey" PRIMARY KEY ("Id")
)


--Actualizamos la funcion
CREATE FUNCTION conteo()
RETURNS integer
LANGUAGE 'plpgsql'
AS $$
DECLARE
	rec RECORD;
    contador INTEGER := 0;
BEGIN
	FOR rec IN SELECT * FROM "Pasajeros" LOOP
		RAISE NOTICE 'Un pasajero se llama % ', rec."Nombre";
        contador := contador + 1;
	END LOOP;
    INSERT INTO "contPasajeros" ("Total", "Tiempo") VALUES (contador, now());
	RETURN contador;
END
$$

--Actualizamos la fuccion para que se llame desde el trigger al insertar un pasajero
CREATE FUNCTION conteo2()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
DECLARE
	rec RECORD;
    contador INTEGER := 0;
BEGIN
	FOR rec IN SELECT * FROM "Pasajeros" LOOP
		contador := contador + 1;
	END LOOP;
    INSERT INTO "contPasajeros" ("Total", "Tiempo") VALUES (contador, now());
	RETURN NEW
END
$$

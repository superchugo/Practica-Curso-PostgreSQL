--Realizar una consulta 
DO $$
DECLARE
	rec RECORD;
    contador INTEGER := 0;
BEGIN
	FOR rec IN SELECT * FROM "Pasajeros" LOOP
		RAISE NOTICE 'Un pasajero se llama % ', rec."Nombre";
        contador := contador + 1;
	END LOOP;
    RAISE NOTICE 'El conteo es % ', contador;
END
$$

--Realizar una funcion para poder llamarla desde una consulta
--Realizar una consulta 
CREATE FUNCTION funcion()
RETURNS void
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
    RAISE NOTICE 'El conteo es % ', contador;
END
$$

--Realizar una funcion para poder llamarla desde una consulta
--Realizar una consulta y devuelva un entero
CREATE FUNCTION funcion()
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
    RAISE NOTICE 'El conteo es % ', contador;
	RETURN contador
END
$$

--Utilizamos la funcion
SELECT * from funcion();
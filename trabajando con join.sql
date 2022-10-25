--Que pasajeros han tomado al menos un viaje
SELECT * FROM PUBLIC."Pasajeros"
JOIN PUBLIC."Viajes" ON (PUBLIC."Viajes"."IdPasajero" = PUBLIC."Pasajeros"."Id")

--Que pasajero no tomo ningun viaje
SELECT * FROM PUBLIC."Pasajeros" pas
JOIN PUBLIC."Viajes" viajes ON (viajes."IdPasajero" = pas."Id")
WHERE viajes."IdPasajero" IS NULL;

--Que estaciones visito cada pasajero
SELECT pas."Nombre" AS "Nombre Pasajero", e."Nombre" AS "Nombre Estacion"  FROM PUBLIC."Pasajeros" pas
JOIN PUBLIC."Viajes" v ON (v."IdPasajero" = pas."Id") 
JOIN PUBLIC."Trayectos" tra ON (v."IdTrayecto" = tra."id")
JOIN PUBLIC."Estaciones" e ON (tra."IdEstacion" = e."Id")
ORDER BY pas."Nombre"

--Cuantos viajes realizado cada pasajero
SELECT pas."Nombre" AS "Nombre Pasajero", COUNT (*) AS "Cantidad de Viajes del Pasajero"  FROM PUBLIC."Pasajeros" pas
JOIN PUBLIC."Viajes" v ON (v."IdPasajero" = pas."Id") 
GROUP BY pas."Id"
ORDER BY pas."Nombre"

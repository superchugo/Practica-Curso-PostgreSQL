--Que pasajeros han tomado al menos un viaje
select * from public."Pasajeros"
join public."Viajes" on (public."Viajes"."IdPasajero" = public."Pasajeros"."Id")
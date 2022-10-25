--Creacion de una vista Volatil
CREATE VIEW public.rango_view
    AS
     SELECT *,
 CASE
 WHEN "Fecha_Nacimiento" > '2021-01-01' THEN 'Mayor'
   ELSE 'Niño'
        END AS tipo
   FROM "Pasajeros"
  ORDER BY tipo;
  
  --Creacion de una vista Materealizada
CREATE MATERIALIZED VIEW public.materealizada_view
AS
SELECT * FROM "Viajes" "Inicio" > '2021-10-01'
WITH NO DATA;


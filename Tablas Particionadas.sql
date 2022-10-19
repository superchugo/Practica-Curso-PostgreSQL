--Crea una tabla paticionada
CREATE TABLE historial201001 PARTITION OF historial
FOR VALUES FROM ('2010-01-01') TO ('2010-01-31')
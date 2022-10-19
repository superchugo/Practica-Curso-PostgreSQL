--Crea la tabla Estaciones
CREATE TABLE IF NOT EXISTS public."Estaciones"
(
    "Id" integer NOT NULL DEFAULT nextval('"Estaciones_Id_seq"'::regclass),
    "Nombre" character varying(50) COLLATE pg_catalog."default",
    "Direcciom" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Estaciones_pkey" PRIMARY KEY ("Id")
)

-- Crea la tabla de Pasajeros
CREATE TABLE IF NOT EXISTS public."Pasajeros"
(
    "Id" integer NOT NULL DEFAULT nextval('"Pasajeros_Id_seq"'::regclass),
    "Nombre" character varying(50) COLLATE pg_catalog."default",
    "Direccion" character varying(100) COLLATE pg_catalog."default",
    "Fecha_Nacimiento" date,
    CONSTRAINT "Pasajeros_pkey" PRIMARY KEY ("Id")
)


--Crea la tabla Trenes
CREATE TABLE IF NOT EXISTS public."Trenes"
(
    "Id" integer NOT NULL DEFAULT nextval('"Trenes_Id_seq"'::regclass),
    "Modelo" character varying(50) COLLATE pg_catalog."default",
    "Capacidad" numeric,
    CONSTRAINT "Trenes_pkey" PRIMARY KEY ("Id")
)


--Crea la tabla Trayectos y sus Condiciones
CREATE TABLE IF NOT EXISTS public."Trayectos"
(
    "Id" integer NOT NULL DEFAULT nextval('"Trayectos_Id_seq"'::regclass),
    "IdEstacion" numeric NOT NULL,
    "IdTren" numeric,
    "Nombre" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "Trayectos_pkey" PRIMARY KEY ("IdEstacion"),
    CONSTRAINT "Trayectos_Estaciones_fkey" FOREIGN KEY ("Id")
        REFERENCES public."Estaciones" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Trayectos_Trenes_fkey" FOREIGN KEY ("Id")
        REFERENCES public."Trenes" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

--Crea la tabla Viajes y sus condiciones
CREATE TABLE IF NOT EXISTS public."Viajes"
(
    "Id" integer NOT NULL DEFAULT nextval('"Viajes_Id_seq"'::regclass),
    "IdPasajero" numeric NOT NULL,
    "IdTrayecto" numeric[],
    "Inicio" date[],
    "Fin" date[],
    CONSTRAINT "Viajes_pkey" PRIMARY KEY ("IdPasajero"),
    CONSTRAINT "Viajes_Pazsajerps_fkey" FOREIGN KEY ("Id")
        REFERENCES public."Pasajeros" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
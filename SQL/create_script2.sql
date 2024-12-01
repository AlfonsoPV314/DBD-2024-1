-- Table: public.Usuario

DROP TABLE IF EXISTS public."Usuario";

CREATE TABLE IF NOT EXISTS public."Usuario"
(
    "idUsuario" integer NOT NULL,
    correo character varying(31) COLLATE pg_catalog."default",
    nombre text COLLATE pg_catalog."default",
    clave character varying(15) COLLATE pg_catalog."default",
    region text COLLATE pg_catalog."default",
    ciudad text COLLATE pg_catalog."default",
    comuna text COLLATE pg_catalog."default",
    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Usuario"
    OWNER to postgres;

-- Table: public.CarroDeCompras

DROP TABLE IF EXISTS public."CarroDeCompras";

CREATE TABLE IF NOT EXISTS public."CarroDeCompras"
(
    "idCarro" integer NOT NULL,
    "idUsuario" integer,
    CONSTRAINT "CarroDeCompras_pkey" PRIMARY KEY ("idCarro"),
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."CarroDeCompras"
    OWNER to postgres;

-- Table: public.Boleta

DROP TABLE IF EXISTS public."Boleta";

CREATE TABLE IF NOT EXISTS public."Boleta"
(
    "idBoleta" integer NOT NULL,
    "metodoPago" text COLLATE pg_catalog."default",
    "idCarro" integer,
    "idUsuario" integer,
    CONSTRAINT "Boleta_pkey" PRIMARY KEY ("idBoleta"),
    CONSTRAINT fk_carro FOREIGN KEY ("idCarro")
        REFERENCES public."CarroDeCompras" ("idCarro") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Boleta"
    OWNER to postgres;

-- Table: public.Producto

DROP TABLE IF EXISTS public."Producto";

CREATE TABLE IF NOT EXISTS public."Producto"
(
    "idProducto" integer NOT NULL,
    "url-imagen" text COLLATE pg_catalog."default",
    stock integer,
    nombre text COLLATE pg_catalog."default",
    precio integer,
    descripcion text COLLATE pg_catalog."default",
    CONSTRAINT "Producto_pkey" PRIMARY KEY ("idProducto")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Producto"
    OWNER to postgres;

-- Table: public.ProductosCarro

DROP TABLE IF EXISTS public."ProductosCarro";

CREATE TABLE IF NOT EXISTS public."ProductosCarro"
(
    "idCarro" integer NOT NULL,
    "idProducto" integer NOT NULL,
    cantidad integer,
    CONSTRAINT "ProductosCarro_pkey" PRIMARY KEY ("idCarro", "idProducto"),
    CONSTRAINT fk_carro FOREIGN KEY ("idCarro")
        REFERENCES public."CarroDeCompras" ("idCarro") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_producto FOREIGN KEY ("idProducto")
        REFERENCES public."Producto" ("idProducto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ProductosCarro"
    OWNER to postgres;

-- Table: public.Tipo

DROP TABLE IF EXISTS public."Tipo";

CREATE TABLE IF NOT EXISTS public."Tipo"
(
    "idTipo" integer NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    CONSTRAINT "Tipo_pkey" PRIMARY KEY ("idTipo")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Tipo"
    OWNER to postgres;

-- Table: public.ProductoTipo

DROP TABLE IF EXISTS public."ProductoTipo";

CREATE TABLE IF NOT EXISTS public."ProductoTipo"
(
    "idProducto" integer NOT NULL,
    "idTipo" integer NOT NULL,
    CONSTRAINT "ProductoTipo_pkey" PRIMARY KEY ("idProducto", "idTipo"),
    CONSTRAINT fk_id_producto FOREIGN KEY ("idProducto")
        REFERENCES public."Producto" ("idProducto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_id_tipo FOREIGN KEY ("idTipo")
        REFERENCES public."Tipo" ("idTipo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ProductoTipo"
    OWNER to postgres;

-- Table: public.SubidaASistema

DROP TABLE IF EXISTS public."SubidaASistema";

CREATE TABLE IF NOT EXISTS public."SubidaASistema"
(
    "idUsuario" integer NOT NULL,
    "idProducto" integer NOT NULL,
    CONSTRAINT "SubidaASistema_pkey" PRIMARY KEY ("idUsuario", "idProducto"),
    CONSTRAINT fk_producto FOREIGN KEY ("idProducto")
        REFERENCES public."Producto" ("idProducto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."SubidaASistema"
    OWNER to postgres;

-- Table: public.Valorizacion

DROP TABLE IF EXISTS public."Valorizacion";

CREATE TABLE IF NOT EXISTS public."Valorizacion"
(
    "idUsuario" integer NOT NULL,
    "idProducto" integer NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    puntuacion integer,
    CONSTRAINT "Valorizacion_pkey" PRIMARY KEY ("idUsuario", "idProducto"),
    CONSTRAINT fk_producto FOREIGN KEY ("idProducto")
        REFERENCES public."Producto" ("idProducto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Valorizacion"
    OWNER to postgres;

-- Table: public.ListaDeseos

DROP TABLE IF EXISTS public."ListaDeseos";

CREATE TABLE IF NOT EXISTS public."ListaDeseos"
(
    "idUsuario" integer NOT NULL,
    "idProducto" integer NOT NULL,
    CONSTRAINT "ListaDeseos_pkey" PRIMARY KEY ("idUsuario", "idProducto"),
    CONSTRAINT fk_producto FOREIGN KEY ("idProducto")
        REFERENCES public."Producto" ("idProducto") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ListaDeseos"
    OWNER to postgres;

-- Table: public.Permiso

DROP TABLE IF EXISTS public."Permiso";

CREATE TABLE IF NOT EXISTS public."Permiso"
(
    "idPermiso" integer NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    CONSTRAINT "Permiso_pkey" PRIMARY KEY ("idPermiso")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Permiso"
    OWNER to postgres;

-- Table: public.Rol

DROP TABLE IF EXISTS public."Rol";

CREATE TABLE IF NOT EXISTS public."Rol"
(
    "IdRol" integer NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    CONSTRAINT "Rol_pkey" PRIMARY KEY ("IdRol")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Rol"
    OWNER to postgres;

-- Table: public.RolPermiso

DROP TABLE IF EXISTS public."RolPermiso";

CREATE TABLE IF NOT EXISTS public."RolPermiso"
(
    "idRol" integer NOT NULL,
    "idPermiso" integer NOT NULL,
    CONSTRAINT "RolPermiso_pkey" PRIMARY KEY ("idRol", "idPermiso"),
    CONSTRAINT fk_permiso FOREIGN KEY ("idPermiso")
        REFERENCES public."Permiso" ("idPermiso") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_rol FOREIGN KEY ("idRol")
        REFERENCES public."Rol" ("IdRol") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RolPermiso"
    OWNER to postgres;

-- Table: public.UsuarioRol

DROP TABLE IF EXISTS public."UsuarioRol";

CREATE TABLE IF NOT EXISTS public."UsuarioRol"
(
    "idUsuario" integer NOT NULL,
    "idRol" integer NOT NULL,
    CONSTRAINT "UsuarioRol_pkey" PRIMARY KEY ("idUsuario", "idRol"),
    CONSTRAINT fk_rol FOREIGN KEY ("idRol")
        REFERENCES public."Rol" ("IdRol") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_usuario FOREIGN KEY ("idUsuario")
        REFERENCES public."Usuario" ("idUsuario") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."UsuarioRol"
    OWNER to postgres;
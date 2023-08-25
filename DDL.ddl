-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-08-25 17:47:06 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE compra (
    nombre            VARCHAR2(100) NOT NULL,
    num_tarjeta       INTEGER NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    juego_nom_jue     VARCHAR2(100) NOT NULL
);



ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( num_tarjeta );

CREATE TABLE des_jue (
    fecha_salida         DATE NOT NULL,
    desarollador_cor_des VARCHAR2(100) NOT NULL,
    juego_nom_jue        VARCHAR2(100) NOT NULL
);



ALTER TABLE des_jue ADD CONSTRAINT desarollador_juego_pk PRIMARY KEY ( fecha_salida );

CREATE TABLE desarollador (
    cor_des VARCHAR2(100) NOT NULL,
    nom_des VARCHAR2(100) NOT NULL,
    ali_des VARCHAR2(100) NOT NULL
);



ALTER TABLE desarollador ADD CONSTRAINT desarollador_pk PRIMARY KEY ( cor_des );

CREATE TABLE deseos (
    id_deseo      INTEGER NOT NULL,
    juego_nom_jue VARCHAR2(100) NOT NULL
);



ALTER TABLE deseos ADD CONSTRAINT lista_deseos_pk PRIMARY KEY ( id_deseo );

CREATE TABLE juego (
    nom_jue         VARCHAR2(100) NOT NULL,
    des_cor         VARCHAR2(50) NOT NULL,
    des_det         VARCHAR2(200) NOT NULL,
    precio_1        INTEGER NOT NULL,
    genero          VARCHAR2(100) NOT NULL,
    calificacion    INTEGER NOT NULL,
    clasificacion   INTEGER NOT NULL,
    disponible_pais VARCHAR2(100) NOT NULL,
    fecha_descuento DATE NOT NULL,
    descuento       INTEGER NOT NULL
);


ALTER TABLE juego ADD CONSTRAINT juego_catalogo_pk PRIMARY KEY ( nom_jue );

CREATE TABLE usu_com (
    fecha_compra               DATE NOT NULL,
    compra_num_tarjeta         INTEGER NOT NULL,
    usuario_correo_electronico VARCHAR2(100) NOT NULL
);



ALTER TABLE usu_com ADD CONSTRAINT usuario_compras_pk PRIMARY KEY ( fecha_compra );

CREATE TABLE usuario (
    nombre_completo          VARCHAR2(100) NOT NULL,
    nombre_corto             VARCHAR2(100) NOT NULL,
    alias                    VARCHAR2(100) NOT NULL,
    edad                     INTEGER NOT NULL,
    correo_electronico       VARCHAR2(100) NOT NULL,
    telefono                 INTEGER NOT NULL,
    direccion                VARCHAR2(100) NOT NULL,
    pais                     VARCHAR2(100) NOT NULL,
    contraseña               VARCHAR2(20) NOT NULL,
    rol                      VARCHAR2(100) NOT NULL,
    biblioteca_biblioteca_id NUMBER NOT NULL,
    deseos_id_deseo          INTEGER NOT NULL,
    id_deseo                 INTEGER NOT NULL
);



CREATE UNIQUE INDEX usuario__idx ON
    usuario (
        biblioteca_biblioteca_id
    ASC );

CREATE UNIQUE INDEX usuario__idxv1 ON
    usuario (
        deseos_id_deseo
    ASC );

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( correo_electronico );

ALTER TABLE compra
    ADD CONSTRAINT compra_juego_fk FOREIGN KEY ( juego_nom_jue )
        REFERENCES juego ( nom_jue );

ALTER TABLE des_jue
    ADD CONSTRAINT des_jue_desarollador_fk FOREIGN KEY ( desarollador_cor_des )
        REFERENCES desarollador ( cor_des );

ALTER TABLE des_jue
    ADD CONSTRAINT des_jue_juego_fk FOREIGN KEY ( juego_nom_jue )
        REFERENCES juego ( nom_jue );

ALTER TABLE deseos
    ADD CONSTRAINT deseos_juego_fk FOREIGN KEY ( juego_nom_jue )
        REFERENCES juego ( nom_jue );

ALTER TABLE usu_com
    ADD CONSTRAINT usu_com_compra_fk FOREIGN KEY ( compra_num_tarjeta )
        REFERENCES compra ( num_tarjeta );

ALTER TABLE usu_com
    ADD CONSTRAINT usu_com_usuario_fk FOREIGN KEY ( usuario_correo_electronico )
        REFERENCES usuario ( correo_electronico );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_deseos_fk FOREIGN KEY ( deseos_id_deseo )
        REFERENCES deseos ( id_deseo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0

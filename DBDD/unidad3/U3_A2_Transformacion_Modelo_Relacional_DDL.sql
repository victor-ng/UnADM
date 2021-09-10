/* -----------------------------------------------------------
	Se crea al base de datos 
----------------------------------------------------------- */
CREATE DATABASE `VERIFICENTRO`;
USE VERIFICENTRO;

/* ------------------------------------------------------------------------------
	Sentencias DDL para crear tablas, indices, llaves primarias y secundarias
------------------------------------------------------------------------------ */
CREATE TABLE usuario
(
	id_usuario INT PRIMARY KEY,
	nombre_pila VARCHAR(45),
	apellido_paterno VARCHAR(45),
	apellido_materno VARCHAR(45),
	rfc VARCHAR(13),
	calle VARCHAR(45),
	num_interior VARCHAR(45),
	num_exterior VARCHAR(45)
);

CREATE TABLE autos
(
	placas VARCHAR(7) PRIMARY KEY,
	estado VARCHAR(45),
	marca VARCHAR(45),
	modelo VARCHAR(45),
	color VARCHAR(45),
	tipo VARCHAR(45),
	usuario_idusuario INT,
    FOREIGN KEY (usuario_idusuario) REFERENCES usuario(id_usuario)
);

CREATE INDEX fk_autos_usuario_idx ON autos(usuario_idusuario);

CREATE TABLE centro_verificacion
(
	idcentro_verificacion INT PRIMARY KEY,
	calle VARCHAR(45),
	num_exterior VARCHAR(45),
	num_interior VARCHAR(45),
	colonia VARCHAR(45),
	ciudad VARCHAR(45),
	estado VARCHAR(45),
	nombre_responsable VARCHAR(45),
	num_trabajadores TINYINT
);

CREATE	TABLE verificaciones
(
	id_verificacion INT PRIMARY KEY,
    fecha_verificacion DATE,
    status VARCHAR(45),
    costo_verificacion FLOAT,
    periodo_inicio DATE,
    periodo_fin DATE,
    autos_placas VARCHAR(7),
	centro_verificacion_idcentro_verificacion INT,
    FOREIGN KEY (autos_placas) REFERENCES autos(placas),
    FOREIGN KEY (centro_verificacion_idcentro_verificacion) REFERENCES centro_verificacion(idcentro_verificacion)
);

CREATE UNIQUE INDEX fk_verificaciones_autos1_idx ON verificaciones(autos_placas);
CREATE INDEX fk_verificaciones_centro_verificacion1_idx ON verificaciones(centro_verificacion_idcentro_verificacion);

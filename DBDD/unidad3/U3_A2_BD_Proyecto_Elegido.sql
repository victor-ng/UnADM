/* -----------------------------------------------------------
	Creación de la Base de datos y establecerla como activa 
----------------------------------------------------------- */
CREATE DATABASE `AyudaParaTodos`;
USE AyudaParaTodos;

/* ----------------------------------------------------------------------------------------
	Creación de las tablas con sus llaves primarias, llaves foráneas, indices y relaciones.
---------------------------------------------------------------------------------------- */
CREATE TABLE Estados
(
	id_estado INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50)
);

CREATE TABLE Ciudades
(
	id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    ciudad VARCHAR(50)
);

CREATE TABLE EstadosCiudades
(
	id_estado INT,
	id_ciudad INT,
    FOREIGN KEY (id_estado) REFERENCES Estados(id_estado),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE Beneficiarios
(
	id_beneficiario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	apellido_paterno VARCHAR(50),
	apellido_materno VARCHAR(50),
    telefono BIGINT,
    edad TINYINT,
	domicilio VARCHAR(100),
    id_estado INT,
    id_ciudad INT,
    curp CHAR(19),
    FOREIGN KEY (id_estado) REFERENCES Estados(id_estado),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE ApoyosEconomicos
(
	id_apoyo_economico INT PRIMARY KEY AUTO_INCREMENT,
	id_beneficiario INT,
    importe DECIMAL(7,2),
    fecha DATE,
    periodo TINYINT,
    activo BOOL,
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    UNIQUE KEY(id_beneficiario, periodo)
);

CREATE TABLE BecasInfantiles
(
	id_beca INT PRIMARY KEY AUTO_INCREMENT,
	id_beneficiario INT,
    importe DECIMAL(7,2),
    fecha DATE,
    periodo TINYINT,
    activo BOOL,
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    UNIQUE KEY(id_beneficiario, periodo)
);

CREATE TABLE ApoyosDespensas
(
	id_apoyo_despensa INT PRIMARY KEY AUTO_INCREMENT,
	id_beneficiario INT,
    cantidad_despensas TINYINT,
    fecha DATE,
    periodo TINYINT,
    activo BOOL,
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    UNIQUE KEY(id_beneficiario, periodo)
);

CREATE TABLE TiposApoyos
(
	id_tipo_apoyo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50)
);

CREATE TABLE ApoyosTerceraEdad
(
	id_folio INT PRIMARY KEY AUTO_INCREMENT,
	id_tipo_apoyo INT,
    id_beneficiario INT,
    fecha DATE,
    activo BOOL,
    FOREIGN KEY (id_tipo_apoyo) REFERENCES TiposApoyos(id_tipo_apoyo),
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    UNIQUE KEY(id_tipo_apoyo, id_beneficiario)
);

CREATE TABLE TiposCupones
(
	id_tipo_cupon INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50)
);

CREATE TABLE CuponesDescuento
(
	id_cupon INT PRIMARY KEY AUTO_INCREMENT,
	id_tipo_cupon INT,
    id_beneficiario INT,
    fecha DATE,
    folio_inicial BIGINT,
    folio_final BIGINT,
    activo BOOL,
    FOREIGN KEY (id_tipo_cupon) REFERENCES TiposCupones(id_tipo_cupon),
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    UNIQUE KEY(id_tipo_cupon, id_beneficiario)
);

CREATE TABLE TipoUsuario
(
	id_tipo_usuario INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50)
);

CREATE TABLE Usuarios
(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_usuario INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    preparacion VARCHAR(100),
    INDEX ix_usuario_preparacion (preparacion)
);

CREATE TABLE Sedes
(
	id_sede INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sede VARCHAR(50),
    direccion VARCHAR(100),
    id_estado INT,
    id_ciudad INT,
    FOREIGN KEY (id_estado) REFERENCES Estados(id_estado),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

CREATE TABLE TallerCurso
(
	id_taller_curso INT PRIMARY KEY AUTO_INCREMENT,
	id_encargado INT,
	id_docente INT,
    descripcion VARCHAR(50),
    tipo_taller_curso CHAR(2),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_sede INT,
    FOREIGN KEY (id_encargado) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_docente) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_sede) REFERENCES Sedes(id_sede)
);

CREATE TABLE Alumnos
(
	id_beneficiario INT,
    id_taller_curso INT,
    FOREIGN KEY (id_beneficiario) REFERENCES Beneficiarios(id_beneficiario),
    FOREIGN KEY (id_taller_curso) REFERENCES TallerCurso(id_taller_curso)
);

/* ----------------------------------------------------------------
	Inserción de al menos 6 registros para todas las tablas creadas
---------------------------------------------------------------- */

INSERT Estados (estado) VALUES ('Campeche');
INSERT Estados (estado) VALUES ('Chiapas');
INSERT Estados (estado) VALUES ('Durango');
INSERT Estados (estado) VALUES ('Guanajuato');
INSERT Estados (estado) VALUES ('Jalisco');
INSERT Estados (estado) VALUES ('Oaxaca');
INSERT Estados (estado) VALUES ('Tabasco');
INSERT Estados (estado) VALUES ('Veracruz');

INSERT Ciudades (ciudad) VALUES ('Carmen');
INSERT Ciudades (ciudad) VALUES ('Tenabo');
INSERT Ciudades (ciudad) VALUES ('Arriaga');
INSERT Ciudades (ciudad) VALUES ('Comitan');
INSERT Ciudades (ciudad) VALUES ('El Refugio');
INSERT Ciudades (ciudad) VALUES ('San Isidro');
INSERT Ciudades (ciudad) VALUES ('El Zapote');
INSERT Ciudades (ciudad) VALUES ('San Cristobal');
INSERT Ciudades (ciudad) VALUES ('San Francisco');
INSERT Ciudades (ciudad) VALUES ('Vicente Guerrero');
INSERT Ciudades (ciudad) VALUES ('Emiliano Zapata');
INSERT Ciudades (ciudad) VALUES ('Miguel Aleman');

INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (1, 1);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (1, 2);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (2, 3);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (2, 4);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (3, 5);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (3, 6);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (4, 7);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (4, 8);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (5, 9);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (6, 10);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (7, 11);
INSERT EstadosCiudades (id_estado, id_ciudad) VALUES (8, 12);

INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Nico', 'Gumary', 'Huntriss', 2044972403, 23, '562 Crest Line Junction', 4, 8, 'GUHN980104HASMNI08');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Lockwood', 'Pillman', 'Summerrell', 4472674444, 45, '98 South Road', 6, 10, 'PISL760206MCHIMC05');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Anya', 'Cuthbertson', 'Cozby', 6848158442, 63, '3 Farmco Crossing', 4, 7, 'CUCA580303MGTTZN01');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Joyous', 'Lanon', 'Lattin', 5704959691, 12, '3 Calypso Court', 8, 12, 'LALJ090811HCSNTY05');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Alexina', 'Starton', 'Benam', 7336047590, 37, '7 Lawn Hill', 3, 6, 'SABA840525MHGTNL03');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Charlton', 'Woolens', 'Frazer', 8891269575, 58, '7 Rieder Junction', 3, 5, 'WOFC630413HMSLRH011');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Norri', 'Rioch', 'Dole', 3818103598, 16, '08364 Pond Point', 7, 11, 'RIDN050922MCCILR02');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Celesta', 'Lagadu', 'Radage', 2593076442, 77, '2 Debra Hill', 5, 9, 'LARC440516MTLGDL01');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Siana', 'Dudley', 'Rubee', 7284245859, 19, '1 Hermina Point', 2, 3, 'DURS020219MVZDBI08');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Oliver', 'Standeven', 'Beurich', 2179543763, 24, '34043 Bay Point', 1, 1, 'SABO971122HNTTRL05');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Claire', 'Nornasell', 'Bigley', 1473782932, 41, '724 Acker Avenue', 3, 6, 'NOBC800612MTCRGL04');
INSERT Beneficiarios (nombre, apellido_paterno, apellido_materno, telefono, edad, domicilio, id_estado, id_ciudad, curp)
VALUES ('Alfred', 'Tompkinson', 'Reasce', 3972064641, 9, '2 Eastlawn Lane', 7, 11, 'TORA120521HTCMSLA6');

INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (1, 550, '2021-02-22', 1, true);
INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (5, 1500, '2021-03-18', 2, true);
INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (9, 2500, '2021-04-25', 3, true);
INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (4, 1750, '2021-10-05', 3, true);
INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (6, 2000, '2021-10-02', 1, true);
INSERT ApoyosEconomicos (id_beneficiario, importe, fecha, periodo, activo) VALUES (10, 1500, '2021-01-15', 1, true);

INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (4, 3000, '2020-10-01', 4, true);
INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (7, 3000, '2021-01-01', 1, true);
INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (4, 3000, '2020-07-01', 3, true);
INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (7, 3000, '2020-06-01', 3, true);
INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (4, 3000, '2021-04-01', 1, true);
INSERT BecasInfantiles (id_beneficiario, importe, fecha, periodo, activo) VALUES (7, 3000, '2021-05-01', 2, true);

INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (1, 1, '2020-11-01', 6, true);
INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (7, 1, '2021-03-11', 2, true);
INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (10, 3, '2020-10-15', 5, true);
INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (4, 2, '2020-08-15', 3, true);
INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (5, 1, '2021-05-09', 2, true);
INSERT ApoyosDespensas (id_beneficiario, cantidad_despensas, fecha, periodo, activo) VALUES (9, 1, '2020-09-16', 5, true);

INSERT TiposApoyos (descripcion) VALUES ('Especialidades Medicas');
INSERT TiposApoyos (descripcion) VALUES ('Farmacia');
INSERT TiposApoyos (descripcion) VALUES ('Aparatos Ortopedicos');
INSERT TiposApoyos (descripcion) VALUES ('Optica');
INSERT TiposApoyos (descripcion) VALUES ('Cuidadores');
INSERT TiposApoyos (descripcion) VALUES ('Enfermería');

INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (1, 5, '2020-11-15', true);
INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (3, 10, '2020-09-02', true);
INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (2, 8, '2020-02-09', true);
INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (4, 7, '2020-07-23', true);
INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (6, 10, '2021-05-21', true);
INSERT ApoyosTerceraEdad (id_tipo_apoyo, id_beneficiario, fecha, activo) VALUES (5, 5, '2020-06-18', true);

INSERT TiposCupones (descripcion) VALUES ('Alimentos y bebidas no alcoholicas');
INSERT TiposCupones (descripcion) VALUES ('Despensa');
INSERT TiposCupones (descripcion) VALUES ('Ropa y uniformes');
INSERT TiposCupones (descripcion) VALUES ('Calzado');
INSERT TiposCupones (descripcion) VALUES ('Electrodomesticos');
INSERT TiposCupones (descripcion) VALUES ('Viajes');

INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (1, 7, '2020-06-01', 1000, 1025, true);
INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (2, 1, '2020-09-10', 2020, 2030, true);
INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (4, 10, '2021-02-22', 4060, 4075, true);
INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (3, 2, '2021-03-30', 4075, 5015, true);
INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (6, 8, '2020-08-19', 200, 499, true);
INSERT CuponesDescuento (id_tipo_cupon, id_beneficiario, fecha, folio_inicial, folio_final, activo) VALUES (5, 5, '2020-10-15', 500, 999, true);

INSERT TipoUsuario (descripcion) VALUES ('Encargado');
INSERT TipoUsuario (descripcion) VALUES ('Docente');
INSERT TipoUsuario (descripcion) VALUES ('Operativo');
INSERT TipoUsuario (descripcion) VALUES ('Mantenimiento');
INSERT TipoUsuario (descripcion) VALUES ('Trabajo Social');
INSERT TipoUsuario (descripcion) VALUES ('Relaciones públicas');

INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (1, 'Haley', 'Kindread', 'Edelheit', 'Ing. Industrial');
INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (1, 'Kinsley', 'Kobierski', 'Edgler', 'Ing. Logistica y Transporte');
INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (2, 'Dalila', 'Scullin', 'Myderscough', 'Arquitecto');
INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (2, 'Dewey', 'Brownsall', 'Tott', 'Lic. Contaduria');
INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (3, 'Keith', 'Riley', 'Anderson', 'Lic. Administración');
INSERT Usuarios (id_tipo_usuario, nombre, apellido_paterno, apellido_materno, preparacion) 
VALUES (4, 'Michael', 'Dent', 'Morrison', 'Tec. Electricidad');

INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('CHI-01', '02 Algoma Plaza', 3, 2);
INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('CAM-15', '40254 Melrose Plaza', 1, 1);
INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('ZAP-09', '6365 Dunning Terrace', 7, 4);
INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('OAX-12', '23098 Kingsford Drive', 6, 10);
INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('TAB-03', '522 Laurel Trail', 7, 11);
INSERT Sedes (nombre_sede, direccion, id_estado, id_ciudad) 
VALUES ('VER-07', '8417 Larry Court', 8, 12);

INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (1, 3, 'Plomeria', 'T', '2020-08-01', '2021-07-01', 1);
INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (2, 4, 'Auxiliar Contable', 'C', '2020-08-01', '2021-07-01', 2);
INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (1, 3, 'Electricidad', 'T', '2020-10-01', '2021-09-01', 4);
INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (2, 4, 'Social Media Management', 'C', '2020-10-01', '2021-09-01', 5);
INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (2, 3, 'Marketing', 'C', '2020-02-01', '202-08-01', 6);
INSERT TallerCurso (id_encargado, id_docente, descripcion, tipo_taller_curso, fecha_inicio, fecha_fin, id_sede)
VALUES (1, 4, 'Soldadura', 'T', '2020-02-01', '202-08-01', 3);

INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (8,2);
INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (7,4);
INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (3,1);
INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (5,6);
INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (4,3);
INSERT Alumnos (id_beneficiario, id_taller_curso) VALUES (10,5);
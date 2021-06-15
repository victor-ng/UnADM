/* -----------------------------------------------------------
	Creación de la Base de datos y establecerla como activa 
----------------------------------------------------------- */
CREATE DATABASE `BD_A4_ES202107523`;
USE BD_A4_ES202107523;

/* ----------------------------------------------------------------------------------------
	Sentencias DDL para crear los objetos de la base de datos
---------------------------------------------------------------------------------------- */
CREATE TABLE Entidad
(
	cve_entidad VARCHAR(8) PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE Municipio
(
	cve_mun VARCHAR(8) PRIMARY KEY,
	nombre VARCHAR(50),
	cve_entidad VARCHAR(8),
    FOREIGN KEY (cve_entidad) REFERENCES Entidad(cve_entidad)
);

CREATE	TABLE Persona
(
	id_persona VARCHAR(8) PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    calle VARCHAR(100),
    num INT,
    email VARCHAR(70),
    curp CHAR(19),
    cve_mun VARCHAR(8),
    FOREIGN KEY (cve_mun) REFERENCES Municipio(cve_mun)
);

CREATE TABLE Telefono
(
	cve_tel VARCHAR(8) PRIMARY KEY,
	telefono CHAR(11),
	id_persona VARCHAR(8),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE	TABLE Enfermedades_Previas
(
	id_enf_previas VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(50),
	id_persona VARCHAR(8),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE	TABLE Vacuna
(
	id_vacuna VARCHAR(8) PRIMARY KEY,
    marca VARCHAR(50),
	lote CHAR(8),
	frasco VARCHAR(20),
	id_persona VARCHAR(8),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE	TABLE Aplicacion
(
	id_aplicacion VARCHAR(8) PRIMARY KEY,
	id_vacuna VARCHAR(8),
    fecha DATE,
	folio_reg_internet VARCHAR(8),
	id_persona VARCHAR(8),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE	TABLE Centro_Vacunacion
(
	id_c_vac VARCHAR(8) PRIMARY KEY,
	calle VARCHAR(100),
	num_ext INT,
    cp CHAR(6),
	folio_reg_internet VARCHAR(8),
	cve_mun VARCHAR(8),
    FOREIGN KEY (cve_mun) REFERENCES Municipio(cve_mun)
);

CREATE	TABLE Ndosis
(
	id_dosis VARCHAR(8) PRIMARY KEY,
	numero VARCHAR(20),
	id_aplicacion VARCHAR(8),
    FOREIGN KEY (id_aplicacion) REFERENCES Aplicacion(id_aplicacion)
);

/* ----------------------------------------------------------------------------------------
	Sentencias DML para insertar los registros en cada una de las tablas
---------------------------------------------------------------------------------------- */
INSERT Entidad (cve_entidad, nombre) VALUES ('E001', 'Aguascalientes');
INSERT Entidad (cve_entidad, nombre) VALUES ('E002', 'Michoacán');
INSERT Entidad (cve_entidad, nombre) VALUES ('E003', 'Tabasco');
INSERT Entidad (cve_entidad, nombre) VALUES ('E004', 'Chihuahua');
INSERT Entidad (cve_entidad, nombre) VALUES ('E005', 'Nayarit');

INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M001', 'Ahuacatlán', 'E005');
INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M002', 'Ahumada', 'E004');
INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M003', 'Amatlán de Cañas', 'E005');
INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M004', 'Huimanguillo', 'E003');
INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M005', 'Morelia', 'E002');
INSERT Municipio (cve_mun, nombre, cve_entidad) VALUES ('M006', 'Patzcuaro', 'E002');

INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P001','FATIMA SARAI','ROMERO MENDEZ','ARIES',102,'jaky_gilb@hotmail.com','ROMF790525MMNMNTA8','M001');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P002','LEONARDO TADEO','ROSILES OREGON','AND. JOSE MANUEL DE HERRERA',152,'guadalupe4350@gmail.com','ROOL640930HMNSRNA7','M002');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P003','BARBARA ALEXA','SAN MARTIN ALCARAZ','METEOROS',433,'lic.isabel.moreno@gmail.com','SAAB541217MMNNLRA9','M002');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P034','BRENDA ERANDI','SANTILLAN CALDERON','ANDALUCIA',17,'liliananarc65@homtail.com','SACB440808MMNNLRA4','M005');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P078','DYLAN ERIK','SOTO BUTANDA','MIGUEL ORTEGA',43,'huertamarisol74@gmail.com','SOBD840627HMNTTYA4','M003');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P106','JOSUE EMMANUEL','RODRIGUEZ GONZALEZ','JOSE MARIA AGUAYO',76,'butanda@gmail.com','ROGJ630306HMNDNSA8','M004');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P125','ZURIA','SALAZAR DE LA PAZ','DE LA MONTAÑA',6,'DelapazZuria@hotmail.com','SAPZ330401MGRLZRA7','M006');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P765','DIEGO ALEXANDER','VILLASEÑOR DÍAZ','BONIFACIO RENDÓN',12,'Dieguito@gmail.com','VIDD730404HMNLZGA7','M006');
INSERT Persona (id_persona, nombres, apellidos, calle, num, email, curp, cve_mun) 
VALUES ('P766','CAMILA','ZAVALA ALMODOVA ','JUAN ANTONIO ROMERO',87,'Zavala.Camila@hotmail.com','ZAAC631014MMNVLMA3','M001');

INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T001','4431681165','P002');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T002','4431681166','P002');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T003','4433766062','P003');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T004','4431035092','P001');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T005','4432606282','P034');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T006','4432636731','P078');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T007','4591109804','P078');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T008','4435445097','P078');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T009','4434732736','P106');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T010','4435334963','P125');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T011','4433853833','P765');
INSERT Telefono (cve_tel, telefono, id_persona) VALUES ('T012','4436101076','P766');

INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN001', 'Hipertension', 'P001');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN002', 'Diabetes', 'P001');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN003', 'Ninguna', 'P003');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN004', 'Ninguna', 'P034');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN005', 'Hipertension', 'P078');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN006', 'Diabetes', 'P106');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN007', 'Ninguna', 'P125');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN008', 'Ninguna', 'P765');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN009', 'Daño renal', 'P766');
INSERT Enfermedades_Previas (id_enf_previas, nombre, id_persona) VALUES ('EN010', 'Pancreatitis', 'P002');

INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V001', 'CanSino', 'A041221', 'VIDRIO DE 25 ML', 'P003');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V002', 'Pfizer', 'B432526', 'VIDRIO DE 25 ML', 'P078');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V003', 'Pfizer', 'B432527', 'VIDRIO DE 25 ML', 'P125');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V004', 'AstraZeneca', 'C654362', 'VIDRIO DE 25 ML', 'P765');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V005', 'AstraZeneca', 'C654367', 'VIDRIO DE 25 ML', 'P765');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V006', 'CanSino', 'C654363', 'VIDRIO DE 25 ML', 'P001');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V007', 'AstraZeneca', 'C654364', 'VIDRIO DE 25 ML', 'P002');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V008', 'Pfizer', 'B242533', 'VIDRIO DE 25 ML', 'P034');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V009', 'Sputnik', 'Y242534', 'VIDRIO DE 25 ML', 'P766');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V010', 'Sputnik', 'Y242535', 'VIDRIO DE 25 ML', 'P106');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V011', 'Pfizer', 'B432565', 'VIDRIO DE 25 ML', 'P078');
INSERT Vacuna (id_vacuna, marca, lote, frasco, id_persona) VALUES ('V012', 'Pfizer', 'B432567', 'VIDRIO DE 25 ML', 'P078');

INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A001', 'V001', '2021-03-22', 'F4252', 'P003');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A002', 'V002', '2021-04-14', 'F7563', 'P078');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A003', 'V010', '2021-05-15', 'F7563', 'P078');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A004', 'V003', '2021-05-04', 'F2324', 'P125');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A005', 'V004', '2021-03-15', 'F8642', 'P765');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A006', 'V004', '2021-04-15', 'F8642', 'P765');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A007', 'V005', '2021-05-10', 'F9864', 'P001');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A008', 'V006', '2021-03-15', 'F0001', 'P002');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A009', 'V007', '2021-04-01', 'F0023', 'P034');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A010', 'V008', '2021-05-05', 'F6535', 'P766');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A011', 'V009', '2021-04-30', 'F4532', 'P106');
INSERT Aplicacion (id_aplicacion, id_vacuna, fecha, folio_reg_internet, id_persona)  VALUES('A012', 'V009', '2021-03-03', 'F4532', 'P106');

INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV001', 'Ganadería de Coaxamaluca', 654, '11084', 'M001');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV002', 'Pino Moctezuma', 87, '58110', 'M005');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV003', 'CIRCUITO SAN MIGUEL', 12, '64264', 'M003');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV004', 'Circuito Pino Michoacán', 43, '50000', 'M005');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV005', 'Lago de Camécuaro', 54, '67532', 'M003');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV006', 'Aries', 8, '23412', 'M002');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV007', 'Manuel Cano', 12, '75432', 'M004');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV008', 'Villa de Apatzingán', 965, '76548', 'M004');
INSERT Centro_Vacunacion (id_c_vac, calle, num_ext, cp, cve_mun)
VALUES('CV009', 'Galaxias', 432, '87321', 'M006');

INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D001', 'Unica', 'A001');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D002', '1ra dosis', 'A002');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D003', '2da dosis', 'A003');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D004', '1ra dosis', 'A004');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D005', '1ra dosis', 'A005');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D006', '2da dosis', 'A006');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D007', 'Unica', 'A007');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D008', '1ra dosis', 'A008');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D009', '1ra dosis', 'A009');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D010', '1ra dosis', 'A010');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D011', '1ra dosis', 'A011');
INSERT Ndosis (id_dosis, numero, id_aplicacion) VALUES('D012', '2da dosis', 'A012');

/* ----------------------------------------------------------------------------------------
	Consultas
---------------------------------------------------------------------------------------- */
/* 1 */
SELECT	DISTINCT Nombres, 
		Apellidos, 
        CONCAT(calle, ' ', num) As Domiclio
FROM	Persona p INNER
JOIN	Vacuna v on p.id_persona = v.id_persona
WHERE	v.marca = 'AstraZeneca'
ORDER	BY Apellidos;

/* 2 */
SELECT	a.id_persona, CURP, Fecha, Email
FROM	Persona a INNER
JOIN	Vacuna b ON a.id_persona = b.id_persona INNER
JOIN	Aplicacion c ON b.id_vacuna = c.id_vacuna INNER
JOIN	Ndosis d on c.id_aplicacion = d.id_aplicacion
WHERE	b.marca = 'Pfizer'
AND		d.Numero != '2da dosis';

/* 4 */
SELECT	CONCAT(nombres, ' ', apellidos) AS Nombre,
		b.nombre AS Enfermedad
FROM	Persona a INNER
JOIN	Enfermedades_Previas b on a.id_persona = b.id_persona
WHERE	apellidos LIKE 'S%';

/* 5 */
SELECT	CONCAT(nombres, ' ', apellidos) AS Nombre,
        e.nombre AS Estado,
        d.nombre AS Municipio
FROM	Persona a INNER
JOIN	Vacuna b on a.id_persona = b.id_persona INNER
JOIN	Aplicacion c ON b.id_vacuna = c.id_vacuna INNER
JOIN	Municipio d  ON a.cve_mun = d.cve_mun INNER
JOIN	Entidad e ON d.cve_entidad = e.cve_entidad
WHERE	b.marca in ('Pfizer', 'AstraZeneca', 'Sputnik')
AND		a.id_persona NOT IN (
		SELECT	a.id_persona
        FROM	Persona a INNER
		JOIN	Vacuna b ON a.id_persona = b.id_persona INNER
        JOIN	Aplicacion c ON b.id_vacuna = c.id_vacuna INNER
        JOIN	Ndosis d on c.id_aplicacion = d.id_aplicacion
        WHERE	d.numero = '2da dosis'
        )
ORDER	BY Estado, Municipio;

/* 8 */
SELECT	CONCAT(nombres, ' ', apellidos) AS Nombre,
		CONCAT(a.calle, ' ', num) AS Domicilio,
        d.nombre AS Estado,
        c.nombre AS Municipio
FROM	Persona a INNER
JOIN	Vacuna b ON a.id_persona = b.id_persona INNER
JOIN	Municipio c on a.cve_mun = c.cve_mun INNER
JOIN	Entidad d ON c.cve_entidad = d.cve_entidad
WHERE	b.lote = 'A041221';

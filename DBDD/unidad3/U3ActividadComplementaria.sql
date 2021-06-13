/* -----------------------------------------------------------
	Creación de la Base de datos y establecerla como activa 
----------------------------------------------------------- */
CREATE DATABASE `ArticulosInvestigacion`;
USE ArticulosInvestigacion;

/* ----------------------------------------------------------------------------------------
	Creación de las tablas con sus llaves primarias, llaves foráneas, indices y relaciones.
---------------------------------------------------------------------------------------- */
CREATE TABLE Departamento
(
	idDepto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50)
);

CREATE TABLE Autores
(
	idAutor BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombreAutor VARCHAR(40),
    apellidoP_A VARCHAR(40),
    apellidoM_A VARCHAR(40),
    idDepto1 INT,
    FOREIGN KEY (idDepto1) REFERENCES Departamento(idDepto)
);

CREATE TABLE Revista
(
	idRevista BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombreRev VARCHAR(40),
    editor VARCHAR(40),
    frecuenciaPub VARCHAR(40)
);

CREATE TABLE Articulos
(
	idArticulo BIGINT PRIMARY KEY AUTO_INCREMENT,
	tituloArticulo VARCHAR(50),
	tipoArticulo VARCHAR(16),
    idAutor1 BIGINT,
    idRevista1 BIGINT,
    FOREIGN KEY (idAutor1) REFERENCES Autores(idAutor),
    FOREIGN KEY (idRevista1) REFERENCES Revista(idRevista)
);

/* ----------------------------------------------------------------
	Inserción de al menos 6 registros para todas las tablas creadas
---------------------------------------------------------------- */

INSERT Departamento (descripcion) VALUES ('Computación');
INSERT Departamento (descripcion) VALUES ('Electrónica');
INSERT Departamento (descripcion) VALUES ('Mecatrónica');
INSERT Departamento (descripcion) VALUES ('Industrial');

ALTER TABLE Autores AUTO_INCREMENT=100;
INSERT Autores (nombreAutor, apellidoP_A, apellidoM_A, idDepto1) VALUES ('José', 'Sánchez', 'González', 1);
INSERT Autores (nombreAutor, apellidoP_A, apellidoM_A, idDepto1) VALUES ('Evelin', 'Flores', 'Delgado', 2);
INSERT Autores (nombreAutor, apellidoP_A, apellidoM_A, idDepto1) VALUES ('María', 'Jacinto', 'Villanueva', 1);
INSERT Autores (nombreAutor, apellidoP_A, apellidoM_A, idDepto1) VALUES ('Eduardo', 'Méndez', 'Novoa', 1);
ALTER TABLE Autores AUTO_INCREMENT=130;
INSERT Autores (nombreAutor, apellidoP_A, apellidoM_A, idDepto1) VALUES ('Luis', 'Escobar', 'Pérez', 2);

ALTER TABLE Revista AUTO_INCREMENT=20;
INSERT Revista (nombreRev, editor, frecuenciaPub) VALUES ('Tecnologías IoT', 'Editorial_1', 'Semestral');
INSERT Revista (nombreRev, editor, frecuenciaPub) VALUES ('Agua', 'Editorial_2', 'Bimestral');
INSERT Revista (nombreRev, editor, frecuenciaPub) VALUES ('automatización', 'Editorial_3', 'Anual');

INSERT Articulos (tituloArticulo, tipoArticulo, idAutor1, idRevista1) VALUES ('Casas inteligentes', 'Divulgación', 100, 20);
INSERT Articulos (tituloArticulo, tipoArticulo, idAutor1, idRevista1) VALUES ('Medición del agua', 'Informe técnico', 101, 21);
INSERT Articulos (tituloArticulo, tipoArticulo, idAutor1, idRevista1) VALUES ('Invernadero automatizado', 'Divulgación', 102, 22);
INSERT Articulos (tituloArticulo, tipoArticulo, idAutor1, idRevista1) VALUES ('Energías renovables', 'Divulgación', 103, 21);
INSERT Articulos (tituloArticulo, tipoArticulo, idAutor1, idRevista1) VALUES ('Autos inteligentes', 'Informe técnico', 130, 20);

/* ----------------------------------------------------------------
	Consultas de la información insertada
---------------------------------------------------------------- */

-- Obtener los datos completos de los autores
SELECT	idAutor AS Id,
		CONCAT(A.nombreAutor, ' ', A.apellidoP_A, ' ', A.apellidoM_A) AS Autor,
		B.descripcion AS Departamento
FROM	Autores A INNER
JOIN	Departamento B ON A.idDepto1 = B.idDepto;

-- Obtener los datos de los artículos que son de divulgación
SELECT	*
FROM	Articulos
WHERE	tipoArticulo = 'Divulgación';

-- Obtener el nombre del artículo y el autor
SELECT	A.tituloArticulo AS Articulo, 
		CONCAT(B.nombreAutor, ' ', B.apellidoP_A, ' ', B.apellidoM_A) AS Autor
FROM	Articulos A INNER
JOIN	Autores B ON A.idAutor1 = B.idAutor;

-- Obtener el nombre del artículo, autor y revista
SELECT	A.tituloArticulo AS Articulo, 
		CONCAT(B.nombreAutor, ' ', B.apellidoP_A, ' ', B.apellidoM_A) AS Autor,
		nombreRev AS Revista
FROM	Articulos A INNER
JOIN	Autores B ON A.idAutor1 = B.idAutor INNER
JOIN	Revista C ON A.idRevista1 = C.idRevista;

-- Mostrar los nombres de las revistas y las frecuencias de publicación
SELECT	nombreRev AS 'Revista',
		frecuenciaPub AS 'Frecuencia de Publicación'
FROM	Revista;

-- Obtener el total de artículos publicados por el departamento de computación
SELECT	A.*,
		C.descripcion as Departamento
FROM	Articulos A INNER
JOIN	Autores B ON A.idAutor1 = B.idAutor INNER
JOIN	Departamento C ON B.idDepto1 = C.idDepto
WHERE	C.descripcion = 'Computación'; -- También puede ser por el idDepto = 1 si se conoce la descripción

-- Insertar la revista mecatrónica, con publicaciones semestrales y la editorial es editorial_2
INSERT Revista (nombreRev, editor, frecuenciaPub) VALUES ('Mecatrónica', 'Editorial_2', 'Semestral');

-- Mostrar las revistas de la editorial_2
SELECT	*
FROM	Revista
WHERE	editor = 'Editorial_2';

-- Se desea ordenar la tabla artículos por orden descendente del campo tituloArticulo
SELECT	*
FROM	Articulos
ORDER	BY tituloArticulo DESC;

-- Eliminar el artículo con idArticulo igual a 4
DELETE	
FROM	Articulos
WHERE	idArticulo = 4;

-- Agregar a la tabla Artículo el campo del año de publicación del artículo
ALTER	TABLE Articulos
ADD		anioPublicacion YEAR;

ALTER TABLE Articulos 
ADD INDEX ix_anio_publicacion (anioPublicacion);

-- Insertar un año de publicación a cada uno de los artículos que vaya del 2010 al 2021
UPDATE Articulos SET anioPublicacion = 2010 WHERE idArticulo = 1;
UPDATE Articulos SET anioPublicacion = 2014 WHERE idArticulo = 2;
UPDATE Articulos SET anioPublicacion = 2018 WHERE idArticulo = 3;
UPDATE Articulos SET anioPublicacion = 2021 WHERE idArticulo = 5;

-- Eliminar de la tabla artículo, los artículos publicados del 2010 al 2015
DELETE	
FROM	Articulos
WHERE	anioPublicacion BETWEEN 2010 AND 2015;

-- Añadir el departamento de energías renovables
INSERT Departamento (descripcion) VALUES ('Energías renovables');

-- Cambiar el nombre del departamento de computación al de sistemas computacionales
UPDATE	Departamento
SET		descripcion = 'Sistemas computacionales'
WHERE	idDepto = 1; -- Si no se conoce el id, entonces se hace por la descripcion (descripcion = 'Computación')

-- Cambiar el nombre de la revista agua por H20
UPDATE	Revista
SET		nombreRev = 'H20'
WHERE	idRevista = 21; -- ó, también como: nombreRev = 'Agua'

-- Mostrar los nombres de autores que han publicado en la revista H2O del periodo 2015 al 2021
SELECT	A.*
FROM	Autores A INNER
JOIN	Articulos B ON A.idAutor = B.idAutor1 INNER
JOIN	Revista C ON B.idRevista1 = C.idRevista
WHERE	anioPublicacion BETWEEN 2015 AND 2021
AND		idRevista = 21; -- ó, también como: nombreRev = 'H20';


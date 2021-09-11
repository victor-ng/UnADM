/* -----------------------------------------------------------
	Se crea al base de datos 
----------------------------------------------------------- */
CREATE DATABASE `PRESUPUESTOS`;
USE PRESUPUESTOS;

/* ------------------------------------------------------------------------------
	Creación de tablas, indices, llaves primarias y secundarias
------------------------------------------------------------------------------ */
CREATE TABLE Contacto
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(45),
	ApPaterno VARCHAR(45),
	ApMaterno VARCHAR(45),
	Telefono VARCHAR(13),
	Email VARCHAR(150)
);

CREATE TABLE Zona
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Descripcion VARCHAR(50),
	Porcentaje FLOAT
);

CREATE TABLE TipoInmueble
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Descripcion VARCHAR(50),
	Porcentaje FLOAT
);

CREATE TABLE Inmueble
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Calle VARCHAR(50),
	Numero VARCHAR(50),
	Colonia VARCHAR(50),
	Municipio VARCHAR(50),
	CodigoPostal VARCHAR(5),
	IdContacto INT,
	IdZona INT,
	IdTipoInmueble INT,
	FOREIGN KEY (IdContacto) REFERENCES Contacto(Id),
	FOREIGN KEY (IdZona) REFERENCES Zona(Id),
	FOREIGN KEY (IdTipoInmueble) REFERENCES TipoInmueble(Id)
);

CREATE TABLE Material
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Descripcion VARCHAR(200),
	Marca VARCHAR(50),
	Unidad VARCHAR(35),
	CostoPorUnidad Decimal(10,2),
	Calidad VARCHAR(35),
	Color VARCHAR(35),
	Acabado VARCHAR(100),
	AniosGarantia TINYINT
);

CREATE	TABLE TipoServicio
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(50),
    Tarifa Decimal(10,2)
);

CREATE TABLE Cotizacion
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Fecha DATE,
	Descripcion VARCHAR(200),
	MetrosCuadrados INT,
	SubTotal Decimal(10,2),
	IVA Decimal(10,2),
	Total Decimal(10,2),
	IdInmueble INT,
	IdTipoServicio INT,
	FOREIGN KEY (IdInmueble) REFERENCES Inmueble(Id),
	FOREIGN KEY (IdTipoServicio) REFERENCES TipoServicio(Id)
);

CREATE TABLE Cotizacion_Materiales
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	IdCotizacion INT,
	IdMaterial INT,
	Cantidad INT,
	FOREIGN KEY (IdCotizacion) REFERENCES Cotizacion(Id),
	FOREIGN KEY (IdMaterial) REFERENCES Material(Id)
);

/* ------------------------------------------------------------------------------
	Sentencias DML para inserción de registros
------------------------------------------------------------------------------ */
INSERT Contacto (Nombre, ApPaterno, ApMaterno, Telefono, Email) VALUES ('Alicia','Arredondo','Amezcua', '5511111111', 'alicia.arredondo@abc.com');
INSERT Contacto (Nombre, ApPaterno, ApMaterno, Telefono, Email) VALUES ('Bernardo','Buenrostro','Balderas', '3312341234', 'bernardo.buenrostrob@def.org');
INSERT Contacto (Nombre, ApPaterno, ApMaterno, Telefono, Email) VALUES ('Cesar','Coppel','Caballero', '8122223333', 'cesarc@gmail.com');
INSERT Contacto (Nombre, ApPaterno, ApMaterno, Telefono, Email) VALUES ('Dante','Duran','Duarte', '5544445555', 'dante.duran@rstn.com');
INSERT Contacto (Nombre, ApPaterno, ApMaterno, Telefono, Email) VALUES ('Esmeralda','Elizondo','Espinosa', '3366667777', 'esmeralda.elizondo@bldr.com');

INSERT Zona (Descripcion, Porcentaje) VALUES ('Centro', .03);
INSERT Zona (Descripcion, Porcentaje) VALUES ('Norte', .02);
INSERT Zona (Descripcion, Porcentaje) VALUES ('Sur', .04);
INSERT Zona (Descripcion, Porcentaje) VALUES ('Oriente', .08);
INSERT Zona (Descripcion, Porcentaje) VALUES ('Poniente', .05);

INSERT TipoInmueble (Descripcion, Porcentaje) VALUES ('Residencial', .07);
INSERT TipoInmueble (Descripcion, Porcentaje) VALUES ('Comercial', .15);
INSERT TipoInmueble (Descripcion, Porcentaje) VALUES ('Gubernamental', .08);
INSERT TipoInmueble (Descripcion, Porcentaje) VALUES ('ONGs', 0.0);
INSERT TipoInmueble (Descripcion, Porcentaje) VALUES ('Centro Educativo', .02);

INSERT TipoServicio (Descripcion, Tarifa) VALUES ('Pintura', 100);
INSERT TipoServicio (Descripcion, Tarifa) VALUES ('Impermeabilización', 250);
INSERT TipoServicio (Descripcion, Tarifa) VALUES ('Ventanas y Canceles', 250);
INSERT TipoServicio (Descripcion, Tarifa) VALUES ('Azulejos', 275);
INSERT TipoServicio (Descripcion, Tarifa) VALUES ('Pisos', 300);


INSERT Inmueble (Calle, Numero, Colonia, Municipio, CodigoPostal, IdContacto, IdZona, IdTipoInmueble)
VALUES ('Londres', '85', 'Cuauhtémoc', 'Cuauhtémoc','06600',1,1,1);
INSERT Inmueble (Calle, Numero, Colonia, Municipio, CodigoPostal, IdContacto, IdZona, IdTipoInmueble)
VALUES ('Av. de los 100 metros', '600', 'Nueva Industrial', 'Gustavo A. Madero','07729',2,2,2);
INSERT Inmueble (Calle, Numero, Colonia, Municipio, CodigoPostal, IdContacto, IdZona, IdTipoInmueble)
VALUES ('Cascomate', '196', 'Pedregal', 'Coyoacán','04730',3,3,4);
INSERT Inmueble (Calle, Numero, Colonia, Municipio, CodigoPostal, IdContacto, IdZona, IdTipoInmueble)
VALUES ('Prolongación Paseo de la Reforma', '880', 'Lomas de Santa Fé', 'Alvaro Obregón','01219',4,4,5);
INSERT Inmueble (Calle, Numero, Colonia, Municipio, CodigoPostal, IdContacto, IdZona, IdTipoInmueble)
VALUES ('Paseo del Tepozán', '62-376', 'Tepozanes', 'Los Reyes Acaquilpan','56428',4,5,3);

INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Impermeabilizante a base de asfalto', 'Fester Imperfacil', 'Litro', 195.0, 'Excelente', 'Negro', 'Con malla', 8);
INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Pintura Vinil Acrilica resistente al lavado', 'Berel', 'Litro', 102.25, 'Buena', 'Cafe', 'Mate', 4);
INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Piso Laminado Imperial Plus', 'Terza', 'Metro Cuadrado', 409.0, 'Muy Buena', 'Caoba Natural', 'Brilloso', 15);
INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Azulejo cerámico marble', 'Interceramic', 'Metro Cuadrado', 329.0, 'Premium', 'Beige', 'Liso', 30);
INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Perfil Aluminio corredizo', 'Cuprum', 'Metro', 705.0, 'Buena', 'Natural', 'Electrostatica', 10);
INSERT Material (Descripcion, Marca, Unidad, CostoPorUnidad, Calidad, Color, Acabado, AniosGarantia)
VALUES ('Hoja de vidrio 9mm', 'Vitro', 'Metro', 210.0, 'Muy buena', 'Transparente', 'Liso', 20);

INSERT Cotizacion (Fecha, Descripcion, MetrosCuadrados, SubTotal, IVA, Total, IdInmueble, IdTipoServicio)
VALUES ('2021-09-01', 'Cotización Impermeabilización Casa Hab. Calle Londres', 20, 7450, 1117.5, 8567.5, 1, 2);
INSERT Cotizacion (Fecha, Descripcion, MetrosCuadrados, SubTotal, IVA, Total, IdInmueble, IdTipoServicio)
VALUES ('2021-09-02', 'Colocación de piso cerámico para cadena comercial Liverpool', 500, 380000, 57000, 437000, 2, 5);
INSERT Cotizacion (Fecha, Descripcion, MetrosCuadrados, SubTotal, IVA, Total, IdInmueble, IdTipoServicio)
VALUES ('2021-09-03', 'Servicio de pintura para interiores Fundación Michu Mau', 25, 3520.25, 528.04, 4048.29, 3, 1);
INSERT Cotizacion (Fecha, Descripcion, MetrosCuadrados, SubTotal, IVA, Total, IdInmueble, IdTipoServicio)
VALUES ('2021-09-04', 'Colocación de canceleles area de aduanas aeropuerto', 70, 73250, 10987.5, 84237.5, 4, 3);
INSERT Cotizacion (Fecha, Descripcion, MetrosCuadrados, SubTotal, IVA, Total, IdInmueble, IdTipoServicio)
VALUES ('2021-09-05', 'Colocación de azulejos baños oficinas SAT Poniente', 95, 60776.25, 9116.44, 69892.69, 5, 4);

INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (1, 1, 10);
INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (2, 3, 500);
INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (3, 2, 9);
INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (4, 5, 55);
INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (4, 6, 70);
INSERT Cotizacion_Materiales (IdCotizacion, IdMaterial, Cantidad) VALUES (5, 4, 95);

/* ------------------------------------------------------------------------------
	Sentencias DML para actualizar datos
------------------------------------------------------------------------------ */
UPDATE Contacto SET  ApPaterno = 'Barreto', Email = 'bernardo.barreto@def.org' WHERE Id = 2;
UPDATE Contacto SET  Telefono = '8158932020' WHERE Id = 3;

UPDATE Zona SET Descripcion = 'Este' WHERE Id = 3;
UPDATE Zona SET Descripcion = 'Oeste' WHERE Id = 4;

UPDATE TipoInmueble SET Descripcion = 'Organización no gubernamental' WHERE Descripcion = 'ONGs';
UPDATE TipoInmueble SET Descripcion = 'Colegios y Universidades' WHERE Id = 5;

UPDATE TipoServicio SET Descripcion = 'Colocación de azulejos' WHERE Descripcion = 'Azulejos';
UPDATE TipoServicio SET Descripcion = 'Colocación de pisos' WHERE Id = 5;

UPDATE Inmueble SET Colonia = 'Ramos Millán' WHERE Id = 2;
UPDATE Inmueble SET Municipio = 'Benito Juárez' WHERE CodigoPostal = '04730';

UPDATE Material SET Unidad = 'Galón' WHERE Id = 1;
UPDATE Material SET Marca = 'Alumax' WHERE Id = 5;

UPDATE Cotizacion SET Fecha = '2021-08-30', Descripcion = 'Aplicación de Impermeabilizante Casa Hab. Calle Londres' WHERE Id = 1;
UPDATE Cotizacion SET MetrosCuadrados = 105, SubTotal = 64066.25, IVA = 9609.94, Total = 73676.19 WHERE Id = 5;

UPDATE Cotizacion_Materiales SET IdMaterial = 5 WHERE Id = 2;
UPDATE Cotizacion_Materiales SET Cantidad = 105 WHERE Id = 5;

/* ------------------------------------------------------------------------------
	Sentencias DML para eliminar datos
------------------------------------------------------------------------------ */
DELETE FROM Cotizacion_Materiales WHERE Id = 6;
DELETE FROM Cotizacion_Materiales WHERE IdCotizacion = 4;

DELETE FROM Cotizacion WHERE IdInmueble = 5;
DELETE FROM Cotizacion WHERE Descripcion LIKE '%aeropuerto%';

DELETE FROM Material WHERE Marca = 'Vitro';
DELETE FROM Material WHERE AniosGarantia = 15;

DELETE FROM Inmueble WHERE Id = 5;
DELETE FROM Inmueble WHERE IdZona = 4 AND CodigoPostal = '01219';

DELETE FROM TipoServicio WHERE Descripcion = 'Ventanas y Canceles';
DELETE FROM TipoServicio WHERE Id = 4;

DELETE FROM TipoInmueble WHERE Descripcion = 'Gubernamental';
DELETE FROM TipoInmueble WHERE Id = 5;

DELETE FROM Zona WHERE Id = 5;
DELETE FROM Zona WHERE Descripcion = 'Oeste';

DELETE FROM Contacto WHERE Email = 'esmeralda.elizondo@bldr.com';
DELETE FROM Contacto WHERE Telefono = '5544445555';

/* ------------------------------------------------------------------------------
	Sentencias DML para consultar datos
------------------------------------------------------------------------------ */
SELECT Nombre, ApPaterno, ApMaterno FROM Contacto;

SELECT * FROM Zona WHERE Porcentaje < .04;

SELECT * FROM TipoInmueble WHERE Descripcion NOT LIKE '%comer%';

SELECT Tarifa FROM TipoServicio WHERE Descripcion = 'Pintura';

SELECT Municipio, CodigoPostal FROM Inmueble WHERE IdZona != 5;

SELECT * FROM Material;

SELECT * FROM Cotizacion WHERE MetrosCuadrados BETWEEN 10 AND 50;

SELECT * FROM Cotizacion_Materiales WHERE IdCotizacion = 2;
use ayudaparatodos;

/* -----------------------------------------------------------
A) Datos personales y sus beneficios
----------------------------------------------------------- */
SELECT	A.id_beneficiario AS Id, 
		CONCAT(A.nombre, ' ', A.apellido_paterno, ' ', A.apellido_materno) AS Beneficiario,
        A.Edad, A.Telefono,
        Estado,
        CASE WHEN CursosTalleres IS NULL THEN 0 ELSE CursosTalleres END as 'Cursos y Talleres',
        CASE WHEN Despensas IS NULL THEN 0 ELSE Despensas END AS Despensas,
        CASE WHEN Apoyos_Economicos IS NULL THEN 0 ELSE Apoyos_Economicos END AS 'Apoyos Economicos',
        CASE WHEN Apoyos_TerceraEdad IS NULL THEN 0 ELSE Apoyos_TerceraEdad END AS 'Apoyos Tercera Edad',
        CASE WHEN Becas_Infantiles IS NULL THEN 0 ELSE Becas_Infantiles END AS 'Becas Infantiles',
        CASE WHEN Cupones_Descuento IS NULL THEN 0 ELSE Cupones_Descuento END AS 'Cupones de Descuento'
FROM	beneficiarios A INNER
JOIN	Estados EST ON A.id_estado = EST.id_estado LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS CursosTalleres FROM alumnos GROUP BY id_beneficiario) B ON A.id_beneficiario = B.id_beneficiario LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS Despensas FROM ApoyosDespensas GROUP BY id_beneficiario) C ON A.id_beneficiario = C.id_beneficiario LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS Apoyos_Economicos FROM ApoyosEconomicos GROUP BY id_beneficiario) D ON A.id_beneficiario = D.id_beneficiario LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS Apoyos_TerceraEdad FROM ApoyosTerceraEdad GROUP BY id_beneficiario) E ON A.id_beneficiario = E.id_beneficiario LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS Becas_Infantiles FROM BecasInfantiles GROUP BY id_beneficiario) F ON A.id_beneficiario = F.id_beneficiario LEFT
JOIN	(SELECT id_beneficiario, COUNT(id_beneficiario) AS Cupones_Descuento FROM CuponesDescuento GROUP BY id_beneficiario) G ON A.id_beneficiario = G.id_beneficiario
ORDER	BY A.id_beneficiario;

/* -----------------------------------------------------------
	B) Lista de cursos talleres
-----------------------------------------------------------*/
SELECT	CASE tipo_taller_curso 
			WHEN 'T' THEN 'Taller' ELSE 'Curso' END
        AS Tipo,
		descripcion,
        nombre_sede AS Sede,
        fecha_inicio,
        fecha_fin
FROM	TallerCurso A INNER
JOIN	Sedes B ON A.id_sede = B.id_sede
ORDER	BY Tipo, descripcion;

/* -----------------------------------------------------------
	C) Encargados de talleres y cursos
-----------------------------------------------------------*/
SELECT	CONCAT(B.nombre, ' ', B.apellido_paterno, ' ', B.apellido_materno) AS Encargado, 
		A.descripcion AS Taller_Curso
FROM	tallercurso A INNER
JOIN	Usuarios B ON A.id_encargado = B.id_usuario
ORDER	BY Encargado, Taller_Curso;

/* -----------------------------------------------------------
	D) Beneficiarios sin ningún programa registrado
-----------------------------------------------------------*/
SELECT	CONCAT(nombre, ' ', apellido_paterno, ' ', apellido_materno) 
		AS Beneficiario
FROM	Beneficiarios
WHERE	id_beneficiario NOT IN
(
	SELECT id_beneficiario FROM Alumnos
    UNION ALL
    SELECT id_beneficiario FROM ApoyosDespensas
    UNION ALL
    SELECT id_beneficiario FROM ApoyosEconomicos
    UNION ALL
    SELECT id_beneficiario FROM ApoyosTerceraEdad
    UNION ALL
    SELECT id_beneficiario FROM becasinfantiles
    UNION ALL
    SELECT id_beneficiario FROM CuponesDescuento
)
ORDER BY Beneficiario;

/* -----------------------------------------------------------
	E) Beneficiarios que tienen apoyo económico
-----------------------------------------------------------*/
SELECT	CONCAT(B.nombre, ' ', B.apellido_paterno, ' ', B.apellido_materno) 
		AS Beneficiario,
        A.Importe
FROM	(
			SELECT	id_beneficiario, SUM(importe) AS Importe
			FROM	ApoyosEconomicos
			GROUP	BY id_beneficiario
        ) A INNER
JOIN	Beneficiarios B ON A.id_beneficiario = B.id_Beneficiario
ORDER	BY Beneficiario;

/* -----------------------------------------------------------
	F) Beneficiarios niños que tienen beca
-----------------------------------------------------------*/
SELECT	CONCAT(B.nombre, ' ', B.apellido_paterno, ' ', B.apellido_materno)
		AS Beneficiario,
        edad
FROM	(
		SELECT	DISTINCT 
				id_beneficiario
        FROM 	BecasInfantiles
        ) A INNER
JOIN	Beneficiarios B 
		ON A.id_beneficiario = B.id_beneficiario
WHERE	B.edad < 18;

/* -----------------------------------------------------------
	G) Beneficiarios con apoyo de despensa
-----------------------------------------------------------*/
SELECT	CONCAT(B.nombre, ' ', B.apellido_paterno, ' ', B.apellido_materno) 
		AS Beneficiario,
        A.Despensas
FROM	(
		SELECT	id_beneficiario, 
				SUM(cantidad_despensas) AS Despensas
		FROM	ApoyosDespensas
        GROUP	BY id_beneficiario
        ) A INNER
JOIN	beneficiarios B
		ON A.id_beneficiario = B.id_beneficiario
ORDER 	BY Beneficiario;
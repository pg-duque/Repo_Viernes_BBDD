-- CREATION TABLAS PLATAFORMA EDUCATIVA ---

-- TABLA ALUMNOS --

/*Contiene información sobre los alumnos*/

DROP TABLE IF EXISTS alumnos CASCADE;
CREATE TABLE alumnos (
	alumno_id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellidos VARCHAR(150) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE
);

-- TABLA CURSOS --

/*Contiene información sobre los cursos*/


DROP TABLE IF EXISTS Cursos CASCADE;
CREATE TABLE Cursos (
	curso_id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	duracion NUMERIC(10,2) NOT NULL,
	numero_asignaturas INT NOT NULL 
);

-- TABLA INSCRIPCIONES --

/*Contiene información de los detalles de las inscripciones*/

DROP TABLE IF EXISTS inscripciones CASCADE;
CREATE TABLE inscripciones (
    inscripcion_id SERIAL PRIMARY KEY,
	alumno_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion DATE NOT NULL
);

/*Añado claves foráneas*/
ALTER TABLE inscripciones ADD CONSTRAINT FK_inscripcion_alumno FOREIGN KEY (alumno_id)   REFERENCES alumnos (alumno_id);

ALTER TABLE inscripciones ADD CONSTRAINT FK_inscripcion_curso FOREIGN KEY (curso_id) REFERENCES cursos (curso_id);

/*Inserciones*/

INSERT INTO alumnos (nombre, apellidos, email) VALUES
('Juan', 'Lopeo Locoja', 'juanlopeolocoja@gmail.com'),
('Sara', 'García Dorado', 'sara1987@gmail.com'),
('Pablo', 'Calzado Martín', 'pabloimg1561@gmail.com'),
('Vicente', 'López López', 'vicentell@gmail.com'),
('Lucas', 'Crabioto Mendez', 'lucascm@hotmail.com'),
('Alva', 'Ginón Rosado', 'alvaginon@gmail.com'),
('Rafa', 'Del Olmo Pisado', 'rafaolmopisado@gmail.com');

INSERT INTO inscripciones (alumno_id, curso_id, fecha_inscripcion) VALUES
('1', '3', '2005-11-10'),
('2', '3', '2005-10-08'),
('3', '1', '2011-10-08'),
('4', '4', '2001-09-11'),
('5', '5', '2004-10-14'),
('6', '2', '2001-09-11'),
('7', '5', '2004-10-13');

INSERT INTO cursos (nombre, duracion, numero_asignaturas) VALUES 
('tecnologico', '200', '6'),
('biosanitario', '200', '7'),
('sociales', '200', '5'),
('artes artisticas', '200', '4'),
('artes plasticas', '200', '4');

/*Consultas*/

-- Alumnos apuntados a cursos con más de 6 asignaturas --

SELECT
	a.nombre,
	a.apellidos,
	c.nombre,
	c.numero_asignaturas
FROM alumnos AS a
INNER JOIN inscripciones AS i
	ON a.alumno_id = i.alumno_id
INNER JOIN cursos AS c
	ON i.curso_id = c.curso_id
WHERE numero_asignaturas > 6
ORDER BY c.numero_asignaturas DESC;

/*Obtener alumnos inscritos en el curso de */

SELECT
	a.nombre,
	a.apellidos,
	c.nombre,
	i.fecha_inscripcion
FROM alumnos AS a
INNER JOIN inscripciones AS i ON a.alumno_id = i.alumno_id
INNER JOIN cursos AS c ON i.curso_id = c.curso_id
WHERE c.nombre = 'artes artisticas';

/*Alumnos que se hayan inscrito antes de x año*/
SELECT
	*
FROM alumnos AS a
INNER JOIN inscripciones AS i
	ON a.alumno_id=i.alumno_id
WHERE EXTRACT (YEAR FROM i.fecha_inscripcion) < '2005'
ORDER BY a.nombre;

/*Cursos que tengan más de 3 asignaturas*/
SELECT
	*
FROM cursos 
WHERE numero_asignaturas>3;
CREATE DATABASE prueba;
GO
USE prueba;

CREATE TABLE TipoIdentificacion(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	prefijo VARCHAR(10)NOT NULL,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Asignatura(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	codigo VARCHAR(50)NOT NULL,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Profesor(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	identificacion VARCHAR(50) UNIQUE NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	asignatura_id INT NOT NULL,
	CONSTRAINT fk_asignatura FOREIGN KEY (asignatura_id)
    REFERENCES Asignatura (id),
	tipo_identificacion_id INT NOT NULL,
	CONSTRAINT fk_tipo_identificacion FOREIGN KEY (tipo_identificacion_id)
    REFERENCES TipoIdentificacion (id)

);

CREATE TABLE Estudiante(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	identificacion VARCHAR(50) UNIQUE NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	tipo_identificacion_id INT NOT NULL,
	CONSTRAINT fk_tipo_identificacion1 FOREIGN KEY (tipo_identificacion_id)
    REFERENCES TipoIdentificacion (id)
);

CREATE TABLE DetalleEstudianteAsignatura(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nota_final TINYINT NOT NULL,
	asignatura_id INT NOT NULL,
	CONSTRAINT fk_asignatura1 FOREIGN KEY (asignatura_id)
    REFERENCES Asignatura (id),
	estudiante_id INT NOT NULL,
	CONSTRAINT fk_estudiante FOREIGN KEY (estudiante_id)
    REFERENCES Estudiante (id)
);

CREATE TABLE Matricula(
	id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	anioEscolar TINYINT NOT NULL,
	estudiante_id INT NOT NULL,
	CONSTRAINT fk_estudiante1 FOREIGN KEY (estudiante_id)
    REFERENCES Estudiante (id)
);
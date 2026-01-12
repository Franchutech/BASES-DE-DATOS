DROP DATABASE IF EXISTS ManipulandoDatos; 
CREATE DATABASE IF NOT EXISTS ManipulandoDatos; 
USE ManipulandoDatos; 

CREATE TABLE Departamento (
id_numero CHAR(10) PRIMARY KEY,
nombre VARCHAR(40),
ubicacion VARCHAR(40)
);
CREATE TABLE Empleados (
dni_nie CHAR(10) PRIMARY KEY,
nombre VARCHAR(40),
apellidos VARCHAR(40),
fecha_nacimiento DATE,
id_numero CHAR(10),
FOREIGN KEY(id_numero)REFERENCES Departamento(id_numero)
);
CREATE TABLE Coche_Empresa (
matricula CHAR(10) PRIMARY KEY,
marca VARCHAR (20),
modelo VARCHAR (20),
dni_nie CHAR(10),
FOREIGN KEY(dni_nie)REFERENCES Empleados(dni_nie)
);


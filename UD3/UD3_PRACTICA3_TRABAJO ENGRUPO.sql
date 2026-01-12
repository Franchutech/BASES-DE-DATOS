
CREATE DATABASE IF NOT EXISTS jaguaia_park_fin;
USE jaguaia_park_fin;

CREATE TABLE Habitat (
    ID_Habitat INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(30),
    Ubicacion VARCHAR(100),
    Temperatura_Promedio DECIMAL(4,1)
);

CREATE TABLE Especie (
    ID_Especie INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Cientifico VARCHAR(80),
    Tipo_Alimentacion VARCHAR(40),
    Estado_Conservacion VARCHAR(50)
);

CREATE TABLE Animal (
    ID_Animal INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Categoria VARCHAR(50),
    Sexo ENUM('Macho','Hembra'),
    ID_Especie INT,
    ID_Habitat INT,
    FOREIGN KEY (ID_Especie) REFERENCES Especie(ID_Especie),
    FOREIGN KEY (ID_Habitat) REFERENCES Habitat(ID_Habitat)
);

CREATE TABLE Donantes (
    ID_Donador INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(80),
    Tipo VARCHAR(50),
    Fecha_Donacion DATE,
    Monto DECIMAL(10,2)
);

CREATE TABLE Personal (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Telefono VARCHAR(20),
    Puesto ENUM('Veterinario','Encargado')
);

CREATE TABLE Veterinario (
    ID_Veterinario INT PRIMARY KEY,
    Especialidad VARCHAR(50),
    FOREIGN KEY (ID_Veterinario) REFERENCES Personal(ID_Empleado)
);

CREATE TABLE Encargado (
    ID_Encargado INT PRIMARY KEY,
    Area VARCHAR(50),
    FOREIGN KEY (ID_Encargado) REFERENCES Personal(ID_Empleado)
);

CREATE TABLE Consulta_Veterinaria (
    ID_Consulta INT AUTO_INCREMENT PRIMARY KEY,
    Historial TEXT,
    Diagnostico TEXT,
    Tratamiento VARCHAR(100),
    ID_Veterinario INT,
    FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario)
);

CREATE TABLE Rutina (
    ID_Revision INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Control_Peso DECIMAL(5,2),
    Control_Alimentacion VARCHAR(100),
    Anotaciones TEXT,
    ID_Encargado INT,
    FOREIGN KEY (ID_Encargado) REFERENCES Encargado(ID_Encargado)
);

CREATE TABLE Tratamiento (
    ID_Tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(80),
    Descripcion VARCHAR(150),
    Duracion_Estimada INT,
    Frecuencia VARCHAR(50),
    Observaciones TEXT
);

CREATE TABLE Animal_Tratamiento (
    ID_Animal INT,
    ID_Tratamiento INT,
    Fecha DATE,
    Estado VARCHAR(50),
    Observaciones TEXT,
    PRIMARY KEY (ID_Animal, ID_Tratamiento),
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    FOREIGN KEY (ID_Tratamiento) REFERENCES Tratamiento(ID_Tratamiento)
);

CREATE TABLE Vet_Tratamiento (
    ID_Veterinario INT,
    ID_Tratamiento INT,
    Fecha DATE,
    PRIMARY KEY (ID_Veterinario, ID_Tratamiento),
    FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario),
    FOREIGN KEY (ID_Tratamiento) REFERENCES Tratamiento(ID_Tratamiento)
);

CREATE TABLE Atender (
    ID_Veterinario INT,
    ID_Animal INT,
    Fecha DATE,
    Diagnostico TEXT,
    Tratamiento_Aplicado VARCHAR(100),
    Observaciones TEXT,
    PRIMARY KEY (ID_Veterinario, ID_Animal, Fecha),
    FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario),
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal)
);

CREATE TABLE Patrocinar (
    ID_Donador INT,
    ID_Animal INT,
    Fecha DATE,
    PRIMARY KEY (ID_Donador, ID_Animal),
    FOREIGN KEY (ID_Donador) REFERENCES Donantes(ID_Donador),
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal)
);

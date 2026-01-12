DROP DATABASE IF EXISTS examen2; 
CREATE DATABASE IF NOT EXISTS examen2; 
USE examen2; 


CREATE TABLE Cliente (
	pasaporte CHAR(10) PRIMARY KEY,
    nombre VARCHAR (40),
    direccion VARCHAR (60),
    cuenta_bancaria VARCHAR (30)
);
ALTER TABLE Cliente ADD Tipo  ENUM('Premium','Regular');


CREATE TABLE Cupones ( 
    Id_cupon CHAR(15) PRIMARY KEY, 
    fecha_vencimiento DATE, 
    porcentaje_descuento INT, 
    pasaporte CHAR(10),
    FOREIGN KEY (pasaporte) REFERENCES Cliente(pasaporte)
); 

CREATE TABLE Pedidos (
Id_pedido CHAR(10) PRIMARY KEY,
fecha_pedido DATE,
importe_pedido DECIMAL(9,2),
pasaporte CHAR(10),
FOREIGN KEY (pasaporte) REFERENCES Cliente(pasaporte)
);

CREATE TABLE Productos (
Codigo_EAN CHAR(15) PRIMARY KEY,
marca VARCHAR (30),
nombre VARCHAR (30),
precio DECIMAL (6,2)
);
ALTER TABLE Productos DROP COLUMN marca;


CREATE TABLE PEDIDO_PRODUCTO (
id_pedido_codigo_EAN CHAR(20) PRIMARY KEY,
Id_pedido CHAR(10),
Codigo_EAN CHAR(15),
FOREIGN KEY (Id_pedido) REFERENCES Pedidos(Id_Pedido),
FOREIGN KEY (Codigo_EAN) REFERENCES Productos(Codigo_EAN)
);



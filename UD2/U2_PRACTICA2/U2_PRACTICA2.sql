DROP DATABASE IF EXISTS UD2_Practica2; 
CREATE DATABASE IF NOT EXISTS UD2_Practica2; 
USE UD2_Practica2; 

CREATE TABLE Members(
id CHAR(15) PRIMARY KEY,
name VARCHAR(40),
email VARCHAR(50),
phone_number VARCHAR(10)
);
ALTER TABLE Members DROP COLUMN phone_number;

CREATE TABLE Types(
id CHAR(15) PRIMARY KEY,
type_name VARCHAR(40)
);

CREATE TABLE Classes(
id CHAR(15) PRIMARY KEY,
class_name VARCHAR(30),
FOREIGN KEY (id) REFERENCES Types(id),
duration_mins INT
);

CREATE TABLE Instructors(
id CHAR(15) PRIMARY KEY,
name VARCHAR(50)
);
ALTER TABLE Instructors ADD surname VARCHAR(50);

CREATE TABLE Class_Schedule(
id CHAR(15) PRIMARY KEY,
FOREIGN KEY (id) REFERENCES Classes(id),
FOREIGN KEY (id) REFERENCES Instructors(id),
start_time INT,
end_time INT
);

CREATE TABLE Member_Signups(
id CHAR(15) PRIMARY KEY,
FOREIGN KEY (id) REFERENCES Members(id),
FOREIGN KEY (id) REFERENCES Class_Schedule(id),
no_show BOOLEAN
);
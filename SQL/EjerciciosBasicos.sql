DROP TABLE IF EXISTS EMPLEADO;
CREATE TABLE EMPLEADO
(	Nombre VARCHAR(15) NOT NULL,
	Apellido1 CHAR,
	Apellido2 VARCHAR(15) NOT NULL,
	Dni CHAR(9) NOT NULL,
	FechaNac DATE,
	Direccion VARCHAR(30),
	Sexo CHAR,
	Sueldo DECIMAL(10,2),
	SuperDni CHAR(9),
	Dno INT NOT NULL,
	PRIMARY KEY (Dni),
	FOREIGN KEY(SuperDni) REFERENCES EMPLEADO(Dni),
	FOREIGN KEY(Dno) REFERENCES DEPARTAMENTO(NumeroDpto) );
	
--ALTER TABLE EMPLEADO ADD COLUMN Trabajo VARCHAR(12);

DROP TABLE IF EXISTS DEPARTAMENTO;
CREATE TABLE DEPARTAMENTO
	( NombreDpto VARCHAR(15) NOT NULL,
	NumeroDpto INT NOT NULL,
	DniDirector CHAR(9) NOT NULL,
	FechaIngresoDirector DATE,
	PRIMARY KEY(NumeroDpto),
	UNIQUE(NombreDpto),
	FOREIGN KEY(DniDirector) REFERENCES EMPLEADO(Dni) );

DROP TABLE IF EXISTS LOCALIZACIONES_DPTO;
CREATE TABLE LOCALIZACIONES_DPTO
( 	NumeroDpto INT NOT NULL,
	UbicacionDpto VARCHAR(15) NOT NULL,
	PRIMARY KEY(NumeroDpto, UbicacionDpto),
	FOREIGN KEY(NumeroDpto) REFERENCES DEPARTAMENTO(NumeroDpto) );

DROP TABLE IF EXISTS PROYECTO;
CREATE TABLE PROYECTO
( 	NombreProyecto VARCHAR(15) NOT NULL,
	NumProyecto INT NOT NULL,
	UbicacionProyecto VARCHAR(15),
	NumDptoProyecto INT NOT NULL,
	PRIMARY KEY(NumProyecto),
	UNIQUE(NombreProyecto),
	FOREIGN KEY(NumDptoProyecto) REFERENCES DEPARTAMENTO(NumeroDpto) );

DROP TABLE IF EXISTS TRABAJA_EN;
CREATE TABLE TRABAJA_EN
( 	DniEmpleado CHAR(9) NOT NULL,
	NumProy INT NOT NULL,
	Horas DECIMAL(3,1) NOT NULL,
	PRIMARY KEY(DniEmpleado, NumProy),
	FOREIGN KEY(DniEmpleado) REFERENCES EMPLEADO(Dni),
	FOREIGN KEY(NumProy) REFERENCES PROYECTO(NumProyecto) );

DROP TABLE IF EXISTS SUBORDINADO;
CREATE TABLE SUBORDINADO
( 	DniEmpleado CHAR(9) NOT NULL,
	NombSubordinado VARCHAR(15) NOT NULL,
	Sexo CHAR,
	FechaNac DATE,
	Relacion VARCHAR(8),
	PRIMARY KEY(DniEmpleado, NombSubordinado),
	FOREIGN KEY(DniEmpleado) REFERENCES EMPLEADO(Dni) );


---

INSERT INTO EMPLEADO VALUES ('Ricardo', 'Roca', 'Flores', '653298653', '1962-12-30', 'Los Jarales, 47', 'H', 37000, '653298653', 4 );
INSERT INTO EMPLEADO VALUES ('José', 'Pérez', 'Pérez', '123456789', '01-09-1965', 'Eloy I, 98', 'H', 30000, '333445555', 5);
INSERT INTO EMPLEADO VALUES ('Alberto', 'Campos', 'Sastre', '333445555', '08-12-1955', 'Avda. Ríos, 9', 'H', 40000, '888665555', 5);
INSERT INTO EMPLEADO VALUES ('Alicia', 'Jiménez', 'Celaya', '999887777', '12-05-1968', 'Gran Vía, 38', 'M', 25000, '987654321', 4);
INSERT INTO EMPLEADO VALUES ('Juana', 'Sainz', 'Oreja', '987654321', '20-06-1941', 'Cerquillas, 67', 'M', 43000, '888665555', 4);
INSERT INTO EMPLEADO VALUES ('Fernando', 'Ojeda', 'Ordóñez', '666884444', '15-09-1962', 'Portillo, s/n', 'H', 38000, '333445555', 5);
INSERT INTO EMPLEADO VALUES ('Aurora', 'Oliva', 'Avezuela', '453453453', '31-07-1972', 'Antón, 6', 'M', 25000, '333445555', 5);
INSERT INTO EMPLEADO VALUES ('Luis', 'Pajares', 'Morera', '987987987', '29-03-1969', 'Enebros, 90', 'H', 25000, '987654321', 4);
INSERT INTO EMPLEADO VALUES ('Eduardo', 'Ochoa', 'Paredes', '888665555', '10-11-1937', 'Las Peñas, 1', 'H', 55000, 'NULL', 1);
INSERT INTO EMPLEADO (Nombre, Apellido2, Dno, Dni) VALUES ('Ricardo', 'Flores', 4, '653298654' );

INSERT INTO DEPARTAMENTO VALUES ('Investigación', 5, '333445555', 32285);
INSERT INTO DEPARTAMENTO VALUES ('Administración', 4, '987654321', 34700);
INSERT INTO DEPARTAMENTO VALUES ('Sede Central', 1, '888665555', 29756);


INSERT INTO TRABAJA_EN VALUES ('123456789', 1, '32,5');
INSERT INTO TRABAJA_EN VALUES ('123456789', 2, '7,5');
INSERT INTO TRABAJA_EN VALUES ('666884444', 3, '40');
INSERT INTO TRABAJA_EN VALUES ('453453453', 1, '20');
INSERT INTO TRABAJA_EN VALUES ('453453453', 2, '20');
INSERT INTO TRABAJA_EN VALUES ('333445555', 2, '10');
INSERT INTO TRABAJA_EN VALUES ('333445555', 3, '10');
INSERT INTO TRABAJA_EN VALUES ('333445555', 10, '10');
INSERT INTO TRABAJA_EN VALUES ('333445555', 20, '10');
INSERT INTO TRABAJA_EN VALUES ('999887777', 30, '30');
INSERT INTO TRABAJA_EN VALUES ('999887777', 10, '10');
INSERT INTO TRABAJA_EN VALUES ('987987987', 10, '35');
INSERT INTO TRABAJA_EN VALUES ('987987987', 30, '5');
INSERT INTO TRABAJA_EN VALUES ('987654321', 30, '20');
INSERT INTO TRABAJA_EN VALUES ('987654321', 20, '15');
INSERT INTO TRABAJA_EN VALUES ('888665555', 20, '10');

INSERT INTO PROYECTO VALUES ('ProyectoX', 1, 'Valencia',5);
INSERT INTO PROYECTO VALUES ('ProyectoY', 2, 'Sevilla',5);
INSERT INTO PROYECTO VALUES ('ProyectoZ', 3, 'Madrid',5);
INSERT INTO PROYECTO VALUES ('Computación', 10, 'Gijón',4);
INSERT INTO PROYECTO VALUES ('Reorganización', 20, 'Madrid',1);
INSERT INTO PROYECTO VALUES ('Comunicaciones', 30, 'Gijón',4);

INSERT INTO SUBORDINADO VALUES ('333445555', 'Alicia', 'M', '05-04-1986', 'Hija');
INSERT INTO SUBORDINADO VALUES ('333445555', 'Teodoro', 'H', '25-10-1983', 'Hijo');
INSERT INTO SUBORDINADO VALUES ('333445555', 'Luisa', 'M', '03-05-1958', 'Esposa');
INSERT INTO SUBORDINADO VALUES ('987654321', 'Alfonso', 'H', '28-02-1942', 'Esposo');
INSERT INTO SUBORDINADO VALUES ('123456789', 'Miguel', 'H', '04-01-1988', 'Hijo');
INSERT INTO SUBORDINADO VALUES ('123456789', 'Alicia', 'M', '30-12-1988', 'Hija');
INSERT INTO SUBORDINADO VALUES ('123456789', 'Elisa', 'M', '05-05-1967', 'Esposa');

--DML Consultas Básicas

--Consulta 1: Recuperar la fecha de nacimiento y la dirección del empleado (o empleados) cuyo nombre sea José Pérez Pérez
SELECT FechaNac, Direccion
FROM EMPLEADO
WHERE Nombre = 'José' AND Apellido1 = 'Pérez' AND Apellido2 = 'Pérez';

--Consulta 2: Seleccione todos los Dni de EMPLEADO en la base de datos
SELECT Dni
FROM EMPLEADO;

--Consulta 3:  Recupere todos los valores de atributo de cualquier EMPLEADO que trabaje en el DEPARTAMENTO número 5
SELECT *
FROM EMPLEADO
WHERE Dno = 5;

--Consulta 4: : Recuperar el nombre y la dirección de todos los empleados que trabajan en el departamento 'Investigación'.
SELECT Nombre, direccion
FROM EMPLEADO, DEPARTAMENTO
WHERE DEPARTAMENTO.NombreDpto = 'Investigación' AND EMPLEADO.Dno = DEPARTAMENTO.NumeroDpto;

--Consulta 5: Por cada proyecto ubicado en 'Gijón', mostrar su número, el número del departamento que lo gestiona y el primer apellido, dirección y fecha de nacimiento del director del mismo
SELECT PROYECTO.NumProyecto, DEPARTAMENTO.NumeroDpto, EMPLEADO.Apellido1, EMPLEADO.Direccion, EMPLEADO.FechaNac
FROM PROYECTO, DEPARTAMENTO, EMPLEADO
WHERE PROYECTO.UbicacionProyecto = 'Gijón'
AND PROYECTO.NumDptoProyecto = DEPARTAMENTO.NumeroDpto
AND DEPARTAMENTO.DniDirector = EMPLEADO.Dni
AND EMPLEADO.Dno = DEPARTAMENTO.NumeroDpto;	--esta linea es redundante

--Consulta 6.1: Por cada empleado, recuperar el nombre y el primer apellido del empleado, y el nombre y el primer apellido de su supervisor inmediato
SELECt E.Nombre AS NombreEmpleado, E.Apellido1 AS ApellidoEmpleado, S.Nombre AS SupervisorNombre, S.Apellido1 AS SupervisorApellido
FROM EMPLEADO AS E, EMPLEADO AS S
WHERE E.SuperDni=S.Dni;

--Consulta 6.2: Visualizar la suma de los salarios de todos los empleados, el salario más alto, el salario más bajo y el sueldo medio.
SELECT SUM(EMPLEADO.Sueldo) AS Suma, MAX(EMPLEADO.Sueldo) AS Maximo, MIN(EMPLEADO.Sueldo) AS Minimo, AVG(EMPLEADO.Sueldo) AS Media
FROM EMPLEADO;

--Consulta 7: Recuperar el número total de empleados de la empresa
SELECT COUNT(EMPLEADO.Dni) AS Numero_Empleados_en_Empresa
FROM EMPLEADO;

--Consulta 8:  Recuperar número de empleados del departamento 'Investigación'
SELECT COUNT(EMPLEADO.Dni) AS Numero_Empleados_en_Depto
FROM EMPLEADO, DEPARTAMENTO
WHERE EMPLEADO.Dno = DEPARTAMENTO.NumeroDpto
AND DEPARTAMENTO.NombreDpto = 'Investigación';

--Consulta 9: Por cada departamento, recuperar el número de departamento, el número de empleados del mismo y el sueldo medio.

SELECT DEPARTAMENTO.NumeroDpto, COUNT(EMPLEADO.Dni), AVG(EMPLEADO.Sueldo)
FROM DEPARTAMENTO, EMPLEADO
WHERE EMPLEADO.Dno = DEPARTAMENTO.NumeroDpto
GROUP BY DEPARTAMENTO.NumeroDpto;

--Consulta 9 óptima:
SELECT EMPLEADO.Dno, COUNT(EMPLEADO.Dni), AVG(EMPLEADO.Sueldo)
FROM EMPLEADO
GROUP BY EMPLEADO.Dno;

--Consulta 10: Recuperar el sueldo de todos los empleados.
SELECT EMPLEADO.Sueldo
FROM EMPLEADO
GROUP BY EMPLEADO.Dni;	--Esta está extra

--Consulta 11: Obtener todos los valores de sueldo que son distintos.
SELECT DISTINCT EMPLEADO.Sueldo
FROM EMPLEADO;

--Jugando
SELECT EMPLEADO.Sueldo
FROM EMPLEADO
WHERE EMPLEADO.Sueldo != 25000
AND EMPLEADO.Sueldo IS NOT 37000;

--Tarea 1: Listar los nombres de todos los empleados
SELECT EMPLEADO.Nombre
FROM EMPLEADO;

--Tarea 2: Mostrar todos los datos de los empleados
SELECT *
FROM EMPLEADO;

--Tarea 3: Mostrar los empleados (dni y nombre) que trabajan en el departamento 4
SELECT EMPLEADO.Dni, EMPLEADO.Nombre
FROM EMPLEADO, DEPARTAMENTO
WHERE DEPARTAMENTO.NumeroDpto = '4'
AND DEPARTAMENTO.NumeroDpto = EMPLEADO.Dno;

--Tarea 4: Mostrar los nombres de los empleados ordenados por dni
SELECT EMPLEADO.Nombre
FROM EMPLEADO
ORDER BY Dni;

--Tarea 5: Mostrar por cada departamento, el número de empleados
SELECT DEPARTAMENTO.NumeroDpto, COUNT(EMPLEADO.Dni) AS CantidadEmpleados
FROM EMPLEADO, DEPARTAMENTO
GROUP BY DEPARTAMENTO.NumeroDpto;

--Tarea 6: Mostrar por cada departamento, el número de empleados de los que tienen más de 3 empleados.
SELECT DEPARTAMENTO.NumeroDpto, COUNT(EMPLEADO.Dni) AS CantidadEmpleados
FROm EMPLEADO, DEPARTAMENTO
GROUP BY DEPARTAMENTO.NumeroDpto
HAVING CantidadEmpleados > 3;
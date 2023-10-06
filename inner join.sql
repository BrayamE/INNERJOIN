CREATE DATABASE Tienda3
USE Tienda3

CREATE TABLE Personas (
    PersonaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    ApellidoPaterno NVARCHAR(100) NOT NULL,
    ApellidoMaterno NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Direccion NVARCHAR(255),
    Email NVARCHAR(255) UNIQUE,
    Telefono NVARCHAR(20)
);

INSERT INTO Personas ( Nombre, ApellidoPaterno, ApellidoMaterno,FechaNacimiento,Direccion, Email, Telefono)
VALUES
    ('Juan', 'P�rez','Vasquez','1992/12/07', 'Calle 123, Ciudad A', 'juan@email.com', '123-456-7890'),
    ('Ana', 'Garc�a','Perez','1994/10/02', 'Avenida XYZ, Ciudad B', 'ana123@email.com', '987-654-3210'),
    ('Carlos', 'L�pez','Rolando','2003/03/15', 'Calle 456, Ciudad A', 'carlosFgaa@email.com', '955-555-5555'),
    ('Laura', 'Rodr�guez','Quispe','1999/08/29', 'Avenida ABC, Ciudad C', 'laura@email.com', '911-222-3333'),
    ('Pedro', 'S�nchez','Apaza','1992/09/14', 'Calle 789, Ciudad B', 'pedro@email.com', '977-888-0999'),
	('Mar�a', 'L�pez', 'Mart�nez', '1990/03/22', 'Avenida 123, Ciudad C', 'maria@email.com', '555-666-7777'),
	('Juan', 'G�mez', 'Garc�a', '1989/11/07', 'Calle 456, Ciudad D', 'juanito@email.com', '911-222-3333'),
	('Laura', 'Hern�ndez', 'Rodr�guez', '1982/06/30', 'Plaza 789, Ciudad E', 'laura123@email.com', '999-888-7777'),
	('Carlos', 'P�rez', 'G�mez', '1994/08/18', 'Ronda 012, Ciudad F', 'carlos@email.com', '944-555-2236'),
	('Sof�a', 'Gonz�lez', 'Guti�rrez', '1993/02/14', 'Bulevar 345, Ciudad G', 'sofia@email.com', '123-222-1111'),
	('Diego', 'Rodr�guez', 'G�mez', '1998/09/29', 'Avenida 678, Ciudad H', 'diego@email.com', '222-333-3244'),
	('Ana', 'Mart�nez', 'L�pez', '1993/05/11', 'Callej�n 901, Ciudad I', 'ana@email.com', '966-555-1544'),
	('Javier', 'G�mez', 'Hern�ndez', '1980/12/04', 'Plaza 234, Ciudad J', 'javier@email.com', '777-666-5555'),
	('Elena', 'Guti�rrez', 'P�rez', '1994/10/26', 'Bulevar 567, Ciudad K', 'elen12a@email.com', '988-999-0110'),
	('Miguel', 'Hern�ndez', 'Gonz�lez', '1998/07/19', 'Ronda 890, Ciudad L', 'miguel@email.com', '999-000-1111'),
	('Luis', 'G�mez', 'Mart�nez', '2000/04/02', 'Calle 123, Ciudad M', 'luisAQ@email.com', '900-411-2222'),
	('Luc�a', 'P�rez', 'G�mez', '2003/01/15', 'Avenida 456, Ciudad N', 'lucia@email.com', '911-222-9933'),
	('Pablo', 'Rodr�guez', 'Mart�nez', '2000/06/28', 'Plaza 789, Ciudad O', 'pabloITO@email.com', '922-333-4754'),
	('Laura', 'L�pez', 'Hern�ndez', '1976/03/10', 'Bulevar 012, Ciudad P', 'ABClaura@email.com', '933-444-5555'),
	('Santiago', 'G�mez', 'P�rez', '1982/08/23', 'Callej�n 345, Ciudad Q', 'santiagoZZ@email.com', '944-555-6606');


CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    PersonaID INT FOREIGN KEY REFERENCES Personas(PersonaID),
    Usuario NVARCHAR(50) NOT NULL,
    Contrasenia NVARCHAR(128) NOT NULL,
    FechaRegistro DATETIME NOT NULL,
);


select * from Usuarios;

ALTER TABLE Usuarios

ADD Estado NVARCHAR(10);

INSERT INTO Usuarios(PersonaID,Usuario,Contrasenia,FechaRegistro,Estado)
VALUES
	--(1,'Brayam','123Brayam','2023/10/06','ACTIVO'),
	(2,'Garcia','Anaaa','2023/10/06','ACTIVO'),
	(3,'123Carlos','CarlosLopez','2023/10/06','ACTIVO'),
	(4,'Laurita','LauraRodriguezm','2023/10/06','INACTIVO'),
	(5,'PEDROO','Pedrito12','2023/12/06','ACTIVO'),
	(6,'MARI123','mARIAlO','2023/10/26','ACTIVO'),
	(7,'jUAN12@','Juantito','2023/10/16','ACTIVO'),
	(8,'Laura@asd','LauarHernandez','2022/10/06','INACTIVO');


select * from Usuarios;

CREATE VIEW PersonaReporte1 as
SELECT Nombre,
	ApellidoPaterno,
	ApellidoMaterno,
	FechaNacimiento,
	Direccion,
	Email,
	dbo.NombresApellidoss(PersonaID) as NombresApellidoss,
	dbo.HallarEdad(PersonaID) as HallarEdad
	FROM Personas;

SELECT * FROM PersonaReporte1;

CREATE VIEW VistaUsuariosPersonasQa AS
SELECT 
       P.Nombre, 
       P.ApellidoPaterno, 
       P.ApellidoMaterno, 
       P.FechaNacimiento, 
       P.Direccion, 
       P.Email, 
       P.Telefono,
	   U.UsuarioID, 
       U.PersonaID, 
       U.Usuario, 
       U.Contrasenia, 
       U.FechaRegistro, 
       U.Estado
FROM Personas P
INNER JOIN Usuarios U ON U.PersonaID = P.PersonaID;

SELECT *
FROM VistaUsuariosPersonasQa;






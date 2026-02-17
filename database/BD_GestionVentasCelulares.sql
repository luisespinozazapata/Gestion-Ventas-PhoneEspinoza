-- Crear la base de datos
CREATE DATABASE BD_Sistema
  CHARACTER SET utf8mb4  
  COLLATE utf8mb4_general_ci;

-- Usar la base de datos recién creada
USE BD_Sistema;

------------------------------------------------------------
-- Crear tabla Categoria
------------------------------------------------------------


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200)
);
-- TABLA CELULAR
CREATE TABLE celular (
    id_celular INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(120) NOT NULL,
    marca VARCHAR(80) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE Modelo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);


------------------------------------------------------------
-- Crear tabla Producto (modificada para FK)
------------------------------------------------------------
CREATE TABLE Rol (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

----------------------------------------------------
-- 4. CREAR TABLA USUARIO
----------------------------------------------------
CREATE TABLE Usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    ClaveHash VARCHAR(64) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    FechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

----------------------------------------------------
-- 5. TABLA INTERMEDIA USUARIOROL (Muchos a Muchos)
----------------------------------------------------
CREATE TABLE UsuarioRol (
    UsuarioID INT NOT NULL,
    RolID INT NOT NULL,
    PRIMARY KEY (UsuarioID, RolID),

    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY (RolID) REFERENCES Rol(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


----------------------------------------------------
-- 1. INSERTAR CATEGORÍA


CREATE TABLE ventas (
  codigo INT AUTO_INCREMENT PRIMARY KEY,
  solicitante VARCHAR(100) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  cantidad_equipos INT NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  marca VARCHAR(100) NOT NULL,
  CONSTRAINT chk_cantidad_equipos CHECK (cantidad_equipos > 0)
) ENGINE=InnoDB;
CREATE TABLE Solicitante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    ModeloID INT NOT NULL,
    Pagos DECIMAL(10,2) NOT NULL,
    Pendiente DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ID)
);
-- 3. INSERTAR USUARIOS
----------------------------------------------------
INSERT INTO Usuario (Nombre, ClaveHash, Email)
VALUES
('Luis', SHA2('Admin123', 256), 'admin@empresa.com'),
('Juan',  SHA2('Juan2025', 256), 'juan@empresa.com'),
('Maria', SHA2('Maria2025', 256), 'maria@empresa.com');

----------------------------------------------------
-- 4. INSERTAR ROLES
----------------------------------------------------
INSERT INTO Rol (Nombre) VALUES
('Administrador'),
('Vendedor'),
('Inventario');	
----------------------------------------------------
-- 5. INSERTAR USUARIO_ROL
----------------------------------------------------
INSERT INTO UsuarioRol (UsuarioID, RolID)
VALUES
(1, 1),  -- admin -> Administrador
(1, 2),  -- Luis -> Vendedor
(1, 3),  -- Luis -> inventario
(2, 2),  -- juan -> Vendedor
(3, 3);  -- maria -> Inventario



INSERT INTO Modelo (Nombre) VALUES
('Xiaomi Pro X45'),
('Nokia Mix 34'),
('Samsung Galaxy SPro');


INSERT INTO ventas (solicitante, fecha, hora, cantidad_equipos,categoria,modelo,marca) VALUES
('Elena Ríos',     '2025-12-02', '09:00:00', 1,'Gama Alta','Iphone Pro','Apple'),
('Marco Vidal',    '2025-12-02', '14:30:00', 3,'Gama Baja','Galaxy S20','Samsung'),
('Lucía Herrera',  '2025-12-03', '10:15:00', 2,'Gama Media','Xiaomi G45 Pro','Xiaomi'),
('Pedro Salas',    '2025-12-03', '16:45:00', 4,'Gama Alta','Iphone Pro','Apple'),
('Nora Campos',    '2025-12-04', '11:20:00', 1,'Gama Media','Xiaomi Redmi 1x Pro','Xiaomi');


------------------------------------------------------------
-- Insertar datos en Categoria (coinciden con los datos originales)
------------------------------------------------------------

INSERT INTO categoria (nombre, descripcion) VALUES
('Gama Alta', 'Equipos premium'),
('Gama Media', 'Rendimiento equilibrado'),
('Gama Baja', 'Económicos'),
('Gaming', 'Diseñados para juegos'),
('Compactos', 'Equipos pequeños'),
('Fotografía', 'Enfocados en cámara y fotos'),
('Resistentes', 'Equipos robustos y duraderos'),
('5G', 'Compatibles con redes 5G'),
('Batería Prolongada', 'Equipos con gran autonomía'),
('Estilo y Diseño', 'Diseño elegante y moderno');


-- INSERTAR DATOS A LA TABLA CELULARES
INSERT INTO celular (modelo, marca, precio, stock, id_categoria) VALUES
('Galaxy S23 Ultra', 'Samsung', 4500.00, 10, 1),
('iPhone 15 Pro', 'Apple', 5200.00, 8, 1),
('Xiaomi 13T', 'Xiaomi', 2100.00, 20, 2),
('Moto G54', 'Motorola', 899.00, 15, 2),
('Samsung A14', 'Samsung', 650.00, 25, 3),
('Redmi 12C', 'Xiaomi', 480.00, 30, 3),
('ROG Phone 7', 'Asus', 3800.00, 5, 4),
('POCO F5', 'Xiaomi', 1650.00, 12, 4),
('iPhone SE 2022', 'Apple', 1800.00, 7, 5),
('Galaxy Z Fold5', 'Samsung', 7000.00, 3, 1),
('Pixel 8 Pro', 'Google', 4100.00, 6, 1),
('Moto Edge 40', 'Motorola', 1300.00, 10, 2),
('Redmi Note 13', 'Xiaomi', 900.00, 20, 2),
('Nokia G400', 'Nokia', 550.00, 15, 3),
('Samsung M14', 'Samsung', 620.00, 18, 3),
('Asus Zenfone 10', 'Asus', 2200.00, 8, 4),
('Black Shark 6', 'Xiaomi', 2500.00, 7, 4),
('iPhone 14', 'Apple', 4200.00, 9, 1),
('Galaxy A54', 'Samsung', 1600.00, 12, 2),
('Xiaomi Poco X5', 'Xiaomi', 1200.00, 15, 2);



------------------------------------------------------------
-- Insertar datos en Producto
-- Se reemplaza el nombre por el ID correspondiente


INSERT INTO Solicitante (Nombre, ModeloID,Pagos, Pendiente) VALUES
('Elena Rios', 1,1500.99, 500.00),
('Nora Campos', 1,3900.99, 3500.99),
('Marco Vidal', 2,5900.99, 2500.90),
('Julio Salas', 3,8009.99, 1500.98),
('Lucia Herrera', 3,1200.99, 4011.11),
('Jeferson Montes', 1,1300.00, 3000.11),
('Adrian Alvarado', 1,2200.50, 6011.22),
('Jeremy Perez', 2, 4500.00, 1023.34),
('Jorge Basadre', 2,1800.99, 800.00),
('Juan Gutierrez', 3,1899.99, 81.00);
-------------------------------------------------------
-- Stored Procedure: Buscar Categoría por ID
------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE BuscarCelularPorMarca(IN p_marca VARCHAR(50))
BEGIN
    SELECT
        c.id_celular,
        c.modelo,
        c.marca,
        c.precio,
        c.stock,
        c.id_categoria
    FROM celular c
    WHERE c.marca LIKE CONCAT('%', p_marca, '%');
END$$

DELIMITER ;
-----------------------------------------------------
-- Stored Procedure: Buscar celulares por categorias
------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE BuscarCelularPorCategoria(IN p_idCategoria INT)
BEGIN
    SELECT c.id_celular, c.modelo, c.marca, c.precio, c.stock
    FROM celular c
    WHERE c.id_categoria = p_idCategoria;
END $$

DELIMITER ;





------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE SP_BuscarSolicitantePorID(IN dID INT)
BEGIN
    SELECT 
        D.ID,
        D.Nombre,
        D.ModeloID,
        C.Nombre AS ModeloNombre,
        D.Pagos,
        D.Pendiente
    FROM Solicitante D
    INNER JOIN Modelo C ON D.ModeloID = C.ID
    WHERE D.ID = dID;
END $$
DELIMITER ;

CALL SP_BuscarSolicitantePorID(5);

------------------------------------------------------------
-- Stored Procedure: Buscar Categoría por Descripción
------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE BuscarSolicitantePorNombre(IN dNombre VARCHAR(255))
BEGIN
    SELECT 
        D.ID,
        D.Nombre,
        D.ModeloID,
        C.Nombre AS ModeloNombre,
        D.Pagos,
        D.Pendiente
    FROM Solicitante D
    INNER JOIN Modelo C ON D.ModeloID = C.ID
    WHERE D.Nombre LIKE CONCAT('%', dNombre, '%');
END $$
DELIMITER ;

CALL BuscarSolicitantePorNombre(' ');


DELIMITER $$

CREATE PROCEDURE SP_ValidarUsuario(
    IN pNombre VARCHAR(150),
    IN pClave VARCHAR(100)
)
BEGIN
    DECLARE vClaveHash VARCHAR(64);

    -- Generar hash SHA2-256 de la clave ingresada
    SET vClaveHash = SHA2(pClave, 256);

    -- Validar si existe el usuario con la clave correcta
    IF EXISTS (SELECT 1 FROM Usuario 
               WHERE Nombre = pNombre AND ClaveHash = vClaveHash) THEN
        -- Retornar datos del usuario y sus roles
        SELECT 
            U.ID,
            U.Nombre,
            U.Email,
            R.ID AS RolID,
            R.Nombre AS RolNombre
        FROM Usuario U
        INNER JOIN UsuarioRol UR ON U.ID = UR.UsuarioID
        INNER JOIN Rol R ON UR.RolID = R.ID
        WHERE U.Nombre = pNombre
        ORDER BY R.Nombre;
    END IF;

END$$

DELIMITER ;

CALL SP_ValidarUsuario('Luis', 'Admin123');
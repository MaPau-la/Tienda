CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

CREATE TABLE t_usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    email VARCHAR(200),
    password VARCHAR(200),
    rol INT(11),
    imagen VARCHAR(255),
    PRIMARY KEY (id_usuario)
);

CREATE TABLE t_categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id_categoria)
);

CREATE TABLE t_productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    id_categoria INT(11),
    nombre VARCHAR(100),
    precio FLOAT(100,2),
    stock INT(10),
    oferta VARCHAR(20),
    fecha DATE,
    imagen VARCHAR(255),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES t_categorias(id_categoria)
);

CREATE TABLE t_pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    ciudad VARCHAR(100),
    direccion VARCHAR(200),
    costo FLOAT(100,2),
    estado VARCHAR(20),
    fecha DATE,
    hora TIME,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_usuario) REFERENCES t_usuarios(id_usuario)
);

CREATE TABLE t_lineapedidos (
    id_lineapedido INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT(11),
    unidades INT(10),
    PRIMARY KEY (id_lineapedido),
    FOREIGN KEY (id_pedido) REFERENCES t_pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES t_productos(id_producto)
);


INSERT INTO t_categorias (nombre) VALUES 
('Electrónica'),
('Ropa'),
('Hogar'),
('Deportes');

INSERT INTO t_usuarios (nombre, apellidos, email, password, rol, imagen) VALUES 
('Juan', 'Pérez López', 'juan@example.com', 'password123', 0, 'default.jpg'),
('María', 'González Ruiz', 'maria@example.com', 'password456', 0, 'default.jpg'),
('Admin', 'Sistema', 'admin@system.com', 'admin123', 1, 'admin.jpg');

INSERT INTO t_productos (id_categoria, nombre, precio, stock, oferta, fecha, imagen) VALUES 
(1, 'Smartphone XYZ', 299.99, 50, '10%', '2025-05-01', 'smartphone.jpg'),
(1, 'Laptop ABC', 899.99, 20, NULL, '2025-05-01', 'laptop.jpg'),
(2, 'Camiseta casual', 19.99, 100, '20%', '2025-05-01', 'camiseta.jpg'),
(3, 'Lámpara de mesa', 39.99, 30, NULL, '2025-05-01', 'lampara.jpg'),
(4, 'Balón de fútbol', 29.99, 45, '15%', '2025-05-01', 'balon.jpg');

INSERT INTO t_pedidos (id_usuario, ciudad, direccion, costo, estado, fecha, hora) VALUES 
(1, 'Madrid', 'Calle Principal 123', 339.98, 'Entregado', '2025-05-02', '14:30:00'),
(2, 'Barcelona', 'Avenida Central 456', 59.98, 'En proceso', '2025-05-03', '10:15:00');

INSERT INTO t_lineapedidos (id_pedido, id_producto, unidades) VALUES 
(1, 1, 1),  
(1, 4, 1),  
(2, 3, 2), 
(2, 5, 1);
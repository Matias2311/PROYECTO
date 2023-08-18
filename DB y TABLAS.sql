CREATE DATABASE Marketplace;
USE Marketplace;
CREATE TABLE comprador (
  id_comprador INT PRIMARY KEY AUTO_INCREMENT, 
  telefono VARCHAR(32), 
  nombre_completo VARCHAR(32), 
  email VARCHAR(32), 
  estado_de_linea VARCHAR(32), 
  reputacion VARCHAR(32)
);
CREATE TABLE vendedor (
  id_vendedor INT PRIMARY KEY, 
  telefono VARCHAR(32), 
  nombre_completo VARCHAR(32), 
  email VARCHAR(32), 
  estado_de_linea VARCHAR(32), 
  reputacion VARCHAR(32)
);
CREATE TABLE producto (
  nombre VARCHAR(100), 
  id_producto INT PRIMARY KEY, 
  -- AUTO_INCREMENT,
  estado VARCHAR(32), 
  descripcion VARCHAR(200), 
  categoria VARCHAR(32)
);
CREATE TABLE orden (
  id_orden INT PRIMARY KEY, 
  precio INT, 
  cantidad FLOAT, 
  id_comprador INT, 
  id_vendedor INT, 
  id_producto INT, 
  FOREIGN KEY (id_comprador) REFERENCES comprador(id_comprador), 
  FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor), 
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE direccion (
  id_direccion INT PRIMARY KEY AUTO_INCREMENT,
  calle VARCHAR(32),
  numero VARCHAR(10),
  ciudad VARCHAR(32),
  pais VARCHAR(32)
);
CREATE TABLE carrito (
  id_carrito INT PRIMARY KEY AUTO_INCREMENT,
  id_comprador INT,
  FOREIGN KEY (id_comprador) REFERENCES comprador(id_comprador)
);
CREATE TABLE producto_carrito (
  id_producto_carrito INT PRIMARY KEY AUTO_INCREMENT,
  id_carrito INT,
  id_producto INT,
  cantidad INT,
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
CREATE TABLE transaccion (
  id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
  id_orden INT,
  fecha_transaccion DATETIME,
  monto_total DECIMAL(10, 2),
  FOREIGN KEY (id_orden) REFERENCES orden(id_orden)
);
CREATE TABLE mensaje (
  id_mensaje INT PRIMARY KEY AUTO_INCREMENT,
  id_emisor INT,
  id_receptor INT,
  contenido VARCHAR(200),
  fecha_envio DATETIME,
  FOREIGN KEY (id_emisor) REFERENCES comprador(id_comprador),
  FOREIGN KEY (id_receptor) REFERENCES vendedor(id_vendedor)
);
CREATE TABLE factura (
  id_factura INT PRIMARY KEY AUTO_INCREMENT,
  id_transaccion INT,
  fecha_emision DATETIME,
  monto_total DECIMAL(10, 2),
  FOREIGN KEY (id_transaccion) REFERENCES transaccion(id_transaccion)
);
CREATE TABLE envio (
  id_envio INT PRIMARY KEY AUTO_INCREMENT,
  id_transaccion INT,
  id_direccion INT,
  estado_envio VARCHAR(50),
  fecha_envio DATETIME,
  FOREIGN KEY (id_transaccion) REFERENCES transaccion(id_transaccion),
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);
CREATE TABLE pago (
  id_pago INT PRIMARY KEY AUTO_INCREMENT,
  id_transaccion INT,
  metodo_pago VARCHAR(50),
  monto_pagado DECIMAL(10, 2),
  fecha_pago DATETIME,
  FOREIGN KEY (id_transaccion) REFERENCES transaccion(id_transaccion)
);
CREATE TABLE reporte (
  id_reporte INT PRIMARY KEY AUTO_INCREMENT,
  id_comprador INT,
  id_vendedor INT,
  contenido_reporte VARCHAR(200),
  fecha_reporte DATETIME,
  FOREIGN KEY (id_comprador) REFERENCES comprador(id_comprador),
  FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
CREATE TABLE devolucion (
  id_devolucion INT PRIMARY KEY AUTO_INCREMENT,
  id_transaccion INT,
  motivo_devolucion VARCHAR(200),
  fecha_devolucion DATETIME,
  FOREIGN KEY (id_transaccion) REFERENCES transaccion(id_transaccion)
);
CREATE TABLE notificacion (
  id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  mensaje VARCHAR(200),
  fecha_envio DATETIME,
  leida BOOLEAN,
  FOREIGN KEY (id_usuario) REFERENCES comprador(id_comprador)
);
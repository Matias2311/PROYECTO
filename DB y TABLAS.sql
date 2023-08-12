create database Marketplace;
use Marketplace;
create table comprador(
  id_comprador INT PRIMARY KEY AUTO_INCREMENT, 
  telefono VARCHAR(32), 
  nombre_completo VARCHAR (32), 
  email VARCHAR(32), 
  estado_de_linea VARCHAR(32), 
  reputacion VARCHAR (32)
);
CREATE TABLE vendedor (
  id_vendedor INT PRIMARY KEY, 
  telefono VARCHAR(32), 
  nombre_completo VARCHAR(32), 
  email VARCHAR(32), 
  estado_de_linea VARCHAR(32), 
  reputacion VARCHAR(32)
);
create table producto(
  nombre VARCHAR(100), 
  id_producto INT PRIMARY KEY, 
  -- AUTO_INCREMENT,
  estado VARCHAR(32), 
  descripcion VARCHAR(100), 
  categoria VARCHAR(32)
);
create table orden(
  id_orden INT PRIMARY KEY, 
  precio INT, 
  cantidad FLOAT, 
  id_comprador INT, 
  id_vendedor INT, 
  id_producto INT, 
  FOREIGN KEY(id_comprador) REFERENCES comprador(id_comprador), 
  FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor), 
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

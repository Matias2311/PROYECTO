CREATE VIEW producto_mas_vendido AS 
SELECT 
  p.id_producto, 
  p.nombre AS nombre_producto, 
  SUM(o.cantidad) AS total_vendido 
FROM 
  producto p 
  INNER JOIN orden o ON p.id_producto = o.id_producto 
GROUP BY 
  p.id_producto, 
  p.nombre 
ORDER BY 
  total_vendido DESC 
LIMIT 
  1;
/*la primera vista cumple el proposito de ver cual es de todos los productos aquel que tiene mayor ventas*/
CREATE VIEW detalles_ventas AS 
SELECT 
  p.id_producto, 
  p.nombre AS nombre_producto, 
  v.id_vendedor, 
  v.nombre_completo AS nombre_vendedor, 
  c.id_comprador, 
  c.nombre_completo AS nombre_comprador 
FROM 
  producto p 
  INNER JOIN orden o ON p.id_producto = o.id_producto 
  INNER JOIN vendedor v ON o.id_vendedor = v.id_vendedor 
  INNER JOIN comprador c ON o.id_comprador = c.id_comprador;
/*esta vista cumple el objetivo de mostrar los detalles de la ventas, teniendo los datos de los vendedores,compradores y productos*/
CREATE VIEW compras_por_categoria AS 
SELECT 
  p.categoria, 
  SUM(o.cantidad) AS total_compras 
FROM 
  producto p 
  INNER JOIN orden o ON p.id_producto = o.id_producto 
GROUP BY 
  p.categoria;
/*permite ver la cantidad de compras de cada producto segun su categoria correspondiente*/
CREATE VIEW comprador_con_mas_compras AS 
SELECT 
  c.id_comprador, 
  c.nombre_completo AS nombre_comprador, 
  COUNT(o.id_orden) AS total_compras 
FROM 
  comprador c 
  INNER JOIN orden o ON c.id_comprador = o.id_comprador 
GROUP BY 
  c.id_comprador, 
  c.nombre_completo 
ORDER BY 
  total_compras DESC 
LIMIT 
  1;
/*muestra cual es el comprador que ha realizado el mayor numero de compras*/
CREATE VIEW vendedor_con_mas_ventas AS 
SELECT 
  v.id_vendedor, 
  v.nombre_completo AS nombre_vendedor, 
  COUNT(o.id_orden) AS total_ventas 
FROM 
  vendedor v 
  INNER JOIN orden o ON v.id_vendedor = o.id_vendedor 
GROUP BY 
  v.id_vendedor, 
  v.nombre_completo 
ORDER BY 
  total_ventas DESC 
LIMIT 
  1;
/*la ultima vista permite ver cual es el vendedor que ha realizado mas ventas*/
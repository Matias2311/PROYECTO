DELIMITER //
CREATE FUNCTION total_de_usuarios()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE total_compradores INT;
DECLARE total_vendedores INT;
SELECT COUNT(*) INTO total_compradores FROM comprador;
SELECT COUNT(*) INTO total_vendedores FROM vendedor;
RETURN total_compradores + total_vendedores;
END//
DELIMITER ;
/*permite calcular el total de usuarios que hay*/
DELIMITER //
CREATE FUNCTION producto_mas_vendido_por_vendedor(vendedor_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
 DECLARE producto_nombre VARCHAR(100);
 SELECT p.nombre INTO producto_nombre
 FROM producto p
 INNER JOIN (
  SELECT id_producto, SUM(cantidad) as total_vendido
  FROM orden
  WHERE id_vendedor = vendedor_id
  GROUP BY id_producto
  ORDER BY total_vendido DESC
  LIMIT 1
 ) o ON p.id_producto = o.id_producto;
 RETURN producto_nombre;
END //
DELIMITER ;
/*calcula cual es el producto mas vendido de cada vendedor*/
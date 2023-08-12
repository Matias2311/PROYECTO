DELIMITER //CREATE TRIGGER actualiza_reputacion_vendedor after
INSERT
ON orden FOR each row BEGINDECLARE total_facturacion INT;SELECT Sum(precio * cantidad)
INTO   total_facturacion
FROM   orden
WHERE  id_vendedor = new.id_vendedor;UPDATE vendedor
SET    reputacion =
       CASE
              WHEN total_facturacion > 10000 THEN 'muy buena'
              WHEN total_facturacion > 5000 THEN 'buena'
              ELSE 'regular'
       END
WHERE  id_vendedor = new.id_vendedor;END //
delimiter ;
/*el primer trigger permite actualizar la reputacion del vendedor tras una venta exitosa*/
DELIMITER //CREATE TRIGGER verificar_stock_antes_de_ordenar after
INSERT
ON orden FOR each row BEGINDECLARE stock_actual FLOAT;SELECT cantidad
INTO   stock_actual
FROM   producto
WHERE  id_producto = new.id_producto;IF stock_actual < new.cantidad then
signal sqlstate '45000'
SET message_text = 'No hay suficiente stock disponible';
else
UPDATE producto
SET    cantidad = cantidad - new.cantidad
WHERE  id_producto = new.id_producto;ENDIF;END //
delimiter ;
/*el segundo trigger permite verificar el stock antes de ordenar el producto deseado*/

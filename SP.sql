DELIMITER // CREATE PROCEDURE ActualizarReputacionComprador(IN comprador_id INT) BEGIN DECLARE total_compras INT;
-- Calcular el total de compras del comprador
SELECT 
  COUNT(*) INTO total_compras 
FROM 
  orden 
WHERE 
  id_comprador = comprador_id;
-- Actualizar la reputación del comprador
UPDATE 
  comprador 
SET 
  reputacion = CASE WHEN total_compras > 10 THEN 'excelente' WHEN total_compras > 5 THEN 'buena' ELSE 'regular' END 
WHERE 
  id_comprador = comprador_id;
SELECT 
  CONCAT(
    'La reputación del comprador ', 
    comprador_id, ' ha sido actualizada.'
  ) AS mensaje;
END;
// DELIMITER;
/*permite actualizar la reputacion del comprador tras una compra exitos*/
DELIMITER // 
CREATE PROCEDURE OrdenarProductosPorFacturacion (
  IN orden_ordenamiento VARCHAR(10)
) BEGIN 
SET 
  @query = CONCAT (
    'SELECT p.*, (o.cantidad * o.precio) AS facturacion 
                        FROM producto p
                        INNER JOIN orden o ON p.id_producto = o.id_producto 
                        ORDER BY facturacion ', 
    orden_ordenamiento, ';'
  );
PREPARE stmt 
FROM 
  @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END;
delimiter;
/*permite ordenar los productos por facturacion una vez terminada la compra*/


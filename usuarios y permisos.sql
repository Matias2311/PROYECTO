CREATE user 'verificador' identified BY 'marketadmin';
GRANT 
SELECT 
  ON marketplace.* TO 'verificador';
/*con el grant select, el usuario verificador tendra permisos de lectura de todas las tablas*/
CREATE user 'moderador' identified BY 'marketedit';
GRANT 
SELECT 
  , 
  INSERT, 
UPDATE 
  ON Marketplace.* TO 'moderador';
/*el grant select,insert y update que posee el usuario moderador podra leer,insertar datos y actualizar los mismos*/
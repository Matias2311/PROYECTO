INSERT INTO comprador (
  id_comprador, telefono, nombre_completo, 
  email, estado_de_linea, reputacion
) 
VALUES 
  (
    NULL, '1145678901', 'Sergio Oscar Godoy', 
    'SergioGodoy14@gmail.com', 'activo cada seis horas', 
    'buena'
  ), 
  (
    NULL, '1185377955', 'Javier Nicolas Ramirez', 
    'JaviiiR230@gmail.com', 'activo cada tres horas', 
    'muy buena'
  ), 
  (
    NULL, '1191882340', 'Manuela Sofia Fernandez', 
    'SofiaFer02@gmail.com', 'activo cada doce horas', 
    'neutral'
  );
INSERT INTO vendedor (
  id_vendedor, telefono, nombre_completo, 
  email, estado_de_linea, reputacion
) 
VALUES 
  (
    1, '1190872344', 'Rocio Sanchez', 
    'RocioSanchezz@gmail.com', 'activo cada dos horas', 
    'excelente'
  ), 
  (
    2, '1147659102', 'Braian Franco Juarez', 
    'Juarez9970@gmail.com', 'activo cada dos dias', 
    'mala'
  ), 
  (
    3, '1150289423', 'Florencia Yessica Lopez', 
    'FlorYesii@gmail.com', 'activo cada tres dias', 
    'buena'
  );
INSERT INTO producto (
  nombre, id_producto, estado, descripcion, 
  categoria
) 
VALUES 
  (
    'Shampoo anticaspa 3en1', 1, 'nuevo', 
    'Shampoo de reconocida marca para la higiene masculina', 
    'Belleza y cuidados'
  ), 
  (
    'Mueble usado de pino', 2, 'poco uso', 
    'mueble de pino impecable,lo estoy vendiendo por mudanza', 
    'armarios y muebles'
  ), 
  (
    'Guitara criolla a estrenar', 3, 
    'nuevo', 'Guitarra criolla nueva de la marca Pirulo incluye tres puas', 
    'Instrumentos'
  );
INSERT INTO orden (
  id_orden, precio, cantidad, id_comprador, 
  id_vendedor, id_producto
) 
VALUES 
  (1, '1000', '1', 1, 1, 1), 
  (2, '9000', '1', 2, 2, 2), 
  (3, '12000', '1', 3, 3, 3);
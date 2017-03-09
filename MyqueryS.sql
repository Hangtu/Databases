-- Seleccionar todos los que no estan en una tabla 
SELECT * FROM usuario WHERE ID NOT IN(SELECT f_user FROM user_and_band )

-- Seleccionar un FK con un ID Repetido 
Select dato1, dato2, count(*)
from table 
group by dato1, dato2
having count(*) > 1
ORDER BY folio

-- DISTINC: SELECT DISTINCT statement is used to return only distinct (different) values. 
SELECT DISTINCT id_cliente FROM cat_localidad WHERE id_cliente = 2;

--
SELECT a.id_cliente, count(a.id_cliente) as conteo FROM (SELECT id_cliente, id_localidad, localidad FROM cat_localidad) a
GROUP BY a.id_cliente
--HAVING count (a.id_cliente) > 30
ORDER BY a.id_cliente ASC;

--DATE 2007-03-08
SELECT CURRENT_DATE 

--MULTIPLE SELECT
SELECT tabla.*, l.localidad, l.id_cliente FROM (
 SELECT tabla_salida_almacen.id_pedido, tabla_salida_almacen.fecha_captura fecha_salida  , tabla_salida_almacen.cantidad_salida ,   tabla_salida_almacen.no_codigos no_codigos_salida  ,
 tabla_entrada_embarques.fecha_captura fecha_entrada, tabla_entrada_embarques.cantidad_entrada cantidad_entrada, tabla_entrada_embarques.no_codigos no_codigos_entrada
 FROM inv_pedido_emb_entrada ent_emb
 INNER JOIN (
  SELECT s.id_pedido, s.fecha_captura, sum(cantidad) cantidad_salida, COUNT(DISTINCT(s.codigo_barras)) no_codigos, sum(cantidad_entrada) cantidad_entrada_salida
  FROM   inv_salida s
  INNER JOIN inv_almacen al ON
  al.id_almacen  = s.id_almacen
  AND al.id_localidad    = s.id_localidad
  AND al.id_tipo_almacen = 1
  WHERE  s.id_localidad = $id_localidad_matriz
  AND    s.id_pedido NOTNULL
  AND    s.id_devolucion ISNULL
  AND    s.folio_salida ISNULL 
  AND    s.fecha_captura > '2010-06-01 00:00:00'                                                                   
  GROUP BY s.id_pedido, s.fecha_captura) tabla_salida_almacen ON    tabla_salida_almacen.id_pedido = ent_emb.id_pedido
 AND 	tabla_salida_almacen.fecha_captura = ent_emb.fecha_captura
 AND     tabla_salida_almacen.cantidad_entrada_salida <> tabla_salida_almacen.cantidad_salida

 INNER JOIN (
  SELECT ent.id_pedido, ent.fecha_captura,  sum(cantidad) cantidad_entrada,  COUNT(DISTINCT(ent.codigo_barras)) no_codigos
  FROM   inv_entrada ent

  INNER JOIN inv_ubicacion ubic_emb ON
  ubic_emb.id_ubicacion = ent.id_ubicacion
  AND   ubic_emb.estatus = 1
  INNER JOIN inv_almacen al ON
  al.id_almacen      = ubic_emb.id_almacen
  AND al.id_localidad    = ent.id_localidad
  AND al.id_tipo_almacen = 2
  WHERE  ent.id_localidad = $id_localidad_matriz
  AND    ent.id_pedido NOTNULL
  GROUP BY ent.id_pedido, ent.fecha_captura) tabla_entrada_embarques ON tabla_entrada_embarques.id_pedido = ent_emb.id_pedido
 AND 	tabla_entrada_embarques.fecha_captura = ent_emb.fecha_embarcado
 ) tabla                                            
INNER JOIN inv_pedido p ON
p.id_pedido = tabla.id_pedido
INNER JOIN cat_localidad l ON
l.id_localidad  = p.id_localidad
WHERE tabla.cantidad_salida > tabla.cantidad_entrada 
ORDER BY id_pedido, fecha_salida;

--NOT EQUAL
SELECT count(sufijo_test) as cantidad FROM test_receta_respaldo WHERE id_localidad = '1648'
AND sufijo_test <> '';


--STRING CONCAT
  SELECT 
  u.id_usuario, u.usuario, u.nombre, u.paterno, u.materno, u.estatus, u.id_tipo, u.password,u.correo_electronico,u.correo_electronico_abisa,u.correo_electronico_quiropractico ,t.descripcion
  FROM adm_usuario u 
  INNER JOIN adm_tipo t ON u.id_tipo = t.id_tipo
  WHERE (u.nombre||' '||u.paterno||' '||u.materno) ILIKE (?) OR u.usuario ILIKE (?) LIMIT 30"




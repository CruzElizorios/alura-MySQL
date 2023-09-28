
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO 
FROM tabla_de_productos group by ENVASE;
/*una view es una tabla q se crea a partir de una seleccion de daots anteriores, click derecho sobre view-create una view y 
debemos tener copiado la seleccion que queremos para crearla
*/
SELECT X.ENVASE, X.PRECIO_MAXIMO FROM
vw_envases_grandes X WHERE PRECIO_MAXIMO >=10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
((A.PRECIO_DE_LISTA/B.PRECIO_MAXIMO)-1)*100 AS VARIACION_PORCENTAJE FROM tabla_de_productos A
INNER JOIN vw_envases_grandes B ON A.ENVASE = B.ENVASE;


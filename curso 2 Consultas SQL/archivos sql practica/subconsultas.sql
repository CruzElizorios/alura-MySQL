SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT * FROM tabla_de_clientes WHERE BARRIO IN ('Condesa','Del Valle','Contadero','Oblatos');
-- se puede hacer consultas dentro de otra consulta;
SELECT * FROM tabla_de_clientes WHERE BARRIO IN (SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO 
FROM tabla_de_productos group by ENVASE;
/* ahora de la query anterior se forma una tabla con tres filas poniendo el precio de cada
producto, con esto puedo formar una nueva query para crear otra tabla*/

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM (SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO 
FROM tabla_de_productos group by ENVASE) X
WHERE X.PRECIO_MAXIMO >=10;

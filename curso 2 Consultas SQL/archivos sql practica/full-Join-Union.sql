SELECT distinct BARRIO FROM tabla_de_vendedores;

SELECT distinct BARRIO FROM tabla_de_clientes;

SELECT distinct BARRIO FROM tabla_de_vendedores
UNION
SELECT distinct BARRIO FROM tabla_de_clientes;

SELECT distinct BARRIO FROM tabla_de_vendedores
UNION ALL
SELECT distinct BARRIO FROM tabla_de_clientes;

SELECT distinct BARRIO, NOMBRE, 'Cliente' AS TIPO_CLIENTE, DNI FROM tabla_de_clientes
UNION
SELECT distinct BARRIO, NOMBRE, 'Vendedor' AS TIPO_VENDEDOR, MATRICULA FROM tabla_de_vendedores;

SELECT A.NOMBRE,A.CIUDAD,A.BARRIO, B.NOMBRE FROM tabla_de_clientes A 
LEFT JOIN
tabla_de_vendedores B
ON A.BARRIO = B.BARRIO
UNION
SELECT  A.NOMBRE,A.CIUDAD, A.BARRIO,B.NOMBRE FROM tabla_de_clientes A 
RIGHT JOIN
tabla_de_vendedores B
ON A.BARRIO = B.BARRIO;
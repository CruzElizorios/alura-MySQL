SELECT P.SABOR, IFa.CANTIDAD, F.FECHA_VENTA FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO;

/* CANTIDAD VENDIDA POR SABOR AÑO 2016*/
SELECT P.SABOR, SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY P.SABOR, YEAR(F.FECHA_VENTA)
ORDER BY SUM(IFa.CANTIDAD) DESC ;

/* CANTIDAD TOTAL VENDIDA POR AÑO EN ESTE CASO 2016*/
SELECT SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(F.FECHA_VENTA);

/*CANTIDAD VENDIDA EN EL AÑO SEGUN CADA SABOR CON RESPECTO A LA CANTIDAD TOTAL VENDIDA*/
SELECT * FROM(
SELECT P.SABOR, SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY P.SABOR, YEAR(F.FECHA_VENTA)
ORDER BY SUM(IFa.CANTIDAD) DESC ) AS VENTA_SABOR
INNER JOIN
(SELECT SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(F.FECHA_VENTA)) AS VENTA_TOTAL
ON VENTA_TOTAL.AÑO = VENTA_SABOR.AÑO;

/*PORCENTAJE DE JUGO VENDIDO CON RESPECTO A LA CANTIDAD TOTAL VENDIDA*/
SELECT VENTA_SABOR.SABOR, VENTA_SABOR.AÑO, VENTA_SABOR.CANTIDAD_TOTAL,
ROUND((VENTA_SABOR.CANTIDAD_TOTAL/VENTA_TOTAL.CANTIDAD_TOTAL)*100,2) AS PORCENTAJE
FROM(
SELECT P.SABOR, SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY P.SABOR, YEAR(F.FECHA_VENTA)
ORDER BY SUM(IFa.CANTIDAD) DESC ) AS VENTA_SABOR
INNER JOIN
(SELECT SUM(IFa.CANTIDAD) AS CANTIDAD_TOTAL,
 YEAR(F.FECHA_VENTA) AS AÑO FROM 
tabla_de_productos P 
INNER JOIN
items_facturas IFa
ON P.CODIGO_DEL_PRODUCTO = IFa.CODIGO_DEL_PRODUCTO
INNER JOIN
facturas F
ON F.NUMERO = IFa.NUMERO 
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(F.FECHA_VENTA)) AS VENTA_TOTAL
ON VENTA_TOTAL.AÑO = VENTA_SABOR.AÑO
ORDER BY VENTA_SABOR.CANTIDAD_TOTAL DESC;
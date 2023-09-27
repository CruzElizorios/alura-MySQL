USE jugos_ventas;
SELECT * FROM tabla_de_productos WHERE  SABOR = 'mango' AND TAMANO = '470 ml';

SELECT * FROM tabla_de_clientes;
SELECT distinct BARRIO FROM tabla_de_clientes WHERE CIUDAD = 'Ciudad de México';
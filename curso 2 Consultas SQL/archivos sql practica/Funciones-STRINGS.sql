SELECT ltrim("       HOLA Q ONDA");
SELECT rtrim("HOLA Q ONDA       ");
SELECT trim("   HOLA Q ONDA       ");
SELECT concat("HOLA COMO TE VA?"," MUY BIEN");
SELECT upper('esto se ve en mayuscula');
SELECT lower('ESTO SE VE EN MINUSCULA');
SELECT substring('QUIERO QUE SE ELIJA UNA PABLABRA',21,3);
SELECT concat(NOMBRE, " ", DNI) FROM tabla_de_clientes;
SELECT concat(NOMBRE, ": ", DIRECCION_1, ", ", BARRIO,", ", CIUDAD,", ", ESTADO ) AS DATOS_COMPLETOS FROM tabla_de_clientes;
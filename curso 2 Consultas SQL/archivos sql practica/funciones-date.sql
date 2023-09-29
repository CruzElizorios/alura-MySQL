SELECT curdate();
select current_timestamp();
select year(current_timestamp());
select month(current_timestamp());
select monthname(current_timestamp());
select datediff(current_timestamp(), "1974-06-26") as diferencia_dias;

select distinct FECHA_VENTA,
DAYNAME(FECHA_VENTA) AS DIA, MONTHNAME(FECHA_VENTA) AS MES, YEAR(FECHA_VENTA) AS AÑO
FROM facturas;
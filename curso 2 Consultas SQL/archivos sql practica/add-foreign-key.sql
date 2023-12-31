USE ventas_jugos;

CREATE TABLE tb_items_facturas
(NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO));

/*CREACION DE UNA CLAVE FORANEA PARA RELACIONAR LAS TABLAS*/
ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_FACTURAS
FOREIGN KEY (NUMERO)
REFERENCES tb_factura(NUMERO);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO)
REFERENCES tb_productos(CODIGO);

ALTER TABLE facturas ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE facturas ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);

ALTER TABLE facturas RENAME tb_factura;
ALTER TABLE items_facturas RENAME tb_items_facturas;

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);
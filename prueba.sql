-- Se crea la base de datos
CREATE DATABASE prueba;

-- se ingresa a la base de datos
\c "prueba";

-- se crea la tabla cliente
CREATE TABLE cliente(

-- se crea la columna id_cliente que corresponderá a un número serial
id_cliente SERIAL,

-- se crea la columna nombre_cliente que corresponderá a un texto igual o menor a 30 caracteres
nombre_cliente VARCHAR(30),

-- se crea la columna rut que corresponderá a un número entero
rut INT,

-- se crea la columna dirección que corresponderá a un texto igual o menor a 30 caracteres
direccion VARCHAR(70),

-- Se define que la columna id_cliente será la primary key
PRIMARY KEY (id_cliente));

--Se crea la tabla factura
CREATE TABLE factura(

--Se crea la columna id_factura que corresponderá a un número entero
id_factura INT,

--Se crea la columna fecha_factura que corresponderá a una fecha
fecha_factura DATE,

--Se crea la columna subtotal que corresponderá a un número entero.
subtotal INT,

--Se crea la columna iva que corresponderá a un número entero
iva INT,

--Se crea la columna precio_total que corresponderá a un número entero
precio_total INT,

--Se crea la columna id_cliente que corresponderá a un número entero, el cual se encuentra enlazado con el id_cliente de la tabla cliente
id_cliente INT REFERENCES cliente(id_cliente),

-- Se define que la columna id_factura será la primary key
PRIMARY KEY (id_factura));

-- se crea la tabla categoría
CREATE TABLE categoria(

--Se crea la columna id_categoría que corresponderá a un número entero
id_categoria INT,

-- se crea la columna nombre_categoría que corresponderá a un texto igual o menor a 30 caracteres
nombre_categoria VARCHAR(30),

--Se crea la columna descripcion_categoria que corresponderá a un texto
descripcion_categoria TEXT,

-- Se define que la columna id_categoria será la primary key
PRIMARY KEY (id_categoria));

-- se crea la tabla producto
CREATE TABLE producto(

--Se crea la columna id_producto que corresponderá a un número entero
id_producto INT,

-- se crea la columna nombre_producto que corresponderá a un texto igual o menor a 30 caracteres
nombre_producto VARCHAR(30),

--Se crea la columna descripción_producto que corresponderá a un texto
descripcion_producto TEXT,

--Se crea la columna valor_unitario que corresponderá a un número entero
valor_unitario INT,

--Se crea la columna id_categoría que corresponderá a un número entero, el cual se encuentra enlazado con el id_categoría de la tabla cliente
id_categoria INT REFERENCES categoria(id_categoria),

-- Se define que la columna id_producto será la primary key
PRIMARY KEY (id_producto));

-- se crea la tabla producto
CREATE TABLE factura_producto(

--Se crea la columna cantidad que corresponderá a un número entero
cantidad INT,

--Se crea la columna id_factura que corresponderá a un número entero, el cual se encuentra enlazado con el id_factura de la tabla facutra
id_factura INT REFERENCES factura(id_factura),

--Se crea la columna id_producto que corresponderá a un número entero, el cual se encuentra enlazado con el id_producto de la tabla producto
id_producto INT REFERENCES producto(id_producto),

-- Se define que las columnas id_factura y id_producto serán la primary key
PRIMARY KEY (id_factura,id_producto));

--Se añaden 5 clientes diferentes con los nombres francisca, francisco, franchesca, franchesco y maria con los ruts 191363272, 191363273, 191363274, 191363275, 191363276 y direcciones calle inventada 1, calle inventada 2, calle inventada 3, calle inventada 4, calle inventada 5 respectivamente. 
INSERT INTO cliente (nombre_cliente, rut, direccion) VALUES
('francisca','191363272','calle inventada uno');
INSERT INTO cliente (nombre_cliente, rut, direccion) VALUES
('francisco','191363273','calle inventada dos');
INSERT INTO cliente (nombre_cliente, rut, direccion) VALUES
('franchesca','191363274','calle inventada tres');
INSERT INTO cliente (nombre_cliente, rut, direccion) VALUES
('franchesco','191363275','calle inventada cuatro');
INSERT INTO cliente (nombre_cliente, rut, direccion) VALUES
('maria','191363276','calle inventada cinco');

-- Se crean 3 categorías, ropa, comida y juguetes respectivamente
INSERT INTO categoria (id_categoria, nombre_categoria, descripcion_categoria) VALUES
('1','ropa','En esta categoría se vende ropa');
INSERT INTO categoria (id_categoria, nombre_categoria, descripcion_categoria) VALUES
('2','comida','En esta categoría se vende comida');
INSERT INTO categoria (id_categoria, nombre_categoria, descripcion_categoria) VALUES
('3','juguetes','En esta categoría se venden juguetes');

-- Se crean 8 productos, 3 de ropa, 3 de comida y 2 de juguetes respectivamente
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('1','poleron','poleron hombre talla xl','20','1');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('2','polera','polera mujer talla xs','30','1');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('3','pantalon','pantalon mujer talla s','40','1');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('4','platano','los mejores platanos de la ciudad','50','2');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('5','pomelo','los mejores pomelos de la ciudad','60','2');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('6','papaya','las mejores papayas de la ciudad','70','2');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('7','barbie','La nueva barbie doctora esta aquí','80','3');
INSERT INTO producto (id_producto, nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES
('8','Max Steel','Max Steel hombre de acero está aquí','90','3');

--Se crea la factura número 1
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('1','10-24-2020','50','19','60', '1');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('2','10-25-2020','90','19','107', '1');

--Se crea la factura número 2
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('3','10-25-2020','90','19','107', '2');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('4','10-26-2020','90','19','107', '2');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('5','10-27-2020','90','19','107', '2');

--Se crea la factura número 3
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('6','10-27-2020','20','19','24', '3');

--Se crea la factura número 4
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('7','10-28-2020','50','19','60', '4');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('8','10-29-2020','90','19','107', '4');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('9','10-30-2020','140','19','167', '4');
INSERT INTO factura (id_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) VALUES
('10','11-01-2020','70','19','83', '4');


--Se asocian las facturas con los números de producto
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','1','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','1','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','2','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','2','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','2','3');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','3','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','3','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','3','3');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','4','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','4','6');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','5','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','5','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','5','3');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','6','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','7','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','7','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','8','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','8','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','8','3');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','9','1');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','9','2');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','9','3');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','9','4');
INSERT INTO factura_producto (cantidad, id_factura, id_producto) VALUES
('1','10','6');

--Se consulta qué cliente realizó la compra más cara
SELECT nombre_cliente FROM cliente WHERE id_cliente IN (SELECT id_cliente FROM factura ORDER BY precio_total DESC LIMIT 1);

-- Se consulta qué cliente(s) pagaron por sobre 100 de monto
SELECT nombre_cliente FROM cliente WHERE id_cliente IN (SELECT id_cliente FROM factura WHERE precio_total > '100');

--Se consulta el número de clientes que han comprado el producto 6.
SELECT COUNT (id_producto) FROM factura_producto WHERE id_producto = '6';
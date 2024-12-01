--Sentencia 1
--Valores de ejemplo
INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (1, 1, 2);

--Sentencia 2
--Valores de ejemplo
DELETE FROM public."ProductosCarro"
	WHERE "idProducto"=4 AND "idCarro"=0;

--Sentencia 3
--Valor de "idCarro" de ejemplo
SELECT "Producto"."idProducto", "url-imagen", stock, nombre, precio, descripcion
FROM "Producto", "ProductosCarro"
WHERE "ProductosCarro"."idCarro" = 0 AND
	"Producto"."idProducto" = "ProductosCarro"."idProducto";

--Sentencia 4
--Valor de "idCarro" de ejemplo
SELECT SUM("Producto".precio * "ProductosCarro".Cantidad) AS "precioTotal"
FROM "Producto", "ProductosCarro"
WHERE "ProductosCarro"."idCarro" = 0 AND
	"Producto"."idProducto" = "ProductosCarro"."idProducto";

--AUX
SELECT * FROM "Producto", "ProductosCarro", "CarroDeCompras", "Usuario";

--Sentencia 5
--Valores de "region", "ciudad", "comuna" de ejemplo
SELECT "Producto"."idProducto", "url-imagen", stock, "Producto".nombre, precio, descripcion
FROM "Producto", "ProductosCarro", "CarroDeCompras", "Usuario"
WHERE "Usuario".region= 'RM' AND 
	ciudad = 'Santiago' AND 
	comuna = 'Estacion Central' AND
	"CarroDeCompras"."idUsuario" = "Usuario"."idUsuario" AND
	"ProductosCarro"."idCarro" = "CarroDeCompras"."idCarro" AND
	"Producto"."idProducto" = "ProductosCarro"."idProducto";

--Sentencia 6
SELECT SUM("ProductosCarro".cantidad) AS "totalVentas", "Producto"."idProducto", "url-imagen", stock, nombre, precio, descripcion
FROM "Producto", "ProductosCarro"
WHERE "ProductosCarro"."idProducto" = "Producto"."idProducto"
GROUP BY "Producto"."idProducto"
ORDER BY "totalVentas" DESC;

--Sentencia 7
--Valor de "idUsuario" de ejemplo
SELECT "Producto"."idProducto", "url-imagen", stock, "Producto"."nombre", precio, descripcion
FROM "Producto", "ListaDeseos"
WHERE "ListaDeseos"."idUsuario" = 0 AND
	"Producto"."idProducto" = "ListaDeseos"."idProducto";
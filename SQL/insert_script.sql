--Usuario

INSERT INTO public."Usuario"(
	"idUsuario", correo, nombre, clave, region, ciudad, comuna)
	VALUES (0, 'usuario0@gmail.com', 'usuario0', 'clave0', 'RM', 'Santiago', 'Estacion Central');

INSERT INTO public."Usuario"(
	"idUsuario", correo, nombre, clave, region, ciudad, comuna)
	VALUES (1, 'usuario1@gmail.com', 'usuario1', 'clave1', 'RM', 'Santiago', 'Recoleta');

INSERT INTO public."Usuario"(
	"idUsuario", correo, nombre, clave, region, ciudad, comuna)
	VALUES (2, 'usuario2@gmail.com', 'usuario2', 'clave2', 'Maule', 'Talca', 'Talca_');

INSERT INTO public."Usuario"(
	"idUsuario", correo, nombre, clave, region, ciudad, comuna)
	VALUES (3, 'usuario3@gmail.com', 'usuario3', 'clave3', 'RM', 'Santiago', 'Maipu');

INSERT INTO public."Usuario"(
	"idUsuario", correo, nombre, clave, region, ciudad, comuna)
	VALUES (4, 'usuario4@gmail.com', 'usuario4', 'clave4', 'Araucania', 'Temuco', 'Temuco_');

--CarroDeCompras

INSERT INTO public."CarroDeCompras"(
	"idCarro", "idUsuario")
	VALUES (0, 0);

INSERT INTO public."CarroDeCompras"(
	"idCarro", "idUsuario")
	VALUES (1, 1);

INSERT INTO public."CarroDeCompras"(
	"idCarro", "idUsuario")
	VALUES (2, 2);

INSERT INTO public."CarroDeCompras"(
	"idCarro", "idUsuario")
	VALUES (3, 3);

INSERT INTO public."CarroDeCompras"(
	"idCarro", "idUsuario")
	VALUES (4, 0);

--Boleta

INSERT INTO public."Boleta"(
	"idBoleta", "metodoPago", "idCarro", "idUsuario")
	VALUES (0, 'contado', 0, 0);

INSERT INTO public."Boleta"(
	"idBoleta", "metodoPago", "idCarro", "idUsuario")
	VALUES (1, 'contado', 0, 0);

INSERT INTO public."Boleta"(
	"idBoleta", "metodoPago", "idCarro", "idUsuario")
	VALUES (2, 'credito', 1, 1);

INSERT INTO public."Boleta"(
	"idBoleta", "metodoPago", "idCarro", "idUsuario")
	VALUES (3, 'credito', 2, 2);

INSERT INTO public."Boleta"(
	"idBoleta", "metodoPago", "idCarro", "idUsuario")
	VALUES (4, 'debito', 3, 3);

--Producto

INSERT INTO public."Producto"(
	"idProducto", "url-imagen", stock, nombre, precio, descripcion)
	VALUES (0, '123', 10, 'botella de agua', 1000, 'aguita');

INSERT INTO public."Producto"(
	"idProducto", "url-imagen", stock, nombre, precio, descripcion)
	VALUES (1, '122', 7, 'score', 2200, 'aguita con sabor');

INSERT INTO public."Producto"(
	"idProducto", "url-imagen", stock, nombre, precio, descripcion)
	VALUES (2, '121', 15, 'empanada de queso', 2100, 'hace hambre');

INSERT INTO public."Producto"(
	"idProducto", "url-imagen", stock, nombre, precio, descripcion)
	VALUES (3, '120', 20, 'maruchan', 1300, 'sopita pal frio');

INSERT INTO public."Producto"(
	"idProducto", "url-imagen", stock, nombre, precio, descripcion)
	VALUES (4, '124', 10, 'coca-cola', 1100, 'espuma');

--ListaDeseos

INSERT INTO public."ListaDeseos"(
	"idUsuario", "idProducto")
	VALUES (0, 0);

INSERT INTO public."ListaDeseos"(
	"idUsuario", "idProducto")
	VALUES (0, 1);

INSERT INTO public."ListaDeseos"(
	"idUsuario", "idProducto")
	VALUES (0, 2);

INSERT INTO public."ListaDeseos"(
	"idUsuario", "idProducto")
	VALUES (1, 1);

INSERT INTO public."ListaDeseos"(
	"idUsuario", "idProducto")
	VALUES (2, 3);

--Permiso

INSERT INTO public."Permiso"(
	"idPermiso", descripcion)
	VALUES (0, 'subir producto');

INSERT INTO public."Permiso"(
	"idPermiso", descripcion)
	VALUES (1, 'lista de deseos');

INSERT INTO public."Permiso"(
	"idPermiso", descripcion)
	VALUES (2, 'valorizacion');

INSERT INTO public."Permiso"(
	"idPermiso", descripcion)
	VALUES (3, 'carro de compras');

INSERT INTO public."Permiso"(
	"idPermiso", descripcion)
	VALUES (4, 'admin');

--Tipo

INSERT INTO public."Tipo"(
	"idTipo", descripcion)
	VALUES (0, 'bebestible');

INSERT INTO public."Tipo"(
	"idTipo", descripcion)
	VALUES (1, 'comida');

INSERT INTO public."Tipo"(
	"idTipo", descripcion)
	VALUES (2, 'para llevar');

INSERT INTO public."Tipo"(
	"idTipo", descripcion)
	VALUES (3, 'electronico');

INSERT INTO public."Tipo"(
	"idTipo", descripcion)
	VALUES (4, 'otro');

--ProductoTipo

INSERT INTO public."ProductoTipo"(
	"idProducto", "idTipo")
	VALUES (0, 0);

INSERT INTO public."ProductoTipo"(
	"idProducto", "idTipo")
	VALUES (1, 0);

INSERT INTO public."ProductoTipo"(
	"idProducto", "idTipo")
	VALUES (2, 1);

INSERT INTO public."ProductoTipo"(
	"idProducto", "idTipo")
	VALUES (3, 2);

INSERT INTO public."ProductoTipo"(
	"idProducto", "idTipo")
	VALUES (4, 4);

--ProductosCarro

INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (0, 0, 1);

INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (0, 1, 2);

INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (1, 2, 2);

INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (1, 4, 1);

INSERT INTO public."ProductosCarro"(
	"idCarro", "idProducto", cantidad)
	VALUES (2, 3, 1);

--Rol

INSERT INTO public."Rol"(
	"IdRol", descripcion)
	VALUES (0, 'admin');

INSERT INTO public."Rol"(
	"IdRol", descripcion)
	VALUES (1, 'pyme');

INSERT INTO public."Rol"(
	"IdRol", descripcion)
	VALUES (2, 'cliente');

INSERT INTO public."Rol"(
	"IdRol", descripcion)
	VALUES (3, 'rol3');

INSERT INTO public."Rol"(
	"IdRol", descripcion)
	VALUES (4, 'rol4');

--RolPermiso

INSERT INTO public."RolPermiso"(
	"idRol", "idPermiso")
	VALUES (0, 4);

INSERT INTO public."RolPermiso"(
	"idRol", "idPermiso")
	VALUES (1, 1);

INSERT INTO public."RolPermiso"(
	"idRol", "idPermiso")
	VALUES (2, 2);

INSERT INTO public."RolPermiso"(
	"idRol", "idPermiso")
	VALUES (2, 3);

INSERT INTO public."RolPermiso"(
	"idRol", "idPermiso")
	VALUES (0, 2);

--SubidaASistema

INSERT INTO public."SubidaASistema"(
	"idUsuario", "idProducto")
	VALUES (0, 0);

INSERT INTO public."SubidaASistema"(
	"idUsuario", "idProducto")
	VALUES (0, 1);

INSERT INTO public."SubidaASistema"(
	"idUsuario", "idProducto")
	VALUES (3, 4);

INSERT INTO public."SubidaASistema"(
	"idUsuario", "idProducto")
	VALUES (3, 2);

INSERT INTO public."SubidaASistema"(
	"idUsuario", "idProducto")
	VALUES (3, 3);

--UsuarioRol

INSERT INTO public."UsuarioRol"(
	"idUsuario", "idRol")
	VALUES (0, 1);

INSERT INTO public."UsuarioRol"(
	"idUsuario", "idRol")
	VALUES (0, 3);

INSERT INTO public."UsuarioRol"(
	"idUsuario", "idRol")
	VALUES (3, 1);

INSERT INTO public."UsuarioRol"(
	"idUsuario", "idRol")
	VALUES (3, 3);

INSERT INTO public."UsuarioRol"(
	"idUsuario", "idRol")
	VALUES (1, 2);

--Valorizacion

INSERT INTO public."Valorizacion"(
	"idUsuario", "idProducto", descripcion, puntuacion)
	VALUES (2, 0, 'aguita', 7);

INSERT INTO public."Valorizacion"(
	"idUsuario", "idProducto", descripcion, puntuacion)
	VALUES (2, 1, 'aguita con sabor_', 10);

INSERT INTO public."Valorizacion"(
	"idUsuario", "idProducto", descripcion, puntuacion)
	VALUES (1, 0, 'aguita1', 4);

INSERT INTO public."Valorizacion"(
	"idUsuario", "idProducto", descripcion, puntuacion)
	VALUES (4, 3, 'no me acuerdo que era xd', 7);

INSERT INTO public."Valorizacion"(
	"idUsuario", "idProducto", descripcion, puntuacion)
	VALUES (4, 4, 'espuma_', 8);
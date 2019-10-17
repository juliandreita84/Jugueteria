-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2019 a las 03:10:39
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ofertasdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoriaproducto`
--

CREATE TABLE `auditoriaproducto` (
  `idauditoriaproducto` int(11) NOT NULL COMMENT 'Id de la tabla idauditoriaproducto',
  `idproducto` int(11) NOT NULL COMMENT 'Llave foranea de la tabla producto que hace referencia al producto al cual se le estan persistiendo los campos de auditoria de esta tabla',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'Descripcion del campo de auditoria',
  `precio` decimal(15,2) DEFAULT NULL COMMENT 'Precio del producto para fines de auditoria',
  `accion` varchar(255) DEFAULT NULL COMMENT 'Acción de la auditoria'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los campos de auditoria de cada producto';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `idcotizacion` int(11) NOT NULL COMMENT 'Id de la tabla cotizacion',
  `idusuario` int(11) NOT NULL COMMENT 'Llave foranea de la tabla usuario que hace referencia al usuario cliente que esta solicitando la cotizacion',
  `cantidad` int(11) DEFAULT NULL COMMENT 'Cantidad de juguetes solicitados en la cotización',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'Descripcion de la cotización',
  `fecha` date DEFAULT NULL COMMENT 'Fecha de la cotización',
  `vigencia` int(11) DEFAULT NULL COMMENT 'Dias de vigencia de la cotización',
  `totalimpuestos` decimal(15,2) DEFAULT NULL COMMENT 'Valor total de impuestos de la cotización',
  `valortotal` decimal(15,2) DEFAULT NULL COMMENT 'Valor total de la cotización',
  `idimpuesto` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tabla impuesto que hace referencia al impuesto aplicado a dicha cotizacion',
  `subtotal` decimal(15,2) DEFAULT NULL COMMENT 'Subtotal de la Cotización',
  `estado` int(11) DEFAULT NULL COMMENT 'Estado de la cotización (0=Inactiva, 1=Activa)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojadas las cotizaciones hechas por el cliente';

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`idcotizacion`, `idusuario`, `cantidad`, `descripcion`, `fecha`, `vigencia`, `totalimpuestos`, `valortotal`, `idimpuesto`, `subtotal`, `estado`) VALUES
(1, 4, 0, NULL, '2019-10-16', 0, '0.00', '0.00', 4, '0.00', 1),
(2, 3, NULL, NULL, '2019-10-16', NULL, NULL, NULL, 4, NULL, 1),
(3, 2, NULL, NULL, '2019-10-16', NULL, NULL, NULL, 4, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE `impuesto` (
  `idimpuesto` int(11) NOT NULL COMMENT 'Id de la tabla impuesto',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre del impuesto',
  `porcentaje` decimal(6,2) DEFAULT NULL COMMENT 'Porcentaje del impuesto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los impuestos a aplicar a un producto determinado';

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`idimpuesto`, `nombre`, `porcentaje`) VALUES
(1, 'IVA', '5.00'),
(2, 'IVA', '8.00'),
(3, 'IVA', '10.00'),
(4, 'IVA', '19.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL COMMENT 'Id de la tabla log',
  `idusuario` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tabla usuario que hace referencia al usuario que esta ejecutando la acción a persistir',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha y hora del log',
  `accion` varchar(255) DEFAULT NULL COMMENT 'Accion realizada por el usuario',
  `contenido` varchar(255) DEFAULT NULL COMMENT 'Contenido del log'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los logs de las acciones realizadas por el usuario';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL COMMENT 'Id de la tabla producto',
  `idtipoproducto` int(11) NOT NULL COMMENT 'Llave foranea de la tabla tipoproducto que hace referencia al tipo del producto',
  `idusuario` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tabla usuario que hace referencia al usuario proveedor que esta ofertando el producto',
  `codigoproducto` varchar(20) DEFAULT NULL,
  `idimpuesto` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tabla impuesto que hace referencia al impúesto que tiene aplicado el producto',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'Descripción del producto',
  `estado` int(11) DEFAULT NULL COMMENT 'Estado del producto (0=Inactivo, 1=Activo)',
  `precio` decimal(15,2) DEFAULT NULL COMMENT 'Precio unitario del producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Producto que el cliente desea incluir en su cotización';

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `idtipoproducto`, `idusuario`, `codigoproducto`, `idimpuesto`, `descripcion`, `estado`, `precio`) VALUES
(1, 1, 1, 'P001-P1', 1, 'Alfombra de actividades', 1, '20000.00'),
(2, 1, 1, 'P002-P1', 1, 'Canasta pequeña de baloncesto', 1, '10000.00'),
(3, 1, 1, 'P003-P1', 1, 'Carrusel musical', 1, '18000.00'),
(4, 1, 1, 'P004-P1', 2, 'Casita de tela', 1, '12000.00'),
(5, 1, 1, 'P005-P1', 2, 'Coches, camiones paquete por 6', 1, '13500.00'),
(6, 1, 1, 'P006-P1', 2, 'Cubo, pala y rastrillo', 1, '5000.00'),
(7, 1, 1, 'P008-P1', 2, 'Cuentos con texturas y sonidos paquete por 2', 1, '20000.00'),
(8, 1, 1, 'P009-P1', 3, 'Dominó de colores y formas', 1, '4100.00'),
(9, 1, 1, 'P010-P1', 3, 'Juego de bolos de plástico', 1, '35000.00'),
(10, 1, 1, 'P011-P1', 3, 'Juegos de asociaciones sencillas (colores y formas)', 1, '25000.00'),
(11, 1, 1, 'P012-P1', 3, 'Juguetes con códigos de colores (llaves grandes de colores)', 1, '35000.00'),
(12, 1, 1, 'P013-P1', 3, 'Juguetes para el baño pato rana oso', 1, '40000.00'),
(13, 1, 1, 'P014-P1', 3, 'Juguetes para encajar figuras', 1, '30000.00'),
(14, 1, 1, 'P015-P1', 3, 'Juguetes para hacer burbujas', 1, '15000.00'),
(15, 1, 1, 'P016-P1', 1, 'Juguetes suaves (tela y peluche) que se desplazan, emiten sonidos, luces', 1, '58000.00'),
(16, 1, 1, 'P017-P1', 1, 'manoplas', 1, '6000.00'),
(17, 1, 1, 'P018-P1', 1, 'Móviles para la cuna', 1, '70000.00'),
(18, 1, 1, 'P019-P1', 2, 'Muñecas con vestidos', 1, '11000.00'),
(19, 1, 1, 'P020-P1', 2, 'Muñecas de trapo', 1, '25000.00'),
(20, 1, 1, 'P021-P1', 2, 'Peluche Elefante', 1, '35000.00'),
(21, 1, 1, 'P022-P1', 2, 'Pelotas( paquete por 3 plástico)', 1, '5000.00'),
(22, 1, 1, 'P023-P1', 2, 'Juegos de construcciones', 1, '70000.00'),
(23, 1, 1, 'P024-P1', 3, 'Peluche perro con sonido', 1, '70000.00'),
(24, 1, 1, 'P025-P1', 3, 'Pequeño gimnasio de actividades', 0, '130000.00'),
(25, 1, 1, 'P026-P1', 3, 'Juegos de tiendas: caja registradora,biletes,libreta', 1, '25000.00'),
(26, 1, 1, 'P027-P1', 3, 'Sonajeros', 1, '4000.00'),
(27, 1, 1, 'P028-P1', 3, 'Tableros de actividades', 1, '80000.00'),
(28, 1, 1, 'P029-P1', 3, 'Teléfono de juguete', 1, '35000.00'),
(29, 1, 1, 'P030-P1', 3, 'Títeres', 1, '18000.00'),
(30, 1, 1, 'P031-P1', 3, 'Tren', 1, '13500.00'),
(31, 1, 2, 'P001-P2', 1, 'Alfombra de actividades', 1, '18000.00'),
(32, 1, 2, 'P002-P2', 1, 'Canasta pequeña de baloncesto', 1, '11000.00'),
(33, 1, 2, 'P003-P2', 1, 'Carrusel musical', 1, '17000.00'),
(34, 1, 2, 'P004-P2', 2, 'Casita de tela', 1, '12000.00'),
(35, 1, 2, 'P005-P2', 2, 'Coches, camiones paquete por 6', 0, '13800.00'),
(36, 1, 2, 'P006-P2', 2, 'Cubo, pala y rastrillo', 1, '5300.00'),
(37, 1, 2, 'P008-P2', 2, 'Cuentos con texturas y sonidos paquete por 2', 1, '18000.00'),
(38, 1, 2, 'P009-P2', 3, 'Dominó de colores y formas', 1, '4150.00'),
(39, 1, 2, 'P010-P2', 3, 'Juego de bolos de plástico', 1, '35000.00'),
(40, 1, 2, 'P011-P2', 3, 'Juegos de asociaciones sencillas (colores y formas)', 1, '22000.00'),
(41, 1, 2, 'P012-P2', 3, 'Juguetes con códigos de colores (llaves grandes de colores)', 1, '36000.00'),
(42, 1, 2, 'P013-P2', 3, 'Juguetes para el baño pato rana oso', 1, '48000.00'),
(43, 1, 2, 'P014-P2', 3, 'Juguetes para encajar figuras', 1, '35000.00'),
(44, 1, 2, 'P015-P2', 3, 'Juguetes para hacer burbujas', 1, '16000.00'),
(45, 1, 2, 'P016-P2', 1, 'Juguetes suaves (tela y peluche) que se desplazan, emiten sonidos, luces', 1, '55000.00'),
(46, 1, 2, 'P017-P2', 1, 'manoplas', 1, '5900.00'),
(47, 1, 2, 'P018-P2', 1, 'Móviles para la cuna', 1, '74000.00'),
(48, 1, 2, 'P019-P2', 2, 'Muñecas con vestidos', 1, '15000.00'),
(49, 1, 2, 'P020-P2', 2, 'Muñecas de trapo', 1, '26000.00'),
(50, 1, 2, 'P021-P2', 2, 'Peluche Elefante', 1, '36000.00'),
(51, 1, 2, 'P022-P2', 2, 'Pelotas( paquete por 3 plástico)', 0, '5000.00'),
(52, 1, 2, 'P023-P2', 2, 'Juegos de construcciones', 1, '71000.00'),
(53, 1, 2, 'P024-P2', 3, 'Peluche perro con sonido', 1, '71500.00'),
(54, 1, 2, 'P025-P2', 3, 'Pequeño gimnasio de actividades', 1, '128000.00'),
(55, 1, 2, 'P026-P2', 3, 'Juegos de tiendas: caja registradora,biletes,libreta', 1, '27000.00'),
(56, 1, 2, 'P027-P2', 3, 'Sonajeros', 1, '4200.00'),
(57, 1, 2, 'P028-P2', 3, 'Tableros de actividades', 1, '82000.00'),
(58, 1, 2, 'P029-P2', 3, 'Teléfono de juguete', 1, '35000.00'),
(59, 1, 2, 'P030-P2', 3, 'Títeres', 1, '19000.00'),
(60, 1, 2, 'P031-P2', 3, 'Tren', 1, '12500.00'),
(61, 1, 3, 'P001-P3', 1, 'Alfombra de actividades', 1, '20000.00'),
(62, 1, 3, 'P002-P3', 1, 'Canasta pequeña de baloncesto', 1, '10000.00'),
(63, 1, 3, 'P003-P3', 1, 'Carrusel musical', 1, '18500.00'),
(64, 1, 3, 'P004-P3', 2, 'Casita de tela', 1, '12000.00'),
(65, 1, 3, 'P005-P3', 2, 'Coches, camiones paquete por 6', 1, '13200.00'),
(66, 1, 3, 'P006-P3', 2, 'Cubo, pala y rastrillo', 1, '5100.00'),
(67, 1, 3, 'P008-P3', 2, 'Cuentos con texturas y sonidos paquete por 2', 1, '22000.00'),
(68, 1, 3, 'P009-P3', 3, 'Dominó de colores y formas', 1, '4200.00'),
(69, 1, 3, 'P010-P3', 3, 'Juego de bolos de plástico', 1, '35000.00'),
(70, 1, 3, 'P011-P3', 3, 'Juegos de asociaciones sencillas (colores y formas)', 1, '21000.00'),
(71, 1, 3, 'P012-P3', 3, 'Juguetes con códigos de colores (llaves grandes de colores)', 1, '31000.00'),
(72, 1, 3, 'P013-P3', 3, 'Juguetes para el baño pato rana oso', 1, '41000.00'),
(73, 1, 3, 'P014-P3', 3, 'Juguetes para encajar figuras', 0, '29000.00'),
(74, 1, 3, 'P015-P3', 3, 'Juguetes para hacer burbujas', 1, '16000.00'),
(75, 1, 3, 'P016-P3', 1, 'Juguetes suaves (tela y peluche) que se desplazan, emiten sonidos, luces', 1, '57000.00'),
(76, 1, 3, 'P017-P3', 1, 'manoplas', 1, '6000.00'),
(77, 1, 3, 'P018-P3', 1, 'Móviles para la cuna', 1, '76000.00'),
(78, 1, 3, 'P019-P3', 2, 'Muñecas con vestidos', 1, '16000.00'),
(79, 1, 3, 'P020-P3', 2, 'Muñecas de trapo', 1, '23000.00'),
(80, 1, 3, 'P021-P3', 2, 'Peluche Elefante', 1, '35000.00'),
(81, 1, 3, 'P022-P3', 2, 'Pelotas( paquete por 3 plástico)', 1, '5000.00'),
(82, 1, 3, 'P023-P3', 2, 'Juegos de construcciones', 1, '72000.00'),
(83, 1, 3, 'P024-P3', 3, 'Peluche perro con sonido', 1, '70000.00'),
(84, 1, 3, 'P025-P3', 3, 'Pequeño gimnasio de actividades', 1, '132000.00'),
(85, 1, 3, 'P026-P3', 3, 'Juegos de tiendas: caja registradora,biletes,libreta', 1, '25000.00'),
(86, 1, 3, 'P027-P3', 3, 'Sonajeros', 1, '4100.00'),
(87, 1, 3, 'P028-P3', 3, 'Tableros de actividades', 0, '81000.00'),
(88, 1, 3, 'P029-P3', 3, 'Teléfono de juguete', 1, '32000.00'),
(89, 1, 3, 'P030-P3', 3, 'Títeres', 1, '16500.00'),
(90, 1, 3, 'P031-P3', 3, 'Tren', 1, '13200.00'),
(91, 1, 4, 'P001-P4', 1, 'Alfombra de actividades', 1, '19000.00'),
(92, 1, 4, 'P002-P4', 1, 'Canasta pequeña de baloncesto', 1, '9500.00'),
(93, 1, 4, 'P003-P4', 1, 'Carrusel musical', 1, '15000.00'),
(94, 1, 4, 'P004-P4', 2, 'Casita de tela', 1, '12000.00'),
(95, 1, 4, 'P005-P4', 2, 'Coches, camiones paquete por 6', 1, '13000.00'),
(96, 1, 4, 'P006-P4', 2, 'Cubo, pala y rastrillo', 1, '5000.00'),
(97, 1, 4, 'P008-P4', 2, 'Cuentos con texturas y sonidos paquete por 2', 0, '20000.00'),
(98, 1, 4, 'P009-P4', 3, 'Dominó de colores y formas', 1, '4000.00'),
(99, 1, 4, 'P010-P4', 3, 'Juego de bolos de plástico', 1, '35000.00'),
(100, 1, 4, 'P011-P4', 3, 'Juegos de asociaciones sencillas (colores y formas)', 1, '22500.00'),
(101, 1, 4, 'P012-P4', 3, 'Juguetes con códigos de colores (llaves grandes de colores)', 1, '36000.00'),
(102, 1, 4, 'P013-P4', 3, 'Juguetes para el baño pato rana oso', 1, '40000.00'),
(103, 1, 4, 'P014-P4', 3, 'Juguetes para encajar figuras', 1, '31000.00'),
(104, 1, 4, 'P015-P4', 3, 'Juguetes para hacer burbujas', 1, '16000.00'),
(105, 1, 4, 'P016-P4', 1, 'Juguetes suaves (tela y peluche) que se desplazan, emiten sonidos, luces', 1, '60000.00'),
(106, 1, 4, 'P017-P4', 1, 'manoplas', 1, '5900.00'),
(107, 1, 4, 'P018-P4', 1, 'Móviles para la cuna', 1, '70000.00'),
(108, 1, 4, 'P019-P4', 2, 'Muñecas con vestidos', 1, '12000.00'),
(109, 1, 4, 'P020-P4', 2, 'Muñecas de trapo', 0, '21000.00'),
(110, 1, 4, 'P021-P4', 2, 'Peluche Elefante', 1, '36000.00'),
(111, 1, 4, 'P022-P4', 2, 'Pelotas( paquete por 3 plástico)', 1, '5000.00'),
(112, 1, 4, 'P023-P4', 2, 'Juegos de construcciones', 1, '75000.00'),
(113, 1, 4, 'P024-P4', 3, 'Peluche perro con sonido', 1, '71000.00'),
(114, 1, 4, 'P025-P4', 3, 'Pequeño gimnasio de actividades', 1, '130000.00'),
(115, 1, 4, 'P026-P4', 3, 'Juegos de tiendas: caja registradora,biletes,libreta', 1, '26000.00'),
(116, 1, 4, 'P027-P4', 3, 'Sonajeros', 1, '4000.00'),
(117, 1, 4, 'P028-P4', 3, 'Tableros de actividades', 1, '79000.00'),
(118, 1, 4, 'P029-P4', 3, 'Teléfono de juguete', 1, '36000.00'),
(119, 1, 4, 'P030-P4', 3, 'Títeres', 1, '17500.00'),
(120, 1, 4, 'P031-P4', 3, 'Tren', 1, '13000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocotizacion`
--

CREATE TABLE `productocotizacion` (
  `idproductocotizacion` int(11) NOT NULL COMMENT 'Id de la tabla productocotizacion',
  `idproducto` int(11) NOT NULL COMMENT 'Llave foranea de la tabla producto que hace referencia al producto incluido en la cotizacion',
  `idusuario` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tablausuario que hace referencia al proveedor al que pertenece el producto',
  `idcotizacion` int(11) NOT NULL COMMENT 'Llave foranea de la tabla cotizacion que hace referencia a la cotizacion en la que esta incluida el producto',
  `idimpuesto` int(11) DEFAULT NULL COMMENT 'Llave foranea de la tabla impuesto que hace referencia al impúesto que tiene aplicado el producto',
  `cantidad` int(11) DEFAULT NULL COMMENT 'Cantidad del producto a cotizar',
  `precio` decimal(15,2) DEFAULT NULL COMMENT 'Precio unitario del producto a cotizar',
  `total` decimal(15,2) DEFAULT NULL COMMENT 'Precio de los productos a cotizar (Precio Producto por Cantidad)',
  `impuesto` decimal(15,2) DEFAULT NULL COMMENT 'Impuesto del producto a cotizar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los productos a incluir en la cotización';

--
-- Volcado de datos para la tabla `productocotizacion`
--

INSERT INTO `productocotizacion` (`idproductocotizacion`, `idproducto`, `idusuario`, `idcotizacion`, `idimpuesto`, `cantidad`, `precio`, `total`, `impuesto`) VALUES
(1, 33, 1, 1, 1, 10, '1000.00', '10000.00', '100.00'),
(2, 44, 1, 1, 1, 5, '5000.00', '25000.00', '250.00'),
(3, 55, 1, 2, 1, 3, '3000.00', '9000.00', '300.00'),
(4, 66, 1, 3, 1, 40, '4000.00', '160000.00', '400.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL COMMENT 'Id de la tabla rol',
  `tipo` varchar(50) DEFAULT NULL COMMENT 'Tipo de Rol que puede tener un usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los tipos de roles que puede tener un usuario';

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `tipo`) VALUES
(1, 'cliente'),
(2, 'proveedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolusuario`
--

CREATE TABLE `rolusuario` (
  `idusuario` int(11) NOT NULL COMMENT 'Id de la tabla rolusuario que hace referencia al proveedor al usuario al cual le estamos asignando el rol',
  `idrol` int(11) NOT NULL COMMENT 'Llave foranea de la tabla rol que hace referencia al rol que le estamos asignando al usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla donde quedan alojados los roles que un usuario puede tener';

--
-- Volcado de datos para la tabla `rolusuario`
--

INSERT INTO `rolusuario` (`idusuario`, `idrol`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE `tipoidentificacion` (
  `idtipoidentificacion` int(11) NOT NULL COMMENT 'Id de la tabla tipoidentificacion',
  `tipoidentificacion` varchar(15) DEFAULT NULL COMMENT 'Nombre del tipo de identificación'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipos de identificacion que un usuario puede tener';

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`idtipoidentificacion`, `tipoidentificacion`) VALUES
(1, 'nit'),
(2, 'cédula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL COMMENT 'Id de la tabla tipoproducto',
  `tipoproducto` varchar(100) DEFAULT NULL COMMENT 'Nombre del tipo de producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipos de producto';

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`idtipoproducto`, `tipoproducto`) VALUES
(1, 'producto'),
(2, 'servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL COMMENT 'Id de la tabla usuario',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del usuario',
  `idtipoidentificacion` int(11) NOT NULL COMMENT 'Llave foranea de la tabla tipoidentificacion que hace referencia al tipo de identificacion que tiene el usuario',
  `identificacion` varchar(10) NOT NULL COMMENT 'Identificación del usuario',
  `empresa` varchar(100) DEFAULT NULL COMMENT 'Empresa del usuario',
  `email` varchar(50) DEFAULT NULL COMMENT 'E-mail del usuario',
  `direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección del usuario',
  `telefono` varchar(10) DEFAULT NULL COMMENT 'Teléfono del usuario',
  `loginname` varchar(15) NOT NULL COMMENT 'LoginName registrado del usuario',
  `clave` varchar(15) NOT NULL COMMENT 'Clave registrada del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla con la información del usuario registrado en el sistema';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `idtipoidentificacion`, `identificacion`, `empresa`, `email`, `direccion`, `telefono`, `loginname`, `clave`) VALUES
(1, 'Juan Antonio Cortes Rojas', 1, '8009638522', 'Distribuidora Juguetes primeras edades Cortes y Rojas', 'goyenechejennifer@gmail.com', 'Cra. 13 #No.11-72', '3013777431', 'Juan', '123'),
(2, 'Maria Eslava montes', 2, '41757808', 'A la mano juguetería infantil', 'goyenechejennifer@gmail.com', 'Calle 13 # 69 - 06 tercer piso', '3118700053', 'Maria', '123'),
(3, 'Jhon Jairo Rojas Ramirez', 1, '9004564565', 'Jugueteria JJ, distribuidores nacionales', 'goyenechejennifer@gmail.com', 'Cra. 13 #1078', '3124061830', 'Jhon', '123'),
(4, 'Andrea Cruz Aldana', 2, '52757808', '', 'goyenechejennifer@gmail.com', 'Cra. 13 #11-83', '3415034', 'Andrea', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoriaproducto`
--
ALTER TABLE `auditoriaproducto`
  ADD PRIMARY KEY (`idauditoriaproducto`),
  ADD KEY `FK_idproductoauditoriaproducto_idx` (`idproducto`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`idcotizacion`),
  ADD KEY `FK_idusuariocotizacion_idx` (`idusuario`),
  ADD KEY `FK_idimpuestocotizacion_idx` (`idimpuesto`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
  ADD PRIMARY KEY (`idimpuesto`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`),
  ADD KEY `FK_idusuariolog_idx` (`idusuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `FK_idimpuestoproducto_idx` (`idimpuesto`),
  ADD KEY `FK_idtipoproductoproducto_idx` (`idtipoproducto`),
  ADD KEY `FK_idusuarioproducto_idx` (`idusuario`);

--
-- Indices de la tabla `productocotizacion`
--
ALTER TABLE `productocotizacion`
  ADD PRIMARY KEY (`idproductocotizacion`),
  ADD KEY `FK_idproductoproductocotizacion_idx` (`idproducto`),
  ADD KEY `FK_idcotizacionproductocotizacion_idx` (`idcotizacion`),
  ADD KEY `FK_idusuarioproductocotizacion_idx` (`idusuario`),
  ADD KEY `FK_idimpuestoproductocotizacion_idx` (`idimpuesto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `rolusuario`
--
ALTER TABLE `rolusuario`
  ADD KEY `FK_idusuariorolusuario_idx` (`idusuario`),
  ADD KEY `FK_idrolrolusuario_idx` (`idrol`);

--
-- Indices de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  ADD PRIMARY KEY (`idtipoidentificacion`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idtipoproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`,`loginname`),
  ADD KEY `FK_idtipoidentificacionusuario_idx` (`idtipoidentificacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoriaproducto`
--
ALTER TABLE `auditoriaproducto`
  ADD CONSTRAINT `FK_idproductoauditoriaproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `FK_idimpuestocotizacion` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`idimpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idusuariocotizacion` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_idusuariolog` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_idimpuestoproducto` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`idimpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idtipoproductoproducto` FOREIGN KEY (`idtipoproducto`) REFERENCES `tipoproducto` (`idtipoproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idusuarioproducto` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productocotizacion`
--
ALTER TABLE `productocotizacion`
  ADD CONSTRAINT `FK_idcotizacionproductocotizacion` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idimpuestoproductocotizacion` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`idimpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idproductoproductocotizacion` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idusuarioproductocotizacion` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rolusuario`
--
ALTER TABLE `rolusuario`
  ADD CONSTRAINT `FK_idrolrolusuario` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_idusuariorolusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_idtipoidentificacionusuario` FOREIGN KEY (`idtipoidentificacion`) REFERENCES `tipoidentificacion` (`idtipoidentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

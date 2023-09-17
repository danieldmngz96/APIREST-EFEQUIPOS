-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2023 a las 21:02:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `almacen`
--
CREATE DATABASE IF NOT EXISTS `almacen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `almacen`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizador`
--

DROP TABLE IF EXISTS `autorizador`;
CREATE TABLE IF NOT EXISTS `autorizador` (
  `id_autorizador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`id_autorizador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `autorizador`
--

INSERT INTO `autorizador` (`id_autorizador`, `nombre`) VALUES
(1, 'EDNA PATRICIA DOMINGUEZ TELLO'),
(2, 'JOHN JAIRO DOMINGUEZ TELLO'),
(3, 'RAQUEL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nom_cargo`) VALUES
(1, 'INTERNET'),
(2, 'GERENTE GENERAL'),
(3, 'GERENTE COMERCIAL'),
(4, 'GERENTE ADMINISTRATIVA'),
(5, 'DIRECTORA DE INGENIERIA'),
(6, 'GERENTE'),
(7, 'GERENTE ZONA'),
(8, 'GERENTE ZONA 1'),
(9, 'GERENTE ZONA 2'),
(10, 'GERENTE ZONA 3'),
(11, 'DIRECTOR SISTEMAS'),
(12, 'AUXILIAR INGENIERIA'),
(13, 'GERENTE ZONA 4'),
(14, 'INGENIERO SISTEMAS'),
(16, 'SUPERVISOR PLANTA'),
(17, 'SOLDADOR 1'),
(18, 'SOLDADOR 2'),
(19, 'AUXILIAR PLANTA'),
(20, 'OFICIOS VARIOS'),
(21, 'GERENTE ZONA 6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cod_cli` int(11) NOT NULL,
  `nom_cliente` varchar(30) NOT NULL,
  `NIT` int(11) NOT NULL,
  `cargo_obra` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `departamento` varchar(30) NOT NULL,
  `nombre_obra` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cod_cli`, `nom_cliente`, `NIT`, `cargo_obra`, `direccion`, `celular`, `ciudad`, `departamento`, `nombre_obra`) VALUES
(1, 'ar construcciones', 5454, 'John Jairo Dominguez Tello,', 'cr 3 ## 22 01', 'chia', '3012310666', 'cundinamarca', 'purente 323'),
(4, 'ARQUITECTURA Y CONCRETO', 890, 'ING. ERNESTO PINTO', 'CRA 66 No. 5 67', '3123148810', 'BOGOTA', 'CCOLOMBIA', 'Calle 86'),
(5, 'prueba2', 123123, 'luis', 'CRA 74 # 163 - 80 CASA 28', '3123148810', 'BOGOTA', 'COLOMBIA', 'Punte chirajara'),
(9, 'es una prueba desde postman', 0, 'es una prueba desde postman', '0', 'es una prueba d', 'es una prueba desde postman', 'es una prueba desde postman', 'es una prueba desde postman'),
(10, 'pureuba desde app angular ', 2147483647, 'jhon elever cataño falso', 'callle false 123', '323222111223', 'manizales ', 'cundinamarca', 'puente 9'),
(11, 'preuba 2 cliene', 34343433, 'mancuso', 'cll 2 # 44 -05', '2323232', 'pereira', 'antioquia', 'puente 6'),
(12, 'contructora probando alerta', 343344324, 'pepe el que purueba', 'call 3 # 43-05', '4332322', 'ibague', 'manizales', 'calle aux');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

DROP TABLE IF EXISTS `contratos`;
CREATE TABLE IF NOT EXISTS `contratos` (
  `cod_cont` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`cod_cont`, `nombre`, `cod_cli`, `fec_ini`, `fec_fin`, `estado`) VALUES
(1, 'GHHDFKG IDFHGK', 1, '2008-07-29', '2008-10-29', '1'),
(2, 'abc', 1, '2008-07-29', '2008-10-29', '1'),
(3, 'xyz', 1, '2008-07-29', '2008-10-29', '2'),
(4, '', 1, '2008-07-29', '2008-10-29', '1'),
(5, '', 1, '2008-07-29', '2008-10-29', '2'),
(6, '', 1, '2008-07-29', '2008-08-29', '1'),
(7, '', 1, '2008-07-29', '2008-08-29', '2'),
(8, '', 1, '2008-07-29', '2008-08-29', '2'),
(9, '', 1, '2008-07-30', '2008-08-30', '1'),
(10, '', 1, '2009-09-09', '2009-10-10', '2'),
(11, '', 4, '2008-08-19', '2008-09-19', '1'),
(14, '', 4, '2008-08-15', '2008-09-15', '1'),
(15, '', 4, '2008-08-15', '2008-09-15', '2'),
(16, '', 4, '2008-08-15', '2008-09-15', '1'),
(17, '', 5, '2008-09-04', '2008-10-04', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_obra`
--

DROP TABLE IF EXISTS `contrato_obra`;
CREATE TABLE IF NOT EXISTS `contrato_obra` (
  `cod_cont` int(11) NOT NULL,
  `cod_obra` int(11) NOT NULL,
  `ciudad_obra` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `cod_cli` bigint(20) DEFAULT NULL,
  `dir_entrega_fac` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `dir_obra` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `fec_fin` datetime DEFAULT NULL,
  `fec_ini` datetime DEFAULT NULL,
  `obra` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `nom_resp` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `porcentaje` float DEFAULT NULL,
  `tel_obra` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `tipo_cont` float DEFAULT NULL,
  PRIMARY KEY (`cod_cont`,`cod_obra`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `contrato_obra`
--

INSERT INTO `contrato_obra` (`cod_cont`, `cod_obra`, `ciudad_obra`, `cod_cli`, `dir_entrega_fac`, `dir_obra`, `fec_fin`, `fec_ini`, `obra`, `nom_resp`, `porcentaje`, `tel_obra`, `tipo_cont`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `cod_cont` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cli` int(11) DEFAULT NULL,
  `fec_ini` date DEFAULT NULL,
  `fec_fin` date DEFAULT NULL,
  `dir_obra` varchar(50) DEFAULT NULL,
  `ciudad_obra` varchar(30) DEFAULT NULL,
  `nom_resp` varchar(50) DEFAULT NULL,
  `tel_obra` varchar(15) DEFAULT NULL,
  `dir_entrega_fac` varchar(50) DEFAULT NULL,
  `obra` varchar(30) DEFAULT NULL,
  `porcentaje` float DEFAULT 0.02,
  `tipo_cont` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`cod_cont`, `cod_cli`, `fec_ini`, `fec_fin`, `dir_obra`, `ciudad_obra`, `nom_resp`, `tel_obra`, `dir_entrega_fac`, `obra`, `porcentaje`, `tipo_cont`) VALUES
(10, 4, '2011-09-03', '2011-10-03', 'CALLE 30', 'BOGOTA', 'JAIME', '4304470', 'CRA 92', 'CASA 28', 0.002, 'VENTA'),
(11, 4, '2011-09-03', '2011-10-03', 'CALLE 30', 'BOGOTA', 'JAIME', '4304470', 'CRA 92', 'CASA 28', 0.002, 'VENTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachadores`
--

DROP TABLE IF EXISTS `despachadores`;
CREATE TABLE IF NOT EXISTS `despachadores` (
  `id_despa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE ascii_bin NOT NULL,
  `id_despá` bigint(20) NOT NULL,
  PRIMARY KEY (`id_despa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `despachadores`
--

INSERT INTO `despachadores` (`id_despa`, `nombre`, `id_despá`) VALUES
(1, 'EDGAR', 0),
(2, 'EDWIN', 0),
(3, 'JAVIER', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachos`
--

DROP TABLE IF EXISTS `despachos`;
CREATE TABLE IF NOT EXISTS `despachos` (
  `id_despacho` int(11) NOT NULL AUTO_INCREMENT,
  `cod_obra` int(11) NOT NULL,
  `cod_cont` int(11) NOT NULL,
  `fec_des` date NOT NULL,
  `conductor_veh` varchar(50) COLLATE ascii_bin NOT NULL,
  `placa_veh` varchar(6) COLLATE ascii_bin NOT NULL,
  `tipo_veh` int(11) NOT NULL,
  `despachador` int(11) NOT NULL,
  `autorizador` int(11) NOT NULL,
  `obs` varchar(300) COLLATE ascii_bin NOT NULL,
  `peso_total` float NOT NULL,
  `area_total` float NOT NULL,
  `descripcion` varchar(145) COLLATE ascii_bin NOT NULL,
  `cantidad` int(100) NOT NULL,
  PRIMARY KEY (`id_despacho`)
) ENGINE=InnoDB AUTO_INCREMENT=66675 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `despachos`
--

INSERT INTO `despachos` (`id_despacho`, `cod_obra`, `cod_cont`, `fec_des`, `conductor_veh`, `placa_veh`, `tipo_veh`, `despachador`, `autorizador`, `obs`, `peso_total`, `area_total`, `descripcion`, `cantidad`) VALUES
(1, 1234, 5678, '2023-05-05', 'Juan Perez', 'ABC123', 1, 10, 20, 'Observaciones', 100.5, 25.75, 'ABRAZADERA NY', 0),
(2, 5678, 9101, '2023-05-06', 'Maria Rodriguez', 'XYZ987', 2, 11, 21, 'Otras observaciones', 150.25, 30.5, 'ABRAZADERA ORIENTABLE', 0),
(3, 9101, 1123, '2023-05-07', 'Pedro Gomez', 'DEF456', 3, 12, 22, 'M?s observaciones', 200.75, 40.25, 'ABRAZADERA PARA TUBO', 0),
(4, 2345, 6789, '2023-05-08', 'Ana Torres', 'GHI789', 1, 13, 23, 'Algunas observaciones', 300, 50, 'ABRAZADERA PTS', 0),
(5, 6789, 1011, '2023-05-09', 'Luisa Fernandez', 'JKL012', 2, 14, 24, 'Nuevas observaciones', 175.5, 35.75, 'ABRAZADERA PTS ESP ', 0),
(6, 1011, 1234, '2023-05-10', 'Mario Vargas', 'MNO345', 3, 15, 25, 'Otras m?s observaciones', 225.75, 45.25, 'ABRAZADERA SIMPLE', 0),
(7, 3456, 7890, '2023-05-11', 'Carla Perez', 'PQR678', 1, 16, 26, 'Observaciones adicionales', 400.5, 75.75, 'ALINEADOR TUBO 2.5\" X 3\" X 1000', 0),
(8, 7890, 1112, '2023-05-12', 'Gabriel Rodriguez', 'STU901', 2, 17, 27, 'Otras nuevas observaciones', 125.25, 20.5, 'ALINEADOR TUBO 2.5\" X 3\" X 1200', 0),
(9, 1112, 2345, '2023-05-13', 'Andres Gomez', 'VWX234', 3, 18, 28, 'M?s y m?s observaciones', 300.75, 60.25, 'ALINEADOR TUBO 2.5\" X 3\" X 1500', 0),
(10, 4567, 8901, '2023-05-14', 'Lucia Torres', 'YZA567', 1, 19, 29, 'Observaciones varias', 250, 55, 'ALINEADOR TUBO 2.5\" X 3\" X 2000', 0),
(11, 8901, 1122, '2023-05-15', 'Javier Fernandez', 'BCD890', 2, 20, 30, 'Nuevas observaciones adicionales', 150.5, 30.75, 'ALINEADOR TUBO 2.5\" X 3\" X 2400', 0),
(12, 1122, 3456, '2023-05-16', 'Marta Vargas', 'EFG123', 3, 21, 31, 'Otras m?s y m?s observaciones', 175.75, 35.25, 'ALINEADOR TUBO 2.5\" X 3\" X 2500', 0),
(13, 3333, 2003233, '2002-05-10', 'idy-420', '', 0, 0, 0, 'las observaciones', 100000, 25, 'ALINEADOR TUBO 2.5\" X 3\" X 3000', 0),
(14, 665, 7896, '2023-05-12', 'juanes', 'RKU797', 3, 2, 1, 'Ejemplo de observacion', 140.3, 23, 'ANCLAJE DE 1?', 2),
(15, 0, 0, '0000-00-00', '', '', 0, 0, 0, '', 0, 0, 'ANCLAJE PERDIDO ', 0),
(16, 0, 0, '0000-00-00', '', '', 0, 0, 0, '', 0, 0, 'ANCLAJE PIE DE AMIGO', 0),
(17, 545, 333, '2023-05-17', '3fdgf', '', 0, 3, 0, 'fdfd', 23, 23, 'ANDAMIO DE CARGA DE 1500 X 1000', 0),
(18, 0, 100, '2023-05-12', 'goku', '', 0, 2, 0, 'ejemplo de observaciones', 22, 11, 'ANDAMIO DE CARGA DE 1500 X 500', 0),
(66672, 3322, 32323, '2017-02-08', 'alfred', 'WEW222', 0, 2, 0, 'es un ejemplo de obs', 11, 0, 'ANDAMIO DE CARGA DE 1500 X 700', 1),
(66673, 3322, 32323, '2017-02-08', 'alfred', 'WEW222', 0, 2, 0, 'es un ejemplo de obs', 11, 0, 'ANDAMIO DE CARGA DE 1500 X 700', 1),
(66674, 333, 434, '2023-05-11', 'NACHO', 'ERE333', 0, 9, 0, 'jxjxc', 1000, 333, 'es un despacho de purueba desde front', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho_linea`
--

DROP TABLE IF EXISTS `despacho_linea`;
CREATE TABLE IF NOT EXISTS `despacho_linea` (
  `id_despacho` int(11) NOT NULL AUTO_INCREMENT,
  `cod_prod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_despacho`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `e_mail` varchar(40) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `clave` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `id_cargo`, `celular`, `e_mail`, `usuario`, `clave`) VALUES
(6, 'HECTOR GONZALO SUÁREZ ', 7, '3115010236', 'hector.gonzalez@encofradosyequipos.com ', 'hector.gonzalez', ''),
(7, 'ING. SAMIR ORLANDO SÁNCHEZ VERGARA', 8, '3138692461', 'samir.sanchez@encofradosyequipos.com', 'samir.sanchez', ''),
(8, 'HENRY BERMUDEZ CÁRDENAS ', 9, '8297224495', 'henry.bermudez@encofradosyequipos.com', 'henry.bermudez', ''),
(9, 'ING. MARLIO TAFUR ', 10, '8097051266', 'marlio.tafur@encofradosyequipos.com', 'marlio.tafur', ''),
(10, 'ING. ARTURO DOMINGUEZ TELLO ', 11, '3015309154', 'arturo.dominguez@encofradosyequipos.com', 'arturo.dominguez', 'Juanes05'),
(11, 'DIEGO LOPEZ', 12, '0', 'diego.lopez@encifradosyequipos.com', 'diego.lopez', '1098V0'),
(12, 'ALEJANDRA DUSSAN', 13, '0', 'alejandro.dussan@encifradosyequipos.com', 'alejandro.dussan', '2519D9'),
(13, 'GERMAN TELLEZ', 14, '0', 'german.tellez@encifradosyequipos.com', 'german.tellez', '6213J3'),
(16, 'MARIO FONSECA', 17, '0', 'mario.fonseca@encifradosyequipos.com', 'mario.fonseca', '79C242'),
(17, 'HUMBERTO CAICEDO', 18, '0', 'humberto.caicedo@encifradosyequipos.com', 'humberto.caicedo', '300X67'),
(18, 'DAVID ROJAS', 19, '0', 'david.rojas@encifradosyequipos.com', 'david.rojas', '34R421'),
(19, 'MAYERLY VELASQUEZ', 20, '0', 'mayerly.velasquez@encifradosyequipos.com', 'mayerly.velasquez', 'F22121'),
(20, 'SOFIA VELEÑO', 21, '0', 'sofia.veleno@encifradosyequipos.com', 'sofia.veleno', '3961E8'),
(21, 'DANIEL ARTURO DOMINGUEZ LOPEZ', 4, '313987654', ' danarturo @encofradosyequipos.co', 'danarturo', '654321'),
(22, 'Probando post', 0, '5666', 'juan@gmail.com', '', ''),
(23, 'JUAN ESTEBAN DOMINGUEZ AGREGADO DESDE FR', 0, '180004206669', 'juanito@hotmail.com', '', ''),
(24, 'DIANA FERNADA LOPEZ', 0, '3163861673', 'dianalopez@yahoo.es', '', ''),
(0, 'ejempol', NULL, '33322', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_contrato`
--

DROP TABLE IF EXISTS `estado_contrato`;
CREATE TABLE IF NOT EXISTS `estado_contrato` (
  `cod_est` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) COLLATE ascii_bin NOT NULL,
  `cod_estado` bigint(20) NOT NULL,
  PRIMARY KEY (`cod_est`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `estado_contrato`
--

INSERT INTO `estado_contrato` (`cod_est`, `nombre`, `cod_estado`) VALUES
(1, 'ACTIVO', 0),
(2, 'TERMINADO', 0),
(3, 'CANCELADO', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `id_num` int(11) NOT NULL AUTO_INCREMENT,
  `per_ini` date NOT NULL,
  `per_fin` date NOT NULL,
  `cod_cont` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `porcentaje` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `num_dias` int(11) NOT NULL,
  `val_fac` float NOT NULL,
  PRIMARY KEY (`id_num`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id_num`, `per_ini`, `per_fin`, `cod_cont`, `cod_prod`, `porcentaje`, `cantidad`, `num_dias`, `val_fac`) VALUES
(343, '2008-09-01', '2008-09-15', 11, 1, 0.002, 3, 15, 7200),
(344, '2008-09-01', '2008-09-15', 11, 148, 0.002, 4, 15, 4080),
(345, '2008-09-01', '2008-09-11', 11, 149, 0.002, 5, 11, 715),
(346, '2008-09-11', '2008-09-13', 11, 149, 0.002, 3, 3, 117),
(347, '2008-09-11', '2008-09-13', 11, 35, 0.02, 7, 3, 35700),
(348, '2008-09-11', '2008-09-13', 11, 36, 0.002, 8, 3, 4416),
(349, '2008-09-13', '2008-09-15', 11, 149, 0.002, 1, 3, 39),
(350, '2008-09-13', '2008-09-15', 11, 35, 0.02, 14, 3, 71400),
(351, '2008-09-13', '2008-09-15', 11, 36, 0.002, 16, 3, 8832),
(352, '2008-09-06', '2008-09-10', 17, 1, 0.02, 1, 5, 8000),
(353, '2008-09-06', '2008-09-10', 17, 148, 0.02, 2, 5, 6800),
(354, '2008-09-06', '2008-09-10', 17, 149, 0.02, 3, 5, 1950),
(355, '2008-09-06', '2008-09-10', 17, 35, 0.02, 4, 5, 34000),
(356, '2008-09-06', '2008-09-10', 17, 36, 0.02, 5, 5, 46000),
(357, '2008-09-10', '2008-09-12', 17, 1, 0.02, 11, 3, 52800),
(358, '2008-09-10', '2008-09-12', 17, 148, 0.02, 22, 3, 44880),
(359, '2008-09-10', '2008-09-12', 17, 149, 0.02, 33, 3, 12870),
(360, '2008-09-10', '2008-09-12', 17, 35, 0.02, 44, 3, 224400),
(361, '2008-09-10', '2008-09-12', 17, 36, 0.02, 55, 3, 303600),
(362, '2008-09-12', '2008-09-15', 17, 1, 0.02, 2, 4, 12800),
(363, '2008-09-12', '2008-09-15', 17, 148, 0.02, 14, 4, 38080),
(364, '2008-09-12', '2008-09-15', 17, 149, 0.02, 26, 4, 13520),
(365, '2008-09-12', '2008-09-15', 17, 35, 0.02, 38, 4, 258400),
(366, '2008-09-12', '2008-09-15', 17, 36, 0.02, 54, 4, 397440);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `num_mov` int(11) NOT NULL AUTO_INCREMENT,
  `guia` int(11) NOT NULL,
  `cod_cont` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `tip_mov` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fec_mov` date NOT NULL,
  `nom_transp` varchar(50) NOT NULL,
  `num_cc` int(11) NOT NULL,
  `placa_veh` varchar(10) NOT NULL,
  PRIMARY KEY (`num_mov`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`num_mov`, `guia`, `cod_cont`, `cod_prod`, `tip_mov`, `cantidad`, `fec_mov`, `nom_transp`, `num_cc`, `placa_veh`) VALUES
(3, 0, 11, 1, 'SALIDA', 3, '2008-09-01', 'pedro', 1234, 'abc123'),
(4, 0, 11, 148, 'SALIDA', 4, '2008-09-01', 'pedro', 1234, 'abc123'),
(5, 0, 11, 149, 'SALIDA', 5, '2008-09-01', 'pedro', 1234, 'abc123'),
(6, 0, 11, 149, 'DEVOLUCION', 2, '2008-09-11', '', 0, ''),
(7, 0, 11, 35, 'SALIDA', 7, '2008-09-11', '', 0, ''),
(8, 0, 11, 36, 'SALIDA', 8, '2008-09-11', '', 0, ''),
(9, 0, 11, 149, 'DEVOLUCION', 2, '2008-09-13', '', 0, ''),
(10, 0, 11, 35, 'SALIDA', 7, '2008-09-13', '', 0, ''),
(11, 0, 11, 36, 'SALIDA', 8, '2008-09-13', '', 0, ''),
(12, 0, 17, 1, 'SALIDA', 1, '2008-09-06', 'pedro', 78345923, 'abc234'),
(13, 0, 17, 148, 'SALIDA', 2, '2008-09-06', 'pedro', 78345923, 'abc234'),
(14, 0, 17, 149, 'SALIDA', 3, '2008-09-06', 'pedro', 78345923, 'abc234'),
(15, 0, 17, 35, 'SALIDA', 4, '2008-09-06', 'pedro', 78345923, 'abc234'),
(16, 0, 17, 36, 'SALIDA', 5, '2008-09-06', 'pedro', 78345923, 'abc234'),
(18, 0, 17, 148, 'SALIDA', 20, '2008-09-10', '', 0, ''),
(19, 0, 17, 149, 'SALIDA', 30, '2008-09-10', '', 0, ''),
(20, 0, 17, 35, 'SALIDA', 40, '2008-09-10', '', 0, ''),
(21, 0, 17, 36, 'SALIDA', 50, '2008-09-10', '', 0, ''),
(22, 0, 17, 1, 'DEVOLUCION', 9, '2008-09-12', '', 0, ''),
(23, 0, 17, 148, 'DEVOLUCION', 8, '2008-09-12', '', 0, ''),
(24, 0, 17, 149, 'DEVOLUCION', 7, '2008-09-12', '', 0, ''),
(25, 0, 17, 35, 'DEVOLUCION', 6, '2008-09-12', '', 0, ''),
(26, 0, 17, 36, 'DEVOLUCION', 1, '2008-09-12', '', 0, ''),
(57, 987, 17, 151, 'SALIDA', 1, '2011-10-10', 'JAIME', 123, 'ABS123'),
(58, 987, 17, 152, 'DEVOLUCION', 2, '2011-10-10', 'JAIME', 123, 'ABS123'),
(59, 987, 17, 154, 'SALIDA', 3, '2011-10-10', 'JAIME', 123, 'ABS123'),
(60, 987, 17, 155, 'DEVOLUCION', 4, '2011-10-10', 'JAIME', 123, 'ABS123'),
(61, 987, 17, 156, 'SALIDA', 5, '2011-10-10', 'JAIME', 123, 'ABS123'),
(62, 987, 17, 172, 'DEVOLUCION', 6, '2011-10-10', 'JAIME', 123, 'ABS123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_usuario`
--

DROP TABLE IF EXISTS `nivel_usuario`;
CREATE TABLE IF NOT EXISTS `nivel_usuario` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(15) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `nivel_usuario`
--

INSERT INTO `nivel_usuario` (`id_nivel`, `nivel`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'SUPERVISOR'),
(3, 'ANALISTA'),
(4, 'DESPACHADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

DROP TABLE IF EXISTS `obras`;
CREATE TABLE IF NOT EXISTS `obras` (
  `cod_obra` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE ascii_bin NOT NULL,
  `fec_ini` date NOT NULL,
  `fec_fin` date DEFAULT NULL,
  `dir_obra` varchar(50) COLLATE ascii_bin NOT NULL,
  `ciudad_obra` varchar(30) COLLATE ascii_bin NOT NULL,
  `nom_ingeniero` varchar(50) COLLATE ascii_bin NOT NULL,
  `tel_obra` int(11) NOT NULL,
  `dir_entrega_fac` varchar(50) COLLATE ascii_bin NOT NULL,
  `obra` varchar(30) COLLATE ascii_bin NOT NULL,
  `estado` varchar(10) COLLATE ascii_bin NOT NULL,
  `val_metro` float NOT NULL,
  `porcentaje` float DEFAULT NULL,
  `tipo_neg` int(11) NOT NULL,
  `dir_entrega_fact` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  PRIMARY KEY (`cod_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `obras`
--

INSERT INTO `obras` (`cod_obra`, `nombre`, `fec_ini`, `fec_fin`, `dir_obra`, `ciudad_obra`, `nom_ingeniero`, `tel_obra`, `dir_entrega_fac`, `obra`, `estado`, `val_metro`, `porcentaje`, `tipo_neg`, `dir_entrega_fact`) VALUES
(2, 'NOMBRE OBRA', '2011-09-15', '2011-10-15', 'DIR OBRA', 'CIUDAD OBRA', 'NOM INGENIERO', 324543453, 'CRA 23 23 43', 'PRUWEBA', '', 1, 0.002, 3, NULL),
(3, 'NOMBRE OBRA uno', '2011-09-15', '2011-10-15', 'DIR OBRA', 'CIUDAD OBRA', 'NOM INGENIERO', 324543453, 'CRA 23 23 43', 'PRUWEBA', '', 0, 0.002, 2, NULL),
(4, 'NOMBRE OBRA dos', '2011-09-15', '2011-10-15', 'DIR OBRA', 'CIUDAD OBRA', 'NOM INGENIERO', 324543453, 'CRA 23 23 43', 'PRUWEBA', '', 0, 0.002, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_lines`
--

DROP TABLE IF EXISTS `obra_lines`;
CREATE TABLE IF NOT EXISTS `obra_lines` (
  `cod_cont_linea` int(11) NOT NULL AUTO_INCREMENT,
  `cod_obra` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`cod_cont_linea`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `obra_lines`
--

INSERT INTO `obra_lines` (`cod_cont_linea`, `cod_obra`, `cod_prod`, `cantidad`, `valor`) VALUES
(234, 3, 36, 1, ''),
(235, 3, 11, 2, ''),
(236, 3, 12, 3, ''),
(237, 3, 37, 10, ''),
(238, 3, 39, 5, ''),
(244, 4, 38, 1, ''),
(245, 4, 150, 2, ''),
(246, 4, 151, 3, ''),
(247, 4, 40, 10, ''),
(248, 4, 152, 5, ''),
(314, 2, 1, 1, ''),
(315, 2, 148, 2, ''),
(316, 2, 149, 3, ''),
(317, 2, 35, 10, ''),
(318, 2, 10, 5, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE IF NOT EXISTS `periodos` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `fec_ini` date NOT NULL,
  `fec_fin` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `fec_ini`, `fec_fin`, `estado`) VALUES
(1, '2008-09-01', '2008-09-15', 'FACTURADO'),
(2, '2008-09-16', '2008-09-30', ''),
(3, '2008-10-01', '2008-10-15', ''),
(4, '2008-10-16', '2008-10-31', ''),
(5, '2008-11-01', '2008-11-15', ''),
(6, '2008-11-16', '2008-11-30', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqr_i`
--

DROP TABLE IF EXISTS `pqr_i`;
CREATE TABLE IF NOT EXISTS `pqr_i` (
  `id_pqri` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `e_mail` varchar(40) NOT NULL,
  `obs` varchar(500) NOT NULL,
  `ofi_ori` int(11) NOT NULL,
  `fec_ori` datetime NOT NULL,
  `ofi_des` int(11) NOT NULL,
  `fec_des` datetime NOT NULL,
  `estado` varchar(15) NOT NULL,
  `num_pqr` int(11) NOT NULL,
  PRIMARY KEY (`id_pqri`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pqr_i`
--

INSERT INTO `pqr_i` (`id_pqri`, `nombre`, `empresa`, `direccion`, `telefono`, `celular`, `ciudad`, `pais`, `e_mail`, `obs`, `ofi_ori`, `fec_ori`, `ofi_des`, `fec_des`, `estado`, `num_pqr`) VALUES
(6, '', '', '', '', '', '', '', '', '', 1, '2010-11-20 19:25:27', 2, '2010-11-20 19:25:27', 'NUEVA', 1),
(7, 'jorge eliecer gomez', 'constructora vial', 'calla 55# 86-72', '2185563', '3134562318', 'bogota', 'colombia', '', 'es una empresa ala cual le falta muchas cosas por mejorar tanto en la parte administrativa como en la planta en general por lo tanto les sugiero que deben trabajar en eso y falta de personal administrativo.como en la planta.\r\n', 1, '2010-11-20 19:33:48', 2, '2010-11-20 19:33:48', 'NUEVA', 2),
(8, 'Ing. guaroa Alba', 'Constructora y servicios Guaroa Alba', 'punta cana', '', '', '', '', '', '', 1, '2011-07-21 15:49:16', 2, '2011-07-21 15:49:16', 'NUEVA', 3),
(9, 'Ing. guaroa Alba', 'Constructora y servicios Guaroa Alba', 'punta cana', '8092998706', '', 'Higuey', 'Republica Dominicana', 'guaroa_alba@hotmail.com', 'hola , buenas tarde me gustaria cotizar formaletas\r\npara columnas y porticos , hable con el ser marlio , que me dises que el es su rrepesentante el Republica Dominicana , me gustaria saber mas de su producto , espero saber pronto de ustedes por que quiero que me cotizen varios producto de ustedes\r\n  muchas gracias , guaroa alba', 1, '2011-07-21 15:53:33', 2, '2011-07-21 15:53:33', 'NUEVA', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `cod_prod` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_uni` varchar(12) NOT NULL,
  `peso_uni` int(11) NOT NULL,
  `area` float NOT NULL,
  PRIMARY KEY (`cod_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cod_prod`, `tipo`, `descripcion`, `cantidad`, `valor_uni`, `peso_uni`, `area`) VALUES
(1, 'CONCON', 'ABRAZADERA ORIENTABLE', 0, '80000', 7, 0.35),
(2, 'CONCON', 'CERCHA DE 3000', 0, '150000', 35, 0),
(3, 'CONCON', 'CRUCETA CORTA', 0, '12000', 2, 0),
(4, 'CONCON', 'CRUCETA LARGA', 0, '19000', 2, 0),
(5, 'CONCON', 'FORMALETA CILINDRICA D=1000X1000', 0, '1413000', 157, 3),
(6, 'CONCON', 'FORMALETA CILINDRICA D=1000X1670', 0, '2360000', 262, 5),
(7, 'CONCON', 'FORMALETA CILINDRICA D=1000X500', 0, '706800', 73, 1),
(8, 'CONCON', 'REPISA CONCONCRETO', 0, '680000', 135, 0),
(9, 'CONCON', 'TUBO ALMINE X 2500', 0, '32000', 17, 0),
(10, 'IMPAC', 'ANDAMIO DE CARGA DE 1500X1000', 0, '118000', 13, 0),
(11, 'IMPAC', 'ANDAMIO DE CARGA DE 1500X500', 0, '95000', 10, 0),
(12, 'IMPAC', 'ANDAMIO DE CARGA DE 1500X700', 0, '98000', 11, 0),
(13, 'IMPAC', 'DIAGONAL  AND. DE CARGA DE 1500', 0, '55000', 9, 0),
(14, 'IMPAC', 'RIOSTRA INFERIOR 1500 AC', 0, '45000', 6, 0),
(15, 'IMPAC', 'RIOSTRA SUPERIOR 1500 AC', 0, '42000', 7, 0),
(16, 'IMPAC', 'RIOSTRA SUPERIOR 1500 AA', 0, '42000', 7, 0),
(17, 'IMPAC', 'RIOSTRA INFERIOR 1500 AA', 0, '36000', 7, 0),
(18, 'IMPAC', 'RIOSTRA INFERIOR 1350 AA', 0, '36000', 6, 0),
(19, 'IMPAC', 'TACO METALICO 5 TON.', 0, '100000', 25, 0),
(20, 'IMPAC', 'TORNILLO DE 1/2 X 1 1/4', 0, '400', 0, 0),
(21, 'IMPAC', 'TORNILLO DE 1/2\" X 3\"', 0, '500', 0, 0),
(22, 'IMPAC', 'TORNILLO DE 3/8 X 2', 0, '400', 0, 0),
(23, 'IMPAC', 'TORNILLO NIVELADOR INF.600', 0, '85000', 5, 0),
(24, 'IMPAC', 'TORNILLO NIVELADOR SUP.600', 0, '98000', 5, 0),
(25, 'IMPAC', 'TORNILLO ROSCA CUADRADA D=1 1/4\" X 900mm', 0, '95000', 6, 0),
(26, 'IMPAC', 'TUERCA DE 1/2 GALV. FRIO', 0, '150', 0, 0),
(27, 'IMPAC', 'TUERCA ROSCA CUADRADA D=1 1/4\" X 900mm', 0, '8000', 0, 0),
(28, 'IMPAC', 'VIGA DOKA L= 2900', 0, '250000', 35, 0),
(29, 'IMPAC', 'VIGA I 14X27X7800', 0, '237500', 200, 0),
(30, 'IMPAC', 'VIGA I 120X65X2000', 0, '132000', 20, 0),
(31, 'IMPAC', 'VIGA I 120X65X2500', 0, '160000', 25, 0),
(32, 'IMPAC', 'VIGA TUBULAR PTS 100X100 L= 3000', 0, '122000', 28, 0),
(33, 'IMPAC', 'VIGA TUBULAR PTS 100X100 L=2500', 0, '105000', 24, 0),
(34, 'IMPAC', 'VIGA TUBULAR PTS 100X100 L=6000', 0, '187500', 56, 0),
(35, 'IMPAC', 'ANDAMIO AUTOAJUSTABLE 1350X1000', 10, '85000', 13, 10),
(36, 'IMPAC', 'ANDAMIO AUTOAJUSTABLE 1500X1000', 0, '92000', 17, 0),
(37, 'IMPAC', 'ANDAMIO DE CARGA TIPO A 1500', 0, '125000', 13, 0),
(38, 'IMPAC', 'ANDAMIO DE CARGA TIPO B 1500', 0, '125000', 13, 0),
(39, 'IMPAC', 'ANDAMIO DE FACHADA ', 0, '172000', 37, 0),
(40, 'IMPAC', 'ANDAMIO ESCUALIZABLE', 0, '370000', 45, 0),
(41, 'IMPAC', 'ANG. EXT. 2 1/2\" X 3000', 0, '45000', 13, 0),
(42, 'IMPAC', 'ESQ. INT. 150 X 150 X 2400', 0, '221760', 27, 0),
(43, 'IMPAC', 'ESQ. INT. 150 X 150 X 3000', 0, '277200', 34, 0),
(44, 'IMPAC', 'ESQ. INT. 200 X 200 X 2400', 0, '300000', 36, 0),
(45, 'IMPAC', 'ESQ. INT. 200 X 200 X 3000', 0, '369600', 45, 0),
(46, 'IMPAC', 'CAMISA Y BAYONETA NUMERO 10', 0, '10000', 0, 0),
(47, 'IMPAC', 'CAMISA Y BAYONETA NUMERO 8', 0, '7000', 0, 0),
(48, 'IMPAC', 'CHAPETA TENSORA 3/8', 0, '5500', 0, 0),
(49, 'IMPAC', 'CONECTOR PLANO DE 19', 0, '3500', 0, 0),
(50, 'IMPAC', 'CONECTOR PLANO DE 26', 0, '3500', 0, 0),
(51, 'IMPAC', 'CORBATAS M:150        (2P)', 0, '3000', 0, 0),
(52, 'IMPAC', 'CORBATAS M:150        (3P)', 0, '3000', 0, 0),
(53, 'IMPAC', 'CORBATAS M:150        (4P)', 0, '4000', 0, 0),
(54, 'IMPAC', 'CORBATAS M:200        (2P)', 0, '3500', 0, 0),
(55, 'IMPAC', 'CORBATAS M:200        (3P)', 0, '3500', 0, 0),
(56, 'IMPAC', 'CORBATAS M:200        (4P)', 0, '3500', 0, 0),
(57, 'IMPAC', 'CORBATAS M:250        (2P)', 0, '4000', 0, 0),
(58, 'IMPAC', 'CORBATAS M:250        (3P)', 0, '4000', 0, 0),
(59, 'IMPAC', 'CORBATAS M:250        (4P)', 0, '4000', 0, 0),
(60, 'IMPAC', 'CORBATAS M:300        (2P)', 0, '5000', 0, 0),
(61, 'IMPAC', 'CORBATAS M:300        (3P)', 0, '5000', 0, 0),
(62, 'IMPAC', 'CORBATAS M:300        (4P)', 0, '5000', 0, 0),
(63, 'IMPAC', 'CORBATAS M:350        (2P)', 0, '5500', 0, 0),
(64, 'IMPAC', 'CORBATAS M:350        (3P)', 0, '5500', 0, 0),
(65, 'IMPAC', 'CORBATAS M:350        (4P)', 0, '5500', 0, 0),
(66, 'IMPAC', 'CORBATAS M:400        (2P)', 0, '6000', 0, 0),
(67, 'IMPAC', 'CORBATAS M:400        (3P)', 0, '6000', 0, 0),
(68, 'IMPAC', 'CORBATAS M:400        (4P)', 0, '6000', 0, 0),
(69, 'IMPAC', 'CORBATAS M:450        (2P)', 0, '6500', 0, 0),
(70, 'IMPAC', 'CORBATAS M:450        (3P)', 0, '6500', 0, 0),
(71, 'IMPAC', 'CORBATAS M:450        (4P)', 0, '6500', 0, 0),
(72, 'IMPAC', 'CORBATAS M:500        (2P)', 0, '7000', 0, 0),
(73, 'IMPAC', 'CORBATAS M:500        (3P)', 0, '7000', 0, 0),
(74, 'IMPAC', 'CORBATAS M:500        (4P)', 0, '7000', 0, 0),
(75, 'IMPAC', 'CORBATAS M:550        (2P)', 0, '7500', 0, 0),
(76, 'IMPAC', 'CORBATAS M:550        (3P)', 0, '7500', 0, 0),
(77, 'IMPAC', 'CORBATAS M:550        (4P)', 0, '7500', 0, 0),
(78, 'IMPAC', 'CORBATAS M:600        (2P)', 0, '8000', 0, 0),
(79, 'IMPAC', 'CORBATAS M:600        (3P)', 0, '8000', 0, 0),
(80, 'IMPAC', 'CORBATAS M:600        (4P)', 0, '8000', 0, 0),
(81, 'IMPAC', 'CU', 0, '2200', 0, 0),
(82, 'IMPAC', 'CU', 0, '2200', 0, 0),
(83, 'IMPAC', 'ESCALERA EN ALUMINIO', 0, '650000', 17, 0),
(84, 'IMPAC', 'ESCALERA EN LAMINA ALFAJOR', 0, '350000', 27, 0),
(85, 'IMPAC', 'FORM. CILINDRICA D=1000 X 2400', 0, '3.375e+006', 377, 7),
(86, 'IMPAC', 'FORM. CILINDRICA D=1000 X 3000', 0, '4.23e+006', 471, 9),
(87, 'IMPAC', 'FORM. CILINDRICA D=350 X 2400', 0, '1.188e+006', 132, 2),
(88, 'IMPAC', 'FORM. CILINDRICA D=500 X 1200', 0, '904000', 94, 1),
(89, 'IMPAC', 'FORM. CILINDRICA D=500 X 2400', 0, '1.696e+006', 188, 3),
(90, 'IMPAC', 'FORM. CILINDRICA D=500 X 3000', 0, '2.12e+006', 235, 4),
(91, 'IMPAC', 'FORM. CILINDRICA D=600 X 2400', 0, '2035000', 225, 4),
(92, 'IMPAC', 'FORM. CILINDRICA D=600 X 3000', 0, '2545000', 285, 5),
(93, 'IMPAC', 'FORM. CILINDRICA D=700 X 1200', 0, '1.26e+006', 130, 2),
(94, 'IMPAC', 'FORM. CILINDRICA D=700 X 2400', 0, '2.375e+006', 265, 5),
(95, 'IMPAC', 'FORM. CILINDRICA D=700 X 3000', 0, '2.968e+006', 330, 6),
(96, 'IMPAC', 'FORM. CILINDRICA D=800 X 2400', 0, '2.7e+006', 300, 6),
(97, 'IMPAC', 'FORM. CILINDRICA D=800 X 3000', 0, '3.4e+006', 375, 7),
(98, 'IMPAC', 'FORM. CILINDRICA D=900 X 2400', 0, '3.05e+006', 340, 6),
(99, 'IMPAC', 'FORM. CILINDRICA D=900 X 3000', 0, '3.8e+006', 425, 8),
(100, 'IMPAC', 'GATO TENSOR 3/8', 0, '52000', 3, 0),
(101, 'IMPAC', 'MENSULA APOYO PTS NO.2', 0, '16700', 5, 0),
(102, 'IMPAC', 'MENSULA DE APOYO VIGA  NO. 1', 0, '150000', 32, 0),
(103, 'IMPAC', 'PLATINA DE 100X190X1/2\"', 0, '5300', 1, 0),
(104, 'IMPAC', 'PLATINA DE 150X150X1/2\"', 0, '6350', 2, 0),
(105, 'IMPAC', 'PLATINA DE 85X100X3/8', 0, '7200', 0, 0),
(106, 'IMPAC', 'RIOSTRA INFERIOR 1350A.A.', 0, '42000', 6, 0),
(107, 'IMPAC', 'RIOSTRA INFERIOR 1500 A.A.', 0, '42000', 7, 0),
(108, 'IMPAC', 'RIOSTRA SUPERIOR 1350 A.A.', 0, '42000', 6, 0),
(109, 'IMPAC', 'RIOSTRA SUPERIOR 1500 A.A.', 0, '42000', 7, 0),
(110, 'IMPAC', 'SACACORBATA DE GOLPE', 0, '68000', 8, 0),
(111, 'IMPAC', 'SACACORBATA DE TORNILLO', 0, '120000', 23, 0),
(112, 'IMPAC', 'SOP. ALINEADOR', 0, '12000', 0, 0),
(113, 'IMPAC', 'SOPORTE TACO', 0, '12000', 0, 0),
(114, 'IMPAC', 'TABLERO DE MURO 100 X 2400', 0, '124000', 19, 0),
(115, 'IMPAC', 'TABLERO DE MURO 100 X 3000', 0, '142000', 22, 0),
(116, 'IMPAC', 'TABLERO DE MURO 150 X 2400', 0, '124000', 23, 0),
(117, 'IMPAC', 'TABLERO DE MURO 150 X 3000', 0, '142000', 27, 0),
(118, 'IMPAC', 'TABLERO DE MURO 200 X 2400', 0, '124000', 27, 0),
(119, 'IMPAC', 'TABLERO DE MURO 200 X 3000', 0, '142000', 36, 0),
(120, 'IMPAC', 'TABLERO DE MURO 250 X 2400', 0, '124000', 34, 0),
(121, 'IMPAC', 'TABLERO DE MURO 250 X 3000', 0, '142000', 40, 0),
(122, 'IMPAC', 'TABLERO DE MURO 300 X 2400', 0, '245000', 37, 0),
(123, 'IMPAC', 'TABLERO DE MURO 300 X 3000', 0, '245000', 44, 0),
(124, 'IMPAC', 'TABLERO DE MURO 350 X 2400', 0, '245000', 43, 0),
(125, 'IMPAC', 'TABLERO DE MURO 350 X 3000', 0, '245000', 51, 1),
(126, 'IMPAC', 'TABLERO DE MURO 400 X 2400', 0, '321000', 46, 0),
(127, 'IMPAC', 'TABLERO DE MURO 400 X 3000', 0, '321000', 55, 1),
(128, 'IMPAC', 'TABLERO DE MURO 450 X 2400', 0, '321000', 50, 1),
(129, 'IMPAC', 'TABLERO DE MURO 450 X 3000', 0, '321000', 59, 1),
(130, 'IMPAC', 'TABLERO DE MURO 500 X 2400', 0, '336000', 53, 1),
(131, 'IMPAC', 'TABLERO DE MURO 550 X 2400', 0, '370000', 64, 1),
(132, 'IMPAC', 'TABLERO DE MURO 550 X 3000', 0, '462000', 77, 1),
(133, 'IMPAC', 'TABLERO DE MURO 600 X 3000', 0, '504000', 81, 1),
(134, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X1800', 0, '72500', 15, 0),
(135, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X2000', 0, '92000', 17, 0),
(136, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X3000', 0, '122000', 25, 0),
(137, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X3630', 0, '114100', 30, 0),
(138, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X3630', 0, '142000', 30, 0),
(139, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X4000', 0, '142000', 34, 0),
(140, 'IMPAC', 'VIGA  TUBULAR PTS 90X90X6000', 0, '182000', 51, 0),
(141, 'IMPAC', 'VIGA EN I 120X65  L=2000', 0, '132000', 20, 0),
(142, 'IMPAC', 'VIGA EN I 120X65  L=2500', 0, '160000', 25, 0),
(143, 'IMPAC', 'VIGA IPE 270 X 6800', 0, '747500', 299, 0),
(144, 'IMPAC', 'VIGA IPE 270 X 6800', 0, '420000', 299, 0),
(145, 'IMPAC', 'VIGA S DE 8\" X 6000', 0, '375000', 150, 0),
(146, 'MATRIX', 'MENSULA APOYO PTS NO.3', 0, '42000', 5, 0),
(147, 'MATRIX', 'MENSULA APOYO PTS NO.3', 0, '42000', 5, 0),
(148, 'MATRIX', 'ABRAZADERA P/TACO METALICO', 0, '34000', 6, 0),
(149, 'MATRIX', 'ALINEADOR DE PERFORACION', 0, '6500', 0, 0),
(150, 'MATRIX', 'ANDAMIO DE FACHADA', 0, '135000', 22, 0),
(151, 'MATRIX', 'ANDAMIO DE TABLERO', 0, '125000', 19, 0),
(152, 'MATRIX', 'ANG. ALINEADOR L=1000', 0, '21000', 6, 0),
(153, 'MATRIX', 'ANG. ALINEADOR L=1500', 0, '31000', 9, 0),
(154, 'MATRIX', 'ANG. ALINEADOR L=2000', 0, '42000', 12, 0),
(155, 'MATRIX', 'ANG. ALINEADOR L=2500', 0, '52500', 15, 0),
(156, 'MATRIX', 'ANG. ALINEADOR L=3000', 0, '63000', 18, 0),
(157, 'MATRIX', 'ANG. ALINEADOR L=3500', 0, '73000', 21, 0),
(158, 'MATRIX', 'ANG. ALINEADOR L=4000', 0, '84000', 24, 0),
(159, 'MATRIX', 'ANG. ALINEADOR L=4500', 0, '90000', 27, 0),
(160, 'MATRIX', 'ANG. ALINEADOR L=5000', 0, '100000', 30, 0),
(161, 'MATRIX', 'ANG. ALINEADOR L=5500', 0, '110000', 33, 0),
(162, 'MATRIX', 'ANG. ALINEADOR L=6000', 0, '120000', 36, 0),
(163, 'MATRIX', 'ANG. EXT. 50 X 1300', 0, '25000', 4, 0),
(164, 'MATRIX', 'ANG. EXT. 50 X 2300', 0, '45000', 8, 0),
(165, 'MATRIX', 'ANG. EXT. 50 X 2350', 0, '45000', 8, 0),
(166, 'MATRIX', 'ANG. EXT. 50 X 2400', 0, '45000', 8, 0),
(167, 'MATRIX', 'ANG. EXT. 50 X 2500', 0, '45000', 9, 0),
(168, 'MATRIX', 'ANG. EXT. 50 X 600', 0, '17000', 2, 0),
(169, 'MATRIX', 'SOPORTE CORBATA  AND. FACHADA', 0, '10000', 0, 0),
(170, 'MATRIX', 'BASE PUNTAL PLOMADOR N1-N2', 0, '25000', 2, 0),
(171, 'MATRIX', 'BORDE DE LOSA DE 200 X 1000', 0, '50000', 8, 0),
(172, 'MATRIX', 'BORDE DE LOSA DE 200 X 1500', 0, '75000', 12, 0),
(173, 'MATRIX', 'BORDE DE LOSA DE 200 X 1600', 0, '75000', 12, 0),
(174, 'MATRIX', 'BORDE DE LOSA DE 200 X 2000', 0, '100000', 14, 0),
(175, 'MATRIX', 'BORDE DE LOSA DE 200 X 2400', 0, '120000', 17, 0),
(176, 'MATRIX', 'BORDE DE LOSA DE 200 X 800', 0, '40000', 5, 0),
(177, 'MATRIX', 'CONECTOR PLANO', 0, '2500', 0, 0),
(178, 'MATRIX', 'CORBATAS M:100 (L=205)', 0, '2500', 0, 0),
(179, 'MATRIX', 'CORBATAS M:120 (L=225)', 0, '2500', 0, 0),
(180, 'MATRIX', 'CORBATAS M:125 (L=230)', 0, '2500', 0, 0),
(181, 'MATRIX', 'CORBATAS M:150 (L=255)', 0, '2500', 0, 0),
(182, 'MATRIX', 'CORBATAS M:200 (L=305)', 0, '3500', 0, 0),
(183, 'MATRIX', 'CORBATAS M:250 (L=355)', 0, '3500', 0, 0),
(184, 'MATRIX', 'CORBATAS M:300 (L=405)', 0, '4000', 0, 0),
(185, 'MATRIX', 'CORBATAS M:350 (L=455)', 0, '4000', 0, 0),
(186, 'MATRIX', 'CORBATAS M:400 (L=505)', 0, '5000', 0, 0),
(187, 'MATRIX', 'CORBATAS M:450 (L=555)', 0, '5500', 0, 0),
(188, 'MATRIX', 'CORBATAS M:500 (L=605)', 0, '6000', 0, 0),
(189, 'MATRIX', 'CORBATAS M:550 (L=655)', 0, '6500', 0, 0),
(190, 'MATRIX', 'CORBATAS M:600 (L=705)', 0, '7000', 0, 0),
(191, 'MATRIX', 'CORBATAS M:75 (L=180)', 0, '2500', 0, 0),
(192, 'MATRIX', 'CORBATAS M:80 (L=185)', 0, '2500', 0, 0),
(193, 'MATRIX', 'CORBATAS M:90 (L=195)', 0, '2000', 0, 0),
(194, 'MATRIX', 'CU', 0, '2500', 0, 0),
(195, 'MATRIX', 'ESQUINERO INTERIOR 100 X 100 X 600', 0, '68000', 4, 0),
(196, 'MATRIX', 'ESQUINERO INTERIOR 100X100X1300', 0, '138000', 11, 0),
(197, 'MATRIX', 'ESQUINERO INTERIOR 100X100X2200', 0, '237000', 19, 0),
(198, 'MATRIX', 'ESQUINERO INTERIOR 100X100X2300', 0, '237000', 19, 0),
(199, 'MATRIX', 'ESQUINERO INTERIOR 100X100X2350', 0, '237000', 19, 0),
(200, 'MATRIX', 'ESQUINERO INTERIOR 100X100X2400', 0, '237000', 20, 0),
(201, 'MATRIX', 'ESQUINERO INTERIOR 100X100X2500', 0, '237000', 22, 0),
(202, 'MATRIX', 'ESQUINERO INTERIOR 150X150X1300', 0, '138000', 12, 0),
(203, 'MATRIX', 'ESQUINERO INTERIOR 150X150X2300', 0, '237000', 32, 0),
(204, 'MATRIX', 'MENSULA APOYO PTS NO.3', 0, '42000', 3, 0),
(205, 'MATRIX', 'MENSULA APOYO PTS NO.4', 0, '42000', 3, 0),
(206, 'MATRIX', 'NERVIO DE 100X1000', 0, '105000', 27, 0),
(207, 'MATRIX', 'NERVIO DE 100X1050', 0, '110000', 27, 0),
(208, 'MATRIX', 'NERVIO DE 100X1100', 0, '115000', 28, 0),
(209, 'MATRIX', 'NERVIO DE 100X1150', 0, '120000', 28, 0),
(210, 'MATRIX', 'NERVIO DE 100X1200', 0, '130000', 29, 0),
(211, 'MATRIX', 'NERVIO DE 100X1250', 0, '130000', 30, 0),
(212, 'MATRIX', 'NERVIO DE 100X1280', 0, '135000', 30, 0),
(213, 'MATRIX', 'NERVIO DE 100X1300', 0, '140000', 30, 0),
(214, 'MATRIX', 'NERVIO DE 100X1350', 0, '140000', 31, 0),
(215, 'MATRIX', 'NERVIO DE 100X1400', 0, '145000', 31, 0),
(216, 'MATRIX', 'NERVIO DE 100X1410', 0, '145000', 31, 0),
(217, 'MATRIX', 'NERVIO DE 100X1450', 0, '150000', 32, 0),
(218, 'MATRIX', 'NERVIO DE 100X1500', 0, '155000', 32, 0),
(219, 'MATRIX', 'NERVIO DE 100X1550', 0, '160000', 33, 0),
(220, 'MATRIX', 'NERVIO DE 100X1600', 0, '165000', 33, 0),
(221, 'MATRIX', 'NERVIO DE 100X1750', 0, '180000', 36, 0),
(222, 'MATRIX', 'NERVIO DE 100X500', 0, '60000', 11, 0),
(223, 'MATRIX', 'NERVIO DE 100X550', 0, '60000', 11, 0),
(224, 'MATRIX', 'NERVIO DE 100X600', 0, '60000', 12, 0),
(225, 'MATRIX', 'NERVIO DE 100X700', 0, '80000', 14, 0),
(226, 'MATRIX', 'NERVIO DE 100X750', 0, '80000', 15, 0),
(227, 'MATRIX', 'NERVIO DE 100X800', 0, '90000', 16, 0),
(228, 'MATRIX', 'NERVIO DE 100X850', 0, '90000', 17, 0),
(229, 'MATRIX', 'NERVIO DE 100X900', 0, '95000', 18, 0),
(230, 'MATRIX', 'NERVIO DE 100X925', 0, '95000', 19, 0),
(231, 'MATRIX', 'NERVIO DE 100X950', 0, '100000', 20, 0),
(232, 'MATRIX', 'NERVIO DE 120 X 1300', 0, '140000', 34, 0),
(233, 'MATRIX', 'NERVIO DE 120 X 1400', 0, '145000', 36, 0),
(234, 'MATRIX', 'NERVIO DE 120 X 700', 0, '80000', 16, 0),
(235, 'MATRIX', 'NERVIO DE 120 X 500', 0, '57200', 11, 0),
(236, 'MATRIX', 'NERVIO DE 120 X 600', 0, '68000', 13, 0),
(237, 'MATRIX', 'NERVIO DE 120 X 1000', 0, '114000', 22, 0),
(238, 'MATRIX', 'NERVIO DE 80X1000', 0, '105000', 25, 0),
(239, 'MATRIX', 'NERVIO DE 80X1100', 0, '115000', 26, 0),
(240, 'MATRIX', 'NERVIO DE 80X1200', 0, '125000', 28, 0),
(241, 'MATRIX', 'NERVIO DE 80X1250', 0, '130000', 29, 0),
(242, 'MATRIX', 'NERVIO DE 80X1300', 0, '135000', 30, 0),
(243, 'MATRIX', 'NERVIO DE 80X1350', 0, '140000', 30, 0),
(244, 'MATRIX', 'NERVIO DE 80X1400', 0, '145000', 31, 0),
(245, 'MATRIX', 'NERVIO DE 80X1600', 0, '165000', 32, 0),
(246, 'MATRIX', 'NERVIO DE 80X600', 0, '65000', 15, 0),
(247, 'MATRIX', 'NERVIO DE 80X650', 0, '70000', 16, 0),
(248, 'MATRIX', 'NERVIO DE 80X700', 0, '75000', 17, 0),
(249, 'MATRIX', 'NERVIO DE 80X800', 0, '85000', 20, 0),
(250, 'MATRIX', 'NERVIO DE 80X850', 0, '90000', 16, 0),
(251, 'MATRIX', 'NERVIO DE 80X900', 0, '95000', 17, 0),
(252, 'MATRIX', 'NERVIO DE 80X950', 0, '100000', 19, 0),
(253, 'MATRIX', 'NERVIO DE 100X550 h=50', 0, '60000', 11, 0),
(254, 'MATRIX', 'NERVIO DE 100X600 h=50', 0, '60000', 12, 0),
(255, 'MATRIX', 'NERVIO DE 100X650 h=50', 0, '60000', 13, 0),
(256, 'MATRIX', 'NERVIO DE 100X700 h=50', 0, '80000', 14, 0),
(257, 'MATRIX', 'NERVIO DE 100X750 h=50', 0, '80000', 15, 0),
(258, 'MATRIX', 'NERVIO DE 100X800 h=50', 0, '90000', 16, 0),
(259, 'MATRIX', 'NERVIO DE 100X900 h=50', 0, '95000', 18, 0),
(260, 'MATRIX', 'NERVIO DE 100X950 h=50', 0, '100000', 20, 0),
(261, 'MATRIX', 'NERVIO DE 100X1000 h=50', 0, '105000', 27, 0),
(262, 'MATRIX', 'NERVIO DE 100X1100 h=50', 0, '115000', 28, 0),
(263, 'MATRIX', 'NERVIO DE 100X1150 h=50', 0, '120000', 28, 0),
(264, 'MATRIX', 'NERVIO DE 100X1200 h=50', 0, '130000', 29, 0),
(265, 'MATRIX', 'NERVIO DE 100X1300 h=50', 0, '140000', 30, 0),
(266, 'MATRIX', 'NERVIO DE 100X1350 h=50', 0, '140000', 31, 0),
(267, 'MATRIX', 'NERVIO DE 100X1400 h=50', 0, '145000', 31, 0),
(268, 'MATRIX', 'NERVIO DE 100X1450 h=50', 0, '150000', 32, 0),
(269, 'MATRIX', 'NERVIO DE 100X1500 h=50', 0, '155000', 32, 1),
(270, 'MATRIX', 'NERVIO DE 100X1600 h=50', 0, '165000', 33, 0),
(271, 'MATRIX', 'PARAL ANDAMIO DE FACHADA', 0, '12000', 6, 0),
(272, 'MATRIX', 'PIN GRAPA', 0, '7500', 0, 0),
(273, 'MATRIX', 'POSICIONADOR DE CONECTOR', 0, '23000', 3, 0),
(274, 'MATRIX', 'PUNTAL DOBLE ACCION TIPO A', 0, '165000', 19, 0),
(275, 'MATRIX', 'PUNTAL DOBLE ACCION TIPO B', 0, '155500', 19, 0),
(276, 'MATRIX', 'PUNTAL DOBLE ACCION TIPO C', 0, '155500', 19, 0),
(277, 'MATRIX', 'PUNTAL PLOMADOR N2 ALTO 5M.', 0, '465000', 61, 0),
(278, 'MATRIX', 'PUNTAL PLOMADOR NI  ALTO 2,5M', 0, '170000', 12, 0),
(279, 'MATRIX', 'SACA CORBATAS', 0, '68000', 17, 0),
(280, 'MATRIX', 'SACA TAPAS', 0, '110000', 8, 0),
(281, 'MATRIX', 'SACA TELERA', 0, '78000', 12, 0),
(282, 'MATRIX', 'SACA VIGA', 0, '110000', 17, 0),
(283, 'MATRIX', 'SACACORBATA', 0, '68000', 8, 0),
(284, 'MATRIX', 'SOPORTE  ALINEADOR 2', 0, '24000', 0, 0),
(285, 'MATRIX', 'SOPORTE ALINEADOR 1', 0, '12000', 0, 0),
(286, 'MATRIX', 'APOYO TACO METALICO', 0, '8500', 0, 0),
(287, 'MATRIX', 'TABLERO DE MURO  100 X 2400', 0, '156000', 18, 0),
(288, 'MATRIX', 'TABLERO DE MURO 100 X 1300', 0, '138000', 5, 0),
(289, 'MATRIX', 'TABLERO DE MURO 100 X 2300', 0, '156000', 17, 0),
(290, 'MATRIX', 'TABLERO DE MURO 100 X 2350', 0, '156000', 17, 0),
(291, 'MATRIX', 'TABLERO DE MURO 100 X 2500', 0, '156000', 18, 0),
(292, 'MATRIX', 'TABLERO DE MURO 100 X 600', 0, '58000', 2, 0),
(293, 'MATRIX', 'TABLERO DE MURO 150 X 1300', 0, '138000', 8, 0),
(294, 'MATRIX', 'TABLERO DE MURO 150 X 2300', 0, '172000', 20, 0),
(295, 'MATRIX', 'TABLERO DE MURO 150 X 2400', 0, '172000', 21, 0),
(296, 'MATRIX', 'TABLERO DE MURO 150 X 2500', 0, '172000', 23, 0),
(297, 'MATRIX', 'TABLERO DE MURO 150 X 600', 0, '58000', 3, 0),
(298, 'MATRIX', 'TABLERO DE MURO 175 X 2300', 0, '172000', 22, 0),
(299, 'MATRIX', 'TABLERO DE MURO 175 X 2400', 0, '172000', 23, 0),
(300, 'MATRIX', 'TABLERO DE MURO 175 X 2500', 0, '172000', 24, 0),
(301, 'MATRIX', 'TABLERO DE MURO 180 X 1300', 0, '138000', 10, 0),
(302, 'MATRIX', 'TABLERO DE MURO 180 X 2200', 0, '172000', 21, 0),
(303, 'MATRIX', 'TABLERO DE MURO 180 X 2300', 0, '172000', 22, 0),
(304, 'MATRIX', 'TABLERO DE MURO 180 X 2400', 0, '172000', 25, 0),
(305, 'MATRIX', 'TABLERO DE MURO 180 X 2500', 0, '172000', 26, 0),
(306, 'MATRIX', 'TABLERO DE MURO 200 X 1300', 0, '138000', 11, 0),
(307, 'MATRIX', 'TABLERO DE MURO 200 X 2300', 0, '172000', 24, 0),
(308, 'MATRIX', 'TABLERO DE MURO 200 X 2350', 0, '172000', 25, 0),
(309, 'MATRIX', 'TABLERO DE MURO 200 X 2400', 0, '172000', 26, 0),
(310, 'MATRIX', 'TABLERO DE MURO 200 X 2500', 0, '172000', 27, 0),
(311, 'MATRIX', 'TABLERO DE MURO 200 X 600', 0, '58000', 5, 0),
(312, 'MATRIX', 'TABLERO DE MURO 220 X 2300', 0, '172000', 26, 0),
(313, 'MATRIX', 'TABLERO DE MURO 220 X 2400', 0, '126500', 27, 0),
(314, 'MATRIX', 'TABLERO DE MURO 220 X 600', 0, '58000', 5, 0),
(315, 'MATRIX', 'TABLERO DE MURO 225 X 2300', 0, '172000', 27, 0),
(316, 'MATRIX', 'TABLERO DE MURO 225 X 2350', 0, '172000', 28, 0),
(317, 'MATRIX', 'TABLERO DE MURO 225 X 600', 0, '58000', 5, 0),
(318, 'MATRIX', 'TABLERO DE MURO 250 X 1300', 0, '145000', 14, 0),
(319, 'MATRIX', 'TABLERO DE MURO 250 X 2300', 0, '202000', 28, 0),
(320, 'MATRIX', 'TABLERO DE MURO 250 X 2350', 0, '202000', 29, 0),
(321, 'MATRIX', 'TABLERO DE MURO 250 X 2400', 0, '202000', 30, 0),
(322, 'MATRIX', 'TABLERO DE MURO 250 X 2500', 0, '202000', 32, 0),
(323, 'MATRIX', 'TABLERO DE MURO 250 X 2550', 0, '226000', 33, 0),
(324, 'MATRIX', 'TABLERO DE MURO 250 X 600', 0, '58000', 6, 0),
(325, 'MATRIX', 'TABLERO DE MURO 275 X 2300', 0, '202000', 29, 0),
(326, 'MATRIX', 'TABLERO DE MURO 275 X 2500', 0, '202000', 32, 0),
(327, 'MATRIX', 'TABLERO DE MURO 280 X 2300', 0, '202000', 29, 0),
(328, 'MATRIX', 'TABLERO DE MURO 280 X 2400', 0, '202000', 31, 0),
(329, 'MATRIX', 'TABLERO DE MURO 280 X 2500', 0, '202000', 33, 0),
(330, 'MATRIX', 'TABLERO DE MURO 280 X 600', 0, '58000', 7, 0),
(331, 'MATRIX', 'TABLERO DE MURO 300 X 1300', 0, '145000', 16, 0),
(332, 'MATRIX', 'TABLERO DE MURO 300 X 2300', 0, '230000', 32, 0),
(333, 'MATRIX', 'TABLERO DE MURO 300 X 2350', 0, '230000', 33, 0),
(334, 'MATRIX', 'TABLERO DE MURO 300 X 2400', 0, '230000', 34, 0),
(335, 'MATRIX', 'TABLERO DE MURO 300 X 2500', 0, '230000', 35, 0),
(336, 'MATRIX', 'TABLERO DE MURO 300 X 2550', 0, '230000', 36, 0),
(337, 'MATRIX', 'TABLERO DE MURO 300 X 600', 0, '58000', 8, 0),
(338, 'MATRIX', 'TABLERO DE MURO 320 X 2300', 0, '243000', 33, 0),
(339, 'MATRIX', 'TABLERO DE MURO 325 X 2300', 0, '243000', 34, 0),
(340, 'MATRIX', 'TABLERO DE MURO 325 X 2500', 0, '243000', 35, 0),
(341, 'MATRIX', 'TABLERO DE MURO 350 X 1300', 0, '145000', 19, 0),
(342, 'MATRIX', 'TABLERO DE MURO 350 X 2300', 0, '243000', 35, 0),
(343, 'MATRIX', 'TABLERO DE MURO 350 X 2350', 0, '243000', 36, 0),
(344, 'MATRIX', 'TABLERO DE MURO 350 X 2400', 0, '243000', 37, 0),
(345, 'MATRIX', 'TABLERO DE MURO 350 X 2500', 0, '243000', 38, 0),
(346, 'MATRIX', 'TABLERO DE MURO 350 X 600', 0, '76000', 9, 0),
(347, 'MATRIX', 'TABLERO DE MURO 400 X 1300', 0, '158000', 22, 0),
(348, 'MATRIX', 'TABLERO DE MURO 400 X 2300', 0, '268000', 37, 0),
(349, 'MATRIX', 'TABLERO DE MURO 400 X 2350', 0, '268000', 38, 0),
(350, 'MATRIX', 'TABLERO DE MURO 400 X 2400', 0, '268000', 39, 0),
(351, 'MATRIX', 'TABLERO DE MURO 400 X 2550', 0, '268000', 42, 1),
(352, 'MATRIX', 'TABLERO DE MURO 400 X 600', 0, '75000', 10, 0),
(353, 'MATRIX', 'TABLERO DE MURO 400X600', 0, '72000', 10, 0),
(354, 'MATRIX', 'TABLERO DE MURO 450 X 1300', 0, '183000', 24, 0),
(355, 'MATRIX', 'TABLERO DE MURO 450 X 2300', 0, '302000', 41, 1),
(356, 'MATRIX', 'TABLERO DE MURO 450 X 2350', 0, '302000', 43, 1),
(357, 'MATRIX', 'TABLERO DE MURO 450 X 2400', 0, '302000', 44, 1),
(358, 'MATRIX', 'TABLERO DE MURO 450 X 2500', 0, '302000', 45, 1),
(359, 'MATRIX', 'TABLERO DE MURO 450 X 2550', 0, '302000', 46, 1),
(360, 'MATRIX', 'TABLERO DE MURO 450 X 600', 0, '84000', 11, 0),
(361, 'MATRIX', 'TABLERO DE MURO 500 X 1300', 0, '170000', 31, 0),
(362, 'MATRIX', 'TABLERO DE MURO 500 X 2300', 0, '316000', 42, 1),
(363, 'MATRIX', 'TABLERO DE MURO 500 X 2350', 0, '316000', 44, 1),
(364, 'MATRIX', 'TABLERO DE MURO 500 X 2400', 0, '316000', 45, 1),
(365, 'MATRIX', 'TABLERO DE MURO 500 X 2450', 0, '316000', 46, 1),
(366, 'MATRIX', 'TABLERO DE MURO 500 X 2500', 0, '326000', 47, 1),
(367, 'MATRIX', 'TABLERO DE MURO 500 X 2550', 0, '326000', 48, 1),
(368, 'MATRIX', 'TABLERO DE MURO 500 X 600', 0, '78000', 12, 0),
(369, 'MATRIX', 'TABLERO DE MURO 550 X 1300', 0, '186000', 31, 0),
(370, 'MATRIX', 'TABLERO DE MURO 550 X 2300', 0, '344000', 54, 1),
(371, 'MATRIX', 'TABLERO DE MURO 550 X 2400', 0, '344000', 54, 1),
(372, 'MATRIX', 'TABLERO DE MURO 600 X 1300', 0, '203000', 33, 0),
(373, 'MATRIX', 'TABLERO DE MURO 600 X 2300', 0, '386000', 56, 1),
(374, 'MATRIX', 'TABLERO DE MURO 600 X 2400', 0, '386000', 59, 1),
(375, 'MATRIX', 'TAPA MURO DE 100 X 2400', 0, '148000', 10, 0),
(376, 'MATRIX', 'TAPA MURO DE 185 X 2250', 0, '147000', 14, 0),
(377, 'MATRIX', 'TAPA MURO DE 185 X 2250', 0, '147000', 14, 0),
(378, 'MATRIX', 'TAPA MURO DE 185 X 2300', 0, '147000', 14, 0),
(379, 'MATRIX', 'TAPA MURO DE 185 X 2400', 0, '147000', 16, 0),
(380, 'MATRIX', 'TAPA MURO DE 185 X 2500', 0, '147000', 17, 0),
(381, 'MATRIX', 'TAPA MURO DE 100 X 2100', 0, '147000', 16, 0),
(382, 'MATRIX', 'TAPA MURO DE 100 X 2200', 0, '147000', 17, 0),
(383, 'MATRIX', 'TAPA MURO DE 100 X 2300', 0, '147000', 9, 0),
(384, 'MATRIX', 'TAPA MURO DE 100 X 2350', 0, '156000', 8, 0),
(385, 'MATRIX', 'TAPA MURO DE 100 X 2500', 0, '156000', 11, 0),
(386, 'MATRIX', 'TAPA MURO DE 120 X 2100', 0, '147000', 17, 0),
(387, 'MATRIX', 'TAPA MURO DE 120 X 2200', 0, '156000', 9, 0),
(388, 'MATRIX', 'TAPA MURO DE 120 X 2300', 0, '156000', 9, 0),
(389, 'MATRIX', 'TAPA MURO DE 120 X 2350', 0, '156000', 12, 0),
(390, 'MATRIX', 'TAPA MURO DE 120 X 2400', 0, '156000', 12, 0),
(391, 'MATRIX', 'TAPA MURO DE 125 X 2100', 0, '156000', 17, 0),
(392, 'MATRIX', 'TAPA MURO DE 125 X 2200', 0, '156000', 18, 0),
(393, 'MATRIX', 'TAPA MURO DE 125 X 2300', 0, '156000', 19, 0),
(394, 'MATRIX', 'TAPA MURO DE 125 X 2350', 0, '156000', 19, 0),
(395, 'MATRIX', 'TAPA MURO DE 125 X 2550', 0, '156000', 20, 0),
(396, 'MATRIX', 'TAPA MURO DE 250 X 2300', 0, '222400', 28, 0),
(397, 'MATRIX', 'TAPA MURO DE 150 X 2100', 0, '166200', 18, 0),
(398, 'MATRIX', 'TAPA MURO DE 150 X 2200', 0, '166000', 19, 0),
(399, 'MATRIX', 'TAPA MURO DE 150 X 2300', 0, '166000', 21, 0),
(400, 'MATRIX', 'TAPA MURO DE 150 X 2350', 0, '166200', 12, 0),
(401, 'MATRIX', 'TAPA MURO DE 150 X 2400', 0, '166200', 12, 0),
(402, 'MATRIX', 'TAPA MURO DE 150 X 600', 0, '60000', 3, 0),
(403, 'MATRIX', 'TAPA MURO DE 200 X 2100', 0, '192000', 22, 0),
(404, 'MATRIX', 'TAPA MURO DE 200 X 2200', 0, '198250', 23, 0),
(405, 'MATRIX', 'TAPA MURO DE 200 X 2300', 0, '192000', 25, 0),
(406, 'MATRIX', 'TAPA MURO DE 200 X 2400', 0, '198250', 23, 0),
(407, 'MATRIX', 'TAPA MURO DE 250 X 2100', 0, '220000', 26, 0),
(408, 'MATRIX', 'TAPA MURO DE 250 X 2200', 0, '220000', 27, 0),
(409, 'MATRIX', 'TAPA MURO DE 300 X 2200', 0, '245000', 28, 0),
(410, 'MATRIX', 'TAPA MURO DE 75 X 2100', 0, '147000', 15, 0),
(411, 'MATRIX', 'TAPA MURO DE 75 X 2200', 0, '156000', 15, 0),
(412, 'MATRIX', 'TAPA MURO DE 75 X 2300', 0, '1.47e+006', 15, 0),
(413, 'MATRIX', 'TAPA MURO DE 80 X 2200', 0, '165000', 12, 0),
(414, 'MATRIX', 'TAPA MURO DE 80 X 2300', 0, '147000', 13, 0),
(415, 'MATRIX', 'TELERA 1100 X 1100', 0, '322000', 41, 1),
(416, 'MATRIX', 'TELERA 1000 X 1000', 0, '267000', 34, 6),
(417, 'MATRIX', 'TELERA 1000 X 700', 0, '203000', 25, 0),
(418, 'MATRIX', 'TELERA 1000 X 750', 0, '218000', 26, 0),
(419, 'MATRIX', 'TELERA 1000 X 800', 0, '232000', 28, 0),
(420, 'MATRIX', 'TELERA 1000 X 850', 0, '249000', 30, 0),
(421, 'MATRIX', 'TELERA 1000 X 900', 0, '266000', 31, 0),
(422, 'MATRIX', 'TELERA 1000 X 950', 0, '266000', 33, 0),
(423, 'MATRIX', 'TELERA 1100 X 900', 0, '266000', 33, 0),
(424, 'MATRIX', 'TELERA 500 X 350', 0, '50000', 13, 0),
(425, 'MATRIX', 'TELERA 500 X 450', 0, '50000', 14, 0),
(426, 'MATRIX', 'TELERA 500 X 500', 0, '72000', 15, 0),
(427, 'MATRIX', 'TELERA 550 X 350', 0, '72000', 12, 0),
(428, 'MATRIX', 'TELERA 550 X 400', 0, '72000', 13, 0),
(429, 'MATRIX', 'TELERA 550 X 450', 0, '72000', 14, 0),
(430, 'MATRIX', 'TELERA 550 X 500', 0, '72000', 15, 0),
(431, 'MATRIX', 'TELERA 550 X 550', 0, '72000', 16, 0),
(432, 'MATRIX', 'TELERA 600 X 350', 0, '72000', 14, 0),
(433, 'MATRIX', 'TELERA 600 X 400', 0, '72000', 15, 0),
(434, 'MATRIX', 'TELERA 600 X 450', 0, '72000', 14, 0),
(435, 'MATRIX', 'TELERA 600 X 500', 0, '104000', 16, 0),
(436, 'MATRIX', 'TELERA 600 X 550', 0, '104000', 17, 0),
(437, 'MATRIX', 'TELERA 600 X 600', 0, '104000', 18, 0),
(438, 'MATRIX', 'TELERA 700 X 300', 0, '104000', 15, 0),
(439, 'MATRIX', 'TELERA 700 X 350', 0, '104000', 16, 0),
(440, 'MATRIX', 'TELERA 700 X 400', 0, '104000', 16, 0),
(441, 'MATRIX', 'TELERA 700 X 500', 0, '104000', 18, 0),
(442, 'MATRIX', 'TELERA 700 X 550', 0, '104000', 19, 0),
(443, 'MATRIX', 'TELERA 700 X 600', 0, '122000', 19, 0),
(444, 'MATRIX', 'TELERA 700 X 650', 0, '122000', 20, 0),
(445, 'MATRIX', 'TELERA 700 X 700', 0, '142000', 21, 0),
(446, 'MATRIX', 'TELERA 700 X250', 0, '104000', 14, 0),
(447, 'MATRIX', 'TELERA 750 X 500', 0, '142000', 18, 0),
(448, 'MATRIX', 'TELERA 750 X 550', 0, '142000', 19, 0),
(449, 'MATRIX', 'TELERA 750 X 600', 0, '142000', 20, 0),
(450, 'MATRIX', 'TELERA 800 X 250', 0, '104000', 15, 0),
(451, 'MATRIX', 'TELERA 800 X 400', 0, '104000', 18, 0),
(452, 'MATRIX', 'TELERA 800 X 500', 0, '104000', 19, 0),
(453, 'MATRIX', 'TELERA 800 X 550', 0, '104000', 20, 0),
(454, 'MATRIX', 'TELERA 800 X 600', 0, '122000', 21, 0),
(455, 'MATRIX', 'TELERA 800 X 650', 0, '122000', 22, 0),
(456, 'MATRIX', 'TELERA 800 X 700', 0, '162000', 23, 0),
(457, 'MATRIX', 'TELERA 800 X 750', 0, '162000', 24, 0),
(458, 'MATRIX', 'TELERA 800 X 800', 0, '162000', 25, 0),
(459, 'MATRIX', 'TELERA 850 X 350', 0, '104000', 17, 0),
(460, 'MATRIX', 'TELERA 850 X 400', 0, '104000', 18, 0),
(461, 'MATRIX', 'TELERA 850 X 500', 0, '122000', 20, 0),
(462, 'MATRIX', 'TELERA 850 X 550', 0, '122000', 21, 0),
(463, 'MATRIX', 'TELERA 850 X 600', 0, '122000', 22, 0),
(464, 'MATRIX', 'TELERA 850 X 700', 0, '122000', 24, 0),
(465, 'MATRIX', 'TELERA 850 X 800', 0, '122500', 26, 0),
(466, 'MATRIX', 'TELERA 850 X 850', 0, '162000', 27, 0),
(467, 'MATRIX', 'TELERA 900 X 1000', 0, '266000', 31, 0),
(468, 'MATRIX', 'TELERA 900 X 300', 0, '122000', 17, 0),
(469, 'MATRIX', 'TELERA 900 X 350', 0, '122000', 18, 0),
(470, 'MATRIX', 'TELERA 900 X 400', 0, '122000', 19, 0),
(471, 'MATRIX', 'TELERA 900 X 450', 0, '122000', 20, 0),
(472, 'MATRIX', 'TELERA 900 X 500', 0, '122000', 21, 0),
(473, 'MATRIX', 'TELERA 900 X 550', 0, '142000', 22, 0),
(474, 'MATRIX', 'TELERA 900 X 600', 0, '142000', 23, 0),
(475, 'MATRIX', 'TELERA 900 X 650', 0, '142000', 24, 0),
(476, 'MATRIX', 'TELERA 900 X 700', 0, '142000', 25, 0),
(477, 'MATRIX', 'TELERA 900 X 750', 0, '142000', 26, 0),
(478, 'MATRIX', 'TELERA 900 X 800', 0, '209000', 27, 0),
(479, 'MATRIX', 'TELERA 900 X 850', 0, '222000', 28, 0),
(480, 'MATRIX', 'TELERA 900 X 900', 0, '235000', 29, 0),
(481, 'MATRIX', 'TELERA 950 X 400', 0, '110000', 20, 0),
(482, 'MATRIX', 'TELERA 950 X 500', 0, '137000', 22, 0),
(483, 'MATRIX', 'TELERA 950 X 550', 0, '151000', 23, 0),
(484, 'MATRIX', 'TELERA 950 X 600', 0, '165000', 24, 0),
(485, 'MATRIX', 'TELERA 950 X 650', 0, '179000', 25, 0),
(486, 'MATRIX', 'TELERA 950 X 800', 0, '220000', 27, 0),
(487, 'MATRIX', 'TELERA 950 X 850', 0, '234000', 29, 0),
(488, 'MATRIX', 'TELERA 950 X 900', 0, '248000', 30, 0),
(489, 'MATRIX', 'TELERA DE 1000 X 250', 0, '72000', 16, 0),
(490, 'MATRIX', 'TELERA DE 1000 X 300', 0, '87000', 17, 0),
(491, 'MATRIX', 'TELERA DE 1000 X 350 (H50)', 0, '101500', 18, 0),
(492, 'MATRIX', 'TELERA DE 1000 X 400', 0, '116000', 20, 0),
(493, 'MATRIX', 'TELERA DE 1000 X 500', 0, '145000', 21, 0),
(494, 'MATRIX', 'TELERA DE 1000 X 550', 0, '160000', 22, 0),
(495, 'MATRIX', 'TELERA DE 1000 X 600', 0, '174000', 23, 0),
(496, 'MATRIX', 'TELERA DE 1000 X 650', 0, '188500', 24, 0),
(497, 'MATRIX', 'TELERA DE 1000 X 950 (H50)', 0, '266000', 32, 0),
(498, 'MATRIX', 'TELERA DE 1050 X 1000 (H50)', 0, '304500', 35, 1),
(499, 'MATRIX', 'TELERA DE 1050 X 900 (H50)', 0, '274000', 33, 0),
(500, 'MATRIX', 'TELERA DE 850 X 1100', 0, '250000', 31, 0),
(501, 'MATRIX', 'TELERA DE 1200 X 300 (H50)', 0, '104400', 18, 0),
(502, 'MATRIX', 'TELERA DE 1200 X 350 (H50)', 0, '121800', 19, 0),
(503, 'MATRIX', 'TELERA DE 450 X 400 (H50)', 0, '52500', 12, 0),
(504, 'MATRIX', 'TELERA DE 800 X 350 (H50)', 0, '84100', 17, 0),
(505, 'MATRIX', 'TELERA DE 800 X 450 (H50)', 0, '104400', 18, 0),
(506, 'MATRIX', 'TORNILLO EN TE DE 1/2\" X 2\" CON TUERCA', 0, '2000', 0, 0),
(507, 'MATRIX', 'TUBO DE VIDA ANDAMIO DE FACHADA', 0, '12000', 4, 0),
(508, 'MATRIX', 'VIGA EN I 80X45 L=1000', 0, '50000', 6, 0),
(509, 'MATRIX', 'VIGA EN I 80X45 L=2000', 0, '80000', 12, 0),
(510, 'MATRIX', 'VIGA EN I 80X45 L=2500', 0, '100000', 15, 0),
(511, 'MATRIX', 'VIGA EN I 80X45 L=3000', 0, '120000', 18, 0),
(512, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=1000', 0, '27000', 4, 0),
(513, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=1500', 0, '34000', 7, 0),
(514, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=2000', 0, '54000', 9, 0),
(515, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=2500', 0, '60000', 11, 0),
(516, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=3000', 0, '78000', 14, 0),
(517, 'MATRIX', 'VIGA TUBULAR PTS 60X60X2,5 L=3500', 0, '86000', 16, 0),
(518, 'OTROS', 'CORBATA PARA MURO DE 250 E=1/8\"', 0, '2500', 0, 0),
(519, 'OTROS', 'CORBATA PARA MURO DE 400 E=1/8\"', 0, '3000', 0, 0),
(520, 'OTROS', 'CORBATA PARA MURO DE 450 E=1/8\"', 0, '3000', 0, 0),
(521, 'OTROS', 'DINTEL 100 X 400', 0, '100000', 3, 0),
(522, 'OTROS', 'TAPA  MURO DE 205 X 2000', 0, '198250', 16, 0),
(524, 'ARTURO', 'PRUBA ARTURO', 23, '2323232', 23, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo`
--

DROP TABLE IF EXISTS `saldo`;
CREATE TABLE IF NOT EXISTS `saldo` (
  `id_saldo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cont` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `fec_corte` date NOT NULL,
  `cantidad_saldo` int(11) NOT NULL,
  PRIMARY KEY (`id_saldo`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `saldo`
--

INSERT INTO `saldo` (`id_saldo`, `cod_cont`, `cod_prod`, `fec_corte`, `cantidad_saldo`) VALUES
(534, 11, 1, '2008-09-01', 3),
(535, 11, 148, '2008-09-01', 4),
(536, 11, 149, '2008-09-01', 5),
(537, 11, 149, '2008-09-11', 3),
(538, 11, 35, '2008-09-11', 7),
(539, 11, 36, '2008-09-11', 8),
(540, 11, 149, '2008-09-13', 1),
(541, 11, 35, '2008-09-13', 14),
(542, 11, 36, '2008-09-13', 16),
(543, 17, 1, '2008-09-06', 1),
(544, 17, 148, '2008-09-06', 2),
(545, 17, 149, '2008-09-06', 3),
(546, 17, 35, '2008-09-06', 4),
(547, 17, 36, '2008-09-06', 5),
(548, 17, 1, '2008-09-10', 11),
(549, 17, 148, '2008-09-10', 22),
(550, 17, 149, '2008-09-10', 33),
(551, 17, 35, '2008-09-10', 44),
(552, 17, 36, '2008-09-10', 55),
(553, 17, 1, '2008-09-12', 2),
(554, 17, 148, '2008-09-12', 14),
(555, 17, 149, '2008-09-12', 26),
(556, 17, 35, '2008-09-12', 38),
(557, 17, 36, '2008-09-12', 54),
(558, 11, 1, '2008-09-15', 3),
(559, 11, 35, '2008-09-15', 14),
(560, 11, 36, '2008-09-15', 16),
(561, 11, 148, '2008-09-15', 4),
(562, 11, 149, '2008-09-15', 1),
(563, 17, 1, '2008-09-15', 2),
(564, 17, 35, '2008-09-15', 38),
(565, 17, 36, '2008-09-15', 54),
(566, 17, 148, '2008-09-15', 14),
(567, 17, 149, '2008-09-15', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_negocio`
--

DROP TABLE IF EXISTS `tipo_negocio`;
CREATE TABLE IF NOT EXISTS `tipo_negocio` (
  `id_negocio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`id_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `tipo_negocio`
--

INSERT INTO `tipo_negocio` (`id_negocio`, `descripcion`) VALUES
(1, 'VENTA'),
(2, 'ALQUILER'),
(3, 'ALQUILER METRO2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
CREATE TABLE IF NOT EXISTS `tipo_vehiculo` (
  `id_vehi` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`id_vehi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id_vehi`, `tipo`) VALUES
(1, 'TRACTOMULA'),
(2, 'CAMION'),
(3, 'FURGON'),
(4, 'AUTOMOVIL'),
(5, 'BICICLETA'),
(6, 'VOLQUETA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `nivel` int(11) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `clave` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `nivel`, `usuario`, `clave`) VALUES
(1, 'ARTURO DOMINGUEZ TELLO', 1, 'ardote', 'Juanes05'),
(2, 'JHON JAIRO DOMINUEZ TELLO', 1, 'jj', '1969'),
(3, 'EDNA PATRICIA DOMINGUEZ TELLO', 1, 'patico', 'patico'),
(4, 'ORLANDO MEDINA ORTIZ', 1, 'orlan', 'orlan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `cod_vent` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cli` int(11) NOT NULL,
  `fec_vent` date NOT NULL,
  `dir_obra` varchar(50) NOT NULL,
  `ciudad_obra` varchar(30) NOT NULL,
  `nom_resp` varchar(50) NOT NULL,
  `tel_obra` int(11) NOT NULL,
  `dir_entrega_fac` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_vent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`cod_vent`, `cod_cli`, `fec_vent`, `dir_obra`, `ciudad_obra`, `nom_resp`, `tel_obra`, `dir_entrega_fac`) VALUES
(1, 1, '2008-08-08', 'BOGOTA', 'ARTU', '312', 0, 'CALLE 13 34 45'),
(2, 4, '2008-08-22', 'ewr', 'wer', 'wer', 234, 'wer234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_linea`
--

DROP TABLE IF EXISTS `ventas_linea`;
CREATE TABLE IF NOT EXISTS `ventas_linea` (
  `cod_vent_linea` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vent` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_vent_linea`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas_linea`
--

INSERT INTO `ventas_linea` (`cod_vent_linea`, `cod_vent`, `cod_prod`, `cantidad`, `valor`) VALUES
(6, 1, 1, 2, '160000'),
(7, 1, 148, 4, '136000'),
(8, 1, 149, 6, '37200'),
(9, 1, 35, 8, '680000'),
(10, 1, 36, 10, '920000'),
(11, 2, 1, 1, '80000'),
(12, 2, 35, 5, '425000'),
(13, 2, 10, 2, '236000'),
(14, 2, 38, 3, '375000'),
(15, 2, 151, 4, '500000');
COMMIT;

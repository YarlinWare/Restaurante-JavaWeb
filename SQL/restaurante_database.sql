-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2020 a las 21:56:10
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante_database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombres` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombres`, `descripcion`) VALUES
(1, 'Entradas', NULL),
(2, 'Ensaladas/Bowls', NULL),
(3, 'Veggie', NULL),
(4, 'Pastas', NULL),
(5, 'Pizzas', NULL),
(6, 'Panini', NULL),
(7, 'Horno', NULL),
(8, 'Bebidas', NULL),
(9, 'Postres', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valorNeto` int(11) DEFAULT NULL,
  `valorTotal` int(11) DEFAULT NULL,
  `propina` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `pago` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `IdFormaPago` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `formapago`
--

INSERT INTO `formapago` (`IdFormaPago`, `Nombre`, `Estado`) VALUES
(1, 'Tarjeta', 1),
(2, 'Efectivo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Mesa` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idUsuario`, `Fecha`, `Mesa`, `estado`) VALUES
(1, 3, '2020-03-05', 1, 1),
(2, 3, '2020-03-07', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `idPedido` int(11) NOT NULL,
  `idDetalle` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`idPedido`, `idDetalle`, `idProducto`, `cantidad`, `estado`) VALUES
(1, 1, 6, 1, 1),
(2, 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `cargo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `cargo`, `descripcion`) VALUES
(1, 'Administrador', 'Administrador del restaurante'),
(2, 'Camarero', 'Empleado del restaurante'),
(3, 'Cliente', 'Cliente del restaurante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci DEFAULT NULL,
  `valor` int(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `valor`, `estado`, `idCategoria`) VALUES
(1, 'Panino Caprese', 'Queso bocconcini de búfala, mozzarella, albahaca y tomates secos, con pesto y reducción de balsámico. ', 19500, 1, 0),
(2, 'Bowl Caprese', 'Queso bocconcini de búfala, pasta penne a la napolitana, albahaca y tomates cherry, con aceite de oliva. ', 21000, 1, 0),
(3, 'Bowl Feta', 'Queso bocconcini de búfala o tofu, pasta penne al pesto, maíz, queso feta, ajonjolí, tomates cherry, aguacate y mix de lechugas; con vinagreta campiña.', 20000, 1, 0),
(4, 'Crema de champiñones', 'Crema de champiñones acompañada con pancitos y parmesano. ', 13500, 1, 0),
(5, 'Panino Pollo Carbonara', 'Pollo a la plancha con champiñón portobello y tocineta; cubierto con salsa carbonara y mozzarella. ', 26100, 1, 0),
(6, 'Canelones Ricotta y Espinaca', 'Tres rollos de pasta artesanal, rellenos con espinaca, ricotta y tomates secos, gratinados con salsa blanca, napolitana y parmesano. ', 21600, 1, 0),
(7, 'Bowl Pesto', 'Queso bocconcini de búfala o tofu, cuscús al pesto, tomates cherry, champiñones salteados, zanahorias rostizadas y mix de lechugas; con aderezo ranch. ', 21000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `nombres` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `correo` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idPerfil`, `nombres`, `apellidos`, `correo`, `celular`, `password`) VALUES
(1, 1, ' Arquímedes', 'Hernandez', 'ahernandez@restaurante.com', '3109879876', 'administrador'),
(2, 2, 'Herodes', 'Perez', 'hperez@restaurante.com', '3109876543', 'camarero'),
(3, 3, 'Charlotte', 'Johnson', 'cjohnson@restaurante.com', '3109876542', 'cliente'),
(4, 1, 'Sophia', 'Reyes', 'sreyes@restaurante.com', '3009876765', 'administrador'),
(5, 3, 'Pedro', 'Perez', 'pperez@restaurante.com', '3109996543', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`IdFormaPago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `IdFormaPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

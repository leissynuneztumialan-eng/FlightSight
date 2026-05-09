-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2026 a las 02:46:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flightsight`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aerolinea`
--

CREATE TABLE `aerolinea` (
  `idaerolinea` int(11) NOT NULL,
  `ruc` char(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aerolinea`
--

INSERT INTO `aerolinea` (`idaerolinea`, `ruc`, `nombre`) VALUES
(1, '12345678901', 'FlightSight');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE `aeropuerto` (
  `idaeropuerto` char(3) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `idpais` char(2) DEFAULT NULL,
  `codigo_iata` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aeropuerto`
--

INSERT INTO `aeropuerto` (`idaeropuerto`, `nombre`, `ciudad`, `idpais`, `codigo_iata`) VALUES
('AQP', 'Rodriguez Ballon', 'Arequipa', 'PE', 'AQP'),
('CUZ', 'Velasco Astete', 'Cusco', 'PE', 'CUZ'),
('IQT', 'Coronel FAP Francisco Secada', 'Iquitos', 'PE', 'IQT'),
('JUL', 'Inca Manco Capac', 'Juliaca', 'PE', 'JUL'),
('LIM', 'Jorge Chavez', 'Lima', 'PE', 'LIM'),
('PCL', 'Capitan FAP David Abensur', 'Pucallpa', 'PE', 'PCL'),
('PIU', 'Capitan FAP Guillermo Concha', 'Piura', 'PE', 'PIU'),
('TBP', 'Capitan FAP Pedro Canga', 'Tumbes', 'PE', 'TBP'),
('TPP', 'Cadete FAP Guillermo del Castillo', 'Tarapoto', 'PE', 'TPP'),
('TRU', 'Capitan FAP Carlos Martinez', 'Trujillo', 'PE', 'TRU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `idasiento` int(11) NOT NULL,
  `fila` int(11) DEFAULT NULL,
  `letra` char(1) DEFAULT NULL,
  `idclase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`idasiento`, `fila`, `letra`, `idclase`) VALUES
(1, 1, 'A', 1),
(2, 1, 'B', 1),
(3, 1, 'C', 1),
(4, 2, 'A', 1),
(5, 2, 'B', 1),
(6, 1, 'A', 2),
(7, 1, 'B', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `idavion` char(6) NOT NULL,
  `idaerolinea` int(11) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`idavion`, `idaerolinea`, `fabricante`, `modelo`, `capacidad`) VALUES
('AV001', 1, 'Airbus', 'A320', 180);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checkin`
--

CREATE TABLE `checkin` (
  `idcheckin` int(11) NOT NULL,
  `idreserva` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `asiento_confirmado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_asiento`
--

CREATE TABLE `clase_asiento` (
  `idclase` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_asiento`
--

INSERT INTO `clase_asiento` (`idclase`, `nombre`) VALUES
(1, 'Economica'),
(2, 'Ejecutiva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `iddescuento` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_reserva`
--

CREATE TABLE `detalle_reserva` (
  `iddetalle` int(11) NOT NULL,
  `idreserva` int(11) DEFAULT NULL,
  `idvuelo` int(11) DEFAULT NULL,
  `idasiento` int(11) DEFAULT NULL,
  `idtarifa` int(11) DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_reserva`
--

INSERT INTO `detalle_reserva` (`iddetalle`, `idreserva`, `idvuelo`, `idasiento`, `idtarifa`, `precio_base`, `impuesto`, `descuento`, `total`) VALUES
(1, 3, NULL, 1, 2, 500.00, 100.00, 0.00, 600.00),
(2, 6, NULL, 6, 1, 200.00, 50.00, 0.00, 250.00),
(3, 7, NULL, 3, 2, 500.00, 100.00, 0.00, 600.00),
(4, 8, 1, 7, 1, 200.00, 50.00, 0.00, 250.00),
(5, 9, 2, 6, 2, 500.00, 100.00, 0.00, 600.00),
(6, 10, 1, 2, 1, 200.00, 50.00, 0.00, 250.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipaje`
--

CREATE TABLE `equipaje` (
  `idequipaje` int(11) NOT NULL,
  `idreserva` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `idmetodo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`idmetodo`, `descripcion`) VALUES
(1, 'Tarjeta'),
(2, 'Yape'),
(3, 'Plin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `idreserva` int(11) DEFAULT NULL,
  `idmetodo` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(3) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `idreserva`, `idmetodo`, `fecha`, `monto`, `moneda`, `estado`) VALUES
(1, 7, 2, '2026-04-26 13:27:26', 600.00, 'PEN', 'PAGADO'),
(2, 8, 1, '2026-04-26 13:31:32', 250.00, 'PEN', 'PAGADO'),
(3, 9, 2, '2026-04-26 14:33:51', 600.00, 'PEN', 'PAGADO'),
(4, 10, 3, '2026-04-26 19:03:58', 250.00, 'PEN', 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` char(2) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nombre`) VALUES
('PE', 'Peru');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `idpasajero` char(8) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apaterno` varchar(50) DEFAULT NULL,
  `amaterno` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `idpais` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`idpasajero`, `nombre`, `apaterno`, `amaterno`, `telefono`, `mail`, `fecha_nac`, `idpais`) VALUES
('12345', 'Leche', '', '', '', '', '2000-01-01', 'PE'),
('123456', 'Leche', '', '', '', '', '2000-01-01', 'PE'),
('254687', 'teresa', '', '', '', '', '2000-01-01', 'PE'),
('456789', 'Juan', '', '', '', '', '2000-01-01', 'PE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idpasajero` char(8) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `iddescuento` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `idpasajero`, `fecha`, `iddescuento`, `estado`) VALUES
(1, '123456', '2026-04-26 13:15:50', NULL, 'ACTIVO'),
(2, '123456', '2026-04-26 13:17:57', NULL, 'ACTIVO'),
(3, '123456', '2026-04-26 13:18:09', NULL, 'ACTIVO'),
(4, '123456', '2026-04-26 13:20:36', NULL, 'ACTIVO'),
(5, '123456', '2026-04-26 13:22:05', NULL, 'ACTIVO'),
(6, '123456', '2026-04-26 13:24:21', NULL, 'ACTIVO'),
(7, '254687', '2026-04-26 13:27:19', NULL, 'ACTIVO'),
(8, '456789', '2026-04-26 13:31:29', NULL, 'ACTIVO'),
(9, '123456', '2026-04-26 14:30:56', NULL, 'ACTIVO'),
(10, '12345', '2026-04-26 19:03:49', NULL, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `idruta` int(11) NOT NULL,
  `origen` char(3) NOT NULL,
  `destino` char(3) NOT NULL,
  `duracion_min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`idruta`, `origen`, `destino`, `duracion_min`) VALUES
(1, 'LIM', 'CUZ', 80),
(2, 'LIM', 'AQP', 90),
(3, 'CUZ', 'LIM', 80),
(4, 'AQP', 'LIM', 90),
(5, 'LIM', 'PIU', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `idtarifa` int(11) NOT NULL,
  `clase` varchar(20) DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `impuesto` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`idtarifa`, `clase`, `precio_base`, `impuesto`) VALUES
(1, 'Economica', 200.00, 50.00),
(2, 'Ejecutiva', 500.00, 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipaje`
--

CREATE TABLE `tipo_equipaje` (
  `idtipo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `idvuelo` int(11) NOT NULL,
  `idruta` int(11) DEFAULT NULL,
  `idavion` char(6) DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`idvuelo`, `idruta`, `idavion`, `fecha_salida`, `fecha_llegada`, `estado`) VALUES
(1, 1, 'AV001', '2026-05-01 08:00:00', '2026-05-01 09:20:00', 'PROGRAMADO'),
(2, 1, 'AV001', '2026-05-01 15:00:00', '2026-05-01 16:20:00', 'PROGRAMADO'),
(3, 2, 'AV001', '2026-05-02 10:00:00', '2026-05-02 11:30:00', 'PROGRAMADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aerolinea`
--
ALTER TABLE `aerolinea`
  ADD PRIMARY KEY (`idaerolinea`);

--
-- Indices de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD PRIMARY KEY (`idaeropuerto`),
  ADD KEY `idpais` (`idpais`);

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`idasiento`),
  ADD KEY `idclase` (`idclase`);

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`idavion`),
  ADD KEY `idaerolinea` (`idaerolinea`);

--
-- Indices de la tabla `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`idcheckin`),
  ADD KEY `idreserva` (`idreserva`);

--
-- Indices de la tabla `clase_asiento`
--
ALTER TABLE `clase_asiento`
  ADD PRIMARY KEY (`idclase`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`iddescuento`);

--
-- Indices de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `idreserva` (`idreserva`),
  ADD KEY `idvuelo` (`idvuelo`),
  ADD KEY `idasiento` (`idasiento`),
  ADD KEY `idtarifa` (`idtarifa`);

--
-- Indices de la tabla `equipaje`
--
ALTER TABLE `equipaje`
  ADD PRIMARY KEY (`idequipaje`),
  ADD KEY `idreserva` (`idreserva`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`idmetodo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `idreserva` (`idreserva`),
  ADD KEY `idmetodo` (`idmetodo`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`idpasajero`),
  ADD KEY `idpais` (`idpais`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `idpasajero` (`idpasajero`),
  ADD KEY `iddescuento` (`iddescuento`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`idruta`),
  ADD KEY `origen` (`origen`),
  ADD KEY `destino` (`destino`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`idtarifa`);

--
-- Indices de la tabla `tipo_equipaje`
--
ALTER TABLE `tipo_equipaje`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`idvuelo`),
  ADD KEY `idruta` (`idruta`),
  ADD KEY `idavion` (`idavion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `checkin`
--
ALTER TABLE `checkin`
  MODIFY `idcheckin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipaje`
--
ALTER TABLE `equipaje`
  MODIFY `idequipaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD CONSTRAINT `aeropuerto_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`);

--
-- Filtros para la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD CONSTRAINT `asiento_ibfk_1` FOREIGN KEY (`idclase`) REFERENCES `clase_asiento` (`idclase`);

--
-- Filtros para la tabla `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`idaerolinea`) REFERENCES `aerolinea` (`idaerolinea`);

--
-- Filtros para la tabla `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`);

--
-- Filtros para la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD CONSTRAINT `detalle_reserva_ibfk_1` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`),
  ADD CONSTRAINT `detalle_reserva_ibfk_2` FOREIGN KEY (`idvuelo`) REFERENCES `vuelo` (`idvuelo`),
  ADD CONSTRAINT `detalle_reserva_ibfk_3` FOREIGN KEY (`idasiento`) REFERENCES `asiento` (`idasiento`),
  ADD CONSTRAINT `detalle_reserva_ibfk_4` FOREIGN KEY (`idtarifa`) REFERENCES `tarifa` (`idtarifa`);

--
-- Filtros para la tabla `equipaje`
--
ALTER TABLE `equipaje`
  ADD CONSTRAINT `equipaje_ibfk_1` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idmetodo`) REFERENCES `metodo_pago` (`idmetodo`);

--
-- Filtros para la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `pasajero_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idpasajero`) REFERENCES `pasajero` (`idpasajero`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`iddescuento`) REFERENCES `descuento` (`iddescuento`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `aeropuerto` (`idaeropuerto`),
  ADD CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `aeropuerto` (`idaeropuerto`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`idruta`) REFERENCES `ruta` (`idruta`),
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`idavion`) REFERENCES `avion` (`idavion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

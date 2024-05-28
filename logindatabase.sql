-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2024 a las 13:17:55
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `logindatabase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actas`
--

CREATE TABLE `actas` (
  `id` int(11) NOT NULL,
  `reunion_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text DEFAULT NULL,
  `encargado_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compromisos`
--

CREATE TABLE `compromisos` (
  `id` int(11) NOT NULL,
  `acta_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `porcentaje_avance` int(11) DEFAULT NULL CHECK (`porcentaje_avance` >= 0 and `porcentaje_avance` <= 100),
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_vinculados`
--

CREATE TABLE `documentos_vinculados` (
  `id` int(11) NOT NULL,
  `acta_id` int(11) DEFAULT NULL,
  `nombre_documento` varchar(255) NOT NULL,
  `ruta_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitaciones`
--

CREATE TABLE `invitaciones` (
  `id` int(11) NOT NULL,
  `reunion_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` enum('pendiente','aceptada','rechazada') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresh_token`
--

CREATE TABLE `refresh_token` (
  `token_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `refresh_token`
--

INSERT INTO `refresh_token` (`token_hash`, `expires_at`) VALUES
('69f33a605a17290e6a5af213ccba5d9f24630a7ca7624213ac121260aa8a0aa6', '0000-00-00 00:00:00'),
('8867283d13507587b9e6bb991ec75d3576d9a7d825223015ad094a3ad6dc9f37', '0000-00-00 00:00:00'),
('5f159041888c8c7b83d344789ecf4e36d037601e1bd7185411ec342e0ba55c6c', '0000-00-00 00:00:00'),
('be5f82023cd566092f4eff585a01d1384be8fb394ef8618ca90ef0d397f20c68', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reuniones`
--

CREATE TABLE `reuniones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `creador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`, `email`) VALUES
(89, 'Jotade', '$2y$10$ynFpD/EEJ4Qucl4NzOvbmeGSpzbrKRZ9e.MJqEhqHO4Y2lmStUNae', 'juandurangolopez1507@gmail.com'),
(90, 'juanjulian', '$2y$10$z6Ov7pR8VoHzgNp5KJasIum1dbK6vvHuc/mJJcPnBf5g4Ini20I2K', 'ngolopez1507@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actas`
--
ALTER TABLE `actas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reunion_id` (`reunion_id`),
  ADD KEY `encargado_id` (`encargado_id`);

--
-- Indices de la tabla `compromisos`
--
ALTER TABLE `compromisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acta_id` (`acta_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `documentos_vinculados`
--
ALTER TABLE `documentos_vinculados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acta_id` (`acta_id`);

--
-- Indices de la tabla `invitaciones`
--
ALTER TABLE `invitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reunion_id` (`reunion_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `reuniones`
--
ALTER TABLE `reuniones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creador_id` (`creador_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actas`
--
ALTER TABLE `actas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `compromisos`
--
ALTER TABLE `compromisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_vinculados`
--
ALTER TABLE `documentos_vinculados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invitaciones`
--
ALTER TABLE `invitaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `reuniones`
--
ALTER TABLE `reuniones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actas`
--
ALTER TABLE `actas`
  ADD CONSTRAINT `actas_ibfk_1` FOREIGN KEY (`reunion_id`) REFERENCES `reuniones` (`id`),
  ADD CONSTRAINT `actas_ibfk_2` FOREIGN KEY (`encargado_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `compromisos`
--
ALTER TABLE `compromisos`
  ADD CONSTRAINT `compromisos_ibfk_1` FOREIGN KEY (`acta_id`) REFERENCES `actas` (`id`),
  ADD CONSTRAINT `compromisos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `documentos_vinculados`
--
ALTER TABLE `documentos_vinculados`
  ADD CONSTRAINT `documentos_vinculados_ibfk_1` FOREIGN KEY (`acta_id`) REFERENCES `actas` (`id`);

--
-- Filtros para la tabla `invitaciones`
--
ALTER TABLE `invitaciones`
  ADD CONSTRAINT `invitaciones_ibfk_1` FOREIGN KEY (`reunion_id`) REFERENCES `reuniones` (`id`),
  ADD CONSTRAINT `invitaciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `reuniones`
--
ALTER TABLE `reuniones`
  ADD CONSTRAINT `reuniones_ibfk_1` FOREIGN KEY (`creador_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2024 a las 21:23:52
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
-- Base de datos: `la_rotonda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `stock`, `precio`, `created_at`, `updated_at`) VALUES
(1, 'Salsa de tomate - Marolio', 18, 4300.00, '2024-10-02 04:33:04', '2024-10-22 18:56:06'),
(2, 'Fideos tirabuzón - Matarazo', 55, 2555.00, '2024-10-02 04:33:47', '2024-10-22 18:52:53'),
(3, 'Coca Cola Zero - 2.5L', 189, 4362.00, '2024-10-02 04:34:29', '2024-10-02 04:34:29'),
(4, 'Aceite 1.5L - Natura', 24, 8930.00, '2024-10-02 04:35:06', '2024-10-02 04:35:06'),
(5, 'Fanta 2.5 - Retornable', 11, 5412.23, '2024-10-02 15:44:07', '2024-10-22 18:52:53'),
(7, 'Sprite', 81, 4299.00, '2024-10-21 22:26:54', '2024-10-21 22:26:54'),
(8, 'Sopas', 51, 1999.99, '2024-10-21 22:31:10', '2024-10-21 22:31:10'),
(9, 'Caldo de verdura - Knorr', 298, 123123.00, '2024-10-21 22:32:42', '2024-10-21 22:32:42'),
(10, 'Yerbamate - Rosa Monte', 2, 5601.21, '2024-10-21 22:34:05', '2024-10-21 22:34:05'),
(12, 'Fernet Branca - 560ml', 23, 12998.99, '2024-10-21 22:38:05', '2024-10-21 22:38:05'),
(13, 'Doritos', 63, 4599.89, '2024-10-21 22:50:15', '2024-10-22 18:52:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contrasena`, `rol`, `created_at`, `updated_at`) VALUES
(1, 'Lucas Gancia', 'lucas1234', 1, '2024-10-02 04:37:19', '2024-10-02 04:37:19'),
(2, 'Matías Perez', 'matiPerez123', 0, '2024-10-02 04:37:43', '2024-10-22 16:34:33'),
(3, 'Carina Campos', 'caricampos9812', 0, '2024-10-02 04:38:09', '2024-10-02 04:38:09'),
(4, 'Rocío Lucero', 'rocio1234', 1, '2024-10-22 00:52:04', '2024-10-22 16:23:52'),
(5, 'Marcelo Roberto Gancia', 'marcelo1234Roberto', 0, '2024-10-22 00:56:20', '2024-10-22 00:56:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_usuario`, `total`, `created_at`) VALUES
(1, 2, 13292.00, '2024-10-02 04:57:22'),
(2, 1, 34196.22, '2024-10-22 17:22:13'),
(3, 2, 16311.11, '2024-10-22 17:28:06'),
(4, 2, 157244.21, '2024-10-22 17:32:29'),
(5, 1, 30067.01, '2024-10-22 18:52:53'),
(6, 1, 8600.00, '2024-10-22 18:56:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_productos`
--

CREATE TABLE `venta_productos` (
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_productos`
--

INSERT INTO `venta_productos` (`id_venta`, `id_producto`, `cantidad`) VALUES
(1, 3, 2),
(1, 4, 1),
(2, 1, 1),
(2, 2, 1),
(2, 4, 1),
(2, 5, 1),
(2, 12, 1),
(3, 5, 1),
(3, 7, 1),
(3, 8, 1),
(3, 13, 1),
(4, 1, 1),
(4, 2, 1),
(5, 1, 3),
(5, 2, 1),
(5, 5, 1),
(5, 13, 2),
(6, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_usuario`);

--
-- Indices de la tabla `venta_productos`
--
ALTER TABLE `venta_productos`
  ADD PRIMARY KEY (`id_venta`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `venta_productos`
--
ALTER TABLE `venta_productos`
  ADD CONSTRAINT `venta_productos_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`),
  ADD CONSTRAINT `venta_productos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

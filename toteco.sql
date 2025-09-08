-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2022 a las 16:03:52
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toteco_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establishments`
--

CREATE TABLE `establishments` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `creation_date` date NOT NULL,
  `location` varchar(200),
  `is_open` tinyint(1) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `establishments`
--

INSERT INTO `establishments` (`id`, `name`, `creation_date`, `location`, `is_open`, `score`) VALUES
(1, 'Criollo', '2022-04-17', '{\"latitude\": 0.0, \"longitude\": 0.0}', 1, 0),
(6, 'Doña hipólita', '2022-04-20', '{\"latitude\":2.0,\"longitude\":3.0}', 1, 0),
(16, 'Mondo', '2022-04-20', '{\"latitude\":41.653664,\"longitude\":-0.88433594}', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `score` float NOT NULL,
  `publication_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `date`, `price`, `score`, `publication_id`) VALUES
(1, 'Tostada con tomate', '2022-04-26', 2, 5, 1),
(2, 'Matcha con leche de avena', '2022-04-26', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publications`
--

CREATE TABLE `publications` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_price` float NOT NULL,
  `total_score` float NOT NULL,
  `photo` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `establishment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `publications`
--

INSERT INTO `publications` (`id`, `date`, `total_price`, `total_score`, `photo`, `establishment_id`, `user_id`) VALUES
(1, '2022-04-26', 0, 0, 'string.jpg', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `money_spent` float DEFAULT NULL,
  `publications_number` int(10) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `surname`, `birth_date`, `email`, `password`, `creation_date`, `active`, `money_spent`, `publications_number`, `role`) VALUES
(5, 'martabags', 'Marta', 'Bagüés', '1997-06-18', 'martabags@gmail.com', 'martabags', '2022-04-17', 1, 0, 0, 'USER'),
(6, 'admin', 'admin', 'admin', '1997-06-18', 'admin', 'admin', '2022-04-20', 1, 0, 0, 'ADMIN'),
(8, 'cunba', 'Irene', 'Cunto', '1995-09-05', 'ire.cunba@gmail.com', 'cunba', '2022-04-26', 1, 0, 0, 'USER');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_publication_id` (`publication_id`);

--
-- Indices de la tabla `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_establishment_id` (`establishment_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`);

--
-- Filtros para la tabla `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `fk_establishment_id` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
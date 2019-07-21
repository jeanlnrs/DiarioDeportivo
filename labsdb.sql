-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2016 a las 08:01:07
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `labsdb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_datos` (IN `param_peso` FLOAT(2), IN `param_estatura` FLOAT(2), IN `param_imc` FLOAT(2))  NO SQL
BEGIN 
SET @s = CONCAT("INSERT INTO parcial2 (peso,estatura,imc) VALUES(",param_peso,",",param_estatura,",",param_imc,")");
PREPARE stmt FROM @s; 
EXECUTE stmt;
DEALLOCATE PREPARE stmt; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_resultados` ()  NO SQL
BEGIN
SELECT id, peso, estatura, imc FROM parcial2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcial2`
--

CREATE TABLE `parcial2` (
  `id` int(11) NOT NULL,
  `peso` float NOT NULL,
  `estatura` float NOT NULL,
  `imc` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parcial2`
--

INSERT INTO `parcial2` (`id`, `peso`, `estatura`, `imc`) VALUES
(1, 125, 1.23, 36.1),
(2, 34, 65, 62),
(3, 34, 65, 62),
(4, 89, 67, 89),
(5, 23, 76, 9),
(6, 43, 45, 1.9),
(7, 45, 89, 44),
(8, 8, 8, 8),
(9, 7, 7, 2),
(10, 11, 1, 22),
(11, 898, 667, 2.7),
(12, 2, 88, 0),
(13, 2, 88, 0),
(14, 44, 999, 0.1),
(15, 44, 999, 0.1),
(16, 44, 999, 0.1),
(17, 44, 999, 0.1),
(18, 165, 1.67, 197.6),
(19, 120, 2, 120),
(20, 60, 1.65, 72.7),
(21, 120, 2, 0),
(22, 120, 2, 120),
(23, 120, 2, 30),
(24, 180, 1.7, 52.9412),
(25, 180, 1.7, 52.9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `parcial2`
--
ALTER TABLE `parcial2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `parcial2`
--
ALTER TABLE `parcial2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

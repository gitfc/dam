-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2022 a las 20:53:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jardin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha` int(11) NOT NULL,
  `rut_nino` int(10) UNSIGNED NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `descripcion`, `fecha`, `rut_nino`, `deleted_at`) VALUES
(1, 'Aijz  ClO4nNv Wmnh Ygj9 IHhN g m t xy ntcuyM 9P Aijz  ClO4nNv Wmnh Ygj9 IHhN g m t xy ntcuyM 9P', 20210130, 213183222, NULL),
(2, 'ASCRoLr1RjEZ jnOvaFyObA 2zKfATjtcYt jr fA ASCRoLr1RjEZ jnOvaFyObA 2zKfATjtcYt jr fA ASCRoLr1RjEZ jnOvaFyObA 2zKfATjtcYt jr fA', 20221113, 221908929, NULL),
(3, 'xG Q XRt2OmoR0  Az3i NGL tP  9 3D 5I WIovl9 wth xG Q XRt2OmoR0  Az3i NGL tP  9 3D 5I WIovl9 wth', 20190419, 213183222, NULL),
(4, 'i6OzfKe5h iJ 2DjYnwSh  Gvy 0   6X5PAQJJn6jf', 20220712, 219562942, NULL),
(5, '99vbDY7XGA15Q4or81KUK7ZKqb', 20201227, 236881997, NULL),
(6, 'sGz wSp 6o1e  Wkfyr2THQRmReA', 20191003, 231534393, NULL),
(7, 'x0 hCYr s1 4VIsDUdPG9sToaNS', 20200103, 229275771, NULL),
(8, '3 wC 8O 0PMM8OcRmiY   u pO1BuahpcgAck6X TnX', 20220631, 237476743, NULL),
(9, 'qFKZBcpvSnKQ AXZO wp EzPZGb', 20190228, 214095203, NULL),
(10, 'COgIwek PpyFA GxkPZlREX3OXuK', 20220131, 237476743, NULL),
(11, 'LvWLlj FdFF Iy39l bzI0', 20220428, 229275771, NULL),
(12, 'uKan kc W8 UdxXp fJVC3at', 20201220, 217232465, NULL),
(13, 'Z DNAf8rmJ Bnz8ts8KY8voOTI8Fhklqqp  nrj 3uLqG J1G', 20211125, 213183222, NULL),
(14, 'p O0T4C HAVEg3EJ6bczrR  9 bZsPq', 20201213, 236881997, NULL),
(15, 'ExhzAWGtdXqCA  Mk4 TPTbnS6', 20220324, 214095203, NULL),
(16, 'FVY88aOvrjZ3eGUsM2k CsnSLcB n', 20190322, 213183222, NULL),
(17, '0a6yFNMyYg88VO f31J82', 20210503, 214095203, NULL),
(18, 'IoXSX 2GHus1TexTf D1WEJJe', 20220613, 219562942, NULL),
(19, 'lDdRzT  pE eQ JE8AbmHmylce 5l5  Z QxX', 20220408, 213183222, NULL),
(20, 'B0nzyt0V h8LHXLZTj55 vF4B 0wGBrS el', 20191212, 231534393, NULL),
(21, 'fIMkAYqCl58a  FM yQ Y', 20190926, 217232465, NULL),
(22, 'mUFBrO7NO YVMw5 KC  maF6gGzC7', 20190923, 219562942, NULL),
(23, 'uLt9fXkqPM1R3 Sjkv6 8XP ZKui4VIEPIfO34oCits', 20190707, 231534393, NULL),
(24, '6X9L T0  EO8L6fswZY ds8YV', 20191029, 231534393, NULL),
(25, 'AyFIk  j aovRnR6LAQ  gRkvqxaValK ioe', 20210120, 213183222, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nino`
--

CREATE TABLE `nino` (
  `rut` int(8) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre_apoderado` varchar(100) NOT NULL,
  `telefono_emergencia` int(8) UNSIGNED NOT NULL,
  `id_nivel` int(8) UNSIGNED NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nino`
--

INSERT INTO `nino` (`rut`, `nombre`, `nombre_apoderado`, `telefono_emergencia`, `id_nivel`, `deleted_at`) VALUES
(205348921, 'Obdulia Angulo', 'Avelina Salazar', 959984971, 31, NULL),
(210964657, 'Juan Ramon Angulo', 'Gisela Vallejo', 948072403, 30, NULL),
(213183222, 'Angelina Rosado', 'Markel San Miguel', 914599714, 20, NULL),
(214095203, 'Ana Antunez', 'Rosendo Soria', 905301235, 31, NULL),
(217232465, 'Francisco Caballero', 'Rufina Carrera', 973452752, 10, NULL),
(218072402, 'Iris Lobo', 'Rafaela del Moral', 905604435, 30, NULL),
(218410758, 'Miriam Giner', 'Ivan Recio', 921430956, 11, NULL),
(219562942, 'Guillem Codina', 'Rosalia Bonilla', 929252521, 20, NULL),
(221113330, 'Ion Cebrian', 'Noa Borras', 945684915, 11, NULL),
(221908929, 'Anibal Saura', 'Roxana Sevillano', 932879632, 10, NULL),
(229275771, 'Antonio Casanova', 'Benigno Garcia', 957625316, 30, NULL),
(229437070, 'Victoriano Montesinos', 'Saturnina Peiro', 931349287, 21, NULL),
(231534393, 'Cintia Montiel', 'Ibai Vilchez', 908303555, 20, NULL),
(234651854, 'Clemente Vasquez', 'Antonia Saenz', 998796197, 10, NULL),
(236881997, 'Ander Nuñez', 'Eladio Cañete', 987391204, 30, NULL),
(237476743, 'Javiera Heredia', 'Carmen Salinas', 958070130, 21, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id` int(8) UNSIGNED NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id`, `descripcion`, `deleted_at`) VALUES
(10, 'Sala Cuna Menor', NULL),
(11, 'Sala Cuna Mayor', NULL),
(20, 'Nivel Medio Menor ', NULL),
(21, 'Nivel Medio Mayor', NULL),
(30, 'Primer Nivel de Transición', NULL),
(31, 'Segundo Nivel de Transición', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tia`
--

CREATE TABLE `tia` (
  `rut` int(8) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tia`
--

INSERT INTO `tia` (`rut`, `nombre`, `deleted_at`) VALUES
(12233935, 'Marcela Amores', NULL),
(105113757, 'Maria Sol Cordero', NULL),
(114404810, 'Magdalena Torres', NULL),
(120768646, 'Olivia Belmonte', NULL),
(134083883, 'Ursula Verdugo', NULL),
(141640577, 'Izaskun Robles', NULL),
(148406324, 'Emiliana Yañez', NULL),
(152499302, 'Yasmina Murillo', NULL),
(166892899, 'Claudia Puertas', NULL),
(167772315, 'Ainara Mateo', NULL),
(174774021, 'Carmen Albert', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tia_nivel`
--

CREATE TABLE `tia_nivel` (
  `rut_tia` int(10) UNSIGNED NOT NULL,
  `id_nivel` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tia_nivel`
--

INSERT INTO `tia_nivel` (`rut_tia`, `id_nivel`) VALUES
(105113757, 10),
(105113757, 11),
(114404810, 20),
(120768646, 10),
(120768646, 30),
(134083883, 20),
(134083883, 31),
(148406324, 10),
(148406324, 21),
(152499302, 21),
(166892899, 10),
(167772315, 11),
(174774021, 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rut_nino` (`rut_nino`);

--
-- Indices de la tabla `nino`
--
ALTER TABLE `nino`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `nivel` (`id_nivel`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tia`
--
ALTER TABLE `tia`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `tia_nivel`
--
ALTER TABLE `tia_nivel`
  ADD KEY `rut_tia` (`rut_tia`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`rut_nino`) REFERENCES `nino` (`rut`);

--
-- Filtros para la tabla `nino`
--
ALTER TABLE `nino`
  ADD CONSTRAINT `nino` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id`);

--
-- Filtros para la tabla `tia_nivel`
--
ALTER TABLE `tia_nivel`
  ADD CONSTRAINT `tia_nivel_ibfk_1` FOREIGN KEY (`rut_tia`) REFERENCES `tia` (`rut`),
  ADD CONSTRAINT `tia_nivel_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

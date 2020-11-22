-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2020 a las 15:48:45
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futplay`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendar`
--

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `color` varchar(45) NOT NULL,
  `campo` int(11) NOT NULL,
  `Encuentro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `calendar`
--

INSERT INTO `calendar` (`id`, `title`, `start`, `end`, `color`, `campo`, `Encuentro`) VALUES
(3, '#1 Futbol 5', '2018-02-26 07:30:00', '2018-02-27 12:00:00', 'rgb(244, 67, 54)', 1, NULL),
(4, '#1 Futbol 5', '2020-11-01 16:00:00', '2020-11-01 17:00:00', 'rgb(244, 67, 54)', 1, NULL),
(10, '#1 Futbol 5', '2020-09-10 08:00:00', '2020-09-10 09:00:00', 'rgb(244, 67, 54)', 1, NULL),
(11, '#1 Futbol 5', '2020-09-08 08:00:00', '2020-09-08 09:00:00', 'rgb(244, 67, 54)', 1, NULL),
(19, '#1 Futbol 5', '2020-05-28 07:30:00', '2020-05-28 09:30:00', 'rgb(244, 67, 54)', 1, 1),
(20, 'Encuentro', '2020-01-11 01:00:00', '2020-01-11 02:00:00', 'rgb(244, 67, 54)', 1, 1),
(21, 'Encuentro', '2020-11-01 01:00:00', '2020-11-01 02:00:00', 'rgb(244, 67, 54)', 1, 1),
(23, 'Encuentro', '2020-11-01 13:00:00', '2020-11-01 14:00:00', 'rgb(244, 67, 54)', 1, 4),
(24, 'Encuentro', '2020-11-01 22:00:00', '2020-11-01 23:00:00', 'rgb(244, 67, 54)', 1, 5),
(25, 'Encuentro', '2020-11-02 15:00:00', '2020-11-02 16:00:00', 'rgb(244, 67, 54)', 1, 6),
(26, 'Encuentro', '2020-11-22 17:00:00', '2020-11-22 18:00:00', 'rgb(244, 67, 54)', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo`
--

CREATE TABLE `campo` (
  `idCampo` int(11) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Ubicacion` varchar(50) NOT NULL,
  `Horario` varchar(45) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Foto` text,
  `Propietario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campo`
--

INSERT INTO `campo` (`idCampo`, `Nombre`, `Direccion`, `Ubicacion`, `Horario`, `Rating`, `Foto`, `Propietario`) VALUES
(1, 'Topochos', 'Sogamoso', '4.6481609/-434.06916708', '11:11/11:11', NULL, 'campofutbol_1_pasador.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE `cancha` (
  `idCancha` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Tipo_Cancha` enum('Futbol 5','Futbol 8','Futbol12') NOT NULL,
  `Campo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cancha`
--

INSERT INTO `cancha` (`idCancha`, `Numero`, `Tipo_Cancha`, `Campo`) VALUES
(1, 1, 'Futbol 5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL,
  `Contenido` text NOT NULL,
  `Fecha` datetime NOT NULL,
  `Tipo` enum('Jugador','Equipo','Cancha','Campo') NOT NULL,
  `JugadorComentario` int(11) NOT NULL,
  `JugadorComentado` int(11) DEFAULT NULL,
  `CanchaComentado` int(11) DEFAULT NULL,
  `EquipoComentado` int(11) DEFAULT NULL,
  `CampoComentado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`idComentario`, `Contenido`, `Fecha`, `Tipo`, `JugadorComentario`, `JugadorComentado`, `CanchaComentado`, `EquipoComentado`, `CampoComentado`) VALUES
(1, 'Hola', '2020-10-25 19:36:27', 'Jugador', 2, 13, 0, 0, 0),
(2, 'Hola', '2020-10-25 19:37:46', 'Jugador', 2, 13, 0, 0, 0),
(3, 'Muy buen jugador.', '2020-10-25 19:52:01', 'Jugador', 2, 16, 0, 0, 0),
(4, 'El mejor portero.', '2020-10-25 20:43:18', 'Jugador', 2, 16, 0, 0, 0),
(5, 'El comentario', '2020-10-25 20:47:49', 'Jugador', 2, 16, 0, 0, 0),
(6, 'Comentando.', '2020-10-25 20:48:28', 'Jugador', 2, 16, 0, 0, 0),
(7, 'Muy buen jugador.', '2020-10-25 20:53:25', 'Jugador', 2, 2, 0, 0, 0),
(8, 'El mejor compa.', '2020-11-01 15:13:23', 'Jugador', 2, 7, 0, 0, 0),
(9, 'Buen jugador.', '2020-11-02 12:48:45', 'Jugador', 3, 9, 0, 0, 0),
(10, 'Muy buen jugador.', '2020-11-16 10:36:20', 'Jugador', 2, 16, 0, 0, 0),
(11, 'El mejor capitan de todos.', '2020-11-16 10:53:21', 'Jugador', 3, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuentro`
--

CREATE TABLE `encuentro` (
  `idEncuentro` int(11) NOT NULL,
  `Tipo` enum('5','8','12') NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Marcador` varchar(200) DEFAULT NULL,
  `Estado` enum('Jugando','Finalizado','Pospuesto','En espera') NOT NULL,
  `Cancha` int(11) NOT NULL,
  `Equipo_A` int(11) NOT NULL,
  `Equipo_B` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuentro`
--

INSERT INTO `encuentro` (`idEncuentro`, `Tipo`, `Fecha_Hora`, `Marcador`, `Estado`, `Cancha`, `Equipo_A`, `Equipo_B`) VALUES
(1, '5', '2020-11-01 15:01:10', '2/3', 'Finalizado', 1, 2, 3),
(2, '5', '2020-11-01 21:18:02', '3/2', 'Finalizado', 1, 2, 3),
(3, '5', '2020-11-01 22:49:53', '4/3', 'Finalizado', 1, 2, 3),
(4, '5', '2020-11-01 22:57:45', '5/1', 'Finalizado', 1, 2, 3),
(5, '5', '2020-11-01 23:09:09', '3/3', 'Finalizado', 1, 2, 3),
(6, '5', '2020-11-02 20:51:39', '0/0', 'Finalizado', 1, 2, 3),
(7, '5', '2020-11-22 12:27:35', '2/3', 'Finalizado', 1, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Capitan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idEquipo`, `Nombre`, `Ciudad`, `Capitan`) VALUES
(1, 'FutPlay', 'Sogamoso', '0'),
(2, 'Dummy Team', 'Sogamoso', '2'),
(3, 'Los pepes', 'Duitama', '3'),
(4, 'FutPlay Team', 'Sogamoso', '14'),
(5, 'PAIZOUN TEAM', 'Bogota', '16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadistica`
--

CREATE TABLE `estadistica` (
  `idEstadistica` int(11) NOT NULL,
  `Campeon` int(11) DEFAULT NULL,
  `Goleador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idJugador` int(11) NOT NULL,
  `Alias` varchar(30) NOT NULL,
  `Posicion` enum('Portero','Defensor','Mediocampista','Delantero') NOT NULL,
  `Pierna` enum('Derecha','Izquierda','Ambas') NOT NULL,
  `Descripcion` text NOT NULL,
  `RankingSystem` double NOT NULL,
  `RankingUsers` text,
  `Estado` enum('Activo','Inactivo') NOT NULL,
  `Capitan` tinyint(1) DEFAULT NULL,
  `Equipo` int(11) NOT NULL,
  `Persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`idJugador`, `Alias`, `Posicion`, `Pierna`, `Descripcion`, `RankingSystem`, `RankingUsers`, `Estado`, `Capitan`, `Equipo`, `Persona`) VALUES
(2, 'Andres99', 'Delantero', 'Derecha', 'Hola a todos.', 100, '2~1/', 'Activo', 1, 2, 2),
(3, 'pepee', 'Portero', 'Derecha', 'dddd', 33, '', 'Activo', 1, 3, 3),
(4, 'pepe1', 'Defensor', 'Derecha', 'no se que escribir', 25, '2~1/', 'Activo', 0, 2, 4),
(5, 'pepe2', 'Mediocampista', 'Izquierda', 'no se que escribir', 0, '2~0/', 'Activo', 0, 2, 5),
(6, 'pepe3', 'Mediocampista', 'Ambas', 'no se que escribir', 33, '', 'Activo', 0, 1, 6),
(7, 'pepe4', 'Delantero', 'Izquierda', 'no se que escribir', 100, '', 'Activo', 0, 2, 7),
(8, 'pepe5', 'Portero', 'Derecha', 'no se que escribir', 50, '2~1/', 'Activo', 0, 2, 8),
(9, 'pepe6', 'Mediocampista', 'Derecha', 'no se que escribir', 33, '', 'Activo', 0, 3, 9),
(10, 'pepe7', 'Defensor', 'Derecha', 'no se que escribir', 50, '', 'Activo', 0, 3, 10),
(11, 'pepe8', 'Defensor', 'Derecha', 'no se que escribir', 16, '', 'Activo', 0, 3, 11),
(12, 'pepe9', 'Defensor', 'Izquierda', 'no se que escribir', 25, '', 'Activo', 0, 3, 12),
(13, 'pepe10', 'Defensor', 'Ambas', 'no se que escribir', 33, '14~1/', 'Activo', 0, 4, 13),
(14, 'FutPlay', 'Delantero', 'Ambas', 'FutPlay', 100, '', 'Activo', 1, 4, 15),
(15, 'juancho', 'Defensor', 'Ambas', 'soy el mejor', 16, '', 'Activo', 0, 1, 16),
(16, 'usuario1', 'Portero', 'Izquierda', 'Soy nuevo :)', 8, '2~1/', 'Activo', 1, 5, 17),
(17, 'usuarioPrueba', 'Defensor', 'Derecha', 'Hola', 75, '', 'Activo', 0, 2, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `idMensaje` int(11) NOT NULL,
  `Contenido` text NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(10) NOT NULL,
  `Jugador` int(11) NOT NULL,
  `Equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`idMensaje`, `Contenido`, `Fecha`, `Hora`, `Jugador`, `Equipo`) VALUES
(1, 'Primer Mensaje', '2017-09-17', '9:7 0', 2, 2),
(2, 'aqaq', '2017-09-17', '9:22 0', 2, 2),
(3, 'jijijijij', '2017-09-17', '9:24 0', 2, 2),
(4, 'ejejjejej', '2017-09-17', '9:25 0', 2, 2),
(5, 'jojojojojo', '2017-09-17', '9:25 0', 2, 2),
(6, 'jujujuju', '2017-09-17', '09:27 0', 2, 2),
(7, 'xdxdxd', '2017-09-17', '09:29 0', 2, 2),
(8, 'op', '2017-09-17', '10:18 1', 2, 2),
(9, 'Hola equipo', '2017-09-27', '04:55 1', 14, 4),
(10, 'He vuelto después de mucho tiempo ', '2017-11-06', '09:36 1', 2, 2),
(11, 'Hola', '2020-05-25', '07:54 1', 2, 2),
(12, 'Hola equipo!', '2020-05-25', '11:01 1', 16, 5),
(13, 'Hola a todos', '2020-11-22', '00:01 1', 17, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `idNotificacion` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(15) NOT NULL,
  `Tipo` enum('Registro','EditarEquipo','CrearEquipo','FicharJugador','JugadorAgregado','SolicitarEncuentro','ConfirmarEncuentro','EncuentroConfirmado') NOT NULL,
  `Visto` text,
  `JugadorEnvia` int(11) DEFAULT NULL,
  `JugadorRecibe` int(11) DEFAULT NULL,
  `PropietarioEnvia` int(11) DEFAULT NULL,
  `PropietarioRecibe` int(11) DEFAULT NULL,
  `DatosAdicionales` text,
  `EquipoEnvia` int(11) DEFAULT NULL,
  `EquipoRecibe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`idNotificacion`, `Fecha`, `Hora`, `Tipo`, `Visto`, `JugadorEnvia`, `JugadorRecibe`, `PropietarioEnvia`, `PropietarioRecibe`, `DatosAdicionales`, `EquipoEnvia`, `EquipoRecibe`) VALUES
(2, '2017-09-16', '10:19 1', 'Registro', '/2', 0, 2, 0, 0, '', 0, 0),
(3, '2017-09-16', '10:26 1', 'CrearEquipo', '/2/4/5/17', 2, 0, 0, 0, '', 0, 2),
(4, '2017-09-17', '9:6 0', 'EditarEquipo', '/2/4/5/17', 2, 0, 0, 0, '', 2, 2),
(5, '2017-09-17', '09:31 0', 'EditarEquipo', '/2/4/5/17', 2, 0, 0, 0, '', 2, 2),
(6, '2017-09-17', '00:42 1', 'Registro', '/3', 0, 3, 0, 0, '', 0, 0),
(7, '2017-09-17', '00:43 1', 'Registro', '/4', 0, 4, 0, 0, '', 0, 0),
(8, '2017-09-17', '00:44 1', 'Registro', '/5', 0, 5, 0, 0, '', 0, 0),
(9, '2017-09-17', '00:45 1', 'Registro', '', 0, 6, 0, 0, '', 0, 0),
(10, '2017-09-17', '00:46 1', 'Registro', '/7', 0, 7, 0, 0, '', 0, 0),
(11, '2017-09-17', '00:47 1', 'Registro', '/8', 0, 8, 0, 0, '', 0, 0),
(12, '2017-09-17', '00:48 1', 'FicharJugador', '/4', 2, 4, 0, 0, '2', 0, 0),
(13, '2017-09-17', '00:48 1', 'FicharJugador', '/5', 2, 5, 0, 0, '2', 0, 0),
(14, '2017-09-17', '00:48 1', 'FicharJugador', '', 2, 6, 0, 0, '2', 0, 0),
(15, '2017-09-17', '00:48 1', 'FicharJugador', '/7', 2, 7, 0, 0, '2', 0, 0),
(16, '2017-09-17', '00:48 1', 'FicharJugador', '/8', 2, 8, 0, 0, '2', 0, 0),
(17, '2017-09-17', '00:49 1', 'JugadorAgregado', '/4/5/2/17', 0, 4, 0, 0, '', 0, 2),
(18, '2017-09-17', '00:50 1', 'EditarEquipo', '/4/5/2/17', 4, 0, 0, 0, '', 2, 2),
(19, '2017-09-17', '00:50 1', 'EditarEquipo', '/4/5/2/17', 2, 0, 0, 0, '', 2, 2),
(20, '2017-09-17', '00:51 1', 'JugadorAgregado', '/5/2/4/17', 0, 5, 0, 0, '', 0, 2),
(21, '2017-09-17', '00:52 1', 'JugadorAgregado', '/2/4/17', 0, 7, 0, 0, '', 0, 2),
(22, '2017-09-17', '00:53 1', 'JugadorAgregado', '/2/4/17', 0, 8, 0, 0, '', 0, 2),
(23, '2017-09-17', '00:55 1', 'Registro', '/9', 0, 9, 0, 0, '', 0, 0),
(24, '2017-09-17', '00:57 1', 'Registro', '/10', 0, 10, 0, 0, '', 0, 0),
(25, '2017-09-17', '00:58 1', 'Registro', '/11', 0, 11, 0, 0, '', 0, 0),
(26, '2017-09-17', '00:59 1', 'Registro', '/12', 0, 12, 0, 0, '', 0, 0),
(27, '2017-09-17', '01:00 1', 'Registro', '/13', 0, 13, 0, 0, '', 0, 0),
(28, '2017-09-17', '01:00 1', 'CrearEquipo', '/3/13', 3, 0, 0, 0, '', 0, 3),
(29, '2017-09-17', '01:01 1', 'FicharJugador', '/9', 3, 9, 0, 0, '3', 0, 0),
(30, '2017-09-17', '01:01 1', 'FicharJugador', '/10', 3, 10, 0, 0, '3', 0, 0),
(31, '2017-09-17', '01:01 1', 'FicharJugador', '/11', 3, 11, 0, 0, '3', 0, 0),
(32, '2017-09-17', '01:01 1', 'FicharJugador', '/12', 3, 12, 0, 0, '3', 0, 0),
(33, '2017-09-17', '01:01 1', 'FicharJugador', '/13', 3, 13, 0, 0, '3', 0, 0),
(34, '2017-09-17', '01:01 1', 'JugadorAgregado', '/3/13', 0, 9, 0, 0, '', 0, 3),
(35, '2017-09-17', '01:02 1', 'JugadorAgregado', '/3/13', 0, 10, 0, 0, '', 0, 3),
(36, '2017-09-17', '01:02 1', 'JugadorAgregado', '/3/13', 0, 11, 0, 0, '', 0, 3),
(37, '2017-09-17', '01:03 1', 'JugadorAgregado', '/3/13', 0, 12, 0, 0, '', 0, 3),
(38, '2017-09-17', '01:03 1', 'JugadorAgregado', '/3/13', 0, 13, 0, 0, '', 0, 3),
(41, '2017-09-17', '01:16 1', 'SolicitarEncuentro', '/3/13', 0, 0, 0, 0, '1/5', 2, 3),
(42, '2017-09-17', '01:17 1', 'SolicitarEncuentro', '/2/4/17', 0, 0, 0, 0, '1/5', 3, 2),
(43, '2017-09-17', '01:19 1', 'ConfirmarEncuentro', '/1', 0, 0, 0, 1, '5/2/3', 2, 0),
(44, '2017-09-27', '04:44 1', 'Registro', '', 0, 14, 0, 0, '', 0, 0),
(45, '2017-09-27', '04:45 1', 'CrearEquipo', '', 14, 0, 0, 0, '', 0, 4),
(46, '2017-09-27', '04:49 1', 'FicharJugador', '/13', 14, 13, 0, 0, '4', 0, 0),
(47, '2017-09-27', '04:54 1', 'JugadorAgregado', '', 0, 13, 0, 0, '', 0, 4),
(48, '2017-12-24', '11:07 1', 'Registro', '/15', 0, 15, 0, 0, '', 0, 0),
(49, '2020-05-20', '00:48 0', 'SolicitarEncuentro', '/3', 0, 0, 0, 0, '1/5', 2, 3),
(50, '2020-05-20', '00:51 0', 'EditarEquipo', '/2/4/17', 2, 0, 0, 0, '', 2, 2),
(51, '2020-05-25', '07:54 1', 'FicharJugador', '', 2, 13, 0, 0, '2', 0, 0),
(52, '2020-05-25', '07:56 1', 'SolicitarEncuentro', '/3', 0, 0, 0, 0, '1/5', 2, 3),
(53, '2020-05-25', '10:38 1', 'Registro', '', 0, 16, 0, 0, '', 0, 0),
(54, '2020-05-25', '10:46 1', 'CrearEquipo', '', 16, 0, 0, 0, '', 0, 5),
(55, '2020-05-25', '10:51 1', 'FicharJugador', '/3', 16, 3, 0, 0, '5', 0, 0),
(56, '2020-11-01', '07:35 P.M', 'EncuentroConfirmado', '/2/17', 0, 0, 1, 0, '', 0, 2),
(57, '2020-11-01', '03:01 1', 'EncuentroConfirmado', '/3', 0, 0, 1, 0, '', 0, 3),
(58, '2020-11-01', '09:11 1', 'SolicitarEncuentro', '/3', 0, 0, 0, 0, '1/5', 2, 3),
(59, '2020-11-01', '07:35 P.M', 'EncuentroConfirmado', '/2/17', 0, 0, 1, 0, '', 0, 2),
(60, '2020-11-01', '09:18 1', 'EncuentroConfirmado', '/3', 0, 0, 1, 0, '', 0, 3),
(61, '2020-11-01', '07:35 P.M', 'EncuentroConfirmado', '/2/17', 0, 0, 1, 0, '', 0, 2),
(62, '2020-11-01', '11:09 1', 'EncuentroConfirmado', '/3', 0, 0, 1, 0, '', 0, 3),
(63, '2020-11-02', '04:41 P.M', 'SolicitarEncuentro', '/2/17', 0, 0, 0, 0, '1/5/2020-11-02 15:00:00|2020-11-02 16:00:00', 3, 2),
(64, '2020-11-22', '11:22 0', 'Registro', '/17', 0, 17, 0, 0, '', 0, 0),
(65, '2020-11-22', '11:47 0', 'FicharJugador', '/17', 2, 17, 0, 0, '2', 0, 0),
(66, '2020-11-22', '11:54 0', 'JugadorAgregado', '/17/2', 0, 17, 0, 0, '', 0, 2),
(67, '2020-11-22', '00:11 1', 'SolicitarEncuentro', '/3', 0, 0, 0, 0, '1/5/2020-11-22 17:00:00|2020-11-22 18:00:00', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Genero` enum('Masculino','Femenino') NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `Contrasenia` text NOT NULL,
  `Avatar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `Nombres`, `Apellidos`, `Fecha_Nacimiento`, `Telefono`, `Genero`, `Correo`, `Contrasenia`, `Avatar`) VALUES
(2, 'Andres', 'Ponguta', '2017-09-16', '3015564516', 'Masculino', 'andres@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(3, 'pepe', 'pepe', '2017-09-17', '3006420415', 'Masculino', 'pepe@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(4, 'pepe1', 'pepe1', '2017-09-17', '3006420415', 'Masculino', 'pepe1@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(5, 'ppep2', 'pepe2', '2017-09-17', '3006420415', 'Masculino', 'pepe2@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(6, 'pepe3', 'pepe3', '2017-09-17', '3006420415', 'Femenino', 'pepe3@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(7, 'pepe4', 'pepe4', '2017-09-17', '3006420415', 'Femenino', 'pepe4@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(8, 'pepe5', 'pepe5', '2017-09-17', '3006420415', 'Masculino', 'pepe5@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(9, 'pepe6', 'pepe6', '2017-09-17', '3006420415', 'Femenino', 'pepe6@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(10, 'pepe7', 'pepe7', '2017-09-17', '3006420415', 'Masculino', 'pepe7@gmail.com', '548d81d5a726b42308939ed6bff64eb192ade6d040254c09c574e047fd5f03bbfa40e982c2d959d9edf32dc6358b831bf993092ffc01d0dc635ad20678e88512', 'av.jpg'),
(11, 'pepe8', 'pepe8', '2017-09-17', '3006420415', 'Masculino', 'pepe8@gmail.com', '548d81d5a726b42308939ed6bff64eb192ade6d040254c09c574e047fd5f03bbfa40e982c2d959d9edf32dc6358b831bf993092ffc01d0dc635ad20678e88512', 'av.jpg'),
(12, 'pepe9', 'pepe9', '2017-09-17', '3006420415', 'Masculino', 'pepe9@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(13, 'pepe10', 'pepe10', '2017-09-17', '3006420415', 'Femenino', 'pepe10@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(14, 'prop', 'prop', '2017-09-17', '3015564516', 'Femenino', 'prop@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(15, 'FutPlay', 'FutPlay', '2017-09-27', '3015564516', 'Masculino', 'FutPlay@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg'),
(16, 'Pepe', 'Tester', '2017-12-24', '', 'Femenino', 'germanguhe@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 'av.jpg'),
(17, 'Usuario1', 'Paizoun', '2020-05-25', '3015564533', 'Masculino', 'usuario1@paizoun.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av5.jpg'),
(18, 'Usurio', 'Prueba', '2020-11-22', '3015564557', 'Masculino', 'userPrueba@gmail.com', 'b3eebd72b43b377f8c814c6799723c89c2d134181a9bde7613e2f7c86916522232504510909adcd7be43e84d3b1c2d4c51985bdfc4804633330fc75816d03ff2', 'av.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `idPropietario` int(11) NOT NULL,
  `Persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`idPropietario`, `Persona`) VALUES
(1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `Tipo` enum('Futbol 5','Futbol 8','Futbol 12') NOT NULL,
  `Num_Equipos` int(11) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Cierre` date DEFAULT NULL,
  `Modalidad` enum('Publico','Privado') NOT NULL,
  `Estadistica` int(11) NOT NULL,
  `Propietario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneoequipo`
--

CREATE TABLE `torneoequipo` (
  `idTorneoEquipo` int(11) NOT NULL,
  `Torneo` int(11) NOT NULL,
  `Equipo` int(11) NOT NULL,
  `Clasificacion` int(11) DEFAULT NULL,
  `Estado` enum('Activo','Eliminado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Calendar_Campo1_idx` (`campo`);

--
-- Indices de la tabla `campo`
--
ALTER TABLE `campo`
  ADD PRIMARY KEY (`idCampo`),
  ADD UNIQUE KEY `idCampo_UNIQUE` (`idCampo`),
  ADD KEY `fk_Campo_Propietario1_idx` (`Propietario`);

--
-- Indices de la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD PRIMARY KEY (`idCancha`),
  ADD UNIQUE KEY `idCancha_UNIQUE` (`idCancha`),
  ADD KEY `fk_Cancha_Campo1_idx` (`Campo`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idComentario`);

--
-- Indices de la tabla `encuentro`
--
ALTER TABLE `encuentro`
  ADD PRIMARY KEY (`idEncuentro`),
  ADD UNIQUE KEY `idEncuentro_UNIQUE` (`idEncuentro`),
  ADD KEY `fk_Encuentro_Cancha1_idx` (`Cancha`),
  ADD KEY `fk_Encuentro_Equipo1_idx` (`Equipo_A`),
  ADD KEY `fk_Encuentro_Equipo2_idx` (`Equipo_B`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD UNIQUE KEY `idEquipo_UNIQUE` (`idEquipo`);

--
-- Indices de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  ADD PRIMARY KEY (`idEstadistica`),
  ADD UNIQUE KEY `idEstadistica_UNIQUE` (`idEstadistica`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idJugador`),
  ADD UNIQUE KEY `idUsuario_UNIQUE` (`idJugador`),
  ADD KEY `fk_Jugador_Persona1_idx` (`Persona`),
  ADD KEY `fk_Jugador_Equipo1_idx` (`Equipo`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`idMensaje`),
  ADD KEY `fk_Mensaje_Jugador1_idx` (`Jugador`),
  ADD KEY `fk_Mensaje_Equipo1_idx` (`Equipo`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`idNotificacion`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD UNIQUE KEY `idJugador_UNIQUE` (`idPersona`),
  ADD UNIQUE KEY `Correo_UNIQUE` (`Correo`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idPropietario`),
  ADD UNIQUE KEY `idPropietario_UNIQUE` (`idPropietario`),
  ADD KEY `fk_Propietario_Persona1_idx` (`Persona`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`),
  ADD UNIQUE KEY `idTorneo_UNIQUE` (`idTorneo`),
  ADD KEY `fk_Torneo_Estadistica1_idx` (`Estadistica`),
  ADD KEY `fk_Torneo_Propietario1_idx` (`Propietario`);

--
-- Indices de la tabla `torneoequipo`
--
ALTER TABLE `torneoequipo`
  ADD PRIMARY KEY (`idTorneoEquipo`),
  ADD UNIQUE KEY `idTorneoEquipo_UNIQUE` (`idTorneoEquipo`),
  ADD KEY `fk_Torneo_has_Equipo_Equipo1_idx` (`Equipo`),
  ADD KEY `fk_Torneo_has_Equipo_Torneo1_idx` (`Torneo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `campo`
--
ALTER TABLE `campo`
  MODIFY `idCampo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cancha`
--
ALTER TABLE `cancha`
  MODIFY `idCancha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `encuentro`
--
ALTER TABLE `encuentro`
  MODIFY `idEncuentro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  MODIFY `idEstadistica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idJugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `idMensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `idNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idPropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `idTorneo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `torneoequipo`
--
ALTER TABLE `torneoequipo`
  MODIFY `idTorneoEquipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `fk_Calendar_Campo1` FOREIGN KEY (`campo`) REFERENCES `campo` (`idCampo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campo`
--
ALTER TABLE `campo`
  ADD CONSTRAINT `fk_Campo_Propietario1` FOREIGN KEY (`Propietario`) REFERENCES `propietario` (`idPropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD CONSTRAINT `fk_Cancha_Campo1` FOREIGN KEY (`Campo`) REFERENCES `campo` (`idCampo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuentro`
--
ALTER TABLE `encuentro`
  ADD CONSTRAINT `fk_Encuentro_Cancha1` FOREIGN KEY (`Cancha`) REFERENCES `cancha` (`idCancha`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Encuentro_Equipo1` FOREIGN KEY (`Equipo_A`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Encuentro_Equipo2` FOREIGN KEY (`Equipo_B`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `fk_Jugador_Equipo1` FOREIGN KEY (`Equipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Jugador_Persona1` FOREIGN KEY (`Persona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `fk_Mensaje_Equipo1` FOREIGN KEY (`Equipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Jugador1` FOREIGN KEY (`Jugador`) REFERENCES `jugador` (`idJugador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `fk_Propietario_Persona1` FOREIGN KEY (`Persona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD CONSTRAINT `fk_Torneo_Estadistica1` FOREIGN KEY (`Estadistica`) REFERENCES `estadistica` (`idEstadistica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Torneo_Propietario1` FOREIGN KEY (`Propietario`) REFERENCES `propietario` (`idPropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `torneoequipo`
--
ALTER TABLE `torneoequipo`
  ADD CONSTRAINT `fk_Torneo_has_Equipo_Equipo1` FOREIGN KEY (`Equipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Torneo_has_Equipo_Torneo1` FOREIGN KEY (`Torneo`) REFERENCES `torneo` (`idTorneo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

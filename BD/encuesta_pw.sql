-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-11-2015 a las 10:39:47
-- Versión del servidor: 10.0.17-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuesta_pw`
--
CREATE DATABASE IF NOT EXISTS `encuesta_pw` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `encuesta_pw`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `usuario`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas_rellenas`
--

CREATE TABLE `encuestas_rellenas` (
  `id` int(11) NOT NULL,
  `id_estudios` int(11) NOT NULL,
  `hora_com` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `usuario` text NOT NULL,
  `titulacion` text NOT NULL,
  `biblioteca` text NOT NULL,
  `sexo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuestas_rellenas`
--

INSERT INTO `encuestas_rellenas` (`id`, `id_estudios`, `hora_com`, `hora_fin`, `usuario`, `titulacion`, `biblioteca`, `sexo`) VALUES
(18, 1, '00:47:38', '00:47:38', 'Estudiante', 'Grado en Ingeniería Informática', 'Biblioteca ESI', 'Hombre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `id` int(11) NOT NULL,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listado de estudios';

--
-- Volcado de datos para la tabla `estudios`
--

INSERT INTO `estudios` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Informática'),
(2, 'Grado en Ingeniería Aeroespacial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `id_dimension` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `tipo` int(11) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `id_dimension`, `pregunta`, `tipo`, `descripcion`) VALUES
(1, 1, 'Tipo de usuario', 1, 'PAS, Profesor, Estudiante'),
(2, 1, 'Titulación', 2, 'Grado al que pertenece'),
(3, 1, 'Biblioteca a evaluar', 3, 'Biblioteca que será evaluada'),
(4, 1, 'Sexo', 4, ''),
(5, 1, 'Edad', 6, 'Rango de edades'),
(27, 2, 'El personal me inspira confianza', 5, NULL),
(28, 2, 'El personal me ofrece atención personalizada', 5, NULL),
(29, 2, 'El personal es amable en el trato con los estudiantes', 5, NULL),
(30, 2, 'El personal muestra buena disposición para responder a las preguntas planteadas', 5, NULL),
(31, 2, 'El personal tiene conocimiento y es capaz de responder a las preguntas que se le formulan', 5, NULL),
(32, 2, 'El personal atiende amablemente a los usuarios', 5, NULL),
(33, 2, 'El personal comprende las necesidades de los usuarios', 5, NULL),
(34, 2, 'El personal manifiesta voluntad de ayudar a los usuarios', 5, NULL),
(35, 2, 'El personal muestra fiabilidad en el tratamiento de los problemas del servicio manifestados por los usuarios', 5, NULL),
(36, 3, 'Los espacios de la biblioteca inspiran el estudio y el aprendizaje', 5, NULL),
(37, 3, 'Existen espacios tranquilos para estudio individual', 5, NULL),
(38, 3, 'El espacio de la biblioteca es un lugar confortable y acogedor', 5, NULL),
(39, 3, 'La biblioteca es un lugar adecuado para estudio, aprendizaje o investigación', 5, NULL),
(40, 3, 'Existen espacios colectivos para aprendizaje y estudio en grupo', 5, NULL),
(41, 4, 'El acceso a los recursos electrónicos es factible desde mi casa o despacho', 5, NULL),
(42, 4, 'El sitio web de la biblioteca permite encontrar información por uno mismo', 5, NULL),
(43, 4, 'Los materiales impresos de la biblioteca cubren las necesidades de información que tengo', 5, NULL),
(44, 4, 'Los recursos digitales cubren las necesidades de información que tengo', 5, NULL),
(45, 4, 'El equipamiento es moderno y me permite un acceso fácil a la información que necesito', 5, NULL),
(46, 4, 'Los instrumentos para la recuperación de información (catálogos, bases de datos, ...) son fáciles de usar y me permiten encontrar por mí mismo lo que busco', 5, NULL),
(47, 4, 'Puedo acceder fácilmente a la información para procesarla y usarla en mis tareas', 5, NULL),
(48, 4, 'Las revistas en versión electrónica y/o impresa cubren mis necesidades de información', 5, NULL),
(49, 5, 'Observaciones/Comentarios', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `id_encuesta_rellena` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `respuesta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `id_encuesta_rellena`, `id_pregunta`, `respuesta`) VALUES
(203, 18, 27, '7'),
(204, 18, 28, '4'),
(205, 18, 29, '9'),
(206, 18, 30, '3'),
(207, 18, 31, '6'),
(208, 18, 32, '3'),
(209, 18, 33, '7'),
(210, 18, 34, '5'),
(211, 18, 35, '3'),
(212, 18, 36, '8'),
(213, 18, 37, '3'),
(214, 18, 38, '7'),
(215, 18, 39, '5'),
(216, 18, 40, '5'),
(217, 18, 41, '6'),
(218, 18, 42, '8'),
(219, 18, 43, '6'),
(220, 18, 44, '4'),
(221, 18, 45, '7'),
(222, 18, 46, '2'),
(223, 18, 47, '3'),
(224, 18, 48, '6'),
(225, 18, 49, 'Me asustan las arañas del techo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id` int(11) NOT NULL,
  `id_estudios` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id`, `id_estudios`, `descripcion`) VALUES
(1, 1, 'Preguntas personales'),
(2, 1, 'Valor afectivo del usuario'),
(3, 1, 'La biblioteca como espacio'),
(4, 1, 'Control de la información'),
(5, 1, 'Otros');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encuestas_rellenas`
--
ALTER TABLE `encuestas_rellenas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_estudios` (`id_estudios`);

--
-- Indices de la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dimension` (`id_dimension`),
  ADD KEY `id` (`id`),
  ADD KEY `id_dimension_2` (`id_dimension`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_encuesta_rellena` (`id_encuesta_rellena`),
  ADD KEY `id` (`id`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_estudios` (`id_estudios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `encuestas_rellenas`
--
ALTER TABLE `encuestas_rellenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `estudios`
--
ALTER TABLE `estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuestas_rellenas`
--
ALTER TABLE `encuestas_rellenas`
  ADD CONSTRAINT `encuestas_rellenas_ibfk_1` FOREIGN KEY (`id_estudios`) REFERENCES `estudios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_dimension`) REFERENCES `secciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`id_encuesta_rellena`) REFERENCES `encuestas_rellenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_estudios`) REFERENCES `estudios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

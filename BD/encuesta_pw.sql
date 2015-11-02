-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-11-2015 a las 11:52:44
-- Versión del servidor: 5.6.27
-- Versión de PHP: 5.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `encuesta_pw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `id` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `usuario`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas_rellenas`
--

CREATE TABLE IF NOT EXISTS `encuestas_rellenas` (
  `id` int(11) NOT NULL,
  `id_estudios` int(11) NOT NULL,
  `hora_com` date NOT NULL,
  `hora_fin` date NOT NULL,
  `usuario` text NOT NULL,
  `titulacion` text NOT NULL,
  `biblioteca` text NOT NULL,
  `sexo` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuestas_rellenas`
--

INSERT INTO `encuestas_rellenas` (`id`, `id_estudios`, `hora_com`, `hora_fin`, `usuario`, `titulacion`, `biblioteca`, `sexo`) VALUES
(1, 1, '2015-11-02', '2015-11-03', 'Estudiante', 'Grado en Ingeniería Informática', 'Biblioteca ESI', 'Hombre'),
(2, 1, '2015-11-02', '2015-11-04', 'Profesor', 'Grado en Ingeniería informática', 'Biblioteca CASEM', 'Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE IF NOT EXISTS `estudios` (
  `id` int(11) NOT NULL,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Listado de estudios';

--
-- Volcado de datos para la tabla `estudios`
--

INSERT INTO `estudios` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL,
  `id_dimension` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `tipo` int(11) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int(11) NOT NULL,
  `id_encuesta_rellena` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `respuesta` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `id_encuesta_rellena`, `id_pregunta`, `respuesta`) VALUES
(2, 1, 27, 'Hola!'),
(3, 2, 30, 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id` int(11) NOT NULL,
  `id_estudios` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `encuestas_rellenas`
--
ALTER TABLE `encuestas_rellenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `estudios`
--
ALTER TABLE `estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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

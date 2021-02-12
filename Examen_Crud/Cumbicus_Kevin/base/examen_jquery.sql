-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para examen_jquery
CREATE DATABASE IF NOT EXISTS `examen_jquery` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `examen_jquery`;

-- Volcando estructura para tabla examen_jquery.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla examen_jquery.alumno: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`id`, `nombres`, `telefono`, `direccion`) VALUES
	(1, 'Kevin', 246485542, 'Ciudad Victoria'),
	(2, 'Zahid', 113494, 'El valle'),
	(7, 'Carla', 6168523, 'Epoca'),
	(9, 'Ejemplo2', 168653, 'Ejemplo');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

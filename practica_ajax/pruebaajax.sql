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


-- Volcando estructura de base de datos para pruebaajax
CREATE DATABASE IF NOT EXISTS `pruebaajax` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pruebaajax`;

-- Volcando estructura para tabla pruebaajax.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) DEFAULT NULL,
  `Ciudad` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pruebaajax.clientes: ~5 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`Id`, `Nombre`, `Ciudad`, `Descripcion`) VALUES
	(1, 'Chony', 'Loja', 'nuestro mejor cliente'),
	(2, 'West Digital', 'Guayaquil', 'hacen discos'),
	(3, 'Rosa', 'Quito', 'Cliente pagadora'),
	(4, 'Master PC', 'Balsas', 'Vende computadoras'),
	(5, 'El carbonero', 'Manta', 'asados');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla pruebaajax.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `texto` varchar(200) NOT NULL,
  `fechahora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pruebaajax.comentario: ~0 rows (aproximadamente)
DELETE FROM `comentario`;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

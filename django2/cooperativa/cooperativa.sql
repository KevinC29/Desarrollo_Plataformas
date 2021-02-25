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


-- Volcando estructura de base de datos para cooperativa
CREATE DATABASE IF NOT EXISTS `cooperativa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cooperativa`;

-- Volcando estructura para tabla cooperativa.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_group: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(3, 'clientes'),
	(2, 'gestion_clientes'),
	(1, 'transacciones');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_group_permissions: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(4, 1, 28),
	(5, 1, 29),
	(1, 1, 32),
	(2, 1, 33),
	(3, 1, 36),
	(10, 2, 25),
	(11, 2, 26),
	(12, 2, 27),
	(13, 2, 28),
	(6, 2, 33),
	(7, 2, 34),
	(8, 2, 35),
	(9, 2, 36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_permission: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add cliente', 7, 'add_cliente'),
	(26, 'Can change cliente', 7, 'change_cliente'),
	(27, 'Can delete cliente', 7, 'delete_cliente'),
	(28, 'Can view cliente', 7, 'view_cliente'),
	(29, 'Can add cuenta', 8, 'add_cuenta'),
	(30, 'Can change cuenta', 8, 'change_cuenta'),
	(31, 'Can delete cuenta', 8, 'delete_cuenta'),
	(32, 'Can view cuenta', 8, 'view_cuenta'),
	(33, 'Can add transaccion', 9, 'add_transaccion'),
	(34, 'Can change transaccion', 9, 'change_transaccion'),
	(35, 'Can delete transaccion', 9, 'delete_transaccion'),
	(36, 'Can view transaccion', 9, 'view_transaccion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `api_token` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `api_token`) VALUES
	(1, 'pbkdf2_sha256$216000$p4d9PXSIsAVI$Xj9uet6zGBnKrzuS0Vay/DvLIRCrdfvR+1GSYGvjUX4=', '2021-02-24 23:24:53.554496', 1, 'Kevin', '', '', 'solanokevyn@gmail.com', 1, 1, '2021-01-27 03:37:37.000000', 'bSPp2N2PPwgC9mmFRywSsczNbwr6VPFToo0PW2Bfjb4oCoFB17dgx9IE8wb4tWTidzCAfwKz9w7F0ayre3iSrlpjdHOoKnTDx2BMCeeVgtbwcSD7IURuxOlcwzsMUIigsm32RzyKTHGtVqcbmEXZMM'),
	(2, 'pbkdf2_sha256$216000$aftPQ2qYtbpd$FtL2nij+7OslQnz4iDQVLvatiNsSqD9FER8uHjk5bxA=', '2021-02-16 23:20:15.912243', 0, 'Zahid', 'Zahid', 'Armijos', 'zahid@gmail.com', 0, 1, '2021-01-27 03:43:42.000000', NULL),
	(3, 'pbkdf2_sha256$216000$5X4sCGOV1cXK$bHEOzjTlzr/0QhRpqfu3Sqm0tq1sXpeYqyBKUgf3OgE=', NULL, 0, '110054', 'Kevin', 'Cumbicusus', 'ejemplo@gmail.com', 0, 1, '2021-01-27 12:22:09.848961', NULL),
	(4, 'pbkdf2_sha256$216000$MOKQR3BaKLXQ$q2COkUXUWYdwEejc3MHZbT+Q+/SFgqCD9mcAUK+CHFs=', NULL, 0, '11006789', 'Zahid', 'Armijos', 'zahid@gmail.com', 0, 1, '2021-01-27 12:23:03.288496', NULL),
	(5, 'pbkdf2_sha256$216000$rV2d5trCJlCg$Hc7b2CXz9jy8xfxeEikykiWMbVhvN65qgStvcYzT58s=', NULL, 0, '1100051', 'Jhon', 'Guayllas', 'ejemplo3@gmail.com', 0, 1, '2021-01-27 12:23:49.111602', NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user_groups: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(3, 1, 1),
	(4, 1, 2),
	(5, 1, 3),
	(1, 2, 1),
	(2, 2, 2),
	(6, 3, 3),
	(7, 4, 3),
	(8, 5, 3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user_user_permissions: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 1, 9),
	(10, 1, 10),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22),
	(23, 1, 23),
	(24, 1, 24),
	(25, 1, 25),
	(26, 1, 26),
	(27, 1, 27),
	(28, 1, 28),
	(29, 1, 29),
	(30, 1, 30),
	(31, 1, 31),
	(32, 1, 32),
	(33, 1, 33),
	(34, 1, 34),
	(35, 1, 35),
	(36, 1, 36);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_admin_log: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-01-27 03:38:10.678655', '1', 'Kevin', 2, '[{"changed": {"fields": ["User permissions"]}}]', 4, 1),
	(2, '2021-01-27 03:40:43.604234', '1', 'transacciones', 1, '[{"added": {}}]', 3, 1),
	(3, '2021-01-27 03:42:05.828822', '2', 'gestion_clientes', 1, '[{"added": {}}]', 3, 1),
	(4, '2021-01-27 03:42:19.353418', '3', 'clientes', 1, '[{"added": {}}]', 3, 1),
	(5, '2021-01-27 03:43:42.878461', '2', 'Zahid', 1, '[{"added": {}}]', 4, 1),
	(6, '2021-01-27 03:44:12.685763', '2', 'Zahid', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]', 4, 1),
	(7, '2021-01-27 03:44:47.897972', '1', 'Kevin', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_content_type: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'modelo', 'cliente'),
	(8, 'modelo', 'cuenta'),
	(9, 'modelo', 'transaccion'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_migrations: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-01-27 03:36:11.782524'),
	(2, 'auth', '0001_initial', '2021-01-27 03:36:12.034872'),
	(3, 'admin', '0001_initial', '2021-01-27 03:36:12.390197'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-27 03:36:12.452037'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-27 03:36:12.474970'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-27 03:36:12.537805'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-27 03:36:12.565730'),
	(8, 'auth', '0003_alter_user_email_max_length', '2021-01-27 03:36:12.670448'),
	(9, 'auth', '0004_alter_user_username_opts', '2021-01-27 03:36:12.687403'),
	(10, 'auth', '0005_alter_user_last_login_null', '2021-01-27 03:36:12.759747'),
	(11, 'auth', '0006_require_contenttypes_0002', '2021-01-27 03:36:12.771707'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-27 03:36:12.791652'),
	(13, 'auth', '0008_alter_user_username_max_length', '2021-01-27 03:36:12.832547'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-27 03:36:12.879939'),
	(15, 'auth', '0010_alter_group_name_max_length', '2021-01-27 03:36:12.907857'),
	(16, 'auth', '0011_update_proxy_permissions', '2021-01-27 03:36:12.932790'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-27 03:36:12.982658'),
	(18, 'modelo', '0001_initial', '2021-01-27 03:36:13.528204'),
	(19, 'sessions', '0001_initial', '2021-01-27 03:36:14.395848');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_session: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('cvs6qturfrz9h4c9c22shltyq3q91zq2', '.eJxVjDsOwjAQBe_iGlm2d_2jpOcM1vqHA8iR4qRC3B0ipYD2zcx7sUDb2sI2yhKmzM5MstPvFik9St9BvlO_zTzNfV2myHeFH3Tw65zL83K4fweNRvvWpZYUs3DOo1AYUwXUHqOsOQNWqYC8AHCkjS-AViVC563T2ohqyCJ7fwDp4TdT:1l6w30:nrHHjScKRKbkygsRikR5EsioANEkYuOZM2gWSZw0fIs', '2021-02-16 13:48:50.250094'),
	('l469orxw5dxe5o3ww4avpjb8g6dq24qt', '.eJxVjDsOwjAQBe_iGlm2d_2jpOcM1vqHA8iR4qRC3B0ipYD2zcx7sUDb2sI2yhKmzM5MstPvFik9St9BvlO_zTzNfV2myHeFH3Tw65zL83K4fweNRvvWpZYUs3DOo1AYUwXUHqOsOQNWqYC8AHCkjS-AViVC563T2ohqyCJ7fwDp4TdT:1l4blN:ViJ6rqD0NloDNlz3jDqAu51_NJptNHh9qese8lgFxy4', '2021-02-10 03:45:01.081791'),
	('y8mmhkdna0ret9x23d5ybv3x4c2sckko', '.eJxVjDsOwjAQBe_iGlm2d_2jpOcM1vqHA8iR4qRC3B0ipYD2zcx7sUDb2sI2yhKmzM5MstPvFik9St9BvlO_zTzNfV2myHeFH3Tw65zL83K4fweNRvvWpZYUs3DOo1AYUwXUHqOsOQNWqYC8AHCkjS-AViVC563T2ohqyCJ7fwDp4TdT:1lF3WX:3PFP-35rtjJVfUKITPHlh5IL_d4ySh-TRTKPeJHQ6jM', '2021-03-10 23:24:53.557489'),
	('zipbcsd3i77sd362j1j0jomc45z1l2vp', '.eJxVjDsOwjAQBe_iGlm2d_2jpOcM1vqHA8iR4qRC3B0ipYD2zcx7sUDb2sI2yhKmzM5MstPvFik9St9BvlO_zTzNfV2myHeFH3Tw65zL83K4fweNRvvWpZYUs3DOo1AYUwXUHqOsOQNWqYC8AHCkjS-AViVC563T2ohqyCJ7fwDp4TdT:1lCA9e:I_JANeFo8MpTx3N8cAUyy27SRejWBBc5cGnUd64MgSQ', '2021-03-02 23:53:18.679032');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_cliente
CREATE TABLE IF NOT EXISTS `modelo_cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `estadoCivil` varchar(20) NOT NULL,
  `correo` varchar(105) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_cliente: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_cliente` DISABLE KEYS */;
INSERT INTO `modelo_cliente` (`cliente_id`, `cedula`, `nombres`, `apellidos`, `genero`, `estadoCivil`, `correo`, `telefono`, `celular`, `direccion`, `date_created`) VALUES
	(1, '110054', 'Kevin', 'Cumbicusus', 'masculino', 'soltero', 'ejemplo@gmail.com', '2326317', '0993145872', 'Ciudad Victoria', '2021-01-27 12:22:09.654479'),
	(2, '11006789', 'Zahid', 'Armijoz', 'masculino', 'separado', 'zahid@gmail.com', '2326317', '5645342', 'Ciudad Victoria', '2021-01-27 12:23:03.284508'),
	(3, '1100051', 'Jhon Alexander', 'Guayllas', 'masculino', 'divorciado', 'ejemplo3@gmail.com', '2342889', '094453', 'El Valle', '2021-01-27 12:23:49.109608'),
	(4, '1254', 'Luis', 'Solano', 'masculino', 'casado', 'luis@gmail.com', '36547', '524789', 'Loja', '2021-01-26 04:41:22.231140'),
	(5, '125487', 'Lizbeth', 'Rodriguez', 'femenino', 'divorciado', 'liz@gmail.com', '365485', '524893', 'Loja', '2021-01-26 04:41:22.231140'),
	(6, '12548789', 'Liza', 'Rodriguez', 'femenino', 'soltera', 'liza@gmail.com', '3654845', '5248963', 'Loja', '2021-01-26 04:41:22.231140');
/*!40000 ALTER TABLE `modelo_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_cuenta
CREATE TABLE IF NOT EXISTS `modelo_cuenta` (
  `cuenta_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `fechaApartura` datetime(6) NOT NULL,
  `tipoCuenta` varchar(20) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `modelo_cuenta_cliente_id_dcab0d68_fk_modelo_cliente_cliente_id` (`cliente_id`),
  CONSTRAINT `modelo_cuenta_cliente_id_dcab0d68_fk_modelo_cliente_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `modelo_cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_cuenta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_cuenta` DISABLE KEYS */;
INSERT INTO `modelo_cuenta` (`cuenta_id`, `numero`, `fechaApartura`, `tipoCuenta`, `saldo`, `estado`, `date_created`, `cliente_id`) VALUES
	(1, '1', '2021-02-24 23:26:16.995371', 'ahorros', 50.00, 1, '2021-01-27 12:22:09.833002', 1),
	(2, '2', '2021-01-27 12:23:03.286500', 'corriente', 600.00, 1, '2021-01-27 12:23:03.286500', 2),
	(3, '3', '2021-01-27 12:23:49.110607', 'ahorros', 250.00, 1, '2021-01-27 12:23:49.110607', 3),
	(4, '5', '2021-01-27 12:24:30.724576', 'corriente', 500.00, 1, '2021-01-27 12:24:30.724576', 1);
/*!40000 ALTER TABLE `modelo_cuenta` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_transaccion
CREATE TABLE IF NOT EXISTS `modelo_transaccion` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descripcion` longtext NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `modelo_transaccion_cuenta_id_13e268f8_fk_modelo_cuenta_cuenta_id` (`cuenta_id`),
  CONSTRAINT `modelo_transaccion_cuenta_id_13e268f8_fk_modelo_cuenta_cuenta_id` FOREIGN KEY (`cuenta_id`) REFERENCES `modelo_cuenta` (`cuenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_transaccion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_transaccion` DISABLE KEYS */;
INSERT INTO `modelo_transaccion` (`transaccion_id`, `fecha`, `tipo`, `valor`, `descripcion`, `updated_at`, `cuenta_id`) VALUES
	(1, '2021-01-27 12:26:02.645618', 'deposito', 50.00, 'deposito', '2021-01-27 12:26:02.645618', 1),
	(2, '2021-01-27 12:26:15.446398', 'retiro', 50.00, 'retiro', '2021-01-27 12:26:15.446398', 1),
	(3, '2021-02-24 23:26:16.988390', 'retiro', 10.00, 'retiro', '2021-02-24 23:26:16.988390', 1);
/*!40000 ALTER TABLE `modelo_transaccion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

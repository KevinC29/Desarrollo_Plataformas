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


-- Volcando estructura de base de datos para colegio
CREATE DATABASE IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `colegio`;

-- Volcando estructura para tabla colegio.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_group: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(1, 'gestion_administrativa'),
	(2, 'gestion_matriculas');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_group_permissions: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(5, 1, 25),
	(6, 1, 26),
	(7, 1, 27),
	(8, 1, 28),
	(1, 1, 33),
	(2, 1, 34),
	(3, 1, 35),
	(4, 1, 36),
	(14, 2, 21),
	(15, 2, 29),
	(16, 2, 30),
	(17, 2, 31),
	(9, 2, 32),
	(10, 2, 37),
	(11, 2, 38),
	(12, 2, 39),
	(13, 2, 40);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_permission: ~40 rows (aproximadamente)
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
	(25, 'Can add carrera', 7, 'add_carrera'),
	(26, 'Can change carrera', 7, 'change_carrera'),
	(27, 'Can delete carrera', 7, 'delete_carrera'),
	(28, 'Can view carrera', 7, 'view_carrera'),
	(29, 'Can add curso', 8, 'add_curso'),
	(30, 'Can change curso', 8, 'change_curso'),
	(31, 'Can delete curso', 8, 'delete_curso'),
	(32, 'Can view curso', 8, 'view_curso'),
	(33, 'Can add estudiante', 9, 'add_estudiante'),
	(34, 'Can change estudiante', 9, 'change_estudiante'),
	(35, 'Can delete estudiante', 9, 'delete_estudiante'),
	(36, 'Can view estudiante', 9, 'view_estudiante'),
	(37, 'Can add matricula', 10, 'add_matricula'),
	(38, 'Can change matricula', 10, 'change_matricula'),
	(39, 'Can delete matricula', 10, 'delete_matricula'),
	(40, 'Can view matricula', 10, 'view_matricula');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.auth_user
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `api_token`) VALUES
	(1, 'pbkdf2_sha256$216000$12XWRaYuheuK$l3QIJbrGd7oKqnDRV0r2EKg5p9zfCbl2/t76+1jpBPs=', '2021-02-27 23:43:17.646777', 1, 'Kevin', 'Kevin', 'Cumbicus', 'solanokevyn@gmail.com', 1, 1, '2021-02-24 18:40:12.000000', 'SRzWSeoGdk03XBIy7HGpfbBX15Oy1eckOQbBIyifTPa9OR5OSaYMQEAXSANUq3OzSU11PO6oBlMLz24lRe6YiGg8raiYWtaZxfLZXcmMXDgyCvjmI8d89AxiJStBV1feGQRVVPX4DSRjrQP4bXUsNb'),
	(2, 'pbkdf2_sha256$216000$R4wTuXmhPytK$ITURckNvR3UVCh2tsRgf7jKbLmoVW19T5+O5ccnueJk=', '2021-02-25 14:31:21.258186', 0, 'Zahid', 'Zahid', 'Armijos', 'zahid@gmail.com', 0, 1, '2021-02-24 18:46:57.000000', NULL),
	(4, 'pbkdf2_sha256$216000$9kZ6Cq9ead6a$6n/9WLhJ3eWMS9Yw36jNqWvd5Eq0zdjSrDa35KDwFpI=', '2021-02-25 14:31:45.453886', 0, 'Hugo', 'Hugo', 'Solano', '', 0, 1, '2021-02-25 14:24:44.000000', NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_user_groups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(5, 4, 2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.auth_user_user_permissions: ~40 rows (aproximadamente)
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
	(36, 1, 36),
	(37, 1, 37),
	(38, 1, 38),
	(39, 1, 39),
	(40, 1, 40);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.django_admin_log
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.django_admin_log: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-02-24 18:44:26.932164', '1', 'gestion_administrativa', 1, '[{"added": {}}]', 3, 1),
	(2, '2021-02-24 18:46:00.034475', '2', 'gestion_matriculas', 1, '[{"added": {}}]', 3, 1),
	(3, '2021-02-24 18:46:38.852802', '1', 'Kevin', 2, '[{"changed": {"fields": ["First name", "Last name", "Groups", "User permissions"]}}]', 4, 1),
	(4, '2021-02-24 18:46:58.064950', '2', 'Zahid', 1, '[{"added": {}}]', 4, 1),
	(5, '2021-02-24 18:47:45.524035', '2', 'Zahid', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]', 4, 1),
	(6, '2021-02-24 18:48:08.435183', '3', 'Hugo', 1, '[{"added": {}}]', 4, 1),
	(7, '2021-02-24 18:48:37.269716', '3', 'Hugo', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address", "Active", "Groups"]}}]', 4, 1),
	(8, '2021-02-25 14:24:26.207038', '3', 'Hugo', 3, '', 4, 1),
	(9, '2021-02-25 14:24:45.051040', '4', 'Hugo', 1, '[{"added": {}}]', 4, 1),
	(10, '2021-02-25 14:24:53.366643', '4', 'Hugo', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1),
	(11, '2021-02-25 14:25:14.295989', '4', 'Hugo', 2, '[{"changed": {"fields": ["Last name", "Active", "Groups"]}}]', 4, 1),
	(12, '2021-02-25 14:26:16.521837', '4', 'Hugo', 2, '[{"changed": {"fields": ["Active"]}}]', 4, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.django_content_type: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'modelo', 'carrera'),
	(8, 'modelo', 'curso'),
	(9, 'modelo', 'estudiante'),
	(10, 'modelo', 'matricula'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.django_migrations: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-02-24 18:39:15.344452'),
	(2, 'auth', '0001_initial', '2021-02-24 18:39:15.727539'),
	(3, 'admin', '0001_initial', '2021-02-24 18:39:16.506787'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-24 18:39:16.545685'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-24 18:39:16.553664'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-24 18:39:16.585580'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-24 18:39:16.693289'),
	(8, 'auth', '0003_alter_user_email_max_length', '2021-02-24 18:39:16.717224'),
	(9, 'auth', '0004_alter_user_username_opts', '2021-02-24 18:39:16.725206'),
	(10, 'auth', '0005_alter_user_last_login_null', '2021-02-24 18:39:16.747145'),
	(11, 'auth', '0006_require_contenttypes_0002', '2021-02-24 18:39:16.750136'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-24 18:39:16.758115'),
	(13, 'auth', '0008_alter_user_username_max_length', '2021-02-24 18:39:16.771081'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-24 18:39:16.786040'),
	(15, 'auth', '0010_alter_group_name_max_length', '2021-02-24 18:39:16.810974'),
	(16, 'auth', '0011_update_proxy_permissions', '2021-02-24 18:39:16.820957'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-24 18:39:16.834911'),
	(18, 'modelo', '0001_initial', '2021-02-24 18:39:16.891758'),
	(19, 'modelo', '0002_auto_20210224_1332', '2021-02-24 18:39:17.222150'),
	(20, 'sessions', '0001_initial', '2021-02-24 18:39:17.235115'),
	(21, 'modelo', '0003_auto_20210224_1358', '2021-02-24 19:00:21.020082'),
	(22, 'modelo', '0004_auto_20210224_1400', '2021-02-24 19:00:21.067913');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.django_session: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('8nkxcoed52uiq9g80w5b5n2xr0o0ot57', '.eJxVjDEOwjAMRe-SGUV17CaUkZ0zVHYcSAElUtNOiLtDpQ6w_vfef5mR1yWPa0vzOKk5GTCH3004PlLZgN653KqNtSzzJHZT7E6bvVRNz_Pu_h1kbvlbX5VjCsSASAEoCnkXY2DsxWvoCIF7URi8U0LsjsKeHLNCUESXBvP-AOhRN7A:1lG9Ez:rmPX5eRwsrtnxlK5kzipAbD4E1kULpfd7Ruu1X-meA8', '2021-03-13 23:43:17.691659'),
	('quyck9rdp3t7327jfnjaqmc8s0g14l2h', '.eJxVjDEOwjAMRe-SGUV17CaUkZ0zVHYcSAElUtNOiLtDpQ6w_vfef5mR1yWPa0vzOKk5GTCH3004PlLZgN653KqNtSzzJHZT7E6bvVRNz_Pu_h1kbvlbX5VjCsSASAEoCnkXY2DsxWvoCIF7URi8U0LsjsKeHLNCUESXBvP-AOhRN7A:1lEzkm:dC2z8FBR079zvUISgkD0pjdUEBWNNYnJ2YHxEJlz11c', '2021-03-10 19:23:20.517864');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.modelo_carrera
CREATE TABLE IF NOT EXISTS `modelo_carrera` (
  `carrera_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `duracion` smallint(5) unsigned NOT NULL CHECK (`duracion` >= 0),
  PRIMARY KEY (`carrera_id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.modelo_carrera: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_carrera` DISABLE KEYS */;
INSERT INTO `modelo_carrera` (`carrera_id`, `codigo`, `nombre`, `duracion`) VALUES
	(1, '432', 'Contabilidad', 3),
	(2, '475', 'Mecanica', 3),
	(3, '540', 'Agropecuaria', 3),
	(4, '500', 'BGU', 3);
/*!40000 ALTER TABLE `modelo_carrera` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.modelo_curso
CREATE TABLE IF NOT EXISTS `modelo_curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `creditos` smallint(5) unsigned NOT NULL CHECK (`creditos` >= 0),
  `docente` varchar(100) NOT NULL,
  PRIMARY KEY (`curso_id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.modelo_curso: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_curso` DISABLE KEYS */;
INSERT INTO `modelo_curso` (`curso_id`, `codigo`, `nombre`, `creditos`, `docente`) VALUES
	(1, '1', 'A', 50, 'Maria Romero'),
	(2, '2', 'B', 60, 'Cristhofer Escudero'),
	(3, '3', 'C', 70, 'Estefania Contento'),
	(4, '4', 'D', 40, 'Lizbeth Gutierrez');
/*!40000 ALTER TABLE `modelo_curso` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.modelo_estudiante
CREATE TABLE IF NOT EXISTS `modelo_estudiante` (
  `estudiante_id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` varchar(1) NOT NULL,
  `vigencia` tinyint(1) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `modelo_estudiante_carrera_id_054678a0_fk_modelo_ca` (`carrera_id`),
  CONSTRAINT `modelo_estudiante_carrera_id_054678a0_fk_modelo_ca` FOREIGN KEY (`carrera_id`) REFERENCES `modelo_carrera` (`carrera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.modelo_estudiante: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_estudiante` DISABLE KEYS */;
INSERT INTO `modelo_estudiante` (`estudiante_id`, `dni`, `apellidos`, `nombres`, `fechaNacimiento`, `genero`, `vigencia`, `carrera_id`) VALUES
	(1, '10', 'Cumbicus', 'Kevin', '2000-06-29', 'M', 1, 1),
	(2, '11', 'Armijos', 'Zahid', '2000-06-30', 'M', 1, 1),
	(3, '12', 'Guayllas', 'Jhon', '2001-08-30', 'M', 1, 2),
	(4, '13', 'Espinoza', 'Albertina', '2002-06-29', 'F', 1, 2),
	(5, '14', 'Chuquirima', 'Mirian', '1999-06-24', 'F', 1, 3),
	(6, '15', 'Solano', 'Luis', '1998-07-25', 'M', 1, 3),
	(7, '40', 'ejemplo', 'ejemplo', '2001-08-25', 'M', 1, 1),
	(8, '17', 'Calderon', 'Ana', '1999-06-30', 'F', 1, 3);
/*!40000 ALTER TABLE `modelo_estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla colegio.modelo_matricula
CREATE TABLE IF NOT EXISTS `modelo_matricula` (
  `matricula_id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaMatricula` datetime(6) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_id`),
  KEY `modelo_matricula_estudiante_id_6132242f` (`estudiante_id`),
  KEY `modelo_matricula_curso_id_9a128fe5` (`curso_id`),
  CONSTRAINT `modelo_matricula_curso_id_9a128fe5_fk_modelo_curso_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `modelo_curso` (`curso_id`),
  CONSTRAINT `modelo_matricula_estudiante_id_6132242f_fk_modelo_es` FOREIGN KEY (`estudiante_id`) REFERENCES `modelo_estudiante` (`estudiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla colegio.modelo_matricula: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_matricula` DISABLE KEYS */;
INSERT INTO `modelo_matricula` (`matricula_id`, `fechaMatricula`, `curso_id`, `estudiante_id`) VALUES
	(6, '2021-02-24 19:01:04.468409', 1, 1),
	(7, '2021-02-24 19:01:21.616294', 1, 2),
	(8, '2021-02-24 19:01:36.064536', 2, 3),
	(9, '2021-02-24 19:01:41.880539', 2, 4),
	(10, '2021-02-24 19:01:48.316217', 3, 5),
	(11, '2021-02-24 19:01:54.634624', 3, 6),
	(12, '2021-02-25 19:01:36.064536', 4, 8);
/*!40000 ALTER TABLE `modelo_matricula` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2014 at 10:58 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `podobri`
--
DROP SCHEMA IF EXISTS `podobri` ;
CREATE SCHEMA IF NOT EXISTS `podobri` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `podobri` ;
-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `type`) VALUES
(14, 'PR, Дизайн, Маркетинг'),
(9, 'Бизнес и предприемачество'),
(18, 'Други'),
(10, 'Екология и земеделие'),
(7, 'Изкуство'),
(5, 'ИТ'),
(8, 'Култура'),
(6, 'Медицина и здравеопазване'),
(13, 'Медия и комуникации'),
(17, 'Меки умения'),
(15, 'Образование'),
(2, 'Природни науки'),
(16, 'Социални дейности'),
(3, 'Социални науки'),
(11, 'Спорт'),
(4, 'Технически науки'),
(12, 'Туризъм'),
(1, 'Хуманитарни науки');

-- --------------------------------------------------------

--
-- Table structure for table `auths`
--

CREATE TABLE IF NOT EXISTS `auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_user_id_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `post_code` int(4) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_name_UNIQUE` (`city`),
  KEY `country_id_idx` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=256 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `post_code`, `country_id`) VALUES
(1, 'София', 1000, 1),
(2, 'Пловдив', 4000, 1),
(3, 'Варна', 9000, 1),
(4, 'Бургас', 8000, 1),
(5, 'Русе', 7000, 1),
(6, 'Стара Загора', 6000, 1),
(7, 'Плевен', 5800, 1),
(8, 'Добрич', 9300, 1),
(9, 'Сливен', 8800, 1),
(10, 'Шумен', 9700, 1),
(11, 'Перник', 2300, 1),
(12, 'Ямбол', 8600, 1),
(13, 'Хасково', 6300, 1),
(14, 'Пазарджик', 4400, 1),
(15, 'Благоевград', 2700, 1),
(16, 'Велико Търново', 5000, 1),
(17, 'Враца', 3000, 1),
(18, 'Габрово', 5300, 1),
(19, 'Видин', 3700, 1),
(20, 'Асеновград', 4230, 1),
(21, 'Казанлък', 6100, 1),
(22, 'Кюстендил', 2500, 1),
(23, 'Кърджали', 6600, 1),
(24, 'Монтана', 3400, 1),
(25, 'Димитровград', 6400, 1),
(26, 'Търговище', 7700, 1),
(27, 'Силистра', 7500, 1),
(28, 'Ловеч', 5500, 1),
(29, 'Дупница', 2600, 1),
(30, 'Разград', 7200, 1),
(31, 'Свищов', 5250, 1),
(32, 'Горна Оряховица', 5100, 1),
(33, 'Смолян', 4700, 1),
(34, 'Петрич', 2850, 1),
(35, 'Сандански', 2800, 1),
(36, 'Самоков', 2000, 1),
(37, 'Севлиево', 5400, 1),
(38, 'Лом', 3600, 1),
(39, 'Велинград', 4600, 1),
(40, 'Карлово', 4300, 1),
(41, 'Нова Загора', 8900, 1),
(42, 'Троян', 5600, 1),
(43, 'Айтос', 8500, 1),
(44, 'Ботевград', 2140, 1),
(45, 'Пещера', 4550, 1),
(46, 'Гоце Делчев', 2900, 1),
(47, 'Харманли', 6450, 1),
(48, 'Карнобат', 8400, 1),
(49, 'Свиленград', 6500, 1),
(50, 'Панагюрище', 4500, 1),
(51, 'Чирпан', 6200, 1),
(52, 'Попово', 7800, 1),
(53, 'Раковски', 4150, 1),
(54, 'Радомир', 2400, 1),
(55, 'Червен бряг', 5980, 1),
(56, 'Първомай', 4270, 1),
(57, 'Берковица', 3500, 1),
(58, 'Козлодуй', 3320, 1),
(59, 'Поморие', 8200, 1),
(60, 'Нови пазар', 9900, 1),
(61, 'Нови Искър', 1000, 1),
(62, 'Раднево', 6260, 1),
(63, 'Провадия', 9200, 1),
(64, 'Ихтиман', 2050, 1),
(65, 'Несебър', 8230, 1),
(66, 'Бяла Слатина', 3000, 1),
(67, 'Разлог', 2760, 1),
(68, 'Балчик', 9600, 1),
(69, 'Стамболийски', 4210, 1),
(70, 'Каварна', 9650, 1),
(71, 'Костинброд', 2230, 1),
(72, 'Павликени', 5200, 1),
(73, 'Мездра', 3100, 1),
(74, 'Кнежа', 5835, 1),
(75, 'Етрополе', 2180, 1),
(76, 'Левски', 5900, 1),
(77, 'Банкя', 1320, 1),
(78, 'Елхово', 8700, 1),
(79, 'Тетевен', 5700, 1),
(80, 'Трявна', 5350, 1),
(81, 'Луковит', 5770, 1),
(82, 'Тутракан', 7600, 1),
(83, 'Сопот', 4330, 1),
(84, 'Исперих', 7400, 1),
(85, 'Бяла(Варна)', 7100, 1),
(86, 'Девня', 9160, 1),
(87, 'Средец', 8300, 1),
(88, 'Омуртаг', 7900, 1),
(89, 'Велики Преслав', 9850, 1),
(90, 'Гълъбово', 6280, 1),
(91, 'Лясковец', 5140, 1),
(92, 'Белене', 5930, 1),
(93, 'Кричим', 4220, 1),
(94, 'Септември', 4490, 1),
(95, 'Ракитово', 4640, 1),
(96, 'Момчилград', 6800, 1),
(97, 'Банско', 2770, 1),
(98, 'Дряново', 5370, 1),
(99, 'Белослав', 9178, 1),
(100, 'Кубрат', 7300, 1),
(101, 'Своге', 2260, 1),
(102, 'Аксаково', 9154, 1),
(103, 'Любимец', 6550, 1),
(104, 'Пирдоп', 2070, 1),
(105, 'Хисаря', 4180, 1),
(106, 'Златоград', 4980, 1),
(107, 'Сливница', 2200, 1),
(108, 'Симитли', 2730, 1),
(109, 'Симеоновград', 6490, 1),
(110, 'Долни чифлик', 9120, 1),
(111, 'Генерал Тошево', 9500, 1),
(112, 'Елин Пелин', 2100, 1),
(113, 'Дулово', 7650, 1),
(114, 'Костенец', 2030, 1),
(115, 'Девин', 4800, 1),
(116, 'Тервел', 9450, 1),
(117, 'Мадан', 4900, 1),
(118, 'Вършец', 3540, 1),
(119, 'Бобов дол', 2670, 1),
(120, 'Стралджа', 8680, 1),
(121, 'Царево', 8260, 1),
(122, 'Котел', 8970, 1),
(123, 'Твърдица', 8890, 1),
(124, 'Елена', 5070, 1),
(125, 'Куклен', 4101, 1),
(126, 'Съединение', 4190, 1),
(127, 'Оряхово', 3300, 1),
(128, 'Тополовград', 6560, 1),
(129, 'Якоруда', 2790, 1),
(130, 'Созопол', 8130, 1),
(131, 'Белоградчик', 3900, 1),
(132, 'Чепеларе', 4850, 1),
(133, 'Стражица', 5150, 1),
(134, 'Камено', 8120, 1),
(135, 'Перущица', 4225, 1),
(136, 'Божурище', 2227, 1),
(137, 'Златица', 2080, 1),
(138, 'Суворово', 9170, 1),
(139, 'Крумовград', 6900, 1),
(140, 'Дългопол', 9250, 1),
(141, 'Ветово', 7080, 1),
(142, 'Долна баня', 2040, 1),
(143, 'Полски Тръмбеш', 5180, 1),
(144, 'Койнаре', 5986, 1),
(145, 'Долни Дъбник', 5870, 1),
(146, 'Тръстеник', 5857, 1),
(147, 'Неделино', 4990, 1),
(148, 'Славяново', 5840, 1),
(149, 'Правец', 2161, 1),
(150, 'Годеч', 2240, 1),
(151, 'Брацигово', 4579, 1),
(152, 'Стрелча', 4530, 1),
(153, 'Две могили', 7150, 1),
(154, 'Костандово', 4644, 1),
(155, 'Игнатиево', 9143, 1),
(156, 'Свети Влас', 8256, 1),
(157, 'Смядово', 9820, 1),
(158, 'Брезник', 2360, 1),
(159, 'Сапарева баня', 2650, 1),
(160, 'Дебелец', 5030, 1),
(161, 'Никопол', 5940, 1),
(162, 'Белово', 4470, 1),
(163, 'Ардино', 6750, 1),
(164, 'Цар Калоян', 7280, 1),
(165, 'Ивайловград', 6570, 1),
(166, 'Шивачево', 8895, 1),
(167, 'Рудозем', 4960, 1),
(168, 'Вълчедръм', 3650, 1),
(169, 'Летница', 5570, 1),
(170, 'Мартен', 7058, 1),
(171, 'Искър', 5972, 1),
(172, 'Приморско', 8180, 1),
(173, 'Глоджево', 7040, 1),
(174, 'Кресна', 2840, 1),
(175, 'Върбица', 9870, 1),
(176, 'Сърница', 4633, 1),
(177, 'Шабла', 9680, 1),
(178, 'Гулянци', 5960, 1),
(179, 'Долна Митрополия', 5855, 1),
(180, 'Батак', 4580, 1),
(181, 'Мъглиж', 6180, 1),
(182, 'Мизия', 3330, 1),
(183, 'Кула', 3800, 1),
(184, 'Баня - Община Карлово', 4360, 1),
(185, 'Криводол', 3060, 1),
(186, 'Завет', 7330, 1),
(187, 'Сливо поле', 7060, 1),
(188, 'Каспичан', 9930, 1),
(189, 'Драгоман', 2210, 1),
(190, 'Ветрен', 4480, 1),
(191, 'Сунгурларе', 8470, 1),
(192, 'Белица', 2780, 1),
(193, 'Роман', 3130, 1),
(194, 'Джебел', 6850, 1),
(195, 'Калофер', 4370, 1),
(196, 'Априлци', 5641, 1),
(197, 'Николаево', 6190, 1),
(198, 'Гурково', 6199, 1),
(199, 'Бухово', 1830, 1),
(200, 'Павел баня', 6155, 1),
(201, 'Долна Оряховица', 5130, 1),
(202, 'Опака', 7840, 1),
(203, 'Каблешково', 8210, 1),
(204, 'Рила', 2630, 1),
(205, 'Ябланица', 5750, 1),
(206, 'Хаджидимово', 2933, 1),
(207, 'Угърчин', 5580, 1),
(208, 'Златарица', 5090, 1),
(209, 'Добринище', 2777, 1),
(210, 'Бяла черква', 5220, 1),
(211, 'Дунавци', 3740, 1),
(212, 'Брегово', 3790, 1),
(213, 'Трън', 2460, 1),
(214, 'Лъки', 4241, 1),
(215, 'Малко Търново', 8162, 1),
(216, 'Копривщица', 2077, 1),
(217, 'Садово', 4122, 1),
(218, 'Доспат', 4831, 1),
(219, 'Борово', 7174, 1),
(220, 'Кочериново', 2640, 1),
(221, 'Обзор', 8250, 1),
(222, 'Килифарево', 5050, 1),
(223, 'Лозница', 7290, 1),
(224, 'Бяла(Русе)', 9101, 1),
(225, 'Батановци', 2340, 1),
(226, 'Черноморец', 8142, 1),
(227, 'Пордим', 5898, 1),
(228, 'Ахелой', 8217, 1),
(229, 'Сухиндол', 5240, 1),
(230, 'Българово', 8110, 1),
(231, 'Чипровци', 3460, 1),
(232, 'Главиница', 7630, 1),
(233, 'Брезово', 4160, 1),
(234, 'Кермен', 8870, 1),
(235, 'Меричлери', 6430, 1),
(236, 'Плачковци', 5360, 1),
(237, 'Земен', 2440, 1),
(238, 'Каолиново', 9960, 1),
(239, 'Алфатар', 7570, 1),
(240, 'Момин проход', 2035, 1),
(241, 'Бойчиновци', 3430, 1),
(242, 'Грамада', 3830, 1),
(243, 'Сеново', 7038, 1),
(244, 'Антоново', 7970, 1),
(245, 'Ахтопол', 8280, 1),
(246, 'Шипка', 6150, 1),
(247, 'Бобошево', 2660, 1),
(248, 'Болярово', 8720, 1),
(249, 'Брусарци', 3680, 1),
(250, 'Димово', 3750, 1),
(251, 'Клисура', 4341, 1),
(252, 'Китен', 8183, 1),
(253, 'Плиска', 9920, 1),
(254, 'Маджарово', 6480, 1),
(255, 'Мелник', 2820, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `country` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name_UNIQUE` (`country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`) VALUES
(1, 'България');

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE IF NOT EXISTS `educations` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `education` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grudate_UNIQUE` (`education`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `education`) VALUES
(4, 'Бакалавър'),
(6, 'Доктор'),
(5, 'Магистър'),
(1, 'Начално'),
(2, 'Основно'),
(7, 'Професор'),
(3, 'Средно');

-- --------------------------------------------------------

--
-- Table structure for table `event_coorganizators`
--

CREATE TABLE IF NOT EXISTS `event_coorganizators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_fk_idx` (`event_id`),
  KEY `user_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_cost_types`
--

CREATE TABLE IF NOT EXISTS `event_cost_types` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cost` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cost_UNIQUE` (`cost`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `event_cost_types`
--

INSERT INTO `event_cost_types` (`id`, `cost`) VALUES
(1, 'Напълно поети'),
(3, 'Непоети'),
(2, 'Частично поети');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `opportunity_categories_id` tinyint(4) NOT NULL,
  `opportunity_id` tinyint(4) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `max_participants` smallint(6) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `event_cost_types_id` tinyint(4) DEFAULT NULL,
  `additional_info` varchar(255) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `recruit_coorganizators` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_id_fk_idx` (`event_cost_types_id`),
  KEY `opportunity_categories_id_fk_idx` (`opportunity_categories_id`),
  KEY `opportunity_id_fk_idx` (`opportunity_id`),
  KEY `user_id_fk_idx` (`user_id`),
  KEY `country_id_fk_idx` (`country_id`),
  KEY `city_id_fk_idx` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `opportunity_categories_id`, `opportunity_id`, `description`, `user_id`, `country_id`, `city_id`, `address`, `date_from`, `date_to`, `deadline`, `max_participants`, `picture`, `event_cost_types_id`, `additional_info`, `website`, `facebook`, `status`, `created`, `modified`, `recruit_coorganizators`) VALUES
(1, 'Коледно парти', 1, 3, 'Това ще е купон голям , честно', 1, 1, 24, 'Тожа е таина', '2014-08-21 16:45:25', '2014-08-29 00:00:00', '2014-08-30 00:00:00', 20, 'team1.jpg', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(2, 'Proletno parti', 1, 3, 'Probvam', 1, 1, 24, 'Това е таина', '2014-08-21 16:45:34', '2014-08-29 00:00:00', '2014-08-30 00:00:00', 20, 'team2.jpg', NULL, NULL, NULL, NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events_activities`
--

CREATE TABLE IF NOT EXISTS `events_activities` (
  `event_id` bigint(20) NOT NULL,
  `activity_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`event_id`,`activity_id`),
  KEY `activity_id_fk_idx` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events_lectors`
--

CREATE TABLE IF NOT EXISTS `events_lectors` (
  `event_id` bigint(20) NOT NULL,
  `lector_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`lector_id`),
  KEY `lector_id_fk_idx` (`lector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events_participants`
--

CREATE TABLE IF NOT EXISTS `events_participants` (
  `event_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `individual_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events_programs`
--

CREATE TABLE IF NOT EXISTS `events_programs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `information` text,
  `subject` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_fk_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events_programs_lectors`
--

CREATE TABLE IF NOT EXISTS `events_programs_lectors` (
  `events_program_id` bigint(20) NOT NULL,
  `lector_id` int(11) NOT NULL,
  PRIMARY KEY (`events_program_id`,`lector_id`),
  KEY `events_programs_lector_id_fk_idx` (`lector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events_sponsors`
--

CREATE TABLE IF NOT EXISTS `events_sponsors` (
  `event_id` bigint(20) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`sponsor_id`),
  KEY `sponsor_id_fk_idx` (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE IF NOT EXISTS `individuals` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '1 - male, 2 - female, 3 - dog',
  `education_id` tinyint(4) NOT NULL,
  `recieve_newsletter_emails` tinyint(1) DEFAULT NULL COMMENT '1 - Da, 2 - Ne',
  `recieve_newsletter_events` tinyint(1) DEFAULT NULL COMMENT '1 - Da, 2 - Ne',
  PRIMARY KEY (`user_id`),
  KEY `graduate_id_fk_idx` (`education_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `individuals_languages`
--

CREATE TABLE IF NOT EXISTS `individuals_languages` (
  `user_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`,`language_id`),
  KEY `language_id_fk_idx` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `language` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_UNIQUE` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`) VALUES
(2, 'Английски'),
(9, 'Арабски'),
(1, 'Български'),
(6, 'Испански'),
(7, 'Италиански'),
(10, 'Китайски'),
(3, 'Немски'),
(5, 'Руски'),
(8, 'Турски'),
(4, 'Френски'),
(11, 'Японски');

-- --------------------------------------------------------

--
-- Table structure for table `lectors`
--

CREATE TABLE IF NOT EXISTS `lectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `events_participations` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `opportunity` varchar(45) NOT NULL,
  `opportunity_categories_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opportunity_UNIQUE` (`opportunity`,`opportunity_categories_id`),
  KEY `opportunity_categories_id_fk_idx` (`opportunity_categories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `opportunities`
--

INSERT INTO `opportunities` (`id`, `opportunity`, `opportunity_categories_id`) VALUES
(11, 'Бизнес проекти', 6),
(2, 'В държавна институция', 4),
(3, 'В НПО', 4),
(5, 'В страната', 5),
(1, 'В частна компания', 4),
(6, 'В чужбина', 5),
(13, 'Видеа', 6),
(4, 'Друго', 4),
(7, 'Друго', 5),
(14, 'Друго', 6),
(20, 'Друго', 7),
(23, 'Друго', 9),
(9, 'Есета', 6),
(15, 'За бакалавър', 7),
(17, 'За докторант', 7),
(19, 'За изследване', 7),
(16, 'За магистър', 7),
(18, 'За проект', 7),
(10, 'Креативни идеи', 6),
(8, 'Олимпиади', 6),
(21, 'От индивидуален потребител', 9),
(22, 'От организация', 9),
(12, 'Снимки', 6),
(24, 'Конференция', 1),
(25, 'Работилница', 2),
(26, "Лятно училище", 3),
(27, 'Стаж', 8),
(28, 'Друго', 10);

-- --------------------------------------------------------

--
-- Table structure for table `opportunity_categories`
--

CREATE TABLE IF NOT EXISTS `opportunity_categories` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `opportunity_categories`
--

INSERT INTO `opportunity_categories` (`id`, `category`) VALUES
(5, 'Доброволчество'),
(10, 'Други'),
(9, 'Инициативи'),
(1, 'Конференции'),
(3, 'Летни училища'),
(8, 'Обмени'),
(2, 'Работилници'),
(4, 'Стажове'),
(7, 'Стипендии'),
(6, 'Състезания');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE IF NOT EXISTS `organizations` (
  `user_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `organizations_types_id` tinyint(4) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `recruiter` tinyint(1) DEFAULT NULL COMMENT '1 - Da, 2 - Ne',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `organization_types_id_fk_idx` (`organizations_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizations_forms`
--

CREATE TABLE IF NOT EXISTS `organizations_forms` (
  `organization_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`organization_id`,`name`),
  KEY `organization_id_fk_idx` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizations_likes`
--

CREATE TABLE IF NOT EXISTS `organizations_likes` (
  `organization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`organization_id`,`user_id`),
  KEY `individual_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizations_types`
--

CREATE TABLE IF NOT EXISTS `organizations_types` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `organizations_types`
--

INSERT INTO `organizations_types` (`id`, `type`) VALUES
(6, 'Друго'),
(3, 'Компания'),
(1, 'НПО'),
(4, 'Университет'),
(5, 'Училище'),
(2, 'Фондация');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE IF NOT EXISTS `user_infos` (
  `user_id` int(11) NOT NULL,
  `description` text,
  `country_id` tinyint(4) NOT NULL,
  `city_id` int(11) NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `country_id_fk_idx` (`country_id`),
  KEY `city_id_fk_idx` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook_fid` bigint(20) NOT NULL,
  `google_fid` bigint(20) NOT NULL,
  `linkedin_fid` bigint(20) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` varchar(15) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 - Потребител, 2 -Организация, 3 - Админ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_fid`, `google_fid`, `linkedin_fid`, `username`, `password`, `email`, `created`, `modified`, `status`, `role`) VALUES
(1, 0, 0, 0, 'Admin', 'test', 'teko999@abv.bg', '2014-08-21 00:00:00', '2014-08-21 00:00:00', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_activities`
--

CREATE TABLE IF NOT EXISTS `users_activities` (
  `user_id` int(11) NOT NULL,
  `activity_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`,`activity_id`),
  KEY `activity_id_fk_idx` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_events`
--

CREATE TABLE IF NOT EXISTS `users_events` (
  `user_id` int(11) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `event_id_fk_idx` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auths`
--
ALTER TABLE `auths`
  ADD CONSTRAINT `auth_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `event_coorganizators`
--
ALTER TABLE `event_coorganizators`
  ADD CONSTRAINT `event_coorganizators_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `event_coorganizators_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_cost_id_fk` FOREIGN KEY (`event_cost_types_id`) REFERENCES `event_cost_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_opportunity_categories_id_fk` FOREIGN KEY (`opportunity_categories_id`) REFERENCES `opportunity_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_opportunity_id_fk` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_activities`
--
ALTER TABLE `events_activities`
  ADD CONSTRAINT `events_activities_activity_id_fk` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_activities_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_lectors`
--
ALTER TABLE `events_lectors`
  ADD CONSTRAINT `events_lectors_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_lectors_lector_id_fk` FOREIGN KEY (`lector_id`) REFERENCES `lectors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_participants`
--
ALTER TABLE `events_participants`
  ADD CONSTRAINT `events_participants_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_participants_individual_id_fk` FOREIGN KEY (`user_id`) REFERENCES `individuals` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_programs`
--
ALTER TABLE `events_programs`
  ADD CONSTRAINT `events_program_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_programs_lectors`
--
ALTER TABLE `events_programs_lectors`
  ADD CONSTRAINT `events_programs_lectors_id_fk` FOREIGN KEY (`lector_id`) REFERENCES `lectors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_program_id_fk` FOREIGN KEY (`events_program_id`) REFERENCES `events_programs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `events_sponsors`
--
ALTER TABLE `events_sponsors`
  ADD CONSTRAINT `events_sponsors_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_sponsors_sponsor_id_fk` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `individuals`
--
ALTER TABLE `individuals`
  ADD CONSTRAINT `graduate_id_fk` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `individual_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `individuals_languages`
--
ALTER TABLE `individuals_languages`
  ADD CONSTRAINT `individuals_languages_individual_id_factivitiesk` FOREIGN KEY (`user_id`) REFERENCES `individuals` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `individuals_languages_language_id_fk` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lectors`
--
ALTER TABLE `lectors`
  ADD CONSTRAINT `lectors_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `opportunities`
--
ALTER TABLE `opportunities`
  ADD CONSTRAINT `opportunity_categories_id_fk` FOREIGN KEY (`opportunity_categories_id`) REFERENCES `opportunity_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organization_types_id_fk` FOREIGN KEY (`organizations_types_id`) REFERENCES `organizations_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organizations_forms`
--
ALTER TABLE `organizations_forms`
  ADD CONSTRAINT `organizations_forms_organization_id_fk` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organizations_likes`
--
ALTER TABLE `organizations_likes`
  ADD CONSTRAINT `organizations_likes_individual_id_fk` FOREIGN KEY (`user_id`) REFERENCES `individuals` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organizations_likes_organization_id_fk` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD CONSTRAINT `user_infos_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_info_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_info_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_activities`
--
ALTER TABLE `users_activities`
  ADD CONSTRAINT `users_activities_activity_id_fk` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_activities_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_events`
--
ALTER TABLE `users_events`
  ADD CONSTRAINT `users_events_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_events_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

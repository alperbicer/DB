-- phpMyAdmin SQL Dump
-- version 4.2.12deb1
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 28 Ara 2014, 21:11:29
-- Sunucu sürümü: 5.5.40-0ubuntu1
-- PHP Sürümü: 5.5.12-2ubuntu5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `social`
--
CREATE DATABASE IF NOT EXISTS `social` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `social`;

DELIMITER $$
--
-- İşlevler
--
DROP FUNCTION IF EXISTS `get_average_like_score`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_average_like_score`() RETURNS double
    READS SQL DATA
return (select average(likescore) from social.like_dislike)$$

DROP FUNCTION IF EXISTS `get_total_like_score_post`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_like_score_post`(`a` INT) RETURNS int(11)
    READS SQL DATA
return (select sum(likescore) from social.like_dislike where post_id=a)$$

DROP FUNCTION IF EXISTS `get_total_like_score_user`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_like_score_user`(`id` INT) RETURNS int(11)
    READS SQL DATA
return (select sum(likescore) from like_dislike where who_id=id)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `actors`
--

DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
`actor_id` int(11) NOT NULL,
  `privacy_minus` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `actors`
--

INSERT INTO `actors` (`actor_id`, `privacy_minus`) VALUES
(0, NULL),
(1, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(60, NULL),
(61, NULL),
(62, NULL),
(63, NULL),
(64, NULL),
(65, NULL),
(99, NULL),
(100, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL,
  `door` int(11) NOT NULL,
  `buildingname` varchar(180) COLLATE utf32_turkish_ci DEFAULT NULL,
  `street` varchar(180) COLLATE utf32_turkish_ci NOT NULL,
  `avenue` varchar(180) COLLATE utf32_turkish_ci DEFAULT NULL,
  `boulevard` varchar(180) COLLATE utf32_turkish_ci DEFAULT NULL,
  `locality` varchar(180) COLLATE utf32_turkish_ci DEFAULT NULL,
  `neighbourhood` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL,
  `village` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL,
  `county` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL,
  `township` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL,
  `town` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `province` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `confederate` int(11) DEFAULT NULL,
  `country` char(3) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `address`
--

INSERT INTO `address` (`address_id`, `door`, `buildingname`, `street`, `avenue`, `boulevard`, `locality`, `neighbourhood`, `village`, `county`, `township`, `town`, `city`, `province`, `state`, `confederate`, `country`) VALUES
(0, 174, 'Woodland Apartments', 'Edgewood Driveway', 'Newell Road', 'Woodland Avenue', 'Woodland ', 'Newell', NULL, NULL, 'Palo Alto', 7, 7, NULL, 8, NULL, 'USA'),
(1, 17, NULL, '1909. Sokak', '1912. Sokak', 'Nursultan Nazarbayev Caddesi', NULL, 'Bayraklı Mahallesi', NULL, 'Smyrna', 'Bayraklı 3. Yerleşim Bölgesi', 2, 1, 1, 5, NULL, 'TUR'),
(2, 1600, 'Googleplex', 'Amphitheatre Parkway', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 7, 8, NULL, 'USA'),
(3, 1, 'Microsoft Building', 'Microsoft Way', NULL, 'NE Bellevue Redmond Road', NULL, 'Redmond Industrial', NULL, NULL, NULL, 9, 9, NULL, 10, NULL, 'USA');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE IF NOT EXISTS `block` (
  `blocker` int(11) NOT NULL,
  `blockee` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `date_dropped` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL,
  `city` varchar(286) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`id`, `city`) VALUES
(1, 'İzmir'),
(2, 'Bayraklı'),
(3, 'Bornova'),
(4, 'Krungthepmahanakhon Amonrattanakosin Mahintharayutthaya Mahadilokphop Noppharatratchathaniburirom Udomratchaniwetmahasathan Amonphimanawatansathit Sakkathattiyawitsanukamprasit'),
(5, 'Ege Bölgesi'),
(6, 'Marmara Bölgesi'),
(7, 'Mountain View'),
(8, 'California'),
(9, 'Redmond'),
(10, 'Washington');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `comment` varchar(250) COLLATE utf32_turkish_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `comment`, `post_id`, `created_by`) VALUES
(1, 'Teşekkür ederim Erkin.', 1, 58);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `connections`
--

DROP TABLE IF EXISTS `connections`;
CREATE TABLE IF NOT EXISTS `connections` (
  `connection_id` int(11) NOT NULL,
  `member_one` int(11) NOT NULL,
  `member_two` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `date_dropped` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` char(3) COLLATE utf32_turkish_ci NOT NULL COMMENT 'ISO Ülke Kodu',
  `country` varchar(80) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`id`, `country`) VALUES
('KTC', 'Kuzey Kıbrıs Türk Cumhuriyeti'),
('TUR', 'Turkey'),
('USA', 'United States of America');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `curriculumvitae`
--

DROP TABLE IF EXISTS `curriculumvitae`;
CREATE TABLE IF NOT EXISTS `curriculumvitae` (
  `cv_id` int(11) NOT NULL,
  `curriculum` longtext COLLATE utf32_turkish_ci NOT NULL,
  `vitae` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `dropped_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `curriculumvitae_attachment`
--

DROP TABLE IF EXISTS `curriculumvitae_attachment`;
CREATE TABLE IF NOT EXISTS `curriculumvitae_attachment` (
  `attachment_id` int(11) NOT NULL,
  `cv_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `attachment_url` text COLLATE utf32_turkish_ci,
  `description` longtext COLLATE utf32_turkish_ci NOT NULL,
  `attachment_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `curriculumvitae_attachment_types`
--

DROP TABLE IF EXISTS `curriculumvitae_attachment_types`;
CREATE TABLE IF NOT EXISTS `curriculumvitae_attachment_types` (
  `type` int(11) NOT NULL,
  `summary` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `description` text COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `curriculumvitae_employment_entry`
--

DROP TABLE IF EXISTS `curriculumvitae_employment_entry`;
CREATE TABLE IF NOT EXISTS `curriculumvitae_employment_entry` (
  `cv_attachment_id` int(11) NOT NULL,
  `employment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `curriculumvitae_volunteering_entry`
--

DROP TABLE IF EXISTS `curriculumvitae_volunteering_entry`;
CREATE TABLE IF NOT EXISTS `curriculumvitae_volunteering_entry` (
  `curriculumvitae` int(11) NOT NULL,
  `volunteering_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `education`
--

DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL,
  `education` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE IF NOT EXISTS `emails` (
  `email_id` int(11) NOT NULL,
  `email_textual` varchar(50) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `emails`
--

INSERT INTO `emails` (`email_id`, `email_textual`) VALUES
(0, 'zuck@facebook.com'),
(1, 'erkinalp9035@gmail.com'),
(2, 'alperbicer@gmail.com'),
(3, 'page@google.com'),
(4, 'bill@microsoft.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE IF NOT EXISTS `employer` (
`employer_id` int(11) NOT NULL,
  `employer_user` int(11) NOT NULL,
  `employer_page` int(11) NOT NULL,
  `description` text COLLATE utf32_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employment`
--

DROP TABLE IF EXISTS `employment`;
CREATE TABLE IF NOT EXISTS `employment` (
  `employment_id` int(11) NOT NULL,
  `employer` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  `job_type` int(11) DEFAULT NULL,
  `curriculumvitae` int(11) DEFAULT NULL,
  `date_started` int(11) NOT NULL,
  `date_quit` int(11) DEFAULT NULL,
  `fired` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_animals`
--

DROP TABLE IF EXISTS `fav_animals`;
CREATE TABLE IF NOT EXISTS `fav_animals` (
  `id` int(11) NOT NULL,
  `animal` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_artists`
--

DROP TABLE IF EXISTS `fav_artists`;
CREATE TABLE IF NOT EXISTS `fav_artists` (
  `id` int(11) NOT NULL,
  `artist` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_books`
--

DROP TABLE IF EXISTS `fav_books`;
CREATE TABLE IF NOT EXISTS `fav_books` (
  `id` int(11) NOT NULL,
  `book` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_movie`
--

DROP TABLE IF EXISTS `fav_movie`;
CREATE TABLE IF NOT EXISTS `fav_movie` (
  `id` int(11) NOT NULL,
  `movie` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `follows`
--

DROP TABLE IF EXISTS `follows`;
CREATE TABLE IF NOT EXISTS `follows` (
  `one` int(11) NOT NULL,
  `two` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friend`
--

DROP TABLE IF EXISTS `friend`;
CREATE TABLE IF NOT EXISTS `friend` (
  `id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `is_subscriber` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friend_list`
--

DROP TABLE IF EXISTS `friend_list`;
CREATE TABLE IF NOT EXISTS `friend_list` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `privacy` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(11) NOT NULL,
  `gender` varchar(50) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `gender`
--

INSERT INTO `gender` (`gender_id`, `gender`) VALUES
(0, 'Neutral Gender'),
(1, 'Female'),
(2, 'Male'),
(3, 'Gay'),
(4, 'Lesbian'),
(5, 'Converted Male with female genotype'),
(6, 'Converted Female with male genotype');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) NOT NULL,
  `privacy` int(11) NOT NULL,
  `created_by` int(11) DEFAULT '57',
  `name` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `description` text COLLATE utf32_turkish_ci NOT NULL,
  `created_on` date NOT NULL,
  `destroyed_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `groups`
--

INSERT INTO `groups` (`group_id`, `privacy`, `created_by`, `name`, `description`, `created_on`, `destroyed_on`) VALUES
(60, 0, 57, 'Veritabanı Yönetimi Dersini Erkin Alp GÜNEY''den alanlar grubu', 'Bu grup, veritabanı yönetimi dersini Erkin Alp Güney''den alanlara adanmıştır.', '2014-12-20', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `group_membership`
--

DROP TABLE IF EXISTS `group_membership`;
CREATE TABLE IF NOT EXISTS `group_membership` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `membership_start` date NOT NULL,
  `membership_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `group_membership`
--

INSERT INTO `group_membership` (`user_id`, `group_id`, `membership_start`, `membership_end`) VALUES
(57, 60, '2012-12-21', NULL),
(63, 60, '2014-12-01', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `interests`
--

DROP TABLE IF EXISTS `interests`;
CREATE TABLE IF NOT EXISTS `interests` (
  `id` int(11) NOT NULL,
  `interest` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_type`
--

DROP TABLE IF EXISTS `job_type`;
CREATE TABLE IF NOT EXISTS `job_type` (
  `job_type_page` int(11) NOT NULL,
  `job_description` text COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL,
  `language` varchar(50) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `lang`
--

INSERT INTO `lang` (`id`, `language`) VALUES
(0, 'Phutongua'),
(1, 'Türkçe');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `like_dislike`
--

DROP TABLE IF EXISTS `like_dislike`;
CREATE TABLE IF NOT EXISTS `like_dislike` (
  `id` int(11) NOT NULL,
  `whois_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `likescore` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `like_dislike`
--

INSERT INTO `like_dislike` (`id`, `whois_id`, `post_id`, `likescore`) VALUES
(1, 58, 1, 42),
(2, 1, 1, -128);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE IF NOT EXISTS `marital_status` (
`marital_status_id` smallint(6) NOT NULL,
  `marital_status_name` text COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `marital_status`
--

INSERT INTO `marital_status` (`marital_status_id`, `marital_status_name`) VALUES
(0, 'Unmarried'),
(1, 'Married and stlll not yet divorced'),
(2, 'Divorced'),
(3, 'Widow'),
(4, 'Muslim sexual servant'),
(5, 'African sexual servant'),
(6, 'Illegal sexual servant'),
(7, 'Unpaid slave worker'),
(8, 'Nonhuman intelligent animal'),
(9, 'Irreproducible Robot');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `message` mediumtext COLLATE utf32_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  `is_read` int(11) NOT NULL,
  `is_spam` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `muted_notifications`
--

DROP TABLE IF EXISTS `muted_notifications`;
CREATE TABLE IF NOT EXISTS `muted_notifications` (
  `nfrom` int(11) NOT NULL,
  `nto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `muted_notifications`
--

INSERT INTO `muted_notifications` (`nfrom`, `nto`) VALUES
(57, 1),
(58, 1),
(59, 1),
(62, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL,
  `msg` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `type` int(11) NOT NULL,
  `privacy` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `status` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `is_read` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_generic`
--

DROP TABLE IF EXISTS `page_generic`;
CREATE TABLE IF NOT EXISTS `page_generic` (
  `pagenumber` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `summary` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `description` text COLLATE utf32_turkish_ci,
  `privacy` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `page_generic`
--

INSERT INTO `page_generic` (`pagenumber`, `date_created`, `summary`, `description`, `privacy`) VALUES
(59, '2014-12-20', 'Ege Üniversitesi', 'Ege Üniversitesi, 1955 yılında Muhiddin EREL öncülüğünde kurulmuş bir Türk yükseköğretim okuludur.', 0),
(61, '0571-04-07', 'Islam', NULL, 0),
(62, '2012-12-21', 'Religion of Mozilla', 'What you see in about:mozilla on Firefox is our book. We believe in free software and free web''s power.', 0),
(64, '0000-01-01', 'Christianity', 'This is the holy religion sent to the world through Jesus Christ.', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_ownership`
--

DROP TABLE IF EXISTS `page_ownership`;
CREATE TABLE IF NOT EXISTS `page_ownership` (
  `pagenumber` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phones`
--

DROP TABLE IF EXISTS `phones`;
CREATE TABLE IF NOT EXISTS `phones` (
  `profile_id` int(11) NOT NULL,
  `phone_number` decimal(28,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_types`
--

DROP TABLE IF EXISTS `phone_types`;
CREATE TABLE IF NOT EXISTS `phone_types` (
  `phone_number` decimal(28,0) NOT NULL DEFAULT '0',
  `phone_type` enum('fixed','cellular','voip','') COLLATE utf32_turkish_ci NOT NULL DEFAULT 'voip'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL,
  `p_address` varchar(150) COLLATE utf32_turkish_ci NOT NULL,
  `privacy` int(11) NOT NULL COMMENT 'user or group or page or friend list',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
`post_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `post`
--

INSERT INTO `post` (`post_id`, `actor_id`) VALUES
(1, 57),
(100, 99),
(101, 100);

--
-- Tetikleyiciler `post`
--
DROP TRIGGER IF EXISTS `post_timeline`;
DELIMITER //
CREATE TRIGGER `post_timeline` AFTER INSERT ON `post`
 FOR EACH ROW BEGIN

   	DECLARE actor int;
	DECLARE post int;

   SELECT new.actor_id INTO actor;

   SELECT new.post_id INTO post;


   insert into timeline values (actor,post,CURRENT_DATE());
   
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reply`
--

DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) NOT NULL,
  `reply` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  `privacy` int(11) NOT NULL,
  `to_fb` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `to_twitter` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `attachment` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `status`
--

INSERT INTO `status` (`id`, `message`, `created_at`, `privacy`, `to_fb`, `to_twitter`, `attachment`) VALUES
(1, 'Herkese merhaba', '2014-12-28', 0, '', '', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `who_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `timeline`
--

DROP TABLE IF EXISTS `timeline`;
CREATE TABLE IF NOT EXISTS `timeline` (
  `actor_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `shown_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `timeline`
--

INSERT INTO `timeline` (`actor_id`, `post_id`, `shown_at`) VALUES
(57, 1, '2014-12-28'),
(99, 100, '2014-12-28'),
(100, 101, '2014-12-28');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL,
  `date_joined` date NOT NULL,
  `date_of_birth` date NOT NULL,
  `givenname` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `middlename` varchar(50) COLLATE utf32_turkish_ci DEFAULT NULL,
  `familyname` varchar(50) COLLATE utf32_turkish_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `marital_status_code` smallint(6) NOT NULL,
  `quit` tinyint(1) NOT NULL DEFAULT '0',
  `address` int(11) NOT NULL,
  `religion` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `mail` int(11) NOT NULL,
  `lang` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `user_info`
--

INSERT INTO `user_info` (`user_id`, `date_joined`, `date_of_birth`, `givenname`, `middlename`, `familyname`, `gender`, `marital_status_code`, `quit`, `address`, `religion`, `rating`, `mail`, `lang`) VALUES
(0, '2014-12-31', '2014-12-30', 'A', 'B', 'C', 1, 5, 1, 1, NULL, 3, 1, 1),
(1, '2004-05-02', '1984-05-11', 'Mark', NULL, 'Zuckerberg', 2, 1, 0, 0, 64, 0, 0, 0),
(57, '2012-12-21', '1994-12-27', 'Erkin', 'Alp', 'Güney', 2, 0, 0, 1, NULL, 0, 1, 1),
(63, '2012-12-21', '1991-08-25', 'Alper', NULL, 'Biçer', 2, 0, 0, 1, 59, 0, 2, 1),
(99, '2014-12-28', '1998-01-01', 'Googlebot', NULL, NULL, 0, 0, 0, 2, NULL, 0, 3, 0),
(100, '2014-12-28', '2012-12-21', 'Bingbot', NULL, NULL, 0, 0, 0, 3, NULL, 0, 4, 0);

--
-- Tetikleyiciler `user_info`
--
DROP TRIGGER IF EXISTS `update_info`;
DELIMITER //
CREATE TRIGGER `update_info` AFTER UPDATE ON `user_info`
 FOR EACH ROW BEGIN

   DECLARE actor int;

   SELECT new.user_id INTO actor;

   if (select actor_id from actors where actor=actor_id) is null then
   insert into post(actor_id) values (actor);
   end if;
   
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `user_create`;
DELIMITER //
CREATE TRIGGER `user_create` BEFORE INSERT ON `user_info`
 FOR EACH ROW BEGIN

   DECLARE actor int;

   SELECT new.user_id INTO actor;

    if (select actor_id from actors where actor=actor_id) is null then
    insert into actors values (actor,null);
    end if;
   
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
CREATE TABLE IF NOT EXISTS `volunteers` (
  `volunteering_id` int(11) NOT NULL,
  `volunteer` int(11) NOT NULL,
  `voluntree` int(11) NOT NULL COMMENT 'group volunteered in behalf of',
  `date_started` date NOT NULL,
  `date_dropped` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `want_ad`
--

DROP TABLE IF EXISTS `want_ad`;
CREATE TABLE IF NOT EXISTS `want_ad` (
  `employer_id` int(11) NOT NULL,
  `ad_responsibility` int(11) NOT NULL,
  `job_type` int(11) NOT NULL,
  `description` text COLLATE utf32_turkish_ci NOT NULL,
  `created_on` date NOT NULL,
  `dropped_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `actors`
--
ALTER TABLE `actors`
 ADD PRIMARY KEY (`actor_id`);

--
-- Tablo için indeksler `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`address_id`);

--
-- Tablo için indeksler `block`
--
ALTER TABLE `block`
 ADD PRIMARY KEY (`blocker`,`blockee`), ADD KEY `blockee` (`blockee`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `chat`
--
ALTER TABLE `chat`
 ADD PRIMARY KEY (`id`), ADD KEY `chat_created_by` (`created_by`);

--
-- Tablo için indeksler `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `comment_post` (`post_id`), ADD KEY `comment_created_by` (`created_by`) COMMENT 'User, group or page can comment';

--
-- Tablo için indeksler `connections`
--
ALTER TABLE `connections`
 ADD PRIMARY KEY (`connection_id`), ADD UNIQUE KEY `member_one` (`member_one`,`member_two`);

--
-- Tablo için indeksler `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `curriculumvitae`
--
ALTER TABLE `curriculumvitae`
 ADD PRIMARY KEY (`cv_id`), ADD UNIQUE KEY `cv_ownership` (`vitae`);

--
-- Tablo için indeksler `curriculumvitae_attachment`
--
ALTER TABLE `curriculumvitae_attachment`
 ADD PRIMARY KEY (`attachment_id`), ADD KEY `cv_attachment_ref` (`cv_id`);

--
-- Tablo için indeksler `curriculumvitae_employment_entry`
--
ALTER TABLE `curriculumvitae_employment_entry`
 ADD PRIMARY KEY (`cv_attachment_id`), ADD UNIQUE KEY `curriculumvitae_employment` (`employment_id`);

--
-- Tablo için indeksler `curriculumvitae_volunteering_entry`
--
ALTER TABLE `curriculumvitae_volunteering_entry`
 ADD PRIMARY KEY (`curriculumvitae`), ADD UNIQUE KEY `curriculumvitae_volunteering` (`volunteering_id`);

--
-- Tablo için indeksler `education`
--
ALTER TABLE `education`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `emails`
--
ALTER TABLE `emails`
 ADD PRIMARY KEY (`email_id`);

--
-- Tablo için indeksler `employer`
--
ALTER TABLE `employer`
 ADD PRIMARY KEY (`employer_id`), ADD UNIQUE KEY `employer_user_2` (`employer_user`,`employer_page`), ADD KEY `employer_user` (`employer_user`), ADD KEY `employer_company` (`employer_page`);

--
-- Tablo için indeksler `employment`
--
ALTER TABLE `employment`
 ADD PRIMARY KEY (`employment_id`), ADD KEY `employer_ref` (`employer`), ADD KEY `employee` (`employee`), ADD KEY `employer` (`employer`,`employee`), ADD KEY `curriculumvitae_referenced` (`curriculumvitae`), ADD KEY `employee_works_on` (`job_type`);

--
-- Tablo için indeksler `fav_animals`
--
ALTER TABLE `fav_animals`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `animal` (`animal`,`profile_id`);

--
-- Tablo için indeksler `fav_artists`
--
ALTER TABLE `fav_artists`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `artist` (`artist`,`profile_id`);

--
-- Tablo için indeksler `fav_movie`
--
ALTER TABLE `fav_movie`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `movie` (`movie`,`profile_id`);

--
-- Tablo için indeksler `follows`
--
ALTER TABLE `follows`
 ADD PRIMARY KEY (`one`,`two`), ADD KEY `followee_actor` (`two`);

--
-- Tablo için indeksler `friend`
--
ALTER TABLE `friend`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `friend_user_id` (`friend_user_id`,`user_id`);

--
-- Tablo için indeksler `friend_list`
--
ALTER TABLE `friend_list`
 ADD PRIMARY KEY (`id`), ADD KEY `friendlist_target` (`privacy`);

--
-- Tablo için indeksler `gender`
--
ALTER TABLE `gender`
 ADD PRIMARY KEY (`gender_id`);

--
-- Tablo için indeksler `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`group_id`), ADD KEY `created_by` (`created_by`);

--
-- Tablo için indeksler `group_membership`
--
ALTER TABLE `group_membership`
 ADD PRIMARY KEY (`user_id`,`group_id`), ADD KEY `group_id` (`group_id`);

--
-- Tablo için indeksler `interests`
--
ALTER TABLE `interests`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `job_type`
--
ALTER TABLE `job_type`
 ADD PRIMARY KEY (`job_type_page`);

--
-- Tablo için indeksler `lang`
--
ALTER TABLE `lang`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `like_dislike`
--
ALTER TABLE `like_dislike`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `likeable_once` (`whois_id`,`post_id`), ADD KEY `post_likes` (`post_id`);

--
-- Tablo için indeksler `marital_status`
--
ALTER TABLE `marital_status`
 ADD PRIMARY KEY (`marital_status_id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `muted_notifications`
--
ALTER TABLE `muted_notifications`
 ADD PRIMARY KEY (`nfrom`,`nto`), ADD KEY `notifies` (`nto`);

--
-- Tablo için indeksler `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `msg` (`msg`(191),`created_at`), ADD KEY `notified_to` (`user_id`), ADD KEY `notification_target` (`privacy`);

--
-- Tablo için indeksler `page_generic`
--
ALTER TABLE `page_generic`
 ADD PRIMARY KEY (`pagenumber`);

--
-- Tablo için indeksler `page_ownership`
--
ALTER TABLE `page_ownership`
 ADD PRIMARY KEY (`pagenumber`), ADD KEY `page_created_by` (`created_by`) COMMENT 'user';

--
-- Tablo için indeksler `phones`
--
ALTER TABLE `phones`
 ADD PRIMARY KEY (`profile_id`);

--
-- Tablo için indeksler `phone_types`
--
ALTER TABLE `phone_types`
 ADD PRIMARY KEY (`phone_number`);

--
-- Tablo için indeksler `picture`
--
ALTER TABLE `picture`
 ADD PRIMARY KEY (`id`), ADD KEY `post_privacy` (`privacy`) COMMENT 'To whom the post is visible';

--
-- Tablo için indeksler `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`post_id`), ADD UNIQUE KEY `posted_by` (`actor_id`), ADD KEY `post_id` (`post_id`), ADD KEY `actor_id` (`actor_id`);

--
-- Tablo için indeksler `reply`
--
ALTER TABLE `reply`
 ADD PRIMARY KEY (`id`), ADD KEY `is_reply_of` (`status_id`);

--
-- Tablo için indeksler `status`
--
ALTER TABLE `status`
 ADD PRIMARY KEY (`id`), ADD KEY `status_target` (`privacy`);

--
-- Tablo için indeksler `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD KEY `tagged_by` (`who_id`), ADD KEY `tagged` (`tag_id`), ADD KEY `tagged_in` (`post_id`);

--
-- Tablo için indeksler `timeline`
--
ALTER TABLE `timeline`
 ADD PRIMARY KEY (`actor_id`,`post_id`), ADD KEY `post_subject` (`post_id`);

--
-- Tablo için indeksler `user_info`
--
ALTER TABLE `user_info`
 ADD PRIMARY KEY (`user_id`), ADD KEY `mail` (`mail`) COMMENT 'user_email', ADD KEY `user_gender` (`gender`), ADD KEY `user_marital` (`marital_status_code`), ADD KEY `user_address` (`address`), ADD KEY `religion` (`religion`), ADD KEY `user_locale` (`lang`);

--
-- Tablo için indeksler `volunteers`
--
ALTER TABLE `volunteers`
 ADD PRIMARY KEY (`volunteering_id`), ADD KEY `volunteer` (`volunteer`), ADD KEY `voluntree` (`voluntree`);

--
-- Tablo için indeksler `want_ad`
--
ALTER TABLE `want_ad`
 ADD PRIMARY KEY (`employer_id`,`ad_responsibility`,`job_type`), ADD KEY `ad_responsibility_user` (`ad_responsibility`), ADD KEY `ad_job_type` (`job_type`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `actors`
--
ALTER TABLE `actors`
MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `employer`
--
ALTER TABLE `employer`
MODIFY `employer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `marital_status`
--
ALTER TABLE `marital_status`
MODIFY `marital_status_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Tablo için AUTO_INCREMENT değeri `post`
--
ALTER TABLE `post`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `block`
--
ALTER TABLE `block`
ADD CONSTRAINT `blockee` FOREIGN KEY (`blockee`) REFERENCES `user_info` (`user_id`),
ADD CONSTRAINT `blocker` FOREIGN KEY (`blocker`) REFERENCES `user_info` (`user_id`);

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `commented_by` FOREIGN KEY (`created_by`) REFERENCES `actors` (`actor_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `comment_refers_to` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `curriculumvitae`
--
ALTER TABLE `curriculumvitae`
ADD CONSTRAINT `curriculumvitae_ownership` FOREIGN KEY (`vitae`) REFERENCES `user_info` (`user_id`);

--
-- Tablo kısıtlamaları `curriculumvitae_attachment`
--
ALTER TABLE `curriculumvitae_attachment`
ADD CONSTRAINT `curriculumvitae_attached_to` FOREIGN KEY (`cv_id`) REFERENCES `curriculumvitae` (`cv_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `curriculumvitae_employment_entry`
--
ALTER TABLE `curriculumvitae_employment_entry`
ADD CONSTRAINT `curriculumvitae_employment_id` FOREIGN KEY (`employment_id`) REFERENCES `employment` (`employment_id`),
ADD CONSTRAINT `employment_curriculumvitae_ref` FOREIGN KEY (`cv_attachment_id`) REFERENCES `curriculumvitae_attachment` (`attachment_id`);

--
-- Tablo kısıtlamaları `curriculumvitae_volunteering_entry`
--
ALTER TABLE `curriculumvitae_volunteering_entry`
ADD CONSTRAINT `curriculumvitae_volunteering` FOREIGN KEY (`volunteering_id`) REFERENCES `volunteers` (`volunteering_id`),
ADD CONSTRAINT `volunteers_curriculumvitae` FOREIGN KEY (`curriculumvitae`) REFERENCES `curriculumvitae` (`cv_id`);

--
-- Tablo kısıtlamaları `employer`
--
ALTER TABLE `employer`
ADD CONSTRAINT `employer_company` FOREIGN KEY (`employer_page`) REFERENCES `page_generic` (`pagenumber`),
ADD CONSTRAINT `employer_user` FOREIGN KEY (`employer_user`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `employment`
--
ALTER TABLE `employment`
ADD CONSTRAINT `curriculumvitae_ref` FOREIGN KEY (`curriculumvitae`) REFERENCES `curriculumvitae` (`cv_id`),
ADD CONSTRAINT `employee_job_type` FOREIGN KEY (`job_type`) REFERENCES `job_type` (`job_type_page`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `employee_ref` FOREIGN KEY (`employee`) REFERENCES `user_info` (`user_id`),
ADD CONSTRAINT `employment_employer` FOREIGN KEY (`employer`) REFERENCES `employer` (`employer_id`);

--
-- Tablo kısıtlamaları `follows`
--
ALTER TABLE `follows`
ADD CONSTRAINT `followee_actor` FOREIGN KEY (`two`) REFERENCES `actors` (`actor_id`),
ADD CONSTRAINT `follower_user` FOREIGN KEY (`one`) REFERENCES `user_info` (`user_id`);

--
-- Tablo kısıtlamaları `friend_list`
--
ALTER TABLE `friend_list`
ADD CONSTRAINT `friend_list_as_an_actor` FOREIGN KEY (`id`) REFERENCES `actors` (`actor_id`),
ADD CONSTRAINT `friend_list_visibility` FOREIGN KEY (`privacy`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `groups`
--
ALTER TABLE `groups`
ADD CONSTRAINT `group_actor` FOREIGN KEY (`group_id`) REFERENCES `actors` (`actor_id`),
ADD CONSTRAINT `group_creator` FOREIGN KEY (`created_by`) REFERENCES `user_info` (`user_id`);

--
-- Tablo kısıtlamaları `group_membership`
--
ALTER TABLE `group_membership`
ADD CONSTRAINT `group_member` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
ADD CONSTRAINT `group_ref` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`);

--
-- Tablo kısıtlamaları `like_dislike`
--
ALTER TABLE `like_dislike`
ADD CONSTRAINT `post_liked` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `liked_by` FOREIGN KEY (`whois_id`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `muted_notifications`
--
ALTER TABLE `muted_notifications`
ADD CONSTRAINT `notifies` FOREIGN KEY (`nto`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `notified_from` FOREIGN KEY (`nfrom`) REFERENCES `actors` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `page_generic`
--
ALTER TABLE `page_generic`
ADD CONSTRAINT `page_actor` FOREIGN KEY (`pagenumber`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `page_ownership`
--
ALTER TABLE `page_ownership`
ADD CONSTRAINT `owned_page_existing` FOREIGN KEY (`pagenumber`) REFERENCES `page_generic` (`pagenumber`),
ADD CONSTRAINT `page_created_by` FOREIGN KEY (`created_by`) REFERENCES `user_info` (`user_id`);

--
-- Tablo kısıtlamaları `picture`
--
ALTER TABLE `picture`
ADD CONSTRAINT `picture_activity` FOREIGN KEY (`id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `privacy_target` FOREIGN KEY (`privacy`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `posted_by` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `reply`
--
ALTER TABLE `reply`
ADD CONSTRAINT `is_reply_of` FOREIGN KEY (`status_id`) REFERENCES `post` (`post_id`);

--
-- Tablo kısıtlamaları `status`
--
ALTER TABLE `status`
ADD CONSTRAINT `status_activity` FOREIGN KEY (`id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `status_target` FOREIGN KEY (`privacy`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `tags`
--
ALTER TABLE `tags`
ADD CONSTRAINT `tagged` FOREIGN KEY (`tag_id`) REFERENCES `user_info` (`user_id`),
ADD CONSTRAINT `tagged_by` FOREIGN KEY (`who_id`) REFERENCES `actors` (`actor_id`),
ADD CONSTRAINT `tagged_in` FOREIGN KEY (`post_id`) REFERENCES `picture` (`id`);

--
-- Tablo kısıtlamaları `timeline`
--
ALTER TABLE `timeline`
ADD CONSTRAINT `post_subject` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `timeline_tp` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`);

--
-- Tablo kısıtlamaları `user_info`
--
ALTER TABLE `user_info`
ADD CONSTRAINT `religion` FOREIGN KEY (`religion`) REFERENCES `page_generic` (`pagenumber`),
ADD CONSTRAINT `user_actor` FOREIGN KEY (`user_id`) REFERENCES `actors` (`actor_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_address` FOREIGN KEY (`address`) REFERENCES `address` (`address_id`),
ADD CONSTRAINT `user_email` FOREIGN KEY (`mail`) REFERENCES `emails` (`email_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender_id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_lang` FOREIGN KEY (`lang`) REFERENCES `lang` (`id`),
ADD CONSTRAINT `user_marital` FOREIGN KEY (`marital_status_code`) REFERENCES `marital_status` (`marital_status_id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `volunteers`
--
ALTER TABLE `volunteers`
ADD CONSTRAINT `volunteer_user` FOREIGN KEY (`volunteer`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE,
ADD CONSTRAINT `voluntree_group` FOREIGN KEY (`voluntree`) REFERENCES `groups` (`group_id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `want_ad`
--
ALTER TABLE `want_ad`
ADD CONSTRAINT `ad_goes_to` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`),
ADD CONSTRAINT `ad_job_type` FOREIGN KEY (`job_type`) REFERENCES `job_type` (`job_type_page`),
ADD CONSTRAINT `ad_responsibility_user` FOREIGN KEY (`ad_responsibility`) REFERENCES `user_info` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

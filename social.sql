-- phpMyAdmin SQL Dump
-- version 4.2.12deb1
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 20 Ara 2014, 12:28:30
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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `actors`
--

CREATE TABLE IF NOT EXISTS `actors` (
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address`
--

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
(1, 17, NULL, '1909. Sokak', '1912. Sokak', 'Nursultan Nazarbayev Caddesi', NULL, 'Bayraklı Mahallesi', NULL, 'Smyrna', 'Bayraklı 3. Yerleşim Bölgesi', 2, 1, 1, 5, NULL, 'TUR');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cirriculumvitae`
--

CREATE TABLE IF NOT EXISTS `cirriculumvitae` (
  `cv_id` int(11) NOT NULL,
  `curriculum` longtext COLLATE utf32_turkish_ci NOT NULL,
  `created_on` date NOT NULL,
  `dropped_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

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
(6, 'Marmara Bölgesi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(250) COLLATE utf32_turkish_ci NOT NULL,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `connections`
--

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

CREATE TABLE IF NOT EXISTS `country` (
  `id` char(3) COLLATE utf32_turkish_ci NOT NULL COMMENT 'ISO Ülke Kodu',
  `country` varchar(80) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`id`, `country`) VALUES
('TUR', 'Turkey'),
('USA', 'United States of America');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL,
  `education` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `email_id` int(11) NOT NULL,
  `email_textual` varchar(50) COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `emails`
--

INSERT INTO `emails` (`email_id`, `email_textual`) VALUES
(1, 'erkinalp9035@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_animals`
--

CREATE TABLE IF NOT EXISTS `fav_animals` (
  `id` int(11) NOT NULL,
  `animal` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_artists`
--

CREATE TABLE IF NOT EXISTS `fav_artists` (
  `id` int(11) NOT NULL,
  `artist` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_books`
--

CREATE TABLE IF NOT EXISTS `fav_books` (
  `id` int(11) NOT NULL,
  `book` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fav_movie`
--

CREATE TABLE IF NOT EXISTS `fav_movie` (
  `id` int(11) NOT NULL,
  `movie` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `follows`
--

CREATE TABLE IF NOT EXISTS `follows` (
  `one` int(11) NOT NULL,
  `two` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friend`
--

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
-- Tablo için tablo yapısı `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL,
  `privacy` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `description` text COLLATE utf32_turkish_ci NOT NULL,
  `created_on` date NOT NULL,
  `destroyed_on` date NOT NULL,
  `last_actvity_happened` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `group_membership`
--

CREATE TABLE IF NOT EXISTS `group_membership` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `membership_start` date NOT NULL,
  `membershipe_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `interests`
--

CREATE TABLE IF NOT EXISTS `interests` (
  `id` int(11) NOT NULL,
  `interest` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL,
  `language` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `marital_status`
--

CREATE TABLE IF NOT EXISTS `marital_status` (
  `marital_status_id` smallint(6) NOT NULL,
  `marital_status_name` text COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `marital_status`
--

INSERT INTO `marital_status` (`marital_status_id`, `marital_status_name`) VALUES
(0, 'Unmarried'),
(1, 'Married and stlll not yet divorced'),
(2, 'Divorced'),
(3, 'Widow');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  `is_read` int(11) NOT NULL,
  `is_spam` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL,
  `msg` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `type` int(11) NOT NULL,
  `privacy` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `status` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `who` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_generic`
--

CREATE TABLE IF NOT EXISTS `page_generic` (
  `pagenumber` int(11) NOT NULL,
  `date_created` int(11) NOT NULL,
  `summary` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `description` text COLLATE utf32_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_ownership`
--

CREATE TABLE IF NOT EXISTS `page_ownership` (
  `pagenumber` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `profile_id` int(11) NOT NULL,
  `phone_number` decimal(28,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_types`
--

CREATE TABLE IF NOT EXISTS `phone_types` (
  `phone_number` decimal(28,0) NOT NULL DEFAULT '0',
  `phone_type` enum('fixed','cellular','voip','') CHARACTER SET utf32 COLLATE utf32_turkish_ci NOT NULL DEFAULT 'voip'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `p_address` varchar(150) COLLATE utf32_turkish_ci NOT NULL,
  `privacy` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) NOT NULL,
  `reply` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf32_turkish_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `thumbs_up` int(11) NOT NULL,
  `thumbs_down` int(11) NOT NULL,
  `privacy` int(11) NOT NULL,
  `to_fb` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `to_twitter` varchar(80) COLLATE utf32_turkish_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `attachment` varchar(80) COLLATE utf32_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `who_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `thumbs_up`
--

CREATE TABLE IF NOT EXISTS `thumbs_up` (
  `id` int(11) NOT NULL,
  `whois_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL,
  `date_joined` date NOT NULL,
  `date_of_birth` date NOT NULL,
  `givenname` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `middlename` varchar(50) COLLATE utf32_turkish_ci DEFAULT NULL,
  `familyname` varchar(50) COLLATE utf32_turkish_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `marital_status_code` int(11) NOT NULL,
  `quit` tinyint(1) NOT NULL DEFAULT '0',
  `address` int(11) NOT NULL,
  `religion` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `mail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `user_info`
--

INSERT INTO `user_info` (`user_id`, `date_joined`, `date_of_birth`, `givenname`, `middlename`, `familyname`, `gender`, `marital_status_code`, `quit`, `address`, `religion`, `rating`, `mail`) VALUES
(57, '2012-12-21', '1994-12-27', 'Erkin', 'Alp', 'Güney', 2, 0, 0, 1, NULL, 0, 1);

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
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `chat`
--
ALTER TABLE `chat`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cirriculumvitae`
--
ALTER TABLE `cirriculumvitae`
 ADD PRIMARY KEY (`cv_id`);

--
-- Tablo için indeksler `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`);

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
-- Tablo için indeksler `friend`
--
ALTER TABLE `friend`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `friend_user_id` (`friend_user_id`,`user_id`);

--
-- Tablo için indeksler `friend_list`
--
ALTER TABLE `friend_list`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `group_membership`
--
ALTER TABLE `group_membership`
 ADD KEY `group_id` (`group_id`);

--
-- Tablo için indeksler `interests`
--
ALTER TABLE `interests`
 ADD PRIMARY KEY (`id`);

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
-- Tablo için indeksler `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `msg` (`msg`(191),`created_at`);

--
-- Tablo için indeksler `page_generic`
--
ALTER TABLE `page_generic`
 ADD PRIMARY KEY (`pagenumber`);

--
-- Tablo için indeksler `page_ownership`
--
ALTER TABLE `page_ownership`
 ADD PRIMARY KEY (`pagenumber`);

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
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `reply`
--
ALTER TABLE `reply`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `status`
--
ALTER TABLE `status`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `thumbs_up`
--
ALTER TABLE `thumbs_up`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `whois_id` (`whois_id`,`post_id`);

--
-- Tablo için indeksler `user_info`
--
ALTER TABLE `user_info`
 ADD PRIMARY KEY (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

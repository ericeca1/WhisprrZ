-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2025 at 09:17 PM
-- Server version: 8.0.41
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eric_whisprrz_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_manager`
--

CREATE TABLE `add_manager` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Frameworks` int NOT NULL DEFAULT '0',
  `Languages` int NOT NULL DEFAULT '0',
  `Site_news` int NOT NULL DEFAULT '0',
  `Users` int NOT NULL DEFAULT '0',
  `Modules` int NOT NULL DEFAULT '0',
  `Advertise` int NOT NULL DEFAULT '0',
  `Media` int NOT NULL DEFAULT '0',
  `SMS_TEXT` int NOT NULL DEFAULT '0',
  `Options` int NOT NULL DEFAULT '0',
  `Statistics` int NOT NULL DEFAULT '0',
  `Payment` int NOT NULL DEFAULT '0',
  `Donation` int NOT NULL DEFAULT '0',
  `New_Page` int NOT NULL DEFAULT '0',
  `New_Menu` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `success` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `admin_replier`
--

CREATE TABLE `admin_replier` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_cars`
--

CREATE TABLE `adv_cars` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_casting`
--

CREATE TABLE `adv_casting` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `age` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_cats`
--

CREATE TABLE `adv_cats` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `eng` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rank` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_film`
--

CREATE TABLE `adv_film` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_housting`
--

CREATE TABLE `adv_housting` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `rent` decimal(13,2) NOT NULL DEFAULT '0.00',
  `br` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_images`
--

CREATE TABLE `adv_images` (
  `id` bigint NOT NULL,
  `adv_cat_id` bigint NOT NULL DEFAULT '0',
  `adv_id` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `adv_items`
--

CREATE TABLE `adv_items` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_jobs`
--

CREATE TABLE `adv_jobs` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `telecommute` tinyint NOT NULL DEFAULT '0',
  `contract` tinyint NOT NULL DEFAULT '0',
  `internship` tinyint NOT NULL DEFAULT '0',
  `part_time` tinyint NOT NULL DEFAULT '0',
  `non_profit` tinyint NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_music`
--

CREATE TABLE `adv_music` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_myspace`
--

CREATE TABLE `adv_myspace` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `age` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_personals`
--

CREATE TABLE `adv_personals` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `age` int NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_razd`
--

CREATE TABLE `adv_razd` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cat_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_sale`
--

CREATE TABLE `adv_sale` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `adv_services`
--

CREATE TABLE `adv_services` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `razd_id` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL DEFAULT '0',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `app_push_tokens`
--

CREATE TABLE `app_push_tokens` (
  `user_id` bigint NOT NULL,
  `operation_system` enum('android','ios') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_update` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `audio_greeting`
--

CREATE TABLE `audio_greeting` (
  `user_id` bigint NOT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `audio_invite`
--

CREATE TABLE `audio_invite` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `city` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `audio_reject`
--

CREATE TABLE `audio_reject` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `go` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `group_id` bigint NOT NULL DEFAULT '0',
  `city` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `aux_embed_vids`
--

CREATE TABLE `aux_embed_vids` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `type` enum('flash','graph','code') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'flash',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `alt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `langs` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `templates` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `banners_places`
--

CREATE TABLE `banners_places` (
  `id` int NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `type` enum('static','random') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'static',
  `active` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_comment`
--

CREATE TABLE `blogs_comment` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL DEFAULT '0',
  `post_user_id` int NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_like` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_comments_likes`
--

CREATE TABLE `blogs_comments_likes` (
  `id` bigint NOT NULL,
  `post_id` int NOT NULL,
  `post_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_hotsearch`
--

CREATE TABLE `blogs_hotsearch` (
  `id` int UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_post`
--

CREATE TABLE `blogs_post` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL,
  `count_views` int UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name_seo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `word_count` bigint NOT NULL DEFAULT '0',
  `search_index` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `comments_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `count_comments_all` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments_replies` int UNSIGNED NOT NULL DEFAULT '0',
  `likes` int NOT NULL,
  `last_action_like` datetime NOT NULL,
  `last_action_comment_like` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_post_likes`
--

CREATE TABLE `blogs_post_likes` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_post_tags`
--

CREATE TABLE `blogs_post_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_post_tags_relations`
--

CREATE TABLE `blogs_post_tags_relations` (
  `id` bigint NOT NULL,
  `blog_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_subscribe`
--

CREATE TABLE `blogs_subscribe` (
  `id` int UNSIGNED NOT NULL,
  `subscriber_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `blogger_user_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `carrier`
--

CREATE TABLE `carrier` (
  `id` int NOT NULL,
  `country_id` int NOT NULL,
  `state_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `chat_chair`
--

CREATE TABLE `chat_chair` (
  `id` int NOT NULL,
  `position` tinyint NOT NULL DEFAULT '0',
  `joined` datetime NOT NULL,
  `avatar` smallint NOT NULL DEFAULT '0',
  `nick` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lastbreath` datetime NOT NULL,
  `bot` tinyint NOT NULL DEFAULT '0',
  `asked` int NOT NULL DEFAULT '0',
  `room` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `chat_line`
--

CREATE TABLE `chat_line` (
  `id` int NOT NULL,
  `nick` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `fingerprint` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `line` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `timesaid` datetime NOT NULL,
  `suborder` tinyint NOT NULL DEFAULT '1',
  `room` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `tag` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `password` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '''''',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_avatar_face`
--

CREATE TABLE `city_avatar_face` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `head_color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hash` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_avatar_face_default`
--

CREATE TABLE `city_avatar_face_default` (
  `id` int NOT NULL,
  `gender` enum('M','F') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `head_color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `hash` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_custom_data`
--

CREATE TABLE `city_custom_data` (
  `data_id` bigint UNSIGNED NOT NULL,
  `location` tinyint NOT NULL DEFAULT '0',
  `pos_map` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `uid` bigint NOT NULL DEFAULT '0',
  `counter` bigint UNSIGNED NOT NULL DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_invite`
--

CREATE TABLE `city_invite` (
  `id` int NOT NULL,
  `from_user` int NOT NULL DEFAULT '0',
  `to_user` int NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_link`
--

CREATE TABLE `city_link` (
  `id` bigint UNSIGNED NOT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `location` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `pos_map` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `platform` smallint NOT NULL DEFAULT '0',
  `water_loc` smallint NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `temp` tinyint(1) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_live_streaming`
--

CREATE TABLE `city_live_streaming` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `video_id` int NOT NULL DEFAULT '0',
  `hash` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  `date_stop` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_moving`
--

CREATE TABLE `city_moving` (
  `step` bigint UNSIGNED NOT NULL,
  `id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `location` tinyint NOT NULL DEFAULT '0',
  `move` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_msg`
--

CREATE TABLE `city_msg` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `room` tinyint NOT NULL DEFAULT '0',
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `born` timestamp NULL DEFAULT NULL,
  `msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `from_user_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `to_user_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_msg_backup`
--

CREATE TABLE `city_msg_backup` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `room` tinyint NOT NULL DEFAULT '0',
  `born` timestamp NULL DEFAULT NULL,
  `msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_open`
--

CREATE TABLE `city_open` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` datetime NOT NULL,
  `room` tinyint NOT NULL DEFAULT '0',
  `mid` int UNSIGNED NOT NULL DEFAULT '0',
  `z` int UNSIGNED NOT NULL DEFAULT '0',
  `session` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `session_date` datetime NOT NULL,
  `last_writing` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_photo`
--

CREATE TABLE `city_photo` (
  `photo_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `photo_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `visible` enum('Y','N','P','Nudity') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `default` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `votes` int NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `wall_id` bigint NOT NULL,
  `published` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hash` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_reject`
--

CREATE TABLE `city_reject` (
  `id` int NOT NULL,
  `from_user` int NOT NULL DEFAULT '0',
  `to_user` int NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `go` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_rooms`
--

CREATE TABLE `city_rooms` (
  `id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `video` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL,
  `game` tinyint(1) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_temp`
--

CREATE TABLE `city_temp` (
  `id` bigint UNSIGNED NOT NULL,
  `params` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_users`
--

CREATE TABLE `city_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `face` int NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '1',
  `cap` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_visit` datetime NOT NULL,
  `demo_last_step` bigint NOT NULL DEFAULT '0',
  `sound` tinyint(1) NOT NULL DEFAULT '1',
  `gender` enum('M','F','') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `invite` tinyint(1) NOT NULL DEFAULT '0',
  `demo` tinyint(1) NOT NULL DEFAULT '0',
  `not_open_chats` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `manager` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `city_users_in_rooms`
--

CREATE TABLE `city_users_in_rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `cuid` bigint UNSIGNED NOT NULL DEFAULT '0',
  `location` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `pos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pos_map` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `platform` smallint NOT NULL DEFAULT '0',
  `water_loc` smallint NOT NULL DEFAULT '0',
  `house` smallint NOT NULL DEFAULT '0',
  `rot` smallint NOT NULL DEFAULT '0',
  `floor` smallint NOT NULL DEFAULT '1',
  `last_visit` datetime NOT NULL,
  `demo_last_step` bigint NOT NULL DEFAULT '0',
  `manager` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `club_option`
--

CREATE TABLE `club_option` (
  `id` int UNSIGNED NOT NULL,
  `club_title` text,
  `club_content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `color_scheme`
--

CREATE TABLE `color_scheme` (
  `id` bigint NOT NULL,
  `color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `upper` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lower` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `col_order`
--

CREATE TABLE `col_order` (
  `id` int NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `section` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `additional` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `option` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_in_admin` tinyint(1) NOT NULL,
  `type` enum('text','checkbox','selectbox','password','separator','radio','textarea','section','color','file','label','select_multiple','number','time') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_horoscope`
--

CREATE TABLE `const_horoscope` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_interests`
--

CREATE TABLE `const_interests` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_i_am_here_to`
--

CREATE TABLE `const_i_am_here_to` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_lms_user_type`
--

CREATE TABLE `const_lms_user_type` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `free` enum('none','super') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('teacher','student') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_looking`
--

CREATE TABLE `const_looking` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `search` int NOT NULL DEFAULT '0',
  `gender` enum('B','M','F') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'B',
  `free` enum('none','silver','gold','platinum') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_orientation`
--

CREATE TABLE `const_orientation` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `search` int NOT NULL DEFAULT '0',
  `gender` enum('M','F','C') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `free` int UNSIGNED NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `const_relation`
--

CREATE TABLE `const_relation` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `contact_partner`
--

CREATE TABLE `contact_partner` (
  `id` int NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `custom_folders`
--

CREATE TABLE `custom_folders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `offset` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation_option`
--

CREATE TABLE `donation_option` (
  `background_filepath` text,
  `id` int UNSIGNED NOT NULL,
  `art_title` text,
  `art_content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int UNSIGNED NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `email_auto`
--

CREATE TABLE `email_auto` (
  `id` int NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `button` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `email_auto_settings`
--

CREATE TABLE `email_auto_settings` (
  `id` int NOT NULL,
  `option` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `id` bigint NOT NULL,
  `from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `added_at` datetime NOT NULL,
  `sending_time` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `encounters`
--

CREATE TABLE `encounters` (
  `id` bigint NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `from_reply` enum('P','Y','N','M') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `to_reply` enum('P','Y','N','M') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'P',
  `new` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `new_to` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `events_category`
--

CREATE TABLE `events_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event`
--

CREATE TABLE `events_event` (
  `event_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `user_to` int NOT NULL DEFAULT '0',
  `event_private` tinyint NOT NULL DEFAULT '0',
  `category_id` bigint NOT NULL,
  `event_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city_id` bigint NOT NULL,
  `event_datetime` datetime NOT NULL,
  `event_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event_place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event_site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event_phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event_n_comments` bigint NOT NULL DEFAULT '0',
  `event_n_guests` bigint NOT NULL DEFAULT '0',
  `event_has_images` tinyint NOT NULL DEFAULT '0',
  `signin_couples` tinyint(1) NOT NULL DEFAULT '1',
  `signin_females` tinyint(1) NOT NULL DEFAULT '1',
  `signin_males` tinyint(1) NOT NULL DEFAULT '1',
  `signin_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `signin_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `signin_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `event_approval` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `done_user` int NOT NULL DEFAULT '0',
  `done_new` tinyint(1) NOT NULL DEFAULT '0',
  `wevent_id` tinyint NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `access_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_comment`
--

CREATE TABLE `events_event_comment` (
  `comment_id` bigint NOT NULL,
  `event_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_comment_comment`
--

CREATE TABLE `events_event_comment_comment` (
  `comment_id` bigint NOT NULL,
  `parent_comment_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_guest`
--

CREATE TABLE `events_event_guest` (
  `guest_id` bigint NOT NULL,
  `event_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '1',
  `guest_n_friends` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image`
--

CREATE TABLE `events_event_image` (
  `image_id` bigint NOT NULL,
  `event_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `host` tinyint NOT NULL DEFAULT '1',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `votes` int NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `wall_id` bigint NOT NULL DEFAULT '0',
  `count_comments_all` int NOT NULL DEFAULT '0',
  `count_comments` int NOT NULL DEFAULT '0',
  `count_comments_replies` int NOT NULL DEFAULT '0',
  `count_views` int NOT NULL DEFAULT '0',
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  `restore` tinyint(1) NOT NULL DEFAULT '0',
  `version` int NOT NULL DEFAULT '0',
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `average` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `gif` tinyint(1) NOT NULL DEFAULT '0',
  `hide_header` tinyint(1) NOT NULL DEFAULT '0',
  `face_detect_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visible` enum('Y','N','P','Nudity') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `nudity` tinyint(1) NOT NULL DEFAULT '0',
  `default` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `default_group` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `photo_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `published` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hash` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_comments`
--

CREATE TABLE `events_event_image_comments` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_comments_likes`
--

CREATE TABLE `events_event_image_comments_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` bigint NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_face_user_relation`
--

CREATE TABLE `events_event_image_face_user_relation` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `box_id` tinyint NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_likes`
--

CREATE TABLE `events_event_image_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_rate`
--

CREATE TABLE `events_event_image_rate` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_tags`
--

CREATE TABLE `events_event_image_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_event_image_tags_relations`
--

CREATE TABLE `events_event_image_tags_relations` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_setting`
--

CREATE TABLE `events_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `flashchat_messages`
--

CREATE TABLE `flashchat_messages` (
  `id` int UNSIGNED NOT NULL,
  `time` int NOT NULL,
  `status` enum('system','mess') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'mess',
  `msgtext` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `room` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `send` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `flashchat_rooms`
--

CREATE TABLE `flashchat_rooms` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `flashchat_users`
--

CREATE TABLE `flashchat_users` (
  `id` int UNSIGNED NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `mess_color` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `time_out` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `sys_color` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000099',
  `room` int NOT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'm',
  `user_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_category`
--

CREATE TABLE `forum_category` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sort_rank` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_forum`
--

CREATE TABLE `forum_forum` (
  `id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0',
  `parent_forum_id` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_topics` bigint NOT NULL DEFAULT '0',
  `n_messages` bigint NOT NULL DEFAULT '0',
  `sort_rank` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_message`
--

CREATE TABLE `forum_message` (
  `id` bigint NOT NULL,
  `topic_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_read_marker`
--

CREATE TABLE `forum_read_marker` (
  `id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `forum_id` bigint NOT NULL DEFAULT '0',
  `topics_read` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `read_until` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_setting`
--

CREATE TABLE `forum_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `sort_by` enum('last_post','thread','thread_starter','replies','views') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'last_post',
  `sort_by_dir` enum('asc','desc') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'desc'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `id` bigint NOT NULL,
  `forum_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `n_messages` bigint NOT NULL DEFAULT '0',
  `n_views` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `fr_user_id` int NOT NULL DEFAULT '0',
  `bookmark` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `visible_bookmark` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `DATA` date NOT NULL,
  `featured` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `friends_requests`
--

CREATE TABLE `friends_requests` (
  `user_id` bigint NOT NULL DEFAULT '0',
  `friend_id` bigint NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` bigint NOT NULL DEFAULT '0',
  `friend_featured` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `activity` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

CREATE TABLE `gallery_albums` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `parentid` int UNSIGNED DEFAULT NULL,
  `folder` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `date` datetime DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `show` int UNSIGNED NOT NULL DEFAULT '1',
  `thumb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sort_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sort_order` int UNSIGNED DEFAULT NULL,
  `views` int UNSIGNED DEFAULT '0',
  `access` enum('public','friends','private') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'public'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_comments`
--

CREATE TABLE `gallery_comments` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `imageid` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `inmoderation` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `albumid` int UNSIGNED NOT NULL DEFAULT '0',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `commentson` int NOT NULL DEFAULT '1',
  `show` int NOT NULL DEFAULT '1',
  `sort_order` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `width` int UNSIGNED DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `game_chess`
--

CREATE TABLE `game_chess` (
  `id` int NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `enemy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ingame` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `time_in` bigint DEFAULT NULL,
  `active` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `hod_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `now_hod` enum('login','enemy') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'login'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `game_invite`
--

CREATE TABLE `game_invite` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `game` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `game_morboy`
--

CREATE TABLE `game_morboy` (
  `id` bigint NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `enemy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nowX` smallint DEFAULT NULL,
  `nowY` smallint DEFAULT NULL,
  `ingame` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `time_in` bigint DEFAULT NULL,
  `active` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `massiv` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `popal` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shodil` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'n',
  `pokazal` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `game_reject`
--

CREATE TABLE `game_reject` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `game` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `go` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `game_shashki`
--

CREATE TABLE `game_shashki` (
  `id` bigint NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `enemy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nowX` smallint DEFAULT NULL,
  `nowY` smallint DEFAULT NULL,
  `ingame` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `time_in` bigint DEFAULT NULL,
  `active` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `srubil` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `num_shashka` smallint DEFAULT NULL,
  `damka` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `geo_city`
--

CREATE TABLE `geo_city` (
  `city_id` int NOT NULL,
  `state_id` int NOT NULL DEFAULT '0',
  `country_id` int NOT NULL DEFAULT '0',
  `city_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lat` bigint NOT NULL,
  `long` bigint NOT NULL,
  `pop` int UNSIGNED NOT NULL,
  `hidden` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `geo_country`
--

CREATE TABLE `geo_country` (
  `country_id` int NOT NULL,
  `country_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lat` bigint NOT NULL,
  `long` bigint NOT NULL,
  `street_chat_pos_map` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `first` int DEFAULT '0',
  `hidden` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `geo_state`
--

CREATE TABLE `geo_state` (
  `state_id` int NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `state_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int NOT NULL,
  `sent` int NOT NULL DEFAULT '0',
  `credits` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `hash` int NOT NULL DEFAULT '0',
  `set` tinyint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `gifts_set`
--

CREATE TABLE `gifts_set` (
  `id` int NOT NULL,
  `alias` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `glass_video`
--

CREATE TABLE `glass_video` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `dt` datetime NOT NULL DEFAULT '2002-01-01 00:00:00',
  `count_comments` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments_replies` int UNSIGNED NOT NULL DEFAULT '0',
  `count_views` int UNSIGNED NOT NULL DEFAULT '0',
  `count_rates` int UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `search_index` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rating` float NOT NULL DEFAULT '0',
  `active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `private` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `cat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_uploaded` tinyint(1) NOT NULL DEFAULT '0',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `hide_header` tinyint(1) NOT NULL DEFAULT '0',
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_category`
--

CREATE TABLE `groups_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_forum`
--

CREATE TABLE `groups_forum` (
  `forum_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `forum_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forum_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `forum_n_comments` bigint NOT NULL DEFAULT '0',
  `forum_n_views` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_forum_comment`
--

CREATE TABLE `groups_forum_comment` (
  `comment_id` bigint NOT NULL,
  `forum_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_forum_comment_comment`
--

CREATE TABLE `groups_forum_comment_comment` (
  `comment_id` bigint NOT NULL,
  `parent_comment_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_group`
--

CREATE TABLE `groups_group` (
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `group_private` tinyint NOT NULL DEFAULT '0',
  `category_id` bigint NOT NULL,
  `group_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `group_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `group_n_posts` bigint NOT NULL DEFAULT '0',
  `group_n_comments` bigint NOT NULL DEFAULT '0',
  `group_n_members` bigint NOT NULL DEFAULT '0',
  `group_has_images` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_group_comment`
--

CREATE TABLE `groups_group_comment` (
  `comment_id` bigint NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_group_comment_comment`
--

CREATE TABLE `groups_group_comment_comment` (
  `comment_id` bigint NOT NULL,
  `parent_comment_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_group_image`
--

CREATE TABLE `groups_group_image` (
  `image_id` bigint NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `groups_group_member`
--

CREATE TABLE `groups_group_member` (
  `member_id` bigint NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `groups_invite`
--

CREATE TABLE `groups_invite` (
  `invite_id` bigint NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `invite_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_setting`
--

CREATE TABLE `groups_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `groups_social`
--

CREATE TABLE `groups_social` (
  `group_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `name_seo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `date` datetime NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `category_id` bigint NOT NULL,
  `country_id` int UNSIGNED NOT NULL DEFAULT '0',
  `state_id` int UNSIGNED NOT NULL DEFAULT '0',
  `city_id` int UNSIGNED NOT NULL DEFAULT '0',
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `count_posts` bigint NOT NULL DEFAULT '0',
  `count_comments` bigint NOT NULL DEFAULT '0',
  `count_members` bigint NOT NULL DEFAULT '0',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ban_global` tinyint(1) NOT NULL DEFAULT '0',
  `profile_bg_cover` tinyint(1) NOT NULL DEFAULT '0',
  `profile_bg_cover_param` varchar(510) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `show_owner` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_social_subscribers`
--

CREATE TABLE `groups_social_subscribers` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `group_moderator` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `moderator_options` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `approve_at` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `groups_social_tags`
--

CREATE TABLE `groups_social_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups_social_tags_relations`
--

CREATE TABLE `groups_social_tags_relations` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `groups_user_block_list`
--

CREATE TABLE `groups_user_block_list` (
  `id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `group_party`
--

CREATE TABLE `group_party` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_mail` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `online state` int DEFAULT NULL,
  `comment_msg` varchar(250) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `help_answer`
--

CREATE TABLE `help_answer` (
  `id` int NOT NULL,
  `topic_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `help_topic`
--

CREATE TABLE `help_topic` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_category`
--

CREATE TABLE `hotdates_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate`
--

CREATE TABLE `hotdates_hotdate` (
  `hotdate_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_to` int NOT NULL,
  `hotdate_private` tinyint NOT NULL DEFAULT '0',
  `access_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `category_id` bigint NOT NULL,
  `hotdate_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hotdate_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city_id` bigint NOT NULL,
  `hotdate_datetime` datetime NOT NULL,
  `hotdate_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hotdate_place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hotdate_site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hotdate_phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hotdate_n_comments` bigint NOT NULL DEFAULT '0',
  `hotdate_n_guests` bigint NOT NULL DEFAULT '0',
  `hotdate_has_images` tinyint NOT NULL DEFAULT '0',
  `hotdate_approval` tinyint(1) NOT NULL DEFAULT '0',
  `signin_couples` tinyint(1) NOT NULL DEFAULT '1',
  `signin_females` tinyint(1) NOT NULL DEFAULT '1',
  `signin_males` tinyint(1) NOT NULL DEFAULT '1',
  `signin_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `signin_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `signin_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `done_user` tinyint NOT NULL DEFAULT '0',
  `done_new` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_comment`
--

CREATE TABLE `hotdates_hotdate_comment` (
  `comment_id` bigint NOT NULL,
  `hotdate_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_comment_comment`
--

CREATE TABLE `hotdates_hotdate_comment_comment` (
  `comment_id` bigint NOT NULL,
  `parent_comment_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_guest`
--

CREATE TABLE `hotdates_hotdate_guest` (
  `guest_id` bigint NOT NULL,
  `hotdate_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '1',
  `guest_n_friends` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image`
--

CREATE TABLE `hotdates_hotdate_image` (
  `image_id` bigint NOT NULL,
  `hotdate_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `host` tinyint NOT NULL DEFAULT '1',
  `photo_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `votes` int DEFAULT '0',
  `rating` int DEFAULT '0',
  `wall_id` int DEFAULT '0',
  `count_comments_all` int DEFAULT '0',
  `count_comments` tinyint DEFAULT '0',
  `count_comments_replies` int DEFAULT '0',
  `count_views` int DEFAULT '0',
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `restore` int DEFAULT '0',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  `group_id` bigint DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `version` int NOT NULL DEFAULT '0',
  `average` int NOT NULL DEFAULT '0',
  `gif` tinyint(1) DEFAULT '0',
  `hide_header` tinyint(1) DEFAULT '0',
  `face_detect_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `visible` enum('Y','N','P','Nudity') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `nidity` tinyint(1) DEFAULT '0',
  `default` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `default_group` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `published` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `hash` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_comments`
--

CREATE TABLE `hotdates_hotdate_image_comments` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_comments_likes`
--

CREATE TABLE `hotdates_hotdate_image_comments_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` bigint NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_face_user_relation`
--

CREATE TABLE `hotdates_hotdate_image_face_user_relation` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `box_id` tinyint NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_likes`
--

CREATE TABLE `hotdates_hotdate_image_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_rate`
--

CREATE TABLE `hotdates_hotdate_image_rate` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_tags`
--

CREATE TABLE `hotdates_hotdate_image_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_hotdate_image_tags_relations`
--

CREATE TABLE `hotdates_hotdate_image_tags_relations` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hotdates_setting`
--

CREATE TABLE `hotdates_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `im_audio_message`
--

CREATE TABLE `im_audio_message` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` int NOT NULL,
  `im_msg_id` bigint NOT NULL,
  `wall_comment_id` bigint NOT NULL,
  `photo_comment_id` bigint NOT NULL,
  `video_comment_id` bigint NOT NULL,
  `blog_comment_id` bigint NOT NULL,
  `comment_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `im_contact_replied`
--

CREATE TABLE `im_contact_replied` (
  `user_id` bigint NOT NULL,
  `user_to` bigint NOT NULL,
  `replied` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `im_msg`
--

CREATE TABLE `im_msg` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `from_group_id` bigint NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_group_id` bigint NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `born` timestamp NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(39) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `system_type` tinyint(1) NOT NULL DEFAULT '0',
  `from_user_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `to_user_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `msg_translation` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `audio_message_id` bigint UNSIGNED NOT NULL,
  `msg_hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `im_open`
--

CREATE TABLE `im_open` (
  `id` int UNSIGNED NOT NULL,
  `from_user` int UNSIGNED NOT NULL DEFAULT '0',
  `from_group_id` bigint NOT NULL DEFAULT '0',
  `to_user` int UNSIGNED NOT NULL DEFAULT '0',
  `to_group_id` bigint NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `mid` int UNSIGNED NOT NULL DEFAULT '0',
  `im_open_visible` enum('Y','N','C') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'C',
  `is_new_msg` tinyint(1) NOT NULL DEFAULT '0',
  `x` int UNSIGNED NOT NULL DEFAULT '0',
  `y` int UNSIGNED NOT NULL DEFAULT '0',
  `z` int UNSIGNED NOT NULL DEFAULT '0',
  `session` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `session_date` datetime NOT NULL,
  `last_writing` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `page` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `category` int NOT NULL,
  `interest` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invited_folder`
--

CREATE TABLE `invited_folder` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `friend_id` bigint NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` bigint NOT NULL DEFAULT '0',
  `friend_featured` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` bigint NOT NULL DEFAULT '0',
  `folder_id` int NOT NULL DEFAULT '0',
  `is_new` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invited_personal`
--

CREATE TABLE `invited_personal` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `friend_id` bigint NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` bigint NOT NULL DEFAULT '0',
  `friend_featured` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` bigint NOT NULL DEFAULT '0',
  `is_new` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invited_private`
--

CREATE TABLE `invited_private` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `friend_id` bigint NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` bigint NOT NULL DEFAULT '0',
  `friend_featured` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` bigint NOT NULL DEFAULT '0',
  `is_new` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invited_private_vids`
--

CREATE TABLE `invited_private_vids` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `friend_id` bigint NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `featured` bigint NOT NULL DEFAULT '0',
  `friend_featured` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` bigint NOT NULL DEFAULT '0',
  `is_new` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `invite_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ip_block`
--

CREATE TABLE `ip_block` (
  `id` int NOT NULL,
  `ip` varchar(39) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `live_streaming`
--

CREATE TABLE `live_streaming` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `video_id` int NOT NULL DEFAULT '0',
  `hash` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  `date_stop` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `is_upload_photo` tinyint(1) NOT NULL DEFAULT '0',
  `is_upload_video` tinyint(1) NOT NULL DEFAULT '0',
  `count_viewers` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments_replies` int UNSIGNED NOT NULL DEFAULT '0',
  `wall_id` bigint NOT NULL DEFAULT '0',
  `demo` tinyint(1) NOT NULL DEFAULT '0',
  `demo_session` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `live_streaming_viewers`
--

CREATE TABLE `live_streaming_viewers` (
  `id` int NOT NULL,
  `live_id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `looking_level`
--

CREATE TABLE `looking_level` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mail_folder`
--

CREATE TABLE `mail_folder` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mail_msg`
--

CREATE TABLE `mail_msg` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `folder` int NOT NULL DEFAULT '1',
  `new` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `subject` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_sent` int NOT NULL DEFAULT '0',
  `type` enum('plain','postcard') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `sent_id` bigint NOT NULL DEFAULT '0',
  `receiver_read` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text_hash` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('GROUP_MAIL','GROUP_INVITE','EVENT_MAIL','HOTDATE_MAIL','PARTYHOU_MAIL','MAIL_COMPOSE') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `massmail`
--

CREATE TABLE `massmail` (
  `id` int NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `users` tinyint(1) NOT NULL,
  `other` tinyint(1) NOT NULL,
  `partners` tinyint(1) NOT NULL,
  `languages` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` int NOT NULL,
  `send_partner` tinyint(1) NOT NULL,
  `users_filter` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `emails_sent` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `masssms`
--

CREATE TABLE `masssms` (
  `id` int NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `users` tinyint(1) NOT NULL,
  `other` tinyint(1) NOT NULL,
  `partners` tinyint(1) NOT NULL,
  `languages` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` int NOT NULL,
  `send_partner` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meta_link_info`
--

CREATE TABLE `meta_link_info` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `links_number` bigint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `canonical` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_id` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_category`
--

CREATE TABLE `music_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_musician`
--

CREATE TABLE `music_musician` (
  `musician_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `musician_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `musician_leader` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `musician_about` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `musician_founded` year NOT NULL DEFAULT '0000',
  `country_id` bigint NOT NULL DEFAULT '0',
  `musician_rating` int NOT NULL DEFAULT '0',
  `musician_n_votes` bigint NOT NULL DEFAULT '0',
  `musician_has_images` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_musician_comment`
--

CREATE TABLE `music_musician_comment` (
  `comment_id` bigint NOT NULL,
  `musician_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_musician_image`
--

CREATE TABLE `music_musician_image` (
  `image_id` bigint NOT NULL,
  `musician_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `music_musician_vote`
--

CREATE TABLE `music_musician_vote` (
  `vote_id` bigint NOT NULL,
  `musician_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `vote_rating` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `music_setting`
--

CREATE TABLE `music_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0',
  `setting_limit` enum('all','today','week','month') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `music_song`
--

CREATE TABLE `music_song` (
  `song_id` bigint NOT NULL,
  `musician_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `song_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `song_about` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `song_year` year NOT NULL DEFAULT '0000',
  `song_n_plays` bigint NOT NULL DEFAULT '0',
  `song_n_comments` bigint NOT NULL DEFAULT '0',
  `song_rating` int NOT NULL DEFAULT '0',
  `song_length` int NOT NULL DEFAULT '0',
  `song_n_votes` bigint NOT NULL DEFAULT '0',
  `song_has_images` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_song_comment`
--

CREATE TABLE `music_song_comment` (
  `comment_id` bigint NOT NULL,
  `song_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_song_image`
--

CREATE TABLE `music_song_image` (
  `image_id` bigint NOT NULL,
  `song_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `music_song_vote`
--

CREATE TABLE `music_song_vote` (
  `vote_id` bigint NOT NULL,
  `song_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `vote_rating` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `cat` int NOT NULL DEFAULT '0',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `news_short` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `news_long` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` int NOT NULL DEFAULT '0',
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `root` tinyint(1) NOT NULL,
  `root_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `news_cats`
--

CREATE TABLE `news_cats` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `root` tinyint(1) NOT NULL,
  `root_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `object`
--

CREATE TABLE `object` (
  `id` int UNSIGNED NOT NULL,
  `location` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `object_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `button_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `button_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `big_image_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `video_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `size` float NOT NULL DEFAULT '0',
  `pos_x` int NOT NULL DEFAULT '0',
  `pos_y` int NOT NULL DEFAULT '0',
  `pos_z` int NOT NULL DEFAULT '0',
  `rot_x` int NOT NULL DEFAULT '0',
  `rot_y` int NOT NULL DEFAULT '0',
  `rot_z` int NOT NULL DEFAULT '0',
  `rotation_speed` int NOT NULL DEFAULT '0',
  `cursor_rotation` tinyint(1) NOT NULL DEFAULT '1',
  `info_on_hover` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `object_type`
--

CREATE TABLE `object_type` (
  `id` int UNSIGNED NOT NULL,
  `texture` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `obj` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `outside_image`
--

CREATE TABLE `outside_image` (
  `image_id` bigint NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `image_n_links` bigint NOT NULL DEFAULT '1',
  `outside_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `meta_id` bigint NOT NULL DEFAULT '0',
  `gif` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `menu_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `menu_style` tinyint(1) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `section` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `hide_from_guests` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `partner_id` int NOT NULL,
  `p_partner` int NOT NULL DEFAULT '0',
  `summary` decimal(7,2) NOT NULL DEFAULT '0.00',
  `account` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_last` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_last_date` datetime NOT NULL,
  `count_users` int NOT NULL DEFAULT '0',
  `count_refs` int NOT NULL DEFAULT '0',
  `count_golds` int NOT NULL DEFAULT '0',
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `adress2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `state_id` int NOT NULL DEFAULT '0',
  `city_id` int NOT NULL DEFAULT '0',
  `zip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `other` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_adress1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_adress2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_zip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_aba` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_swift` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `paypal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner_banners`
--

CREATE TABLE `partner_banners` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `size` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `langs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner_faq`
--

CREATE TABLE `partner_faq` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner_main`
--

CREATE TABLE `partner_main` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner_terms`
--

CREATE TABLE `partner_terms` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partner_tips`
--

CREATE TABLE `partner_tips` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_category`
--

CREATE TABLE `partyhouz_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_open`
--

CREATE TABLE `partyhouz_open` (
  `open_partyhouz_id` int NOT NULL,
  `partyhou_ids` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `user_max` int DEFAULT '0',
  `resets` int DEFAULT '3000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou`
--

CREATE TABLE `partyhouz_partyhou` (
  `partyhou_id` bigint NOT NULL,
  `user_to` tinyint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `partyhou_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `partyhou_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `partyhou_datetime` datetime NOT NULL,
  `partyhou_n_comments` bigint NOT NULL DEFAULT '0',
  `partyhou_n_guests` bigint NOT NULL DEFAULT '0',
  `partyhou_has_images` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lock_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_friends` tinyint(1) NOT NULL DEFAULT '0',
  `is_group` tinyint(1) NOT NULL DEFAULT '0',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `cum_couples` tinyint(1) NOT NULL DEFAULT '0',
  `cum_females` tinyint(1) NOT NULL DEFAULT '0',
  `cum_males` tinyint(1) NOT NULL DEFAULT '0',
  `cum_transgender` tinyint(1) NOT NULL DEFAULT '0',
  `cum_nonbinary` tinyint(1) NOT NULL DEFAULT '0',
  `cum_everyone` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_couples` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_females` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_males` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_transgender` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_nonbinary` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_everyone` tinyint(1) NOT NULL DEFAULT '0',
  `partyhou_approval` tinyint(1) NOT NULL DEFAULT '0',
  `signin_couples` tinyint(1) NOT NULL DEFAULT '1',
  `signin_females` tinyint(1) NOT NULL DEFAULT '1',
  `signin_males` tinyint(1) NOT NULL DEFAULT '1',
  `signin_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `signin_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `signin_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `saved_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_saved` tinyint(1) NOT NULL DEFAULT '0',
  `room_status` tinyint NOT NULL DEFAULT '0',
  `partyhou_private` tinyint NOT NULL DEFAULT '0',
  `access_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invited_user_ids` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `done_user` tinyint NOT NULL,
  `done_new` tinyint(1) NOT NULL,
  `city_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `partyhou_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `partyhou_place` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `partyhou_site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `partyhou_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_open_partyhouz` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_comment`
--

CREATE TABLE `partyhouz_partyhou_comment` (
  `comment_id` bigint NOT NULL,
  `partyhou_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_comment_comment`
--

CREATE TABLE `partyhouz_partyhou_comment_comment` (
  `comment_id` bigint NOT NULL,
  `parent_comment_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `comment_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_guest`
--

CREATE TABLE `partyhouz_partyhou_guest` (
  `guest_id` bigint NOT NULL,
  `partyhou_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '1',
  `guest_n_friends` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `declined` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image`
--

CREATE TABLE `partyhouz_partyhou_image` (
  `image_id` bigint NOT NULL,
  `partyhou_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `host` tinyint DEFAULT '1',
  `photo_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `votes` int DEFAULT '0',
  `rating` int DEFAULT '0',
  `wall_id` int DEFAULT '0',
  `count_comments_all` int DEFAULT '0',
  `count_comments` int DEFAULT '0',
  `count_comments_replies` int DEFAULT '0',
  `count_views` int DEFAULT '0',
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `restore` int DEFAULT '0',
  `width` int DEFAULT '0',
  `height` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `version` int DEFAULT '0',
  `average` int NOT NULL DEFAULT '0',
  `gif` tinyint NOT NULL,
  `hide_header` tinyint(1) NOT NULL,
  `face_detect_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visible` enum('Y','N','P','Nudity') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Y',
  `nudity` tinyint(1) DEFAULT '0',
  `default` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `default_group` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'N',
  `published` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `hash` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_comments`
--

CREATE TABLE `partyhouz_partyhou_image_comments` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_comments_likes`
--

CREATE TABLE `partyhouz_partyhou_image_comments_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` bigint NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_face_user_relation`
--

CREATE TABLE `partyhouz_partyhou_image_face_user_relation` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `box_id` tinyint NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_likes`
--

CREATE TABLE `partyhouz_partyhou_image_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_rate`
--

CREATE TABLE `partyhouz_partyhou_image_rate` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_tags`
--

CREATE TABLE `partyhouz_partyhou_image_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_image_tags_relations`
--

CREATE TABLE `partyhouz_partyhou_image_tags_relations` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_partyhou_invites`
--

CREATE TABLE `partyhouz_partyhou_invites` (
  `id` bigint NOT NULL,
  `partyhou_id` bigint NOT NULL,
  `invited_user_id` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending,1-accepted,2-declined'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `partyhouz_setting`
--

CREATE TABLE `partyhouz_setting` (
  `setting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_after`
--

CREATE TABLE `payment_after` (
  `id` int NOT NULL,
  `dt` datetime NOT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_before`
--

CREATE TABLE `payment_before` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL,
  `item` int NOT NULL DEFAULT '0',
  `system` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `request_uri` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subscription_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subscription_expiry_time` int NOT NULL,
  `app_package_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `app_product_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_cat`
--

CREATE TABLE `payment_cat` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_features`
--

CREATE TABLE `payment_features` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_log`
--

CREATE TABLE `payment_log` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `amount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `system` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `referer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `dt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_plan`
--

CREATE TABLE `payment_plan` (
  `item` int NOT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `amount_old` decimal(7,2) NOT NULL DEFAULT '0.00',
  `gold_days` int NOT NULL DEFAULT '0',
  `type` enum('trial','free','payment') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'trial',
  `co_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `set` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `payment_modules_off` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fortumo_service_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fortumo_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `zombaio_pricing_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `iapgoogle_product_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `iapapple_product_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_price`
--

CREATE TABLE `payment_price` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `credits` int NOT NULL DEFAULT '0',
  `set` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `date` datetime NOT NULL,
  `photo_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `visible` enum('Y','N','P','Nudity') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `nudity` tinyint(1) NOT NULL DEFAULT '0',
  `default` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `default_group` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `personal` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `in_custom_folder` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `custom_folder_id` int NOT NULL DEFAULT '0',
  `votes` int NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `wall_id` bigint NOT NULL,
  `published` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `count_comments_all` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments_replies` int UNSIGNED NOT NULL DEFAULT '0',
  `count_views` int UNSIGNED NOT NULL DEFAULT '0',
  `hide_header` tinyint(1) NOT NULL DEFAULT '0',
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  `restore` tinyint(1) NOT NULL DEFAULT '0',
  `face_detect_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_admin_default` tinyint(1) NOT NULL DEFAULT '0',
  `gif` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `photo_comments`
--

CREATE TABLE `photo_comments` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint UNSIGNED NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `photo_comments_likes`
--

CREATE TABLE `photo_comments_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `photo_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `photo_face_user_relation`
--

CREATE TABLE `photo_face_user_relation` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_photo_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `box_id` tinyint NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `photo_likes`
--

CREATE TABLE `photo_likes` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `photo_rate`
--

CREATE TABLE `photo_rate` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL DEFAULT '0',
  `photo_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `photo_tags`
--

CREATE TABLE `photo_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `photo_tags_relations`
--

CREATE TABLE `photo_tags_relations` (
  `id` bigint NOT NULL,
  `photo_id` int NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `places_category`
--

CREATE TABLE `places_category` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `position` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `places_place`
--

CREATE TABLE `places_place` (
  `id` bigint NOT NULL,
  `category_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `about` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city_id` bigint NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `n_votes` bigint NOT NULL DEFAULT '0',
  `has_images` tinyint NOT NULL DEFAULT '0',
  `n_reviews` bigint NOT NULL DEFAULT '0',
  `reviews_rating` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `places_place_image`
--

CREATE TABLE `places_place_image` (
  `id` bigint NOT NULL,
  `place_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `places_place_vote`
--

CREATE TABLE `places_place_vote` (
  `id` bigint NOT NULL,
  `place_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `places_review`
--

CREATE TABLE `places_review` (
  `id` bigint NOT NULL,
  `place_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `n_votes` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `places_review_vote`
--

CREATE TABLE `places_review_vote` (
  `id` bigint NOT NULL,
  `review_id` bigint NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `posting_info`
--

CREATE TABLE `posting_info` (
  `id` int NOT NULL,
  `page` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `header` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deactive` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `profile_status`
--

CREATE TABLE `profile_status` (
  `user_id` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `saved_user_list`
--

CREATE TABLE `saved_user_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `user_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `event_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` enum('group','event','hotdate','partyhou','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_save`
--

CREATE TABLE `search_save` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `query` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int NOT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `keywords` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sms_auto`
--

CREATE TABLE `sms_auto` (
  `id` int NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `button` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `spotlight`
--

CREATE TABLE `spotlight` (
  `id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `date` date NOT NULL,
  `orientation` smallint UNSIGNED NOT NULL,
  `logins` int UNSIGNED NOT NULL,
  `registrations` int UNSIGNED NOT NULL,
  `mail_messages_sent` int UNSIGNED NOT NULL,
  `postcards_sent` int UNSIGNED NOT NULL,
  `videos_uploaded` int UNSIGNED NOT NULL,
  `videos_viewed` int UNSIGNED NOT NULL,
  `videos_comments` int UNSIGNED NOT NULL,
  `profiles_viewved` int UNSIGNED NOT NULL,
  `3d_city_started` int UNSIGNED NOT NULL,
  `hot_or_not_votes` int UNSIGNED NOT NULL,
  `pics_uploaded` int UNSIGNED NOT NULL,
  `photos_uploaded` int UNSIGNED NOT NULL,
  `added_to_friends` int UNSIGNED NOT NULL,
  `3d_chat_opened` int UNSIGNED NOT NULL,
  `flash_chat_opened` int UNSIGNED NOT NULL,
  `new_blogs` int UNSIGNED NOT NULL,
  `events_created` int UNSIGNED NOT NULL,
  `new_forum_posts` int UNSIGNED NOT NULL,
  `groups_created` int UNSIGNED NOT NULL,
  `winks_sent` int UNSIGNED NOT NULL,
  `gold_memberships` int UNSIGNED NOT NULL,
  `ads_published` int UNSIGNED NOT NULL,
  `replies_to_ads` int UNSIGNED NOT NULL,
  `mp3_uploaded` int UNSIGNED NOT NULL,
  `user_blocks` int UNSIGNED NOT NULL,
  `games_started` int UNSIGNED NOT NULL,
  `im_started` int UNSIGNED NOT NULL,
  `im_messages` int UNSIGNED NOT NULL,
  `added_to_favourites` int UNSIGNED NOT NULL,
  `blog_search_used` int UNSIGNED NOT NULL,
  `user_search_used` int UNSIGNED NOT NULL,
  `gifts_sent` int UNSIGNED NOT NULL,
  `hotdates_created` int UNSIGNED NOT NULL,
  `partyhouz_created` int UNSIGNED NOT NULL,
  `lookinglass_created` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `stats_country`
--

CREATE TABLE `stats_country` (
  `date` date NOT NULL,
  `orientation` smallint UNSIGNED NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `count` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `id` int NOT NULL,
  `sticker` int NOT NULL DEFAULT '0',
  `collection` int NOT NULL DEFAULT '0',
  `type` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `animate` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `stickers_collections`
--

CREATE TABLE `stickers_collections` (
  `id` int NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `stickers_popularity_users`
--

CREATE TABLE `stickers_popularity_users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `collection` int NOT NULL DEFAULT '0',
  `sticker` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `date_send` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `assign_to` int NOT NULL DEFAULT '0',
  `priority` enum('high','medium','low') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'low',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 = close, 1 = open',
  `last_reply` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

CREATE TABLE `texts` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `headline` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `essay` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_me` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `interested_in` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `what_are_you_looking_for` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `msg` text NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `user_read` enum('0','1') NOT NULL DEFAULT '0',
  `support_read` enum('0','1') NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int UNSIGNED NOT NULL,
  `partner` int UNSIGNED NOT NULL DEFAULT '0',
  `gold_days` int UNSIGNED NOT NULL DEFAULT '0',
  `trial_days` int UNSIGNED NOT NULL DEFAULT '0',
  `role` enum('user','admin','demo_admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name_seo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `gender` enum('M','F') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `orientation` int UNSIGNED NOT NULL DEFAULT '0',
  `p_orientation` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `relation` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `couple` enum('Y','N','A') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `couple_id` int NOT NULL DEFAULT '0',
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `change_mail` datetime NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `avatar` int UNSIGNED NOT NULL DEFAULT '0',
  `is_photo` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `is_photo_public` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `record` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `record_id` int NOT NULL DEFAULT '0',
  `country_id` int UNSIGNED NOT NULL DEFAULT '0',
  `state_id` int UNSIGNED NOT NULL DEFAULT '0',
  `city_id` int UNSIGNED NOT NULL DEFAULT '0',
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `zip` int UNSIGNED NOT NULL DEFAULT '0',
  `birth` date NOT NULL,
  `p_age_from` int UNSIGNED NOT NULL DEFAULT '0',
  `p_age_to` int UNSIGNED NOT NULL DEFAULT '0',
  `horoscope` int UNSIGNED NOT NULL DEFAULT '0',
  `p_horoscope` bigint UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `active_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hide_time` int UNSIGNED NOT NULL DEFAULT '0',
  `register` datetime NOT NULL,
  `last_visit` datetime NOT NULL,
  `rating` int UNSIGNED NOT NULL DEFAULT '0',
  `new_mails` int UNSIGNED NOT NULL DEFAULT '0',
  `new_interests` int UNSIGNED NOT NULL DEFAULT '0',
  `new_views` int UNSIGNED NOT NULL DEFAULT '0',
  `total_views` int UNSIGNED NOT NULL DEFAULT '0',
  `last_ip` varchar(39) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `set_email_mail` int UNSIGNED NOT NULL DEFAULT '2',
  `set_email_interest` int UNSIGNED NOT NULL DEFAULT '2',
  `site_access_type` enum('trial','free','payment') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'trial',
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `trial_plan_type` int UNSIGNED NOT NULL DEFAULT '0',
  `city_money` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `forum_n_messages` bigint NOT NULL DEFAULT '0',
  `sound` tinyint(1) NOT NULL DEFAULT '1',
  `blog_visits` int UNSIGNED NOT NULL,
  `blog_comments` int UNSIGNED NOT NULL,
  `blog_posts` int UNSIGNED NOT NULL,
  `vid_visits` int UNSIGNED NOT NULL,
  `vid_comments` int UNSIGNED NOT NULL,
  `vid_videos` int UNSIGNED NOT NULL,
  `vid_videos_pages` int UNSIGNED NOT NULL,
  `vid_videos_groups` int UNSIGNED NOT NULL,
  `moderator_photo` tinyint UNSIGNED NOT NULL,
  `moderator_vids_video` tinyint UNSIGNED NOT NULL,
  `moderator_texts` tinyint UNSIGNED NOT NULL,
  `moderator_profiles` tinyint UNSIGNED NOT NULL,
  `facebook_id` bigint UNSIGNED NOT NULL,
  `google_plus_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `linkedin_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `twitter_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vk_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default_online_view` enum('B','M','F') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'B',
  `albums_to_see` enum('users','friends') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'users',
  `wall_like_comment_alert` tinyint(1) NOT NULL,
  `use_as_online` tinyint(1) NOT NULL,
  `isMobile` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `couple_from` int DEFAULT NULL,
  `couple_to` int DEFAULT NULL,
  `couple_request_time` timestamp NOT NULL DEFAULT '1990-01-01 12:00:00',
  `couple_new` tinyint(1) DEFAULT '0',
  `state_narrow_box` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `match_mail` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smart_profile` tinyint(1) NOT NULL DEFAULT '1',
  `wall_only_post` tinyint(1) NOT NULL DEFAULT '2',
  `review_link` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'info',
  `color_scheme` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ban_mails` tinyint(1) NOT NULL DEFAULT '0',
  `is_online_users_im` tinyint(1) NOT NULL DEFAULT '2',
  `ban_time` datetime NOT NULL,
  `ban_time_release` int NOT NULL DEFAULT '0',
  `i_am_here_to` tinyint NOT NULL DEFAULT '1',
  `profile_bg` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `set_who_view_profile` enum('anyone','members') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'anyone',
  `set_can_comment_photos` enum('anyone','members') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'anyone',
  `set_notif_profile_visitors` tinyint(1) DEFAULT '1',
  `set_notif_gifts` tinyint(1) DEFAULT '1',
  `set_notif_voted_photos` tinyint(1) DEFAULT '1',
  `set_notif_push_notifications` tinyint(1) DEFAULT '1',
  `set_hide_my_presence` tinyint(1) DEFAULT '2',
  `set_do_not_show_me_visitors` tinyint(1) DEFAULT '2',
  `rated_photos` tinyint(1) NOT NULL DEFAULT '0',
  `last_photo_visible_rated` int NOT NULL DEFAULT '0',
  `popularity` int NOT NULL DEFAULT '0',
  `credits` int NOT NULL DEFAULT '0',
  `date_search` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_encounters` timestamp NOT NULL DEFAULT '1990-01-01 12:00:00',
  `sp_sending_messages_per_day` int NOT NULL DEFAULT '0',
  `profile_bg_video` varchar(510) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '{}',
  `set_notif_mutual_attraction` tinyint(1) DEFAULT '1',
  `set_notif_want_to_meet_you` tinyint(1) DEFAULT '1',
  `set_notif_new_msg` tinyint(1) DEFAULT '1',
  `set_notif_new_comments` tinyint(1) DEFAULT '1',
  `ban_global` tinyint(1) NOT NULL DEFAULT '0',
  `password_reminder` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_day` date NOT NULL,
  `payment_hour` int NOT NULL,
  `wall_mode` enum('all','friends') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `translation_off` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `video_greeting` int NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_broadcast` datetime NOT NULL,
  `hide_ads` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `im_reply_new_contact_rate` tinyint UNSIGNED NOT NULL DEFAULT '100',
  `welcoming_message_notify` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `geo_position_lat` decimal(10,6) DEFAULT NULL,
  `geo_position_long` decimal(11,6) DEFAULT NULL,
  `geo_position_age` timestamp NOT NULL DEFAULT '1990-01-01 12:00:00',
  `geo_position_city_id` int NOT NULL DEFAULT '0',
  `geo_position_state_id` int NOT NULL DEFAULT '0',
  `geo_position_country_id` int NOT NULL DEFAULT '0',
  `geo_position_city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `geo_position_state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `geo_position_country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `set_notif_show_my_age` tinyint(1) DEFAULT '1',
  `wall_post_access` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `live_now_id` int NOT NULL DEFAULT '0',
  `live_now_status` int NOT NULL DEFAULT '0',
  `profile_bg_cover` tinyint(1) NOT NULL DEFAULT '0',
  `profile_bg_cover_param` varchar(510) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `lms_user_type` int NOT NULL DEFAULT '0',
  `moderator_events` tinyint UNSIGNED NOT NULL,
  `moderator_hotdates` tinyint UNSIGNED NOT NULL,
  `moderator_partyhouz` tinyint UNSIGNED NOT NULL,
  `moderator_craigs` tinyint UNSIGNED NOT NULL,
  `moderator_wowslider` tinyint UNSIGNED NOT NULL,
  `moderator_users_reports` tinyint UNSIGNED NOT NULL,
  `moderator_support_tickets` tinyint NOT NULL,
  `partner_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nsc_couple_id` int NOT NULL DEFAULT '0',
  `set_nsc_banner_activity` tinyint(1) DEFAULT '1',
  `set_events_banner_activity` tinyint(1) DEFAULT '1',
  `set_partyhouz_banner_activity` tinyint(1) DEFAULT '1',
  `nsc_phone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nsc_join_phone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_my_presence_couples` tinyint(1) NOT NULL DEFAULT '2',
  `set_my_presence_males` tinyint(1) NOT NULL DEFAULT '2',
  `set_my_presence_females` tinyint(1) NOT NULL DEFAULT '2',
  `set_my_presence_transgender` tinyint(1) NOT NULL DEFAULT '2',
  `set_my_presence_nonbinary` tinyint(1) NOT NULL DEFAULT '2',
  `set_my_presence_everyone` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor_couples` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor_males` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor_females` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor_transgender` tinyint(1) NOT NULL DEFAULT '2',
  `set_profile_visitor_nonbinary` tinyint(1) NOT NULL DEFAULT '2',
  `set_album_video_couples` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_video_males` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_video_females` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_video_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_video_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_video_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_couples` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_males` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_females` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `set_photo_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_couples` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_males` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_females` tinyint(1) NOT NULL DEFAULT '1',
  `set_album_transgender` tinyint(1) NOT NULL,
  `set_album_nonbinary` tinyint(1) NOT NULL,
  `set_album_everyone` tinyint(1) NOT NULL DEFAULT '1',
  `set_my_map_couples` tinyint(1) NOT NULL DEFAULT '1',
  `set_my_map_males` tinyint(1) NOT NULL DEFAULT '1',
  `set_my_map_females` tinyint(1) NOT NULL DEFAULT '1',
  `set_my_map_transgender` tinyint(1) NOT NULL DEFAULT '1',
  `set_my_map_nonbinary` tinyint(1) NOT NULL DEFAULT '1',
  `set_show_me_map` tinyint(1) NOT NULL DEFAULT '2',
  `set_show_only_friends_map` tinyint(1) NOT NULL DEFAULT '2',
  `set_friends_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_group_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_male_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_female_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_couple_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_transgender_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_nonbinary_see_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_friends_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_group_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_male_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_female_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_couple_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_transgender_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_nonbinary_post_my_calendar` tinyint(1) NOT NULL DEFAULT '1',
  `set_post_my_calendar_users` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `set_sms_alert` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_mi` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_hd` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_pi` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_pa` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_rm` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_wm` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `set_sms_alert_ehp` enum('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'on',
  `carrier_provider` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `verify_code` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `verify_code_date_time` datetime NOT NULL,
  `is_verified_c_provider` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `isnd_filter` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `login_type` tinyint(1) NOT NULL DEFAULT '0',
  `support_tier` enum('','1','2','3') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `free_access` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `custom_folder` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `user_id` int UNSIGNED NOT NULL,
  `headline` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `essay` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `height` int UNSIGNED NOT NULL DEFAULT '0',
  `weight` int UNSIGNED NOT NULL DEFAULT '0',
  `body` int UNSIGNED NOT NULL DEFAULT '0',
  `drinking` int UNSIGNED NOT NULL DEFAULT '0',
  `ethnicity` int UNSIGNED NOT NULL DEFAULT '0',
  `eye` int UNSIGNED NOT NULL DEFAULT '0',
  `religion` int UNSIGNED NOT NULL DEFAULT '0',
  `family` int UNSIGNED NOT NULL DEFAULT '0',
  `hair` int UNSIGNED NOT NULL DEFAULT '0',
  `income` int UNSIGNED NOT NULL DEFAULT '0',
  `career` int UNSIGNED NOT NULL DEFAULT '0',
  `smoking` int UNSIGNED NOT NULL DEFAULT '0',
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `age_preference` int UNSIGNED NOT NULL DEFAULT '0',
  `appearance` int UNSIGNED NOT NULL DEFAULT '0',
  `first_date` int UNSIGNED NOT NULL DEFAULT '0',
  `humor` int UNSIGNED NOT NULL DEFAULT '0',
  `level_of_faith` int UNSIGNED NOT NULL DEFAULT '0',
  `live_where` int UNSIGNED NOT NULL DEFAULT '0',
  `living_with` int UNSIGNED NOT NULL DEFAULT '0',
  `spending_habits` int UNSIGNED NOT NULL DEFAULT '0',
  `user_editor_xml` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_me` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `interested_in` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `interests` int UNSIGNED NOT NULL DEFAULT '0',
  `sexuality` int NOT NULL,
  `star_sign` int NOT NULL,
  `education` int NOT NULL,
  `user_search_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `state_filter_search` tinyint(1) NOT NULL DEFAULT '0',
  `user_search_filters_mobile` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `your_private_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `blogs_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `videos_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `videos_pages_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `videos_groups_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photos_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photos_pages_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photos_groups_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `groups_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pages_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `live_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `songs_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `songs_pages_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `songs_groups_filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `create_task_user_id` int NOT NULL DEFAULT '0',
  `what_are_you_looking_for` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `can_you_host` int NOT NULL,
  `wall_distance_filter` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `userpartner`
--

CREATE TABLE `userpartner` (
  `user_id` int UNSIGNED NOT NULL,
  `p_height_from` int UNSIGNED NOT NULL DEFAULT '0',
  `p_height_to` int UNSIGNED NOT NULL DEFAULT '0',
  `p_weight_from` int UNSIGNED NOT NULL DEFAULT '0',
  `p_weight_to` int UNSIGNED NOT NULL DEFAULT '0',
  `p_relation` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_body` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_drinking` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_ethnicity` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_eye` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_religion` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_family` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_hair` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_income` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_career` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_smoking` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_status` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_education` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_sexuality` bigint UNSIGNED NOT NULL DEFAULT '0',
  `p_star_sign` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `enemy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nowX` smallint DEFAULT NULL,
  `x0` smallint DEFAULT NULL,
  `ingame` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `time_in` bigint DEFAULT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `angle` smallint DEFAULT NULL,
  `sila` smallint DEFAULT NULL,
  `upal` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `popal` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `zernoX` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_block`
--

CREATE TABLE `users_block` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `comment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_checkbox`
--

CREATE TABLE `users_checkbox` (
  `field` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `value` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `users_comments`
--

CREATE TABLE `users_comments` (
  `id` mediumint NOT NULL,
  `user_id` mediumint NOT NULL DEFAULT '0',
  `from_user_id` mediumint NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_favorite`
--

CREATE TABLE `users_favorite` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `comment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_flash`
--

CREATE TABLE `users_flash` (
  `user_id` int NOT NULL DEFAULT '0' COMMENT 'id of user',
  `backgrounds` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'names upload background'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_interest`
--

CREATE TABLE `users_interest` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `new` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `users_private_note`
--

CREATE TABLE `users_private_note` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `from_user_id` int NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_reports`
--

CREATE TABLE `users_reports` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `priority` enum('high','medium','low','') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'low',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `msg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo_id` int NOT NULL DEFAULT '0',
  `video` tinyint(1) NOT NULL,
  `wall_id` bigint NOT NULL DEFAULT '0',
  `comment_id` bigint NOT NULL DEFAULT '0',
  `comment_type` enum('photo','video','wall','') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `group_id` bigint NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_view`
--

CREATE TABLE `users_view` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `new` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `visited` tinyint(1) NOT NULL DEFAULT '0',
  `ref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `last_email_notification` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_visitors`
--

CREATE TABLE `users_visitors` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `last_visit` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `user_block_list`
--

CREATE TABLE `user_block_list` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `mail` tinyint(1) NOT NULL,
  `im` tinyint(1) NOT NULL DEFAULT '0',
  `audiochat` tinyint(1) NOT NULL DEFAULT '0',
  `videochat` tinyint(1) NOT NULL DEFAULT '0',
  `games` tinyint(1) NOT NULL DEFAULT '0',
  `wall` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `user_certify`
--

CREATE TABLE `user_certify` (
  `id` int NOT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `certify_text` text NOT NULL,
  `is_approved` enum('0','1') NOT NULL DEFAULT '0',
  `submit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user_chart_random_value`
--

CREATE TABLE `user_chart_random_value` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `chart` tinyint(1) NOT NULL DEFAULT '0',
  `value` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `user_gift`
--

CREATE TABLE `user_gift` (
  `id` int NOT NULL,
  `user_from` int NOT NULL DEFAULT '0',
  `user_to` int NOT NULL DEFAULT '0',
  `gift` int NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `gifts_credits` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `interest` int NOT NULL,
  `wall_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `user_new`
--

CREATE TABLE `user_new` (
  `user_id` int UNSIGNED NOT NULL,
  `partner` int UNSIGNED NOT NULL DEFAULT '0',
  `gold_days` int UNSIGNED NOT NULL DEFAULT '0',
  `role` enum('user','admin','demo_admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name_seo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `gender` enum('M','F','C') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `orientation` int UNSIGNED NOT NULL DEFAULT '0',
  `p_orientation` int UNSIGNED NOT NULL DEFAULT '0',
  `relation` int UNSIGNED NOT NULL DEFAULT '0',
  `couple` enum('Y','N','A') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `couple_id` int NOT NULL DEFAULT '0',
  `mail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `change_mail` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `avatar` int UNSIGNED NOT NULL DEFAULT '0',
  `is_photo` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `is_photo_public` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `record` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `record_id` int NOT NULL DEFAULT '0',
  `country_id` int UNSIGNED NOT NULL DEFAULT '0',
  `state_id` int UNSIGNED NOT NULL DEFAULT '0',
  `city_id` int UNSIGNED NOT NULL DEFAULT '0',
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `zip` int UNSIGNED NOT NULL DEFAULT '0',
  `birth` date DEFAULT NULL,
  `p_age_from` int UNSIGNED NOT NULL DEFAULT '0',
  `p_age_to` int UNSIGNED NOT NULL DEFAULT '0',
  `horoscope` int UNSIGNED NOT NULL DEFAULT '0',
  `p_horoscope` bigint UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `active_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `hide_time` int UNSIGNED NOT NULL DEFAULT '0',
  `register` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int UNSIGNED NOT NULL DEFAULT '0',
  `new_mails` int UNSIGNED NOT NULL DEFAULT '0',
  `new_interests` int UNSIGNED NOT NULL DEFAULT '0',
  `new_views` int UNSIGNED NOT NULL DEFAULT '0',
  `total_views` int UNSIGNED NOT NULL DEFAULT '0',
  `last_ip` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `set_email_mail` int UNSIGNED NOT NULL DEFAULT '2',
  `set_email_interest` int UNSIGNED NOT NULL DEFAULT '2',
  `type` enum('none','gold','silver','platinum','platinum_events','membership','credits') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `city_money` mediumint UNSIGNED NOT NULL DEFAULT '0',
  `forum_n_messages` bigint NOT NULL DEFAULT '0',
  `sound` tinyint(1) NOT NULL DEFAULT '1',
  `blog_visits` int UNSIGNED NOT NULL,
  `blog_comments` int UNSIGNED NOT NULL,
  `blog_posts` int UNSIGNED NOT NULL,
  `vid_visits` int UNSIGNED NOT NULL,
  `vid_comments` int UNSIGNED NOT NULL,
  `vid_videos` int UNSIGNED NOT NULL,
  `vid_videos_pages` int UNSIGNED NOT NULL,
  `vid_videos_groups` int UNSIGNED NOT NULL,
  `moderator_photo` tinyint UNSIGNED NOT NULL,
  `moderator_vids_video` tinyint UNSIGNED NOT NULL,
  `moderator_texts` tinyint UNSIGNED NOT NULL,
  `moderator_profiles` tinyint UNSIGNED NOT NULL,
  `facebook_id` bigint UNSIGNED NOT NULL,
  `google_plus_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `linkedin_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `twitter_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vk_id` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default_online_view` enum('B','M','F','C') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'B',
  `albums_to_see` enum('users','friends') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'users',
  `wall_like_comment_alert` tinyint(1) NOT NULL,
  `use_as_online` tinyint(1) NOT NULL,
  `isMobile` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'false',
  `couple_from` int DEFAULT NULL,
  `couple_to` int DEFAULT NULL,
  `state_narrow_box` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `match_mail` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `smart_profile` tinyint(1) NOT NULL DEFAULT '1',
  `wall_only_post` tinyint(1) NOT NULL DEFAULT '2',
  `review_link` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'info',
  `color_scheme` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `ban_mails` tinyint(1) NOT NULL DEFAULT '0',
  `is_online_users_im` tinyint(1) NOT NULL DEFAULT '2',
  `ban_time` datetime NOT NULL,
  `ban_time_release` int NOT NULL DEFAULT '0',
  `i_am_here_to` tinyint NOT NULL DEFAULT '1',
  `profile_bg` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `set_who_view_profile` enum('anyone','members') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'anyone',
  `set_can_comment_photos` enum('anyone','members') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'anyone',
  `set_notif_profile_visitors` tinyint(1) DEFAULT '1',
  `set_notif_gifts` tinyint(1) DEFAULT '1',
  `set_notif_voted_photos` tinyint(1) DEFAULT '1',
  `set_notif_push_notifications` tinyint(1) DEFAULT '1',
  `set_hide_my_presence` tinyint(1) DEFAULT '2',
  `set_do_not_show_me_visitors` tinyint(1) DEFAULT '2',
  `rated_photos` tinyint(1) NOT NULL DEFAULT '0',
  `last_photo_visible_rated` int NOT NULL DEFAULT '0',
  `popularity` int NOT NULL DEFAULT '0',
  `credits` int NOT NULL DEFAULT '0',
  `date_search` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_encounters` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sp_sending_messages_per_day` int NOT NULL DEFAULT '0',
  `profile_bg_video` varchar(910) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '{}',
  `set_notif_mutual_attraction` tinyint(1) DEFAULT '1',
  `set_notif_want_to_meet_you` tinyint(1) DEFAULT '1',
  `set_notif_new_msg` tinyint(1) DEFAULT '1',
  `set_notif_new_comments` tinyint(1) DEFAULT '1',
  `ban_global` tinyint(1) NOT NULL DEFAULT '0',
  `password_reminder` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_day` date NOT NULL,
  `payment_hour` int NOT NULL,
  `wall_mode` enum('all','friends') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `translation_off` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `video_greeting` int NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_broadcast` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hide_ads` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `im_reply_new_contact_rate` tinyint UNSIGNED NOT NULL DEFAULT '100',
  `welcoming_message_notify` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `geo_position_lat` bigint NOT NULL DEFAULT '0',
  `geo_position_long` bigint NOT NULL DEFAULT '0',
  `geo_position_age` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `geo_position_city_id` int NOT NULL DEFAULT '0',
  `geo_position_state_id` int NOT NULL DEFAULT '0',
  `geo_position_country_id` int NOT NULL DEFAULT '0',
  `geo_position_city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `geo_position_state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `geo_position_country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `set_notif_show_my_age` tinyint(1) DEFAULT '1',
  `wall_post_access` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `partner_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nsc_couple_id` int NOT NULL DEFAULT '0',
  `set_nsc_banner_activity` tinyint(1) DEFAULT '1',
  `set_events_banner_activity` tinyint(1) DEFAULT '1',
  `nsc_phone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nsc_join_phone` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_age_preference`
--

CREATE TABLE `var_age_preference` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_appearance`
--

CREATE TABLE `var_appearance` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_body`
--

CREATE TABLE `var_body` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_can_you_host`
--

CREATE TABLE `var_can_you_host` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_career`
--

CREATE TABLE `var_career` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_drinking`
--

CREATE TABLE `var_drinking` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_education`
--

CREATE TABLE `var_education` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_ethnicity`
--

CREATE TABLE `var_ethnicity` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_eye`
--

CREATE TABLE `var_eye` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_family`
--

CREATE TABLE `var_family` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_first_date`
--

CREATE TABLE `var_first_date` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_hair`
--

CREATE TABLE `var_hair` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_height`
--

CREATE TABLE `var_height` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value_cm` int NOT NULL DEFAULT '0',
  `value_f` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_hobbies`
--

CREATE TABLE `var_hobbies` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_humor`
--

CREATE TABLE `var_humor` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_income`
--

CREATE TABLE `var_income` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_language`
--

CREATE TABLE `var_language` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_level_of_faith`
--

CREATE TABLE `var_level_of_faith` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_live_where`
--

CREATE TABLE `var_live_where` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_living_with`
--

CREATE TABLE `var_living_with` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_nickname`
--

CREATE TABLE `var_nickname` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_religion`
--

CREATE TABLE `var_religion` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_sexuality`
--

CREATE TABLE `var_sexuality` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_smoking`
--

CREATE TABLE `var_smoking` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_spending_habits`
--

CREATE TABLE `var_spending_habits` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_star_sign`
--

CREATE TABLE `var_star_sign` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_status`
--

CREATE TABLE `var_status` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `var_weight`
--

CREATE TABLE `var_weight` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `value_kg` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `video_invite`
--

CREATE TABLE `video_invite` (
  `id` int NOT NULL,
  `from_user` int NOT NULL DEFAULT '0',
  `to_user` int NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `city` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `video_reject`
--

CREATE TABLE `video_reject` (
  `id` int NOT NULL,
  `from_user` int NOT NULL DEFAULT '0',
  `to_user` int NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `go` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `city` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `video_rooms`
--

CREATE TABLE `video_rooms` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_mail` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `lock_code` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `is_friends` tinyint(1) NOT NULL DEFAULT '0',
  `is_group` tinyint(1) NOT NULL DEFAULT '0',
  `invited_user_ids` varchar(1024) NOT NULL,
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `cum_couples` tinyint(1) NOT NULL DEFAULT '0',
  `cum_females` tinyint(1) NOT NULL DEFAULT '0',
  `cum_males` tinyint(1) NOT NULL DEFAULT '0',
  `cum_everyone` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_couples` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_females` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_males` tinyint(1) NOT NULL DEFAULT '0',
  `lookin_everyone` tinyint(1) NOT NULL DEFAULT '0',
  `saved_name` varchar(64) NOT NULL,
  `is_saved` tinyint(1) NOT NULL DEFAULT '0',
  `room_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'regular party:1\r\nsingle party:2\r\ncouple party:3\r\nsingle female:4',
  `party_date` varchar(32) NOT NULL COMMENT 'Party date',
  `room_status` tinyint NOT NULL DEFAULT '1' COMMENT 'active:1 online:2 closed:0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vids_category`
--

CREATE TABLE `vids_category` (
  `category_id` bigint NOT NULL,
  `category_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `check` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vids_comment`
--

CREATE TABLE `vids_comment` (
  `id` int UNSIGNED NOT NULL,
  `video_id` int UNSIGNED NOT NULL DEFAULT '0',
  `video_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_like` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint UNSIGNED NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vids_comments_likes`
--

CREATE TABLE `vids_comments_likes` (
  `id` bigint NOT NULL,
  `video_id` int NOT NULL,
  `video_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `cid` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vids_likes`
--

CREATE TABLE `vids_likes` (
  `id` bigint NOT NULL,
  `video_id` int NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `video_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vids_rate`
--

CREATE TABLE `vids_rate` (
  `video_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` mediumint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vids_subscribe`
--

CREATE TABLE `vids_subscribe` (
  `id` int UNSIGNED NOT NULL,
  `subscriber_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `uploader_user_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vids_tags`
--

CREATE TABLE `vids_tags` (
  `id` bigint NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `counter` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `vids_tags_relations`
--

CREATE TABLE `vids_tags_relations` (
  `id` bigint NOT NULL,
  `video_id` int NOT NULL,
  `tag_id` bigint NOT NULL,
  `live_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vids_video`
--

CREATE TABLE `vids_video` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_page` tinyint(1) NOT NULL DEFAULT '0',
  `group_private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `ehp_id` bigint NOT NULL DEFAULT '0',
  `ehp_type` enum('event','hotdate','partyhou','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dt` datetime NOT NULL,
  `count_comments` int UNSIGNED NOT NULL DEFAULT '0',
  `count_comments_replies` int UNSIGNED NOT NULL DEFAULT '0',
  `count_views` int UNSIGNED NOT NULL DEFAULT '0',
  `count_rates` int UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `search_index` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rating` float NOT NULL DEFAULT '0',
  `active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `private` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `cat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_uploaded` tinyint(1) NOT NULL DEFAULT '0',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `hide_header` tinyint(1) NOT NULL DEFAULT '0',
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  `last_action_like` datetime DEFAULT NULL,
  `last_action_comment` datetime DEFAULT NULL,
  `last_action_comment_like` datetime DEFAULT NULL,
  `live_id` int NOT NULL DEFAULT '0',
  `wall_id` bigint NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wall`
--

CREATE TABLE `wall` (
  `id` bigint NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `section` enum('comment','status','friends','pics','pics_comment','photo','photo_comment','photo_default','vids','vids_comment','music','music_photo','music_comment','musician','musician_photo','musician_comment','event_added','event_member','event_comment','event_comment_comment','event_photo','places_review','places_photo','group_join','group_wall','group_wall_comment','group_forum_post','group_forum_post_comment','3dcity','blog_post','blog_comment','forum_thread','forum_post','field_status','share','birthday','interests','group_social_created','hotdate_added','hotdate_member','hotdate_comment','hotdate_comment_comment','hotdate_photo','partyhou_added','partyhou_member','partyhou_comment','partyhou_comment_comment','partyhou_photo','event_edited','hotdate_edited','partyhou_edited','certify_text','create_room','enter_room','looking_glass','event_photo_comment','hotdate_photo_comment','partyhou_photo_comment') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `access` enum('public','friends','private','profile','group') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'public',
  `item_id` int NOT NULL,
  `item_user_id` int NOT NULL,
  `parent_user_id` int NOT NULL,
  `params_section` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `comments` int NOT NULL,
  `comments_item` int NOT NULL,
  `share_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `share_to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `shareable` int NOT NULL,
  `likes` int NOT NULL,
  `likes_media` int NOT NULL,
  `hide_from_user` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `site_section` enum('','blog','event','forum','group','music','musician','pics','photo','places','vids','group_social','hotdate','partyhou') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `site_section_item_id` bigint NOT NULL,
  `last_action_like` datetime NOT NULL,
  `last_action_like_media` datetime NOT NULL,
  `last_action_comment` datetime NOT NULL,
  `last_action_comment_like` datetime NOT NULL,
  `shares_count` int NOT NULL,
  `last_action_shares` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `vids_no_load` tinyint(1) NOT NULL DEFAULT '0',
  `users_reports` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wall_comments`
--

CREATE TABLE `wall_comments` (
  `id` bigint NOT NULL,
  `wall_item_id` bigint NOT NULL,
  `wall_item_user_id` int NOT NULL DEFAULT '0',
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL,
  `date` datetime NOT NULL,
  `send` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` bigint DEFAULT '0',
  `parent_user_id` int DEFAULT '0',
  `replies` int DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `last_action_like` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_new_like` tinyint(1) NOT NULL DEFAULT '0',
  `audio_message_id` bigint UNSIGNED NOT NULL,
  `users_reports_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wall_comments_likes`
--

CREATE TABLE `wall_comments_likes` (
  `id` bigint NOT NULL,
  `wall_item_id` bigint NOT NULL,
  `wall_item_user_id` int NOT NULL,
  `group_id` bigint NOT NULL DEFAULT '0',
  `group_user_id` int NOT NULL DEFAULT '0',
  `user_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `parent_id` bigint DEFAULT '0',
  `comment_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `wall_comments_viewed`
--

CREATE TABLE `wall_comments_viewed` (
  `user_id` int DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `wall_items_for_user`
--

CREATE TABLE `wall_items_for_user` (
  `user_id` int NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `item_id` bigint NOT NULL,
  `section` enum('blog','event','forum','group','music','musician','pics','photo','places','vids','group_social') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `wall_likes`
--

CREATE TABLE `wall_likes` (
  `id` bigint NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `wall_item_id` int NOT NULL,
  `wall_item_user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `wall_stats`
--

CREATE TABLE `wall_stats` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `wall_posts` int NOT NULL DEFAULT '0',
  `shared_posts` int NOT NULL DEFAULT '0',
  `comments` int NOT NULL DEFAULT '0',
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `user_id` int NOT NULL DEFAULT '0',
  `widget` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `x` int NOT NULL DEFAULT '0',
  `y` int NOT NULL DEFAULT '0',
  `z` int NOT NULL DEFAULT '0',
  `settings` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `session` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `session_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wowslider`
--

CREATE TABLE `wowslider` (
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `is_check` tinyint DEFAULT NULL,
  `distance` float NOT NULL,
  `slider_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `state_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wowslider_main`
--

CREATE TABLE `wowslider_main` (
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `is_check` tinyint DEFAULT NULL,
  `distance` float NOT NULL,
  `slider_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `country_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_manager`
--
ALTER TABLE `add_manager`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `admin_replier`
--
ALTER TABLE `admin_replier`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name` (`username`) USING BTREE,
  ADD KEY `password` (`password`) USING BTREE;

--
-- Indexes for table `adv_cars`
--
ALTER TABLE `adv_cars`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_casting`
--
ALTER TABLE `adv_casting`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_cats`
--
ALTER TABLE `adv_cats`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_film`
--
ALTER TABLE `adv_film`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_housting`
--
ALTER TABLE `adv_housting`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_images`
--
ALTER TABLE `adv_images`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `adv_cat_id` (`adv_cat_id`,`adv_id`) USING BTREE;

--
-- Indexes for table `adv_items`
--
ALTER TABLE `adv_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_jobs`
--
ALTER TABLE `adv_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_music`
--
ALTER TABLE `adv_music`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_myspace`
--
ALTER TABLE `adv_myspace`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_personals`
--
ALTER TABLE `adv_personals`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_razd`
--
ALTER TABLE `adv_razd`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_sale`
--
ALTER TABLE `adv_sale`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `adv_services`
--
ALTER TABLE `adv_services`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `app_push_tokens`
--
ALTER TABLE `app_push_tokens`
  ADD UNIQUE KEY `token` (`token`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `last_update` (`last_update`) USING BTREE;

--
-- Indexes for table `audio_greeting`
--
ALTER TABLE `audio_greeting`
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `audio_invite`
--
ALTER TABLE `audio_invite`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `audio_reject`
--
ALTER TABLE `audio_reject`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `aux_embed_vids`
--
ALTER TABLE `aux_embed_vids`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `place` (`place`) USING BTREE,
  ADD KEY `active` (`active`) USING BTREE;
ALTER TABLE `banners` ADD FULLTEXT KEY `templates` (`templates`);
ALTER TABLE `banners` ADD FULLTEXT KEY `langs` (`langs`);

--
-- Indexes for table `banners_places`
--
ALTER TABLE `banners_places`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `place` (`place`) USING BTREE,
  ADD KEY `active` (`active`) USING BTREE;

--
-- Indexes for table `blogs_comment`
--
ALTER TABLE `blogs_comment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `parent_user_id` (`parent_user_id`) USING BTREE,
  ADD KEY `id_parent_id` (`id`,`parent_id`) USING BTREE,
  ADD KEY `blog_id_parent_id` (`post_id`,`parent_id`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `is_new_like` (`is_new_like`) USING BTREE;

--
-- Indexes for table `blogs_comments_likes`
--
ALTER TABLE `blogs_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id_cid` (`user_id`,`cid`,`post_id`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `cid_id` (`cid`,`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE;

--
-- Indexes for table `blogs_hotsearch`
--
ALTER TABLE `blogs_hotsearch`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `count` (`count`) USING BTREE;

--
-- Indexes for table `blogs_post`
--
ALTER TABLE `blogs_post`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `dt` (`dt`) USING BTREE;

--
-- Indexes for table `blogs_post_likes`
--
ALTER TABLE `blogs_post_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`blog_id`) USING BTREE,
  ADD KEY `blog_id_id` (`blog_id`,`id`) USING BTREE;

--
-- Indexes for table `blogs_post_tags`
--
ALTER TABLE `blogs_post_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag` (`tag`) USING BTREE,
  ADD KEY `counter` (`counter`) USING BTREE;

--
-- Indexes for table `blogs_post_tags_relations`
--
ALTER TABLE `blogs_post_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `blog_id` (`blog_id`) USING BTREE,
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `blogs_subscribe`
--
ALTER TABLE `blogs_subscribe`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `chat_chair`
--
ALTER TABLE `chat_chair`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `chat_line`
--
ALTER TABLE `chat_line`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `city_avatar_face`
--
ALTER TABLE `city_avatar_face`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`photo_id`,`user_id`) USING BTREE;

--
-- Indexes for table `city_avatar_face_default`
--
ALTER TABLE `city_avatar_face_default`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city_custom_data`
--
ALTER TABLE `city_custom_data`
  ADD PRIMARY KEY (`data_id`) USING BTREE,
  ADD UNIQUE KEY `type_data` (`location`,`pos_map`,`type`) USING BTREE,
  ADD KEY `location` (`location`) USING BTREE,
  ADD KEY `pos_map` (`pos_map`) USING BTREE;

--
-- Indexes for table `city_invite`
--
ALTER TABLE `city_invite`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city_link`
--
ALTER TABLE `city_link`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `location` (`location`) USING BTREE;

--
-- Indexes for table `city_live_streaming`
--
ALTER TABLE `city_live_streaming`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `city_moving`
--
ALTER TABLE `city_moving`
  ADD PRIMARY KEY (`step`) USING BTREE,
  ADD KEY `id` (`id`,`location`) USING BTREE;

--
-- Indexes for table `city_msg`
--
ALTER TABLE `city_msg`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `to` (`to_user`) USING BTREE,
  ADD KEY `from` (`from_user`) USING BTREE,
  ADD KEY `born` (`born`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `to_user_from_user_from_user_deleted_id` (`to_user`,`from_user`,`from_user_deleted`,`id`) USING BTREE,
  ADD KEY `to_user_from_user_to_user_deleted_id` (`to_user`,`from_user`,`to_user_deleted`,`id`) USING BTREE;

--
-- Indexes for table `city_msg_backup`
--
ALTER TABLE `city_msg_backup`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `to` (`to_user`) USING BTREE,
  ADD KEY `from` (`from_user`) USING BTREE,
  ADD KEY `born` (`born`) USING BTREE;

--
-- Indexes for table `city_open`
--
ALTER TABLE `city_open`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `from` (`from_user`) USING BTREE,
  ADD KEY `to` (`to_user`) USING BTREE,
  ADD KEY `mid` (`mid`) USING BTREE;

--
-- Indexes for table `city_photo`
--
ALTER TABLE `city_photo`
  ADD PRIMARY KEY (`photo_id`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`,`visible`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`,`user_id`) USING BTREE,
  ADD KEY `visible` (`visible`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `wall_id` (`wall_id`) USING BTREE,
  ADD KEY `private` (`private`) USING BTREE,
  ADD KEY `default` (`default`) USING BTREE;

--
-- Indexes for table `city_reject`
--
ALTER TABLE `city_reject`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city_rooms`
--
ALTER TABLE `city_rooms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city_temp`
--
ALTER TABLE `city_temp`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `city_users`
--
ALTER TABLE `city_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `last_visit` (`last_visit`) USING BTREE;

--
-- Indexes for table `city_users_in_rooms`
--
ALTER TABLE `city_users_in_rooms`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `luid` (`cuid`,`location`,`pos_map`,`house`) USING BTREE,
  ADD KEY `cuid` (`cuid`) USING BTREE,
  ADD KEY `location` (`location`) USING BTREE,
  ADD KEY `pos_map` (`pos_map`) USING BTREE,
  ADD KEY `last_visit` (`last_visit`) USING BTREE;

--
-- Indexes for table `club_option`
--
ALTER TABLE `club_option`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `color_scheme`
--
ALTER TABLE `color_scheme`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `col_order`
--
ALTER TABLE `col_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_horoscope`
--
ALTER TABLE `const_horoscope`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_interests`
--
ALTER TABLE `const_interests`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_i_am_here_to`
--
ALTER TABLE `const_i_am_here_to`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_lms_user_type`
--
ALTER TABLE `const_lms_user_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_looking`
--
ALTER TABLE `const_looking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_orientation`
--
ALTER TABLE `const_orientation`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `const_relation`
--
ALTER TABLE `const_relation`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `contact_partner`
--
ALTER TABLE `contact_partner`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `custom_folders`
--
ALTER TABLE `custom_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation_option`
--
ALTER TABLE `donation_option`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `mail` (`mail`) USING BTREE;

--
-- Indexes for table `email_auto`
--
ALTER TABLE `email_auto`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `note_lang` (`note`,`lang`) USING BTREE;

--
-- Indexes for table `email_auto_settings`
--
ALTER TABLE `email_auto_settings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `option` (`option`) USING BTREE;

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `added_at` (`added_at`) USING BTREE;

--
-- Indexes for table `encounters`
--
ALTER TABLE `encounters`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE,
  ADD KEY `new` (`new`) USING BTREE,
  ADD KEY `new_to` (`new_to`) USING BTREE,
  ADD KEY `user_to_from_reply_to_reply_id` (`user_to`,`from_reply`,`to_reply`,`id`) USING BTREE,
  ADD KEY `user_from_id` (`user_from`,`id`) USING BTREE,
  ADD KEY `user_to_id` (`user_to`,`id`) USING BTREE,
  ADD KEY `user_from_from_reply_to_reply_id` (`user_from`,`from_reply`,`to_reply`,`id`) USING BTREE,
  ADD KEY `user_from_from_reply_id` (`user_from`,`from_reply`,`id`) USING BTREE,
  ADD KEY `user_to_to_reply_id` (`user_to`,`to_reply`,`id`) USING BTREE;

--
-- Indexes for table `events_category`
--
ALTER TABLE `events_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `events_event`
--
ALTER TABLE `events_event`
  ADD PRIMARY KEY (`event_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE,
  ADD KEY `event_private` (`event_private`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `event_datetime` (`event_datetime`) USING BTREE,
  ADD KEY `event_n_comments` (`event_n_comments`) USING BTREE,
  ADD KEY `event_n_guests` (`event_n_guests`) USING BTREE,
  ADD KEY `event_has_images` (`event_has_images`) USING BTREE,
  ADD KEY `done_user` (`done_user`) USING BTREE;

--
-- Indexes for table `events_event_comment`
--
ALTER TABLE `events_event_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `event_id` (`event_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `events_event_comment_comment`
--
ALTER TABLE `events_event_comment_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `parent_comment_id` (`parent_comment_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `events_event_guest`
--
ALTER TABLE `events_event_guest`
  ADD PRIMARY KEY (`guest_id`) USING BTREE,
  ADD KEY `event_id` (`event_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `events_event_image`
--
ALTER TABLE `events_event_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `event_id` (`event_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `events_event_image_comments`
--
ALTER TABLE `events_event_image_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_comments_likes`
--
ALTER TABLE `events_event_image_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_face_user_relation`
--
ALTER TABLE `events_event_image_face_user_relation`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_likes`
--
ALTER TABLE `events_event_image_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_rate`
--
ALTER TABLE `events_event_image_rate`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_tags`
--
ALTER TABLE `events_event_image_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_event_image_tags_relations`
--
ALTER TABLE `events_event_image_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events_setting`
--
ALTER TABLE `events_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `flashchat_messages`
--
ALTER TABLE `flashchat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `flashchat_rooms`
--
ALTER TABLE `flashchat_rooms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `flashchat_users`
--
ALTER TABLE `flashchat_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `time_out` (`time_out`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `room_time_out` (`room`,`time_out`) USING BTREE;

--
-- Indexes for table `forum_category`
--
ALTER TABLE `forum_category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sort_rank` (`sort_rank`) USING BTREE;

--
-- Indexes for table `forum_forum`
--
ALTER TABLE `forum_forum`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_id` (`category_id`,`sort_rank`) USING BTREE,
  ADD KEY `parent_forum_id` (`parent_forum_id`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE;

--
-- Indexes for table `forum_message`
--
ALTER TABLE `forum_message`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `topic_id` (`topic_id`) USING BTREE;

--
-- Indexes for table `forum_read_marker`
--
ALTER TABLE `forum_read_marker`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`,`forum_id`,`read_until`) USING BTREE;

--
-- Indexes for table `forum_setting`
--
ALTER TABLE `forum_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `forum_id` (`forum_id`,`user_id`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE;

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `fr_user_id` (`fr_user_id`) USING BTREE;

--
-- Indexes for table `friends_requests`
--
ALTER TABLE `friends_requests`
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`) USING BTREE,
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `featured` (`featured`) USING BTREE,
  ADD KEY `friend_featured` (`friend_featured`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`) USING BTREE,
  ADD KEY `friend_id` (`friend_id`) USING BTREE,
  ADD KEY `accepted_user_id_friend_id` (`accepted`,`user_id`,`friend_id`) USING BTREE,
  ADD KEY `friend_id_accepted` (`friend_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE;

--
-- Indexes for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `folder` (`folder`) USING BTREE;

--
-- Indexes for table `gallery_comments`
--
ALTER TABLE `gallery_comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `imageid` (`imageid`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE;

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `filename` (`filename`,`albumid`) USING BTREE,
  ADD KEY `albumid` (`albumid`) USING BTREE;

--
-- Indexes for table `game_chess`
--
ALTER TABLE `game_chess`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `game_invite`
--
ALTER TABLE `game_invite`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `game_morboy`
--
ALTER TABLE `game_morboy`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `game_reject`
--
ALTER TABLE `game_reject`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `game_shashki`
--
ALTER TABLE `game_shashki`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `geo_city`
--
ALTER TABLE `geo_city`
  ADD PRIMARY KEY (`city_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `state_id` (`state_id`) USING BTREE,
  ADD KEY `lat` (`lat`) USING BTREE,
  ADD KEY `long` (`long`) USING BTREE,
  ADD KEY `hidden` (`hidden`) USING BTREE;

--
-- Indexes for table `geo_country`
--
ALTER TABLE `geo_country`
  ADD PRIMARY KEY (`country_id`) USING BTREE,
  ADD KEY `hidden` (`hidden`) USING BTREE,
  ADD KEY `lat` (`lat`) USING BTREE,
  ADD KEY `long` (`long`) USING BTREE,
  ADD KEY `street_chat_pos_map` (`street_chat_pos_map`) USING BTREE;

--
-- Indexes for table `geo_state`
--
ALTER TABLE `geo_state`
  ADD PRIMARY KEY (`state_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `hidden` (`hidden`) USING BTREE;

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gifts_set`
--
ALTER TABLE `gifts_set`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `glass_video`
--
ALTER TABLE `glass_video`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `hide_header` (`hide_header`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE;

--
-- Indexes for table `groups_category`
--
ALTER TABLE `groups_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `groups_forum`
--
ALTER TABLE `groups_forum`
  ADD PRIMARY KEY (`forum_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `forum_n_comments` (`forum_n_comments`) USING BTREE,
  ADD KEY `forum_n_views` (`forum_n_views`) USING BTREE;

--
-- Indexes for table `groups_forum_comment`
--
ALTER TABLE `groups_forum_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `forum_id` (`forum_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_forum_comment_comment`
--
ALTER TABLE `groups_forum_comment_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `parent_comment_id` (`parent_comment_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_group`
--
ALTER TABLE `groups_group`
  ADD PRIMARY KEY (`group_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `group_private` (`group_private`) USING BTREE,
  ADD KEY `group_n_posts` (`group_n_posts`) USING BTREE,
  ADD KEY `group_n_comments` (`group_n_comments`) USING BTREE,
  ADD KEY `group_n_members` (`group_n_members`) USING BTREE,
  ADD KEY `group_has_images` (`group_has_images`) USING BTREE;

--
-- Indexes for table `groups_group_comment`
--
ALTER TABLE `groups_group_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_group_comment_comment`
--
ALTER TABLE `groups_group_comment_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `parent_comment_id` (`parent_comment_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_group_image`
--
ALTER TABLE `groups_group_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_group_member`
--
ALTER TABLE `groups_group_member`
  ADD PRIMARY KEY (`member_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `groups_invite`
--
ALTER TABLE `groups_invite`
  ADD PRIMARY KEY (`invite_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `invite_key` (`invite_key`) USING BTREE;

--
-- Indexes for table `groups_setting`
--
ALTER TABLE `groups_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `groups_social`
--
ALTER TABLE `groups_social`
  ADD PRIMARY KEY (`group_id`) USING BTREE,
  ADD UNIQUE KEY `name_seo` (`name_seo`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `page` (`page`) USING BTREE,
  ADD KEY `private` (`private`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `count_posts` (`count_posts`) USING BTREE,
  ADD KEY `count_comments` (`count_comments`) USING BTREE,
  ADD KEY `count_members` (`count_members`) USING BTREE,
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `state_id` (`state_id`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `ban_global` (`ban_global`) USING BTREE;

--
-- Indexes for table `groups_social_subscribers`
--
ALTER TABLE `groups_social_subscribers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`) USING BTREE,
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `accepted_user_id_group_id` (`accepted`,`user_id`,`group_id`) USING BTREE,
  ADD KEY `group_id_accepted` (`group_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `group_private` (`group_private`) USING BTREE;

--
-- Indexes for table `groups_social_tags`
--
ALTER TABLE `groups_social_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag` (`tag`) USING BTREE,
  ADD KEY `counter` (`counter`) USING BTREE;

--
-- Indexes for table `groups_social_tags_relations`
--
ALTER TABLE `groups_social_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `groups_user_block_list`
--
ALTER TABLE `groups_user_block_list`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `group_id` (`group_id`,`user_id`) USING BTREE,
  ADD KEY `user_id_group_id` (`group_id`,`group_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `group_party`
--
ALTER TABLE `group_party`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `help_answer`
--
ALTER TABLE `help_answer`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `topic_id` (`topic_id`) USING BTREE;

--
-- Indexes for table `help_topic`
--
ALTER TABLE `help_topic`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_category`
--
ALTER TABLE `hotdates_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate`
--
ALTER TABLE `hotdates_hotdate`
  ADD PRIMARY KEY (`hotdate_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `hotdate_private` (`hotdate_private`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `hotdate_datetime` (`hotdate_datetime`) USING BTREE,
  ADD KEY `hotdate_n_comments` (`hotdate_n_comments`) USING BTREE,
  ADD KEY `hotdate_n_guests` (`hotdate_n_guests`) USING BTREE,
  ADD KEY `hotdate_has_images` (`hotdate_has_images`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_comment`
--
ALTER TABLE `hotdates_hotdate_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `hotdate_id` (`hotdate_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_comment_comment`
--
ALTER TABLE `hotdates_hotdate_comment_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `parent_comment_id` (`parent_comment_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_guest`
--
ALTER TABLE `hotdates_hotdate_guest`
  ADD PRIMARY KEY (`guest_id`) USING BTREE,
  ADD KEY `hotdate_id` (`hotdate_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image`
--
ALTER TABLE `hotdates_hotdate_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `hotdate_id` (`hotdate_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_comments`
--
ALTER TABLE `hotdates_hotdate_image_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_comments_likes`
--
ALTER TABLE `hotdates_hotdate_image_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_face_user_relation`
--
ALTER TABLE `hotdates_hotdate_image_face_user_relation`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_likes`
--
ALTER TABLE `hotdates_hotdate_image_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_rate`
--
ALTER TABLE `hotdates_hotdate_image_rate`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_tags`
--
ALTER TABLE `hotdates_hotdate_image_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_hotdate_image_tags_relations`
--
ALTER TABLE `hotdates_hotdate_image_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hotdates_setting`
--
ALTER TABLE `hotdates_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `im_audio_message`
--
ALTER TABLE `im_audio_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `im_contact_replied`
--
ALTER TABLE `im_contact_replied`
  ADD UNIQUE KEY `user_id` (`user_id`,`user_to`) USING BTREE,
  ADD KEY `user_id_replied` (`user_id`,`replied`) USING BTREE;

--
-- Indexes for table `im_msg`
--
ALTER TABLE `im_msg`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `to` (`to_user`) USING BTREE,
  ADD KEY `to_group` (`to_group_id`) USING BTREE,
  ADD KEY `from` (`from_user`) USING BTREE,
  ADD KEY `from_group` (`from_group_id`) USING BTREE,
  ADD KEY `born` (`born`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `to_user_from_user_from_user_deleted_id` (`to_user`,`from_user`,`from_user_deleted`,`id`) USING BTREE,
  ADD KEY `to_user_from_user_to_user_deleted_id` (`to_user`,`from_user`,`to_user_deleted`,`id`) USING BTREE,
  ADD KEY `to_user_to_user_deleted_from_user_is_new` (`to_user`,`to_user_deleted`,`from_user`,`is_new`) USING BTREE,
  ADD KEY `from_user_to_user_is_new` (`from_user`,`to_user`,`is_new`) USING BTREE,
  ADD KEY `is_new_to_user_to_user_deleted_id` (`is_new`,`to_user`,`to_user_deleted`,`id`) USING BTREE;

--
-- Indexes for table `im_open`
--
ALTER TABLE `im_open`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `from` (`from_user`,`from_group_id`,`to_user`,`to_group_id`) USING BTREE,
  ADD KEY `to` (`to_user`) USING BTREE,
  ADD KEY `mid` (`mid`) USING BTREE,
  ADD KEY `from_user_z` (`from_user`,`z`) USING BTREE,
  ADD KEY `from_user_is_new_msg_z_mid` (`from_user`,`is_new_msg`,`z`,`mid`) USING BTREE;

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD UNIQUE KEY `page` (`page`,`lang`) USING BTREE;

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `category` (`category`) USING BTREE,
  ADD KEY `interest` (`interest`) USING BTREE,
  ADD KEY `counter` (`counter`) USING BTREE;

--
-- Indexes for table `invited_folder`
--
ALTER TABLE `invited_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `featured` (`featured`) USING BTREE,
  ADD KEY `friend_featured` (`friend_featured`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`) USING BTREE,
  ADD KEY `friend_id` (`friend_id`) USING BTREE,
  ADD KEY `accepted_user_id_friend_id` (`accepted`,`user_id`,`friend_id`) USING BTREE,
  ADD KEY `friend_id_accepted` (`friend_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE,
  ADD KEY `user_id` (`user_id`,`friend_id`) USING BTREE;

--
-- Indexes for table `invited_personal`
--
ALTER TABLE `invited_personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`) USING BTREE,
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `featured` (`featured`) USING BTREE,
  ADD KEY `friend_featured` (`friend_featured`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`) USING BTREE,
  ADD KEY `friend_id` (`friend_id`) USING BTREE,
  ADD KEY `accepted_user_id_friend_id` (`accepted`,`user_id`,`friend_id`) USING BTREE,
  ADD KEY `friend_id_accepted` (`friend_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE;

--
-- Indexes for table `invited_private`
--
ALTER TABLE `invited_private`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`) USING BTREE,
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `featured` (`featured`) USING BTREE,
  ADD KEY `friend_featured` (`friend_featured`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`) USING BTREE,
  ADD KEY `friend_id` (`friend_id`) USING BTREE,
  ADD KEY `accepted_user_id_friend_id` (`accepted`,`user_id`,`friend_id`) USING BTREE,
  ADD KEY `friend_id_accepted` (`friend_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE;

--
-- Indexes for table `invited_private_vids`
--
ALTER TABLE `invited_private_vids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`) USING BTREE,
  ADD KEY `accepted` (`accepted`) USING BTREE,
  ADD KEY `featured` (`featured`) USING BTREE,
  ADD KEY `friend_featured` (`friend_featured`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`) USING BTREE,
  ADD KEY `friend_id` (`friend_id`) USING BTREE,
  ADD KEY `accepted_user_id_friend_id` (`accepted`,`user_id`,`friend_id`) USING BTREE,
  ADD KEY `friend_id_accepted` (`friend_id`,`accepted`) USING BTREE,
  ADD KEY `user_id_accepted` (`user_id`,`accepted`) USING BTREE;

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ip_block`
--
ALTER TABLE `ip_block`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ip` (`ip`) USING BTREE;

--
-- Indexes for table `live_streaming`
--
ALTER TABLE `live_streaming`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `live_streaming_viewers`
--
ALTER TABLE `live_streaming_viewers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `live_data` (`live_id`,`user_id`) USING BTREE,
  ADD KEY `live_id` (`live_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `looking_level`
--
ALTER TABLE `looking_level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mail_folder`
--
ALTER TABLE `mail_folder`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `mail_msg`
--
ALTER TABLE `mail_msg`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `from_user` (`user_from`) USING BTREE,
  ADD KEY `to_user` (`user_to`) USING BTREE;

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `massmail`
--
ALTER TABLE `massmail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `masssms`
--
ALTER TABLE `masssms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `meta_link_info`
--
ALTER TABLE `meta_link_info`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `url` (`url`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_category`
--
ALTER TABLE `music_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `music_musician`
--
ALTER TABLE `music_musician`
  ADD PRIMARY KEY (`musician_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `musician_rating` (`musician_rating`) USING BTREE,
  ADD KEY `musician_has_images` (`musician_has_images`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_musician_comment`
--
ALTER TABLE `music_musician_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `musician_id` (`musician_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_musician_image`
--
ALTER TABLE `music_musician_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `musician_id` (`musician_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_musician_vote`
--
ALTER TABLE `music_musician_vote`
  ADD PRIMARY KEY (`vote_id`) USING BTREE,
  ADD KEY `musician_id` (`musician_id`) USING BTREE;

--
-- Indexes for table `music_setting`
--
ALTER TABLE `music_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `music_song`
--
ALTER TABLE `music_song`
  ADD PRIMARY KEY (`song_id`) USING BTREE,
  ADD KEY `musician_id` (`musician_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `rating` (`song_rating`) USING BTREE,
  ADD KEY `has_images` (`song_has_images`) USING BTREE,
  ADD KEY `n_comments` (`song_n_comments`) USING BTREE,
  ADD KEY `n_plays` (`song_n_plays`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_song_comment`
--
ALTER TABLE `music_song_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `song_id` (`song_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_song_image`
--
ALTER TABLE `music_song_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `song_id` (`song_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `music_song_vote`
--
ALTER TABLE `music_song_vote`
  ADD PRIMARY KEY (`vote_id`) USING BTREE,
  ADD KEY `song_id` (`song_id`) USING BTREE;

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cat` (`cat`) USING BTREE;

--
-- Indexes for table `news_cats`
--
ALTER TABLE `news_cats`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `object_type`
--
ALTER TABLE `object_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `outside_image`
--
ALTER TABLE `outside_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `outside_url` (`outside_url`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `menu_title` (`menu_title`) USING BTREE,
  ADD KEY `lang` (`lang`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `section` (`section`) USING BTREE,
  ADD KEY `lang_2` (`lang`) USING BTREE,
  ADD KEY `position` (`position`) USING BTREE;

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`partner_id`) USING BTREE;

--
-- Indexes for table `partner_banners`
--
ALTER TABLE `partner_banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partner_faq`
--
ALTER TABLE `partner_faq`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partner_main`
--
ALTER TABLE `partner_main`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partner_terms`
--
ALTER TABLE `partner_terms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partner_tips`
--
ALTER TABLE `partner_tips`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_category`
--
ALTER TABLE `partyhouz_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `partyhouz_open`
--
ALTER TABLE `partyhouz_open`
  ADD PRIMARY KEY (`open_partyhouz_id`);

--
-- Indexes for table `partyhouz_partyhou`
--
ALTER TABLE `partyhouz_partyhou`
  ADD PRIMARY KEY (`partyhou_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `partyhou_datetime` (`partyhou_datetime`) USING BTREE,
  ADD KEY `partyhou_n_comments` (`partyhou_n_comments`) USING BTREE,
  ADD KEY `partyhou_n_guests` (`partyhou_n_guests`) USING BTREE,
  ADD KEY `partyhou_has_images` (`partyhou_has_images`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_comment`
--
ALTER TABLE `partyhouz_partyhou_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `partyhou_id` (`partyhou_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_comment_comment`
--
ALTER TABLE `partyhouz_partyhou_comment_comment`
  ADD PRIMARY KEY (`comment_id`) USING BTREE,
  ADD KEY `parent_comment_id` (`parent_comment_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_guest`
--
ALTER TABLE `partyhouz_partyhou_guest`
  ADD PRIMARY KEY (`guest_id`) USING BTREE,
  ADD KEY `partyhou_id` (`partyhou_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image`
--
ALTER TABLE `partyhouz_partyhou_image`
  ADD PRIMARY KEY (`image_id`) USING BTREE,
  ADD KEY `partyhou_id` (`partyhou_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_comments`
--
ALTER TABLE `partyhouz_partyhou_image_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_comments_likes`
--
ALTER TABLE `partyhouz_partyhou_image_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_face_user_relation`
--
ALTER TABLE `partyhouz_partyhou_image_face_user_relation`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_likes`
--
ALTER TABLE `partyhouz_partyhou_image_likes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_rate`
--
ALTER TABLE `partyhouz_partyhou_image_rate`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_tags`
--
ALTER TABLE `partyhouz_partyhou_image_tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_image_tags_relations`
--
ALTER TABLE `partyhouz_partyhou_image_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_partyhou_invites`
--
ALTER TABLE `partyhouz_partyhou_invites`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `partyhouz_setting`
--
ALTER TABLE `partyhouz_setting`
  ADD PRIMARY KEY (`setting_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `payment_after`
--
ALTER TABLE `payment_after`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_before`
--
ALTER TABLE `payment_before`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `code` (`code`) USING BTREE,
  ADD KEY `system` (`system`) USING BTREE,
  ADD KEY `subscription_id` (`subscription_id`) USING BTREE;

--
-- Indexes for table `payment_cat`
--
ALTER TABLE `payment_cat`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_features`
--
ALTER TABLE `payment_features`
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `alias` (`alias`) USING BTREE;

--
-- Indexes for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_plan`
--
ALTER TABLE `payment_plan`
  ADD PRIMARY KEY (`item`) USING BTREE;

--
-- Indexes for table `payment_price`
--
ALTER TABLE `payment_price`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`type`,`code`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `code` (`code`) USING BTREE;

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`) USING BTREE,
  ADD KEY `user_id_2` (`user_id`,`visible`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`,`user_id`) USING BTREE,
  ADD KEY `visible` (`visible`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `wall_id` (`wall_id`) USING BTREE,
  ADD KEY `private` (`private`) USING BTREE,
  ADD KEY `default` (`default`) USING BTREE,
  ADD KEY `default_group` (`default_group`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `hide_header` (`hide_header`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE;

--
-- Indexes for table `photo_comments`
--
ALTER TABLE `photo_comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `parent_user_id` (`parent_user_id`) USING BTREE,
  ADD KEY `id_parent_id` (`id`,`parent_id`) USING BTREE,
  ADD KEY `photo_id_parent_id` (`photo_id`,`parent_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `photo_user_id_parent_user_id_user_id` (`photo_user_id`,`parent_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `photo_comments_likes`
--
ALTER TABLE `photo_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id_cid` (`user_id`,`cid`,`photo_id`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `cid_id` (`cid`,`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `comment_user_id_user_id` (`comment_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `photo_face_user_relation`
--
ALTER TABLE `photo_face_user_relation`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_relation` (`photo_id`,`user_id`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`,`user_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `new` (`is_new`) USING BTREE;

--
-- Indexes for table `photo_likes`
--
ALTER TABLE `photo_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`photo_id`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`,`id`) USING BTREE,
  ADD KEY `photo_user_id_user_id` (`photo_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `photo_rate`
--
ALTER TABLE `photo_rate`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`) USING BTREE,
  ADD KEY `photo_user_id` (`photo_user_id`,`visible`,`is_new`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `photo_tags`
--
ALTER TABLE `photo_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag` (`tag`) USING BTREE,
  ADD KEY `counter` (`counter`) USING BTREE;

--
-- Indexes for table `photo_tags_relations`
--
ALTER TABLE `photo_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `photo_id` (`photo_id`) USING BTREE,
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `places_category`
--
ALTER TABLE `places_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `places_place`
--
ALTER TABLE `places_place`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `rating` (`rating`) USING BTREE,
  ADD KEY `has_images` (`has_images`) USING BTREE,
  ADD KEY `n_reviews` (`n_reviews`) USING BTREE,
  ADD KEY `reviews_rating` (`reviews_rating`) USING BTREE;

--
-- Indexes for table `places_place_image`
--
ALTER TABLE `places_place_image`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `place_id` (`place_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `places_place_vote`
--
ALTER TABLE `places_place_vote`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `place_id` (`place_id`) USING BTREE;

--
-- Indexes for table `places_review`
--
ALTER TABLE `places_review`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `place_id` (`place_id`,`user_id`) USING BTREE;

--
-- Indexes for table `places_review_vote`
--
ALTER TABLE `places_review_vote`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `review_id` (`review_id`) USING BTREE;

--
-- Indexes for table `posting_info`
--
ALTER TABLE `posting_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `profile_status`
--
ALTER TABLE `profile_status`
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `saved_user_list`
--
ALTER TABLE `saved_user_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_save`
--
ALTER TABLE `search_save`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lang` (`lang`,`default`) USING BTREE;
ALTER TABLE `seo` ADD FULLTEXT KEY `url` (`url`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `mail` (`user_id`) USING BTREE;

--
-- Indexes for table `sms_auto`
--
ALTER TABLE `sms_auto`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `note_lang` (`note`,`lang`) USING BTREE;

--
-- Indexes for table `spotlight`
--
ALTER TABLE `spotlight`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`date`,`orientation`) USING BTREE;

--
-- Indexes for table `stats_country`
--
ALTER TABLE `stats_country`
  ADD PRIMARY KEY (`date`,`orientation`,`country_id`) USING BTREE;

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `sticker_collection` (`sticker`,`collection`) USING BTREE;

--
-- Indexes for table `stickers_collections`
--
ALTER TABLE `stickers_collections`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stickers_popularity_users`
--
ALTER TABLE `stickers_popularity_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `sticker_user_id` (`user_id`,`sticker`,`collection`) USING BTREE;

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `from_user` (`user_from`) USING BTREE,
  ADD KEY `to_user` (`assign_to`) USING BTREE;

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD UNIQUE KEY `mail` (`mail`) USING BTREE,
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `state_id` (`state_id`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE,
  ADD KEY `hide_time` (`hide_time`) USING BTREE,
  ADD KEY `register` (`register`) USING BTREE,
  ADD KEY `orientation` (`orientation`) USING BTREE,
  ADD KEY `orientation_2` (`orientation`,`last_visit`) USING BTREE,
  ADD KEY `is_photo` (`is_photo`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `orientation_3` (`orientation`,`city_id`,`register`) USING BTREE,
  ADD KEY `city_id_2` (`city_id`,`register`) USING BTREE,
  ADD KEY `is_photo_2` (`is_photo`,`register`) USING BTREE,
  ADD KEY `blog_fields` (`blog_visits`,`blog_comments`,`blog_posts`) USING BTREE,
  ADD KEY `last_visit` (`last_visit`) USING BTREE,
  ADD KEY `popularity` (`popularity`) USING BTREE,
  ADD KEY `date_search` (`date_search`) USING BTREE,
  ADD KEY `date_encounters` (`date_encounters`) USING BTREE,
  ADD KEY `i_am_here_to` (`i_am_here_to`) USING BTREE,
  ADD KEY `ban_global` (`ban_global`) USING BTREE,
  ADD KEY `gold_days` (`gold_days`) USING BTREE,
  ADD KEY `payment_day` (`payment_day`) USING BTREE,
  ADD KEY `payment_hour` (`payment_hour`) USING BTREE,
  ADD KEY `facebook_id` (`facebook_id`) USING BTREE,
  ADD KEY `google_plus_id` (`google_plus_id`) USING BTREE,
  ADD KEY `twitter_id` (`twitter_id`) USING BTREE,
  ADD KEY `linkedin_id` (`linkedin_id`) USING BTREE,
  ADD KEY `vk_id` (`vk_id`) USING BTREE,
  ADD KEY `name_seo` (`name_seo`) USING BTREE,
  ADD KEY `hide_time_2` (`hide_time`,`user_id`,`last_visit`) USING BTREE,
  ADD KEY `city_id_popularity` (`city_id`,`popularity`) USING BTREE,
  ADD KEY `birth` (`birth`) USING BTREE,
  ADD KEY `is_photo_date_search_user_id` (`is_photo`,`date_search`,`user_id`) USING BTREE,
  ADD KEY `is_photo_date_encounters_user_id` (`is_photo`,`date_encounters`,`user_id`) USING BTREE,
  ADD KEY `is_photo_user_id` (`is_photo`,`user_id`) USING BTREE,
  ADD KEY `hide_time_use_as_online` (`hide_time`,`use_as_online`) USING BTREE,
  ADD KEY `active_code` (`active_code`) USING BTREE,
  ADD KEY `country_id_set_hide_my_presence` (`country_id`,`set_hide_my_presence`) USING BTREE,
  ADD KEY `geo_position_lat` (`geo_position_lat`) USING BTREE,
  ADD KEY `geo_position_long` (`geo_position_long`) USING BTREE,
  ADD KEY `geo_position_point` (`geo_position_lat`,`geo_position_long`) USING BTREE;

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `userpartner`
--
ALTER TABLE `userpartner`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_block`
--
ALTER TABLE `users_block`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE;

--
-- Indexes for table `users_checkbox`
--
ALTER TABLE `users_checkbox`
  ADD UNIQUE KEY `field_user_id_value` (`field`,`user_id`,`value`) USING BTREE,
  ADD KEY `field` (`field`,`value`) USING BTREE;

--
-- Indexes for table `users_comments`
--
ALTER TABLE `users_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_favorite`
--
ALTER TABLE `users_favorite`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE;

--
-- Indexes for table `users_flash`
--
ALTER TABLE `users_flash`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `users_interest`
--
ALTER TABLE `users_interest`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE,
  ADD KEY `user_to_id` (`user_to`,`id`) USING BTREE;

--
-- Indexes for table `users_private_note`
--
ALTER TABLE `users_private_note`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_reports`
--
ALTER TABLE `users_reports`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `from_user` (`user_from`) USING BTREE,
  ADD KEY `to_user` (`user_to`) USING BTREE;

--
-- Indexes for table `users_view`
--
ALTER TABLE `users_view`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE,
  ADD KEY `user_to_id` (`user_to`,`id`) USING BTREE,
  ADD KEY `user_from_user_to` (`user_from`,`user_to`) USING BTREE,
  ADD KEY `user_from_id` (`user_from`,`id`) USING BTREE;

--
-- Indexes for table `users_visitors`
--
ALTER TABLE `users_visitors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE;

--
-- Indexes for table `user_block_list`
--
ALTER TABLE `user_block_list`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`,`user_to`) USING BTREE,
  ADD KEY `user_from_2` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE;

--
-- Indexes for table `user_certify`
--
ALTER TABLE `user_certify`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_chart_random_value`
--
ALTER TABLE `user_chart_random_value`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_from` (`user_from`) USING BTREE,
  ADD KEY `user_to` (`user_to`) USING BTREE,
  ADD KEY `chart` (`chart`) USING BTREE;

--
-- Indexes for table `user_gift`
--
ALTER TABLE `user_gift`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `from_user` (`user_from`) USING BTREE,
  ADD KEY `to_user` (`user_to`) USING BTREE;

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `interest` (`interest`) USING BTREE,
  ADD KEY `wall_id` (`wall_id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `var_age_preference`
--
ALTER TABLE `var_age_preference`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_appearance`
--
ALTER TABLE `var_appearance`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_body`
--
ALTER TABLE `var_body`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_can_you_host`
--
ALTER TABLE `var_can_you_host`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_career`
--
ALTER TABLE `var_career`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_drinking`
--
ALTER TABLE `var_drinking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_education`
--
ALTER TABLE `var_education`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_ethnicity`
--
ALTER TABLE `var_ethnicity`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_eye`
--
ALTER TABLE `var_eye`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_family`
--
ALTER TABLE `var_family`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_first_date`
--
ALTER TABLE `var_first_date`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_hair`
--
ALTER TABLE `var_hair`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_height`
--
ALTER TABLE `var_height`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_hobbies`
--
ALTER TABLE `var_hobbies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_humor`
--
ALTER TABLE `var_humor`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_income`
--
ALTER TABLE `var_income`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_language`
--
ALTER TABLE `var_language`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_level_of_faith`
--
ALTER TABLE `var_level_of_faith`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_live_where`
--
ALTER TABLE `var_live_where`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_living_with`
--
ALTER TABLE `var_living_with`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_nickname`
--
ALTER TABLE `var_nickname`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_religion`
--
ALTER TABLE `var_religion`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_sexuality`
--
ALTER TABLE `var_sexuality`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_smoking`
--
ALTER TABLE `var_smoking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_spending_habits`
--
ALTER TABLE `var_spending_habits`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_star_sign`
--
ALTER TABLE `var_star_sign`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_status`
--
ALTER TABLE `var_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `var_weight`
--
ALTER TABLE `var_weight`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `video_invite`
--
ALTER TABLE `video_invite`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `video_reject`
--
ALTER TABLE `video_reject`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `video_rooms`
--
ALTER TABLE `video_rooms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `vids_category`
--
ALTER TABLE `vids_category`
  ADD PRIMARY KEY (`category_id`) USING BTREE;

--
-- Indexes for table `vids_comment`
--
ALTER TABLE `vids_comment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `dt` (`dt`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `parent_user_id` (`parent_user_id`) USING BTREE,
  ADD KEY `video_id_parent_id` (`video_id`,`parent_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `is_new_like` (`is_new_like`) USING BTREE;

--
-- Indexes for table `vids_comments_likes`
--
ALTER TABLE `vids_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id_cid` (`user_id`,`cid`,`video_id`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `cid_id` (`cid`,`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `comment_user_id_user_id` (`comment_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `vids_likes`
--
ALTER TABLE `vids_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`video_id`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `video_id` (`video_id`,`id`) USING BTREE,
  ADD KEY `video_user_id` (`video_user_id`) USING BTREE;

--
-- Indexes for table `vids_rate`
--
ALTER TABLE `vids_rate`
  ADD PRIMARY KEY (`video_id`,`user_id`) USING BTREE;

--
-- Indexes for table `vids_subscribe`
--
ALTER TABLE `vids_subscribe`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `vids_tags`
--
ALTER TABLE `vids_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag` (`tag`) USING BTREE,
  ADD KEY `counter` (`counter`) USING BTREE;

--
-- Indexes for table `vids_tags_relations`
--
ALTER TABLE `vids_tags_relations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `video_id` (`video_id`) USING BTREE,
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `vids_video`
--
ALTER TABLE `vids_video`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `hide_header` (`hide_header`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `live_id` (`live_id`) USING BTREE;

--
-- Indexes for table `wall`
--
ALTER TABLE `wall`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `section_item_id` (`section`,`item_id`) USING BTREE,
  ADD KEY `section` (`section`) USING BTREE,
  ADD KEY `item_id_section` (`item_id`,`section`) USING BTREE,
  ADD KEY `id_section` (`id`,`section`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `access` (`access`) USING BTREE,
  ADD KEY `comment_user_id` (`comment_user_id`) USING BTREE,
  ADD KEY `item_id` (`item_id`) USING BTREE;

--
-- Indexes for table `wall_comments`
--
ALTER TABLE `wall_comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `parent_user_id` (`parent_user_id`) USING BTREE,
  ADD KEY `id_parent_id` (`id`,`parent_id`) USING BTREE,
  ADD KEY `wall_item_id_user_id_id` (`wall_item_id`,`user_id`,`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `wall_item_user_id` (`wall_item_user_id`) USING BTREE;

--
-- Indexes for table `wall_comments_likes`
--
ALTER TABLE `wall_comments_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id_cid` (`user_id`,`cid`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `cid_id` (`cid`,`id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `group_user_id` (`group_user_id`) USING BTREE,
  ADD KEY `comment_user_id_user_id` (`comment_user_id`,`user_id`) USING BTREE,
  ADD KEY `user_id_wall_item_id_cid` (`user_id`,`wall_item_id`,`cid`) USING BTREE;

--
-- Indexes for table `wall_comments_viewed`
--
ALTER TABLE `wall_comments_viewed`
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `user_id_item_id_id` (`user_id`,`item_id`,`id`) USING BTREE;

--
-- Indexes for table `wall_items_for_user`
--
ALTER TABLE `wall_items_for_user`
  ADD UNIQUE KEY `user_id` (`user_id`,`item_id`,`section`) USING BTREE,
  ADD KEY `item_id` (`item_id`,`section`) USING BTREE;

--
-- Indexes for table `wall_likes`
--
ALTER TABLE `wall_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`,`wall_item_id`) USING BTREE,
  ADD KEY `wall_item_id_id` (`wall_item_id`,`id`) USING BTREE,
  ADD KEY `is_new` (`is_new`) USING BTREE,
  ADD KEY `wall_item_user_id_user_id` (`wall_item_user_id`,`user_id`) USING BTREE;

--
-- Indexes for table `wall_stats`
--
ALTER TABLE `wall_stats`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wowslider`
--
ALTER TABLE `wowslider`
  ADD PRIMARY KEY (`event_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE;

--
-- Indexes for table `wowslider_main`
--
ALTER TABLE `wowslider_main`
  ADD PRIMARY KEY (`event_id`,`distance`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `city_id` (`city_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_manager`
--
ALTER TABLE `add_manager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_replier`
--
ALTER TABLE `admin_replier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_cars`
--
ALTER TABLE `adv_cars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_casting`
--
ALTER TABLE `adv_casting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_cats`
--
ALTER TABLE `adv_cats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_film`
--
ALTER TABLE `adv_film`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_housting`
--
ALTER TABLE `adv_housting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_images`
--
ALTER TABLE `adv_images`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_items`
--
ALTER TABLE `adv_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_jobs`
--
ALTER TABLE `adv_jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_music`
--
ALTER TABLE `adv_music`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_myspace`
--
ALTER TABLE `adv_myspace`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_personals`
--
ALTER TABLE `adv_personals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_razd`
--
ALTER TABLE `adv_razd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_sale`
--
ALTER TABLE `adv_sale`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adv_services`
--
ALTER TABLE `adv_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audio_invite`
--
ALTER TABLE `audio_invite`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audio_reject`
--
ALTER TABLE `audio_reject`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners_places`
--
ALTER TABLE `banners_places`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_comment`
--
ALTER TABLE `blogs_comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_comments_likes`
--
ALTER TABLE `blogs_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_hotsearch`
--
ALTER TABLE `blogs_hotsearch`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_post`
--
ALTER TABLE `blogs_post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_post_likes`
--
ALTER TABLE `blogs_post_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_post_tags`
--
ALTER TABLE `blogs_post_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_post_tags_relations`
--
ALTER TABLE `blogs_post_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_subscribe`
--
ALTER TABLE `blogs_subscribe`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_chair`
--
ALTER TABLE `chat_chair`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_line`
--
ALTER TABLE `chat_line`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_avatar_face`
--
ALTER TABLE `city_avatar_face`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_avatar_face_default`
--
ALTER TABLE `city_avatar_face_default`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_custom_data`
--
ALTER TABLE `city_custom_data`
  MODIFY `data_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_invite`
--
ALTER TABLE `city_invite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_link`
--
ALTER TABLE `city_link`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_live_streaming`
--
ALTER TABLE `city_live_streaming`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_moving`
--
ALTER TABLE `city_moving`
  MODIFY `step` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_msg`
--
ALTER TABLE `city_msg`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_msg_backup`
--
ALTER TABLE `city_msg_backup`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_open`
--
ALTER TABLE `city_open`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_photo`
--
ALTER TABLE `city_photo`
  MODIFY `photo_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_reject`
--
ALTER TABLE `city_reject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_rooms`
--
ALTER TABLE `city_rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_temp`
--
ALTER TABLE `city_temp`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_users`
--
ALTER TABLE `city_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_users_in_rooms`
--
ALTER TABLE `city_users_in_rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_option`
--
ALTER TABLE `club_option`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color_scheme`
--
ALTER TABLE `color_scheme`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `col_order`
--
ALTER TABLE `col_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_horoscope`
--
ALTER TABLE `const_horoscope`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_interests`
--
ALTER TABLE `const_interests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_i_am_here_to`
--
ALTER TABLE `const_i_am_here_to`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_lms_user_type`
--
ALTER TABLE `const_lms_user_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_looking`
--
ALTER TABLE `const_looking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_orientation`
--
ALTER TABLE `const_orientation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `const_relation`
--
ALTER TABLE `const_relation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_partner`
--
ALTER TABLE `contact_partner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_folders`
--
ALTER TABLE `custom_folders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_option`
--
ALTER TABLE `donation_option`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_auto`
--
ALTER TABLE `email_auto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_auto_settings`
--
ALTER TABLE `email_auto_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encounters`
--
ALTER TABLE `encounters`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_category`
--
ALTER TABLE `events_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event`
--
ALTER TABLE `events_event`
  MODIFY `event_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_comment`
--
ALTER TABLE `events_event_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_comment_comment`
--
ALTER TABLE `events_event_comment_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_guest`
--
ALTER TABLE `events_event_guest`
  MODIFY `guest_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image`
--
ALTER TABLE `events_event_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_comments`
--
ALTER TABLE `events_event_image_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_comments_likes`
--
ALTER TABLE `events_event_image_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_face_user_relation`
--
ALTER TABLE `events_event_image_face_user_relation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_likes`
--
ALTER TABLE `events_event_image_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_rate`
--
ALTER TABLE `events_event_image_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_tags`
--
ALTER TABLE `events_event_image_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_event_image_tags_relations`
--
ALTER TABLE `events_event_image_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_setting`
--
ALTER TABLE `events_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashchat_messages`
--
ALTER TABLE `flashchat_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashchat_rooms`
--
ALTER TABLE `flashchat_rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashchat_users`
--
ALTER TABLE `flashchat_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_category`
--
ALTER TABLE `forum_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_forum`
--
ALTER TABLE `forum_forum`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_message`
--
ALTER TABLE `forum_message`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_setting`
--
ALTER TABLE `forum_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_comments`
--
ALTER TABLE `gallery_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_chess`
--
ALTER TABLE `game_chess`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_invite`
--
ALTER TABLE `game_invite`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_morboy`
--
ALTER TABLE `game_morboy`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_reject`
--
ALTER TABLE `game_reject`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_shashki`
--
ALTER TABLE `game_shashki`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geo_city`
--
ALTER TABLE `geo_city`
  MODIFY `city_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geo_country`
--
ALTER TABLE `geo_country`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geo_state`
--
ALTER TABLE `geo_state`
  MODIFY `state_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gifts_set`
--
ALTER TABLE `gifts_set`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `glass_video`
--
ALTER TABLE `glass_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_category`
--
ALTER TABLE `groups_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_forum`
--
ALTER TABLE `groups_forum`
  MODIFY `forum_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_forum_comment`
--
ALTER TABLE `groups_forum_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_forum_comment_comment`
--
ALTER TABLE `groups_forum_comment_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_group`
--
ALTER TABLE `groups_group`
  MODIFY `group_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_group_comment`
--
ALTER TABLE `groups_group_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_group_comment_comment`
--
ALTER TABLE `groups_group_comment_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_group_image`
--
ALTER TABLE `groups_group_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_group_member`
--
ALTER TABLE `groups_group_member`
  MODIFY `member_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_invite`
--
ALTER TABLE `groups_invite`
  MODIFY `invite_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_setting`
--
ALTER TABLE `groups_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_social`
--
ALTER TABLE `groups_social`
  MODIFY `group_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_social_subscribers`
--
ALTER TABLE `groups_social_subscribers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_social_tags`
--
ALTER TABLE `groups_social_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_social_tags_relations`
--
ALTER TABLE `groups_social_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_user_block_list`
--
ALTER TABLE `groups_user_block_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_party`
--
ALTER TABLE `group_party`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_answer`
--
ALTER TABLE `help_answer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topic`
--
ALTER TABLE `help_topic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_category`
--
ALTER TABLE `hotdates_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate`
--
ALTER TABLE `hotdates_hotdate`
  MODIFY `hotdate_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_comment`
--
ALTER TABLE `hotdates_hotdate_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_comment_comment`
--
ALTER TABLE `hotdates_hotdate_comment_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_guest`
--
ALTER TABLE `hotdates_hotdate_guest`
  MODIFY `guest_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image`
--
ALTER TABLE `hotdates_hotdate_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_comments`
--
ALTER TABLE `hotdates_hotdate_image_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_comments_likes`
--
ALTER TABLE `hotdates_hotdate_image_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_face_user_relation`
--
ALTER TABLE `hotdates_hotdate_image_face_user_relation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_likes`
--
ALTER TABLE `hotdates_hotdate_image_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_rate`
--
ALTER TABLE `hotdates_hotdate_image_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_tags`
--
ALTER TABLE `hotdates_hotdate_image_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_hotdate_image_tags_relations`
--
ALTER TABLE `hotdates_hotdate_image_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotdates_setting`
--
ALTER TABLE `hotdates_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_audio_message`
--
ALTER TABLE `im_audio_message`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_msg`
--
ALTER TABLE `im_msg`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `im_open`
--
ALTER TABLE `im_open`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invited_folder`
--
ALTER TABLE `invited_folder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invited_personal`
--
ALTER TABLE `invited_personal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invited_private`
--
ALTER TABLE `invited_private`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invited_private_vids`
--
ALTER TABLE `invited_private_vids`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_block`
--
ALTER TABLE `ip_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_streaming`
--
ALTER TABLE `live_streaming`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_streaming_viewers`
--
ALTER TABLE `live_streaming_viewers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `looking_level`
--
ALTER TABLE `looking_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_folder`
--
ALTER TABLE `mail_folder`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_msg`
--
ALTER TABLE `mail_msg`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `massmail`
--
ALTER TABLE `massmail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `masssms`
--
ALTER TABLE `masssms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_link_info`
--
ALTER TABLE `meta_link_info`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_category`
--
ALTER TABLE `music_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_musician`
--
ALTER TABLE `music_musician`
  MODIFY `musician_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_musician_comment`
--
ALTER TABLE `music_musician_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_musician_image`
--
ALTER TABLE `music_musician_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_musician_vote`
--
ALTER TABLE `music_musician_vote`
  MODIFY `vote_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_setting`
--
ALTER TABLE `music_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_song`
--
ALTER TABLE `music_song`
  MODIFY `song_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_song_comment`
--
ALTER TABLE `music_song_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_song_image`
--
ALTER TABLE `music_song_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `music_song_vote`
--
ALTER TABLE `music_song_vote`
  MODIFY `vote_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_cats`
--
ALTER TABLE `news_cats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `object`
--
ALTER TABLE `object`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `object_type`
--
ALTER TABLE `object_type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outside_image`
--
ALTER TABLE `outside_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `partner_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_banners`
--
ALTER TABLE `partner_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_faq`
--
ALTER TABLE `partner_faq`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_main`
--
ALTER TABLE `partner_main`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_terms`
--
ALTER TABLE `partner_terms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_tips`
--
ALTER TABLE `partner_tips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_category`
--
ALTER TABLE `partyhouz_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_open`
--
ALTER TABLE `partyhouz_open`
  MODIFY `open_partyhouz_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou`
--
ALTER TABLE `partyhouz_partyhou`
  MODIFY `partyhou_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_comment`
--
ALTER TABLE `partyhouz_partyhou_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_comment_comment`
--
ALTER TABLE `partyhouz_partyhou_comment_comment`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_guest`
--
ALTER TABLE `partyhouz_partyhou_guest`
  MODIFY `guest_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image`
--
ALTER TABLE `partyhouz_partyhou_image`
  MODIFY `image_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_comments`
--
ALTER TABLE `partyhouz_partyhou_image_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_comments_likes`
--
ALTER TABLE `partyhouz_partyhou_image_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_face_user_relation`
--
ALTER TABLE `partyhouz_partyhou_image_face_user_relation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_likes`
--
ALTER TABLE `partyhouz_partyhou_image_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_rate`
--
ALTER TABLE `partyhouz_partyhou_image_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_tags`
--
ALTER TABLE `partyhouz_partyhou_image_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_image_tags_relations`
--
ALTER TABLE `partyhouz_partyhou_image_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_partyhou_invites`
--
ALTER TABLE `partyhouz_partyhou_invites`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partyhouz_setting`
--
ALTER TABLE `partyhouz_setting`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_after`
--
ALTER TABLE `payment_after`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_before`
--
ALTER TABLE `payment_before`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_cat`
--
ALTER TABLE `payment_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_features`
--
ALTER TABLE `payment_features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_log`
--
ALTER TABLE `payment_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_plan`
--
ALTER TABLE `payment_plan`
  MODIFY `item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_price`
--
ALTER TABLE `payment_price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_comments`
--
ALTER TABLE `photo_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_comments_likes`
--
ALTER TABLE `photo_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_face_user_relation`
--
ALTER TABLE `photo_face_user_relation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_likes`
--
ALTER TABLE `photo_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_rate`
--
ALTER TABLE `photo_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_tags`
--
ALTER TABLE `photo_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_tags_relations`
--
ALTER TABLE `photo_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_category`
--
ALTER TABLE `places_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_place`
--
ALTER TABLE `places_place`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_place_image`
--
ALTER TABLE `places_place_image`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_place_vote`
--
ALTER TABLE `places_place_vote`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_review`
--
ALTER TABLE `places_review`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places_review_vote`
--
ALTER TABLE `places_review_vote`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posting_info`
--
ALTER TABLE `posting_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_user_list`
--
ALTER TABLE `saved_user_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_save`
--
ALTER TABLE `search_save`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_auto`
--
ALTER TABLE `sms_auto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spotlight`
--
ALTER TABLE `spotlight`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stickers_collections`
--
ALTER TABLE `stickers_collections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stickers_popularity_users`
--
ALTER TABLE `stickers_popularity_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `texts`
--
ALTER TABLE `texts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpartner`
--
ALTER TABLE `userpartner`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_block`
--
ALTER TABLE `users_block`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_comments`
--
ALTER TABLE `users_comments`
  MODIFY `id` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_favorite`
--
ALTER TABLE `users_favorite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_interest`
--
ALTER TABLE `users_interest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_private_note`
--
ALTER TABLE `users_private_note`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_reports`
--
ALTER TABLE `users_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_view`
--
ALTER TABLE `users_view`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_visitors`
--
ALTER TABLE `users_visitors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_block_list`
--
ALTER TABLE `user_block_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_certify`
--
ALTER TABLE `user_certify`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_chart_random_value`
--
ALTER TABLE `user_chart_random_value`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_gift`
--
ALTER TABLE `user_gift`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_age_preference`
--
ALTER TABLE `var_age_preference`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_appearance`
--
ALTER TABLE `var_appearance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_body`
--
ALTER TABLE `var_body`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_can_you_host`
--
ALTER TABLE `var_can_you_host`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_career`
--
ALTER TABLE `var_career`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_drinking`
--
ALTER TABLE `var_drinking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_education`
--
ALTER TABLE `var_education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_ethnicity`
--
ALTER TABLE `var_ethnicity`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_eye`
--
ALTER TABLE `var_eye`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_family`
--
ALTER TABLE `var_family`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_first_date`
--
ALTER TABLE `var_first_date`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_hair`
--
ALTER TABLE `var_hair`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_height`
--
ALTER TABLE `var_height`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_hobbies`
--
ALTER TABLE `var_hobbies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_humor`
--
ALTER TABLE `var_humor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_income`
--
ALTER TABLE `var_income`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_language`
--
ALTER TABLE `var_language`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_level_of_faith`
--
ALTER TABLE `var_level_of_faith`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_live_where`
--
ALTER TABLE `var_live_where`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_living_with`
--
ALTER TABLE `var_living_with`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_nickname`
--
ALTER TABLE `var_nickname`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_religion`
--
ALTER TABLE `var_religion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_sexuality`
--
ALTER TABLE `var_sexuality`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_smoking`
--
ALTER TABLE `var_smoking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_spending_habits`
--
ALTER TABLE `var_spending_habits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_star_sign`
--
ALTER TABLE `var_star_sign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_status`
--
ALTER TABLE `var_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `var_weight`
--
ALTER TABLE `var_weight`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_invite`
--
ALTER TABLE `video_invite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_reject`
--
ALTER TABLE `video_reject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_rooms`
--
ALTER TABLE `video_rooms`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_category`
--
ALTER TABLE `vids_category`
  MODIFY `category_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_comment`
--
ALTER TABLE `vids_comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_comments_likes`
--
ALTER TABLE `vids_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_likes`
--
ALTER TABLE `vids_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_subscribe`
--
ALTER TABLE `vids_subscribe`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_tags`
--
ALTER TABLE `vids_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_tags_relations`
--
ALTER TABLE `vids_tags_relations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vids_video`
--
ALTER TABLE `vids_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall`
--
ALTER TABLE `wall`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall_comments`
--
ALTER TABLE `wall_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall_comments_likes`
--
ALTER TABLE `wall_comments_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall_likes`
--
ALTER TABLE `wall_likes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall_stats`
--
ALTER TABLE `wall_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wowslider`
--
ALTER TABLE `wowslider`
  MODIFY `event_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wowslider_main`
--
ALTER TABLE `wowslider_main`
  MODIFY `event_id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

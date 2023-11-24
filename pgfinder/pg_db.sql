-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 04:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pg_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

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
(25, 'Can add contact us', 7, 'add_contactus'),
(26, 'Can change contact us', 7, 'change_contactus'),
(27, 'Can delete contact us', 7, 'delete_contactus'),
(28, 'Can view contact us', 7, 'view_contactus'),
(29, 'Can add properties', 8, 'add_properties'),
(30, 'Can change properties', 8, 'change_properties'),
(31, 'Can delete properties', 8, 'delete_properties'),
(32, 'Can view properties', 8, 'view_properties'),
(33, 'Can add rating', 9, 'add_rating'),
(34, 'Can change rating', 9, 'change_rating'),
(35, 'Can delete rating', 9, 'delete_rating'),
(36, 'Can view rating', 9, 'view_rating'),
(37, 'Can add property holder', 10, 'add_propertyholder'),
(38, 'Can change property holder', 10, 'change_propertyholder'),
(39, 'Can delete property holder', 10, 'delete_propertyholder'),
(40, 'Can view property holder', 10, 'view_propertyholder'),
(41, 'Can add enquire', 11, 'add_enquire'),
(42, 'Can change enquire', 11, 'change_enquire'),
(43, 'Can delete enquire', 11, 'delete_enquire'),
(44, 'Can view enquire', 11, 'view_enquire');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$RvoYYFnaBuCwx4NkXRwRer$MMoAX19ngHo4eEanOCPq8/fKTo4Ixm2mL2QwghqqJ7k=', NULL, 1, 'admin', '', '', '', 1, 1, '2023-11-24 14:05:58.684049'),
(2, 'pbkdf2_sha256$390000$5zGLFCHHTkmB4PqFQBRUtp$KkKdRRmaUej5KHsOf+06wBi2lXFaSNKlvwdsMyOU0N8=', '2023-11-24 14:50:18.637329', 0, '9876543210', 'Arijit', 'Das', '', 0, 1, '2023-11-10 08:17:26.914902'),
(3, 'pbkdf2_sha256$600000$ihTApTTjpIYwh06RKt42QH$q6uB0X6EupVdCdXNYj9goTgVUTBzrHXuD1HjnpqRRmU=', '2023-11-12 13:21:17.237085', 0, '9876543212', 'Tamasru', 'Pain', '', 0, 1, '2023-11-10 14:27:46.230821'),
(4, 'pbkdf2_sha256$390000$8pkyCXa36PQ2ueTXCATDGz$lN1buySY7yrfoMaMZFTB9vqjap1X18vggsMxxKUnS3U=', '2023-11-17 08:48:49.576860', 0, '9836111094', 'Sarasij', 'Majumdar', '', 0, 1, '2023-11-17 08:48:32.038859');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'pgapp', 'contactus'),
(11, 'pgapp', 'enquire'),
(8, 'pgapp', 'properties'),
(10, 'pgapp', 'propertyholder'),
(9, 'pgapp', 'rating'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-24 14:05:06.334774'),
(2, 'auth', '0001_initial', '2023-11-24 14:05:06.770047'),
(3, 'admin', '0001_initial', '2023-11-24 14:05:06.878810'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-24 14:05:06.886250'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-24 14:05:06.893722'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-24 14:05:06.962538'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-24 14:05:07.021214'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-24 14:05:07.070655'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-24 14:05:07.077650'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-24 14:05:07.145463'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-24 14:05:07.152612'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-24 14:05:07.160985'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-24 14:05:07.181096'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-24 14:05:07.197329'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-24 14:05:07.213727'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-24 14:05:07.220767'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-24 14:05:07.238899'),
(18, 'pgapp', '0001_initial', '2023-11-24 14:05:07.497659'),
(19, 'sessions', '0001_initial', '2023-11-24 14:05:07.525080');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pgapp_contactus`
--

CREATE TABLE `pgapp_contactus` (
  `cus_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `query` longtext NOT NULL,
  `contact_on` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pgapp_enquire`
--

CREATE TABLE `pgapp_enquire` (
  `enq_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `property` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `enquire_on` datetime(6) NOT NULL,
  `prop_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pgapp_properties`
--

CREATE TABLE `pgapp_properties` (
  `prop_id` int(11) NOT NULL,
  `prop_name` varchar(100) NOT NULL,
  `prop_img` varchar(100) NOT NULL,
  `prop_location` varchar(100) NOT NULL,
  `prop_address` varchar(200) NOT NULL,
  `prop_gmap` varchar(200) NOT NULL,
  `prop_facilities` varchar(100) NOT NULL,
  `prop_price` bigint(20) NOT NULL,
  `prop_details` longtext NOT NULL,
  `prop_gender` varchar(50) NOT NULL,
  `is_active` varchar(5) NOT NULL,
  `prop_slug` varchar(50) NOT NULL,
  `prop_on` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pgapp_properties`
--

INSERT INTO `pgapp_properties` (`prop_id`, `prop_name`, `prop_img`, `prop_location`, `prop_address`, `prop_gmap`, `prop_facilities`, `prop_price`, `prop_details`, `prop_gender`, `is_active`, `prop_slug`, `prop_on`, `user_id`) VALUES
(25, 'suvankar pg salt lake', 'properties/2022-08-29_Qs1upl0.jpg', 'Saltlake', 'Prantik Apartment, 162, Mahisbathan Rd, Mahish Bathan, Sector V, Bidhannagar, Kolkata, West Bengal 700102', 'https://maps.app.goo.gl/Lp1HF4EqyRQQJ1nN7', 'Wifi, water purifier, tv, fridge, cleaning service', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Contact:</strong></p>\r\n<p>Ower Name: Tamasru Pain&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'male', 'true', 'suvankar-pg-salt-lake', '2023-11-12 12:08:21.575934', 3),
(26, 'ASHIM PG', 'properties/unnamed.jpg', 'Saltlake', 'MB-122, near Ankit Apartment, AQ Block, Sector V, Bidhannagar, Kolkata, West Bengal 700102', 'https://maps.app.goo.gl/27KHRfj8R5JQ7Pdr9', 'Wifi, water purifier, tv, fridge, cleaning service', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>\r\n<p>&nbsp;</p>', 'female', 'true', 'ashim-pg', '2023-11-12 12:11:06.785175', 3),
(27, 'Branded PG', 'properties/IMG_20190324_211907.jpg', 'Saltlake', 'MAHISBATHAN, NEAR HOTEL WELCOME INN, MB 71, Sector V, West Bengal 700102', 'https://maps.app.goo.gl/691CqFT5M5uCsXaa7', 'Wifi, water purifier', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'male', 'true', 'branded-pg', '2023-11-12 12:13:15.483481', 3),
(28, 'Koliving Salt Lake PG', 'properties/2023-04-14.jpg', 'Saltlake', 'DAG No- 154, Mahishbathan, near Siksha Sadan, AQ Block, Sector V, Bidhannagar, Kolkata, West Bengal 700102', 'https://maps.app.goo.gl/Ad5KJVdRg6Ps4eZW6', 'Wifi, water purifier, tv, fridge', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>\r\n<p>&nbsp;</p>', 'female', 'true', 'koliving-salt-lake-pg', '2023-11-12 12:16:09.290019', 3),
(29, 'North East pg', 'properties/01_vujCTQ1.jpg', 'Saltlake', 'Salt Lake Bypass, AP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700102', 'https://maps.app.goo.gl/oQkvwqKzxi3w6aWW9', 'Wifi, water purifier, tv, fridge', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>\r\n<p>&nbsp;</p>', 'female', 'true', 'north-east-pg', '2023-11-12 12:17:31.600615', 3),
(30, 'Sinha\'s Home', 'properties/20180626_182620_HDR.jpg', 'Karunamoyee', 'AL-50, AL Block, Sector II, Bidhannagar, Kolkata, West Bengal 700091', 'https://maps.app.goo.gl/ZBJTsJ7aNZ1HHRgN9', 'Wifi, Water Purifier', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'male', 'false', 'sinhas-home-male-female-pg', '2023-11-12 12:24:42.465348', 2),
(33, 'MAA KALI PAYING GUEST', 'properties/IMG20211114200643.jpg', 'Karunamoyee', 'Bk 366, BK Block, Sector II, Bidhannagar, Kolkata, West Bengal 700091', 'https://maps.app.goo.gl/tEzFhNaqmouT7TKG8', 'Wifi, water purifier', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'female', 'true', 'maa-kali-paying-guest', '2023-11-12 12:29:03.506762', 2),
(34, 'Kaberi\'s Ladies PG', 'properties/IMG_20220730_140959.jpg', 'Karunamoyee', 'DL-61, DL Block, Sector II, Bidhannagar, Kolkata, West Bengal 700091', 'https://maps.app.goo.gl/V5Mzwk4nYELNMVs59', 'Wifi, water purifier', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Female', 'true', 'kaberis-ladies-pg', '2023-11-12 12:31:11.684647', 2),
(35, 'GANPATI PAYING GUEST', 'properties/2021-03-15.jpg', 'Newtown', 'DC Block(Newtown), Action Area I, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/Pi7eL1cYSdHzPVgv7', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'male', 'true', 'ganpati-paying-guest', '2023-11-12 12:33:27.300330', 2),
(36, 'MarioStay_Ankush paying guest house', 'properties/IMG-20180220-WA0015.jpg', 'Newtown', 'ca 239, street no- 250, Action Area I, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/NMycaKr4mQ63LWnx7', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'male', 'true', 'mariostay_ankush-paying-guest-house', '2023-11-12 12:35:06.522415', 2),
(37, 'MarioStay Girls PG', 'properties/WhatsApp_Image_2020-11-10_at_13.53.43_1.jpeg', 'Newtown', 'CA 30, Street Number 189, CA Block(Newtown), Action Area I, Newtown, Kolkata, New Town, West Bengal 700156', 'https://maps.app.goo.gl/xd88txPjSahGrbSR9', 'Wifi, water purifier, tv, fridge, cleaning service', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Female', 'true', 'mariostay-girls-pg', '2023-11-12 12:36:44.801743', 2),
(38, 'Sabita Biswas Home PG', 'properties/2022-09-16.jpg', 'Newtown', 'BD-188, Street No 117 BD Block(Newtown, Action Area I, 1A, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/suNAi7UxP4P6LzUh7', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'female', 'true', 'sabita-biswas-home-pg', '2023-11-12 12:39:07.424944', 2),
(39, 'Advance Enterprises - Ladies PG in Newtown', 'properties/IMG_5387.JPG', 'Newtown', 'Keshav Madhav Sadan, BD - 89, Street Number 159, near IV No. Tank, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/PZ1hiebyNqhF2rUJ7', 'Wifi, water purifier', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Female', 'true', 'advance-enterprises-ladies-pg-in-newtown', '2023-11-12 12:41:14.252618', 2),
(41, 'Arjun Male Pg ', 'properties/2021-01-17.jpg', 'Newtown', 'M S Paying Guest House, AI 112, Street Number 23, adjacent to Tank No 3, Action Area I, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/uJY9UBURRSdjPYqX8', 'Wifi, Water Purifier, Tv, Fridge', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>\r\n<p>&nbsp;</p>', 'Male', 'true', 'arjun-male-pg', '2023-11-12 12:51:09.923892', 3),
(42, 'Shohini Female PG ', 'properties/IMG-20170425-WA0002.jpg', 'Newtown', 'New Town, Kolkata, AI 55, Street No 29, 55, Street Number 29, New Town, West Bengal 700156', 'https://maps.app.goo.gl/MbvmnJ2mz3mvNGrEA', 'Wifi, water purifier, tv, fridge', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', ' female', 'true', 'shohini-female-pg', '2023-11-12 12:53:22.356475', 3),
(43, 'Seaburt paying guest', 'properties/thumbnail.jpeg', 'Newtown', 'Thakdari Rd, Action Area I, Newtown, Kolkata, West Bengal 700156', 'https://maps.app.goo.gl/uba7vQDagCAmn8N7A', 'Wifi, water purifier, tv, fridge, cleaning service', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'male', 'true', 'seaburt-paying-guest', '2023-11-12 12:55:33.463727', 3),
(44, 'SINGH PG', 'properties/IMG-20210324-WA0004.jpg', 'Newtown', 'AGAMAN70 STREET NUMBER 38, AC Block(Newtown), Action Area I, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/RyzsmpTL47cxjjWu6', 'Wifi, water purifier', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Male', 'true', 'singh-pg', '2023-11-12 12:57:13.096844', 3),
(45, 'Sweet Home PG ', 'properties/83900sai_krupa.jpg', 'Newtown', 'AC 22, Street Number 43, AC Block(Newtown), Action Area I, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/jzwHXXwQ5ZTUzMC97', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'female', 'true', 'sweet-home-pg', '2023-11-12 12:59:10.967616', 3),
(46, 'JK LADIES PG', 'properties/thumbnail_1.jpeg', 'Dum Dum', '2no, Airport, Motilal Colony, Dum Dum, Kolkata, West Bengal 700052', 'https://maps.app.goo.gl/zCWYMD8iGXq8s95X7', 'Wifi, water purifier', 6000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Female', 'true', 'jk-ladies-pg', '2023-11-12 13:03:10.809021', 3),
(47, 'Shanti Paying Guest For Girls', 'properties/thumbnail_2.jpeg', 'Dum Dum', 'Rani Kuthir Complex, 2No, Airport Gate, Behind Of Santosh Bhavan Marriage House and 2No, Airport Gate Market, Kolkata, West Bengal 700081', 'https://maps.app.goo.gl/iaDrNkDwyVtJiGfU6', 'Wifi, water purifier, tv, fridge', 6000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Female', 'true', 'shanti-paying-guest-for-girls', '2023-11-12 13:04:13.465423', 3),
(48, 'Digonto P.G ', 'properties/thumbnail_3.jpeg', 'Dum Dum', 'JCVG+2G3, Guha Road, 549/5, Radha Nagar, Kolkata, West Bengal 700028', 'https://maps.app.goo.gl/HftjyezBN9ppn4hs8', 'Wifi, water purifier, tv, fridge', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>\r\n<p>&nbsp;</p>', 'female', 'true', 'digonto-pg', '2023-11-12 13:05:32.588184', 3),
(49, 'Shriniketan PG', 'properties/2023-08-01.jpg', 'Dum Dum', '123, 1/1, Dr Jiban Ratan Dhar Rd, Adarsh Nagar, Arabinda Sarani, Dum Dum, Kolkata, West Bengal 700028', 'https://maps.app.goo.gl/C3RvCJRAWxeowxXm8', 'Wifi, water purifier, tv, fridge', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'female', 'true', 'shriniketan-pg', '2023-11-12 13:06:57.220214', 3),
(50, 'Santi Ladies Pg', 'properties/thumbnail_4.jpeg', 'Dum Dum', '1 No Gate, 13 East Kamalapur, beside Kamalapur Boy\'s High School, Airport, Dum Dum, Kolkata, West Bengal 700028', 'https://maps.app.goo.gl/5ZcG5Pj6j93TjxEp8', 'Wifi, water purifier, fridge', 5000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Female', 'true', 'santi-ladies-pg', '2023-11-12 13:09:46.020745', 3),
(51, 'Kakali Pg', 'properties/unnamed_1.jpg', 'Dum Dum', '23/17, Jessore Rd, Mahendra Colony, Cantonment, Nagerbazar, Kamardanga, North Dumdum, West Bengal 700028', 'https://maps.app.goo.gl/bY2JCgsBUrS79wAf7', 'Wifi, Water Purifier, Fridge', 5000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Female', 'true', 'kakali-pg', '2023-11-12 13:13:47.443391', 2),
(52, 'Best Boys Pg', 'properties/2020-10-09.jpg', 'Dum Dum', '1/2, Golpark, South Dum Dum, West Bengal Maharaja Bar and resturant,Golpark, South Dum Dum, North Dumdum, West Bengal 700028', 'https://maps.app.goo.gl/V43cnKMzsUnZWFdJ9', 'Wifi, Water Purifier, Tv, Fridge', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Male', 'true', 'best-boys-pg', '2023-11-12 13:15:23.389091', 2),
(53, 'Aashayain Dla Boy\'s Hostel', 'properties/2017-04-08.jpg', 'Dum Dum', 'Opposite Royal Bhutan Consulate, 7/2, K.B.Sarani, South Dumdum, West Bengal 700080', 'https://maps.app.goo.gl/p9Ym6CpKHGQUXp277', 'Wifi, Water Purifier, Tv, Fridge', 7000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'Male', 'true', 'aashayain-dla-boys-hostel', '2023-11-12 13:16:23.710376', 2),
(54, 'Baba Lokenath PG ( MALE & FEMALE )', 'properties/2023-06-11_bcmQo5w.jpg', 'Dum Dum', 'no. 4, 9, Lakshminagar, South Dumdum, West Bengal 700074', 'https://maps.app.goo.gl/gMhzxhVMjVXTR17e7', 'Wifi, water purifier, fridge', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'female', 'true', 'baba-lokenath-pg-male-female', '2023-11-12 13:18:24.072080', 2),
(55, 'Sai Paying Guest', 'properties/2023-04-02.jpg', 'Dum Dum', '19 Mandir Road Dumdum Cantonment, Gora Bazar, Kolkata, West Bengal 700028', 'https://maps.app.goo.gl/bPFyJPAmT1YZ7EBw6', 'Wifi, water purifier, fridge', 5000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'female', 'true', 'sai-paying-guest', '2023-11-12 13:20:44.385362', 2),
(56, 'Shidhidata Paying Guest', 'properties/2023-03-17.jpg', 'Karunamoyee', 'EC-177, EC Block, Sector 1, Bidhannagar, Kolkata, West Bengal 700064', 'https://maps.app.goo.gl/XokkznavNQe9UwL9A', 'Wifi, water purifier, tv, fridge', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'male', 'true', 'shidhidata-paying-guest', '2023-11-12 13:24:02.178936', 3),
(57, 'Gopal PG ', 'properties/IMG_20220325_105844.jpg', 'Karunamoyee', 'fe-261, FE Block, Sector 3, saltlake, Kolkata, West Bengal 700106', 'https://maps.app.goo.gl/qrZGi4bfjyhaEHw89', 'Wifi, water purifier, tv, fridge, cleaning service', 6800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'female', 'true', 'gopal-pg', '2023-11-12 13:25:54.287258', 3),
(58, 'Saltlake Guest House and Gents PG', 'properties/2022-02-10_1.jpg', 'Karunamoyee', 'FE-460, 1A Cross Rd, FE Block, Sector 3, Bidhannagar, Kolkata, West Bengal 700106', 'https://maps.app.goo.gl/CEyFPeo9F6C27opp6', 'Wifi, water purifier, tv, fridge', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Male', 'true', 'saltlake-guest-house-and-gents-pg', '2023-11-12 13:27:44.860330', 3),
(59, 'Purabi Girls PG', 'properties/2_CG2QCfO.jpg', 'Karunamoyee', 'No.7, Water Tank, AH-318, AH Block, Sector II, Bidhannagar, Kolkata, West Bengal 700091', 'https://maps.app.goo.gl/79iP8T6mGAZ1yAL88', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Female', 'true', 'purabi-girls-pg', '2023-11-12 13:29:26.171291', 3),
(60, 'Shri Aalay PG ', 'properties/unnamed_2.jpg', 'Karunamoyee', 'Sayantika Complex, DL 15, Near Sector 5 ,Salt Lake , Kolkata, AL 219, BJ 255 ,Sector 2, AN Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091', 'https://maps.app.goo.gl/ZBiVJS8TRGuZPDqZ8', 'Wifi, water purifier, tv, fridge', 6500, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>&nbsp;</p>\r\n<p>Contact:</p>\r\n<p>Ower Name: Tarun Pal&nbsp;</p>\r\n<p>Phone no: 9876543212</p>', 'Male', 'true', 'shri-aalay-pg', '2023-11-12 13:30:38.035778', 3),
(61, 'Astarag', 'properties/2022-08-31.jpg', 'Newtown', 'DF-90, Street Number 324, Newtown, Kolkata, West Bengal 700156', 'https://maps.app.goo.gl/Eap1uQSLvj4BWb9M7', 'Wifi, Water Purifier, Tv, Fridge', 8000, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm. Meals are given 3 times a day.And Spacious Garage for parking 4 wheelers and 2 wheelers.</p>', 'male', 'true', 'astarag', '2023-11-12 13:48:43.177504', 2),
(62, 'Ramkrishna Guest House And Pg', 'properties/WhatsApp_Image_2022-04-09_at_12.39.51_PM.jpeg', 'Newtown', 'BE-60 STREET NO 174 Newtown, Action Area I, 1, West Bengal 700156', 'https://maps.app.goo.gl/hwEuxGdkdqZpcbzu6', 'Wifi, Water Purifier, Tv, Fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm. Meals are given 3 times a day. Spacious garage For vaicals.</p>\r\n<p>&nbsp;</p>', 'male', 'false', 'ramkrishna-guest-house-and-pg', '2023-11-12 13:51:12.908235', 2),
(63, 'Krishwiz life Pg', 'properties/2023-05-16.jpg', 'Newtown', '119, BE 20, Street No.119, BE Block(Newtown), Action Area 1B, Newtown, New Town, West Bengal 700156', 'https://maps.app.goo.gl/ighMuvM8yhE4yELc8', 'Wifi, water purifier, tv, fridge', 7800, '<p>We have 2 shearing, 3 shearing and single room also. the pg located near bus tarminal and metro station and also near merket and madical shop. The curfew time of our Pg is 11pm.</p>\r\n<p>Meals are given 3 times a day</p>\r\n<p>Contact:</p>\r\n<p>OwerName: Arjun Dolui&nbsp;</p>\r\n<p>PhoneNo: 9876543210</p>', 'female', 'true', 'krishwiz-life-pg', '2023-11-12 13:52:55.235180', 2),
(64, 'Abc Property', 'properties/prop_tPa0jqT_LKEfQlA.jpg', 'Bhowanipore', 'Somewhere on kolkata', 'https://maps.app.goo.gl/oLEcsVxEbV4aJqPX9', 'Wifi, Security, Parking', 10250, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'male', 'false', 'abc-property', '2023-11-16 18:18:18.841358', 2),
(65, 'Techno', 'properties/unnamed_2_NOT58s6.jpg', 'Narkelbagan', 'Near Mariott Hotel', 'https://maps.app.goo.gl/PZDeRkscGVD2AW3s7', 'AC, wifi, geyser', 7000, '<p>Let us serve you.</p>', 'male', 'true', 'techno', '2023-11-17 08:55:19.428874', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pgapp_propertyholder`
--

CREATE TABLE `pgapp_propertyholder` (
  `owner_id` int(11) NOT NULL,
  `owner_aadhaar` varchar(30) NOT NULL,
  `owner_pan` varchar(10) NOT NULL,
  `owner_city` varchar(50) NOT NULL,
  `owner_state` varchar(50) NOT NULL,
  `owner_pin` varchar(10) NOT NULL,
  `owner_address` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pgapp_propertyholder`
--

INSERT INTO `pgapp_propertyholder` (`owner_id`, `owner_aadhaar`, `owner_pan`, `owner_city`, `owner_state`, `owner_pin`, `owner_address`, `user_id`) VALUES
(1, '3333444455', 'abcde1234f', 'Ghatal', 'West Bengal', '721212', 'POST- Ghatal, DIST- Paschim Medinipur, VILL- Konnnagar, PIN- 721212, WARD NO.- 16, LandMark- Near Basanta Kumari High School. ', 3),
(2, '666333444555', 'efghi5678j', 'Kolkata', 'West Bengal', '700190', '80, Chowringee Rd, Gaza Park, Sreepally, Bhowanipore, Kolkata, West Bengal 700020', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pgapp_rating`
--

CREATE TABLE `pgapp_rating` (
  `rate_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `is_Rated` tinyint(1) NOT NULL,
  `user_ip` char(39) NOT NULL,
  `prop_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pgapp_rating`
--

INSERT INTO `pgapp_rating` (`rate_id`, `score`, `is_Rated`, `user_ip`, `prop_id_id`) VALUES
(1, 3, 1, '127.0.0.1', 62),
(2, 5, 1, '127.0.0.1', 61),
(3, 5, 1, '127.0.0.1', 57),
(4, 2, 1, '127.0.0.1', 60),
(5, 1, 1, '127.0.0.1', 58),
(6, 3, 1, '127.0.0.1', 59);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `pgapp_contactus`
--
ALTER TABLE `pgapp_contactus`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `pgapp_enquire`
--
ALTER TABLE `pgapp_enquire`
  ADD PRIMARY KEY (`enq_id`),
  ADD KEY `pgapp_enquire_prop_id_id_f69bb36d_fk_pgapp_properties_prop_id` (`prop_id_id`);

--
-- Indexes for table `pgapp_properties`
--
ALTER TABLE `pgapp_properties`
  ADD PRIMARY KEY (`prop_id`),
  ADD KEY `pgapp_properties_user_id_1bd4f83f_fk_auth_user_id` (`user_id`),
  ADD KEY `pgapp_properties_prop_slug_69864c9f` (`prop_slug`);

--
-- Indexes for table `pgapp_propertyholder`
--
ALTER TABLE `pgapp_propertyholder`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `pgapp_propertyholder_user_id_33b5ee59_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `pgapp_rating`
--
ALTER TABLE `pgapp_rating`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `pgapp_rating_prop_id_id_864ecf40_fk_pgapp_properties_prop_id` (`prop_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pgapp_contactus`
--
ALTER TABLE `pgapp_contactus`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pgapp_enquire`
--
ALTER TABLE `pgapp_enquire`
  MODIFY `enq_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pgapp_properties`
--
ALTER TABLE `pgapp_properties`
  MODIFY `prop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `pgapp_propertyholder`
--
ALTER TABLE `pgapp_propertyholder`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pgapp_rating`
--
ALTER TABLE `pgapp_rating`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `pgapp_enquire`
--
ALTER TABLE `pgapp_enquire`
  ADD CONSTRAINT `pgapp_enquire_prop_id_id_f69bb36d_fk_pgapp_properties_prop_id` FOREIGN KEY (`prop_id_id`) REFERENCES `pgapp_properties` (`prop_id`);

--
-- Constraints for table `pgapp_properties`
--
ALTER TABLE `pgapp_properties`
  ADD CONSTRAINT `pgapp_properties_user_id_1bd4f83f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `pgapp_propertyholder`
--
ALTER TABLE `pgapp_propertyholder`
  ADD CONSTRAINT `pgapp_propertyholder_user_id_33b5ee59_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `pgapp_rating`
--
ALTER TABLE `pgapp_rating`
  ADD CONSTRAINT `pgapp_rating_prop_id_id_864ecf40_fk_pgapp_properties_prop_id` FOREIGN KEY (`prop_id_id`) REFERENCES `pgapp_properties` (`prop_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

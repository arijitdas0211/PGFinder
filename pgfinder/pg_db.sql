-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2023 at 06:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
(29, 'Can add property holder', 8, 'add_propertyholder'),
(30, 'Can change property holder', 8, 'change_propertyholder'),
(31, 'Can delete property holder', 8, 'delete_propertyholder'),
(32, 'Can view property holder', 8, 'view_propertyholder'),
(33, 'Can add properties', 9, 'add_properties'),
(34, 'Can change properties', 9, 'change_properties'),
(35, 'Can delete properties', 9, 'delete_properties'),
(36, 'Can view properties', 9, 'view_properties'),
(37, 'Can add enquire', 10, 'add_enquire'),
(38, 'Can change enquire', 10, 'change_enquire'),
(39, 'Can delete enquire', 10, 'delete_enquire'),
(40, 'Can view enquire', 10, 'view_enquire');

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
(1, 'pbkdf2_sha256$390000$IvBFu5Hm2sndvKLup7GSXV$YAhvjXj48YTXAUSKltP6ByRZ69aetitgsPgSag/il54=', NULL, 1, 'admin', '', '', '', 1, 1, '2023-11-10 08:16:27.004797'),
(2, 'pbkdf2_sha256$390000$baN6AMNYscCveN3JBExmNX$0KOfOokg5LnSrYYNwADXuTz/AIe67HqwwVK4twBbRrk=', '2023-11-11 16:36:55.099695', 0, '9876543210', 'Arijit', 'Das', '', 0, 1, '2023-11-10 08:17:26.914902'),
(3, 'pbkdf2_sha256$390000$R2KLbr3Y8bO5dye6YgBPac$PpyrrpeEQ1KnGiwg4DP0uqIhV3jnkAy5iy3fAehSd0c=', '2023-11-11 13:34:07.798988', 0, '9876543212', 'Tamasru', 'Pain', '', 0, 1, '2023-11-10 14:27:46.230821');

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
(10, 'pgapp', 'enquire'),
(9, 'pgapp', 'properties'),
(8, 'pgapp', 'propertyholder'),
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
(1, 'contenttypes', '0001_initial', '2023-11-10 08:16:09.154754'),
(2, 'auth', '0001_initial', '2023-11-10 08:16:10.001375'),
(3, 'admin', '0001_initial', '2023-11-10 08:16:10.189521'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-10 08:16:10.217737'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-10 08:16:10.244966'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-10 08:16:10.374267'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-10 08:16:10.474157'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-10 08:16:10.513477'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-10 08:16:10.529215'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-10 08:16:10.625537'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-10 08:16:10.631156'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-10 08:16:10.652518'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-10 08:16:10.691019'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-10 08:16:10.725595'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-10 08:16:10.769900'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-10 08:16:10.792010'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-10 08:16:10.825845'),
(18, 'pgapp', '0001_initial', '2023-11-10 08:16:11.178056'),
(19, 'sessions', '0001_initial', '2023-11-10 08:16:11.255761'),
(20, 'pgapp', '0002_alter_properties_prop_details', '2023-11-10 08:46:19.103705'),
(21, 'pgapp', '0002_alter_properties_prop_img', '2023-11-10 14:14:53.380302');

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
  `score` int(11) NOT NULL,
  `prop_img` varchar(100) NOT NULL,
  `prop_location` varchar(100) NOT NULL,
  `prop_address` varchar(200) NOT NULL,
  `prop_gmap` varchar(200) NOT NULL,
  `prop_facilities` varchar(100) NOT NULL,
  `prop_price` int(11) NOT NULL,
  `prop_details` longtext NOT NULL,
  `prop_gender` varchar(50) NOT NULL,
  `prop_slug` varchar(50) NOT NULL,
  `prop_on` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pgapp_contactus`
--
ALTER TABLE `pgapp_contactus`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pgapp_enquire`
--
ALTER TABLE `pgapp_enquire`
  MODIFY `enq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pgapp_properties`
--
ALTER TABLE `pgapp_properties`
  MODIFY `prop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pgapp_propertyholder`
--
ALTER TABLE `pgapp_propertyholder`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

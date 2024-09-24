-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 30, 2022 at 12:27 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gdbdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add user', 2, 'add_user'),
(6, 'Can change user', 2, 'change_user'),
(7, 'Can delete user', 2, 'delete_user'),
(8, 'Can view user', 2, 'view_user'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add history', 7, 'add_history'),
(26, 'Can change history', 7, 'change_history'),
(27, 'Can delete history', 7, 'delete_history'),
(28, 'Can view history', 7, 'view_history'),
(29, 'Can add project', 8, 'add_project'),
(30, 'Can change project', 8, 'change_project'),
(31, 'Can delete project', 8, 'delete_project'),
(32, 'Can view project', 8, 'view_project'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add master', 10, 'add_master'),
(38, 'Can change master', 10, 'change_master'),
(39, 'Can delete master', 10, 'delete_master'),
(40, 'Can view master', 10, 'view_master'),
(41, 'Can add supervisor', 11, 'add_supervisor'),
(42, 'Can change supervisor', 11, 'change_supervisor'),
(43, 'Can delete supervisor', 11, 'delete_supervisor'),
(44, 'Can view supervisor', 11, 'view_supervisor'),
(45, 'Can add work', 12, 'add_work'),
(46, 'Can change work', 12, 'change_work'),
(47, 'Can delete work', 12, 'delete_work'),
(48, 'Can view work', 12, 'view_work'),
(49, 'Can add relationship', 13, 'add_relationship'),
(50, 'Can change relationship', 13, 'change_relationship'),
(51, 'Can delete relationship', 13, 'delete_relationship'),
(52, 'Can view relationship', 13, 'view_relationship'),
(53, 'Can add project', 14, 'add_project'),
(54, 'Can change project', 14, 'change_project'),
(55, 'Can delete project', 14, 'delete_project'),
(56, 'Can view project', 14, 'view_project'),
(57, 'Can add product', 15, 'add_product'),
(58, 'Can change product', 15, 'change_product'),
(59, 'Can delete product', 15, 'delete_product'),
(60, 'Can view product', 15, 'view_product'),
(61, 'Can add work', 16, 'add_work'),
(62, 'Can change work', 16, 'change_work'),
(63, 'Can delete work', 16, 'delete_work'),
(64, 'Can view work', 16, 'view_work'),
(65, 'Can add supervisor', 17, 'add_supervisor'),
(66, 'Can change supervisor', 17, 'change_supervisor'),
(67, 'Can delete supervisor', 17, 'delete_supervisor'),
(68, 'Can view supervisor', 17, 'view_supervisor'),
(69, 'Can add master', 18, 'add_master'),
(70, 'Can change master', 18, 'change_master'),
(71, 'Can delete master', 18, 'delete_master'),
(72, 'Can view master', 18, 'view_master'),
(73, 'Can add relationship', 19, 'add_relationship'),
(74, 'Can change relationship', 19, 'change_relationship'),
(75, 'Can delete relationship', 19, 'delete_relationship'),
(76, 'Can view relationship', 19, 'view_relationship'),
(77, 'Can add gdb app labour', 20, 'add_gdbapplabour'),
(78, 'Can change gdb app labour', 20, 'change_gdbapplabour'),
(79, 'Can delete gdb app labour', 20, 'delete_gdbapplabour'),
(80, 'Can view gdb app labour', 20, 'view_gdbapplabour'),
(81, 'Can add gdb labour', 21, 'add_gdblabour'),
(82, 'Can change gdb labour', 21, 'change_gdblabour'),
(83, 'Can delete gdb labour', 21, 'delete_gdblabour'),
(84, 'Can view gdb labour', 21, 'view_gdblabour'),
(85, 'Can add quartpint', 22, 'add_quartpint'),
(86, 'Can change quartpint', 22, 'change_quartpint'),
(87, 'Can delete quartpint', 22, 'delete_quartpint'),
(88, 'Can view quartpint', 22, 'view_quartpint'),
(89, 'Can add gdb target', 23, 'add_gdbtarget'),
(90, 'Can change gdb target', 23, 'change_gdbtarget'),
(91, 'Can delete gdb target', 23, 'delete_gdbtarget'),
(92, 'Can view gdb target', 23, 'view_gdbtarget');

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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$U1wWalSQ3raa$xxSSz1wGTV+vw204UNOAnPtAiDbEGOIUUFrdhDlDuCY=', '2022-07-19 12:44:50.919147', 1, 'admin', '', '', 'info@galaxyweblinks.com', 1, 1, '2019-08-13 13:07:07.787720');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-08-14 09:12:40.451021', '10', 'Compactor', 1, 'new through import_export', 8, 1),
(2, '2019-08-14 09:12:40.531748', '11', 'CUT & COMP', 1, 'new through import_export', 8, 1),
(3, '2019-08-14 09:12:40.573495', '12', 'Ollie\'s Aerosol Sorting', 1, 'new through import_export', 8, 1),
(4, '2019-08-14 09:12:40.615166', '13', 'Roller Cover Sleeving', 1, 'new through import_export', 8, 1),
(5, '2019-08-14 09:12:40.665212', '14', 'Roller Sorting', 1, 'new through import_export', 8, 1),
(6, '2019-08-14 09:12:40.715241', '15', 'Applicator Stickering', 1, 'new through import_export', 8, 1),
(7, '2019-08-14 09:12:40.765305', '16', 'Aerosol Stickering', 1, 'new through import_export', 8, 1),
(8, '2019-08-14 09:12:40.815334', '17', 'Roller Sorting', 1, 'new through import_export', 8, 1),
(9, '2019-08-14 09:12:40.865473', '18', 'PR19-5 PPG/ WM ', 1, 'new through import_export', 8, 1),
(10, '2019-08-14 09:18:01.988733', '10', 'Compactor', 1, 'new through import_export', 8, 1),
(11, '2019-08-14 09:18:02.030498', '11', 'CUT & COMP', 1, 'new through import_export', 8, 1),
(12, '2019-08-14 09:18:02.072181', '12', 'Ollie\'s Aerosol Sorting', 1, 'new through import_export', 8, 1),
(13, '2019-08-14 09:18:02.113827', '13', 'Roller Cover Sleeving', 1, 'new through import_export', 8, 1),
(14, '2019-08-14 09:18:02.165235', '14', 'Roller Sorting', 1, 'new through import_export', 8, 1),
(15, '2019-08-14 09:18:02.206983', '15', 'Applicator Stickering', 1, 'new through import_export', 8, 1),
(16, '2019-08-14 09:18:02.249129', '16', 'Aerosol Stickering', 1, 'new through import_export', 8, 1),
(17, '2019-08-14 09:18:02.290833', '17', 'Roller Sorting', 1, 'new through import_export', 8, 1),
(18, '2019-08-14 09:18:02.353070', '18', 'PR19-5 PPG/ WM ', 1, 'new through import_export', 8, 1),
(19, '2019-08-14 10:59:56.854610', '1', 'CUT LABEL', 2, '[]', 9, 1),
(20, '2019-08-14 11:03:17.256640', '10', 'vijay', 1, '[{\"added\": {}}]', 11, 1),
(21, '2019-08-14 11:10:34.690557', '11', 'Paint', 1, '[{\"added\": {}}]', 12, 1),
(22, '2019-08-14 11:10:55.132120', '12', 'Aerosol', 1, '[{\"added\": {}}]', 12, 1),
(23, '2019-08-14 11:11:10.608182', '13', 'Roller', 1, '[{\"added\": {}}]', 12, 1),
(24, '2019-08-14 11:11:22.758859', '14', 'Roller', 1, '[{\"added\": {}}]', 12, 1),
(25, '2019-08-14 11:11:34.508361', '15', 'Applicator', 1, '[{\"added\": {}}]', 12, 1),
(26, '2019-08-14 11:12:26.629285', '16', 'Paint', 1, '[{\"added\": {}}]', 12, 1),
(27, '2019-08-14 11:20:09.496007', '17', 'Paint', 1, '[{\"added\": {}}]', 12, 1),
(28, '2019-08-14 11:20:48.510060', '17', 'Paint', 3, '', 12, 1),
(29, '2019-08-14 11:43:10.303280', '13', 'Roller', 3, '', 12, 1),
(30, '2019-08-14 11:43:10.404219', '11', 'Paint', 3, '', 12, 1),
(31, '2019-08-14 13:35:23.653926', '2', 'GDB INTERNAL WORKS', 1, '[{\"added\": {}}]', 10, 1),
(32, '2019-08-14 13:52:56.492416', '3', 'Outbound Projec', 1, '[{\"added\": {}}]', 10, 1),
(33, '2019-08-14 13:56:37.822548', '2', 'GDB INTERNAL WORKS', 2, '[{\"changed\": {\"fields\": [\"project_size\", \"project_unit_type\", \"project_units\", \"project_total_units\", \"project_cost_unit\"]}}]', 10, 1),
(34, '2019-08-14 14:27:55.993173', '4', 'Outbound Project', 1, '[{\"added\": {}}]', 10, 1),
(35, '2019-08-14 14:32:46.614765', '3', 'Outbound Projec', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_total_gallons\", \"project_cost_gallon\", \"project_cost_unit\", \"project_tmp_labor_cost\", \"project_total_labor_cost\"]}}]', 10, 1),
(36, '2019-08-21 09:48:37.699248', '3', 'Outbound Projec', 2, '[{\"changed\": {\"fields\": [\"project_units\"]}}]', 10, 1),
(37, '2019-08-21 11:21:56.174532', '1', 'Outbound Project', 1, '[{\"added\": {}}]', 10, 1),
(38, '2019-08-21 13:03:47.855796', '1', 'Outbound Project', 1, '[{\"added\": {}}]', 18, 1),
(39, '2019-08-21 13:18:39.650579', '7', 'G', 1, '[{\"added\": {}}]', 19, 1),
(40, '2019-08-21 13:45:54.696064', '8', 'G', 1, '[{\"added\": {}}]', 19, 1),
(41, '2019-08-22 09:00:01.645391', '1', 'Outbound Project', 2, '[{\"changed\": {\"fields\": [\"project_gdb_labor_cost\"]}}]', 18, 1),
(42, '2019-08-22 09:20:19.658059', '7', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_gallons\"]}}]', 19, 1),
(43, '2019-08-22 09:38:15.322669', '8', 'G', 2, '[]', 19, 1),
(44, '2019-08-22 09:44:54.637916', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_gallons\"]}}]', 19, 1),
(45, '2019-08-22 09:45:05.802428', '7', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_gallons\"]}}]', 19, 1),
(46, '2019-08-22 10:00:31.117441', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 19, 1),
(47, '2019-08-22 11:13:25.950135', '2', 'GDB INTERNAL WORKS', 1, '[{\"added\": {}}]', 18, 1),
(48, '2019-08-22 11:15:35.519494', '9', 'Others', 1, '[{\"added\": {}}]', 19, 1),
(49, '2019-08-22 11:32:48.017833', '9', 'Others', 2, '[{\"changed\": {\"fields\": [\"project_cost_gallon\"]}}]', 19, 1),
(50, '2019-08-22 11:38:06.557369', '2', 'GDB INTERNAL WORKS', 2, '[{\"changed\": {\"fields\": [\"project_tmp_labor_cost\", \"project_total_labor_cost\"]}}]', 18, 1),
(51, '2019-08-22 11:55:48.033680', '9', 'Others', 2, '[]', 19, 1),
(52, '2019-08-22 11:56:26.635060', '2', 'GDB INTERNAL WORKS', 2, '[{\"changed\": {\"fields\": [\"project_total_labor_cost\"]}}]', 18, 1),
(53, '2019-08-22 12:20:37.116492', '3', 'Outbound Project', 1, '[{\"added\": {}}]', 18, 1),
(54, '2019-08-22 12:33:02.636157', '10', 'Others', 1, '[{\"added\": {}}]', 19, 1),
(55, '2019-08-22 12:36:09.878988', '4', 'GDB Value Added (Roller Cover Sleeving)(SLEEVING)(Roller)', 1, '[{\"added\": {}}]', 18, 1),
(56, '2019-08-22 12:39:46.240330', '11', 'Others', 1, '[{\"added\": {}}]', 19, 1),
(57, '2019-08-22 13:21:35.455764', '5', 'GDB Value Added (Roller Sorting)(SORTING)(Roller)', 1, '[{\"added\": {}}]', 18, 1),
(58, '2019-08-22 13:23:08.644971', '12', 'Others', 1, '[{\"added\": {}}]', 19, 1),
(59, '2019-08-22 13:52:53.761505', '6', 'Outbound Project (Applicator Stickering)(STICKERING)(Applicator)', 1, '[{\"added\": {}}]', 18, 1),
(60, '2019-08-22 13:55:03.981911', '13', 'Others', 1, '[{\"added\": {}}]', 19, 1),
(61, '2019-08-22 13:57:53.277472', '11', 'Others(\")', 2, '[{\"changed\": {\"fields\": [\"project_unit_type\"]}}]', 19, 1),
(62, '2019-08-22 13:58:02.052531', '12', 'Others(\")', 2, '[{\"changed\": {\"fields\": [\"project_unit_type\"]}}]', 19, 1),
(63, '2019-08-22 13:58:26.159753', '10', 'Others(oz)', 2, '[{\"changed\": {\"fields\": [\"project_unit_type\"]}}]', 19, 1),
(64, '2019-08-22 14:45:26.198470', '5', 'GDB Value Added (Roller Sorting)(SORTING)(Roller)', 2, '[{\"changed\": {\"fields\": [\"project_tmp_labor_cost\", \"project_gdb_labor_cost\"]}}]', 18, 1),
(65, '2019-08-22 14:45:35.676043', '4', 'GDB Value Added (Roller Cover Sleeving)(SLEEVING)(Roller)', 2, '[{\"changed\": {\"fields\": [\"project_gdb_labor_cost\"]}}]', 18, 1),
(66, '2019-08-22 14:45:43.426943', '3', 'Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol)', 2, '[{\"changed\": {\"fields\": [\"project_gdb_labor_cost\"]}}]', 18, 1),
(67, '2019-08-23 05:50:46.775069', '1', 'Outbound Project (CUT & COMP)(CUT LABEL)(Paint)', 2, '[{\"changed\": {\"fields\": [\"size\"]}}]', 18, 1),
(68, '2019-08-23 05:51:25.070913', '3', 'Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol)', 2, '[{\"changed\": {\"fields\": [\"size\"]}}]', 18, 1),
(69, '2019-08-23 05:51:53.494372', '4', 'GDB Value Added (Roller Cover Sleeving)(SLEEVING)(Roller)', 2, '[{\"changed\": {\"fields\": [\"size\"]}}]', 18, 1),
(70, '2019-08-23 05:52:14.609920', '5', 'GDB Value Added (Roller Sorting)(SORTING)(Roller)', 2, '[{\"changed\": {\"fields\": [\"size\"]}}]', 18, 1),
(71, '2019-08-23 11:00:12.201713', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 19, 1),
(72, '2019-08-23 11:06:56.670410', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_gallons\"]}}]', 19, 1),
(73, '2019-08-23 11:07:31.301440', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_total_gallons\"]}}]', 19, 1),
(74, '2019-08-26 10:15:24.735767', '2', '10', 1, '[{\"added\": {}}]', 22, 1),
(75, '2019-08-26 10:15:38.081083', '7', 'G', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(76, '2019-08-26 10:15:46.918963', '8', 'G', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(77, '2019-08-26 10:32:12.925918', '2', '10', 2, '[{\"changed\": {\"fields\": [\"master_id\"]}}]', 22, 1),
(78, '2019-08-27 07:09:57.832471', '3', '0', 1, '[{\"added\": {}}]', 22, 1),
(79, '2019-08-27 07:12:23.413518', '4', '0', 1, '[{\"added\": {}}]', 22, 1),
(80, '2019-08-27 07:13:58.968128', '5', '0', 1, '[{\"added\": {}}]', 22, 1),
(81, '2019-08-27 07:15:14.234645', '6', '0', 1, '[{\"added\": {}}]', 22, 1),
(82, '2019-08-27 07:15:49.832669', '7', '0', 1, '[{\"added\": {}}]', 22, 1),
(83, '2019-08-27 12:14:50.336498', '2', '10', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_total_gallons\", \"project_cost_gallon\", \"project_cost_unit\"]}}]', 22, 1),
(84, '2019-08-27 12:20:59.469272', '3', '0', 2, '[{\"changed\": {\"fields\": [\"others\", \"project_total_units\", \"project_cost_unit\"]}}]', 22, 1),
(85, '2019-08-27 12:23:56.080117', '3', '0', 2, '[]', 22, 1),
(86, '2019-08-27 12:26:06.862392', '9', 'Others', 2, '[{\"changed\": {\"fields\": [\"project_units\"]}}]', 19, 1),
(87, '2019-08-27 12:26:50.887179', '10', 'Others(oz)', 2, '[{\"changed\": {\"fields\": [\"project_size\", \"project_units\"]}}]', 19, 1),
(88, '2019-08-27 12:32:06.577057', '4', '0', 2, '[{\"changed\": {\"fields\": [\"project_cost_unit\"]}}]', 22, 1),
(89, '2019-08-27 12:34:19.120717', '9', 'Others', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(90, '2019-08-27 12:35:22.384827', '3', '0 (0)(5)(GDB INTERNAL WORKS (Compactor)(None)(None))', 2, '[{\"changed\": {\"fields\": [\"others\", \"project_total_units\"]}}]', 22, 1),
(91, '2019-08-27 12:35:59.048485', '4', '0 (0)(6000)(Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 22, 1),
(92, '2019-08-27 13:11:17.244369', '10', 'Others(oz)', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(93, '2019-08-27 13:12:17.747357', '4', '0 (0)(6000)(Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol))', 2, '[]', 22, 1),
(94, '2019-08-27 13:13:40.975680', '4', '0 (0)(6000)(Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 22, 1),
(95, '2019-08-27 13:28:08.858226', '4', '0 (0)(6000)(Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol))', 2, '[]', 22, 1),
(96, '2019-08-27 14:07:43.763864', '9', 'Others', 2, '[]', 19, 1),
(97, '2019-08-27 14:07:50.517488', '4', '0 (0)(6000)(Outbound Project (Ollie\'s Aerosol Sorting)(STICKERING)(Aerosol))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 22, 1),
(98, '2019-08-27 14:09:45.440095', '3', '0 (0)(5)(GDB INTERNAL WORKS (Compactor)(None)(None))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 22, 1),
(99, '2019-08-27 14:11:10.967765', '5', '0 (0)(4950)(GDB Value Added (Roller Cover Sleeving)(SLEEVING)(Roller))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_cost_unit\"]}}]', 22, 1),
(100, '2019-08-27 14:12:43.423028', '6', '0 (0)(1170)(Outbound Project (Applicator Stickering)(STICKERING)(Applicator))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_cost_unit\"]}}]', 22, 1),
(101, '2019-08-27 14:13:17.820511', '7', '0 (0)(3770)(GDB Value Added (Roller Sorting)(SORTING)(Roller))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\", \"project_cost_unit\"]}}]', 22, 1),
(102, '2019-08-28 04:51:03.987014', '2', '15 (5)(0)(Outbound Project (CUT & COMP)(CUT LABEL)(Paint))', 2, '[{\"changed\": {\"fields\": [\"quarts\"]}}]', 22, 1),
(103, '2019-08-28 10:04:37.375448', '1', 'Compactor', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(104, '2019-08-28 10:04:44.573555', '3', 'CUT & COMP', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(105, '2019-08-28 10:04:50.669984', '2', 'Ollie\'s Aerosol Sorting', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(106, '2019-08-28 10:04:57.408676', '4', 'Roller Cover Sleeving', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(107, '2019-08-28 10:05:03.052639', '5', 'Roller Sorting', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(108, '2019-08-28 10:05:11.212174', '6', 'Applicator Stickering', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(109, '2019-08-28 10:05:17.570366', '7', 'Aerosol Stickering', 2, '[{\"changed\": {\"fields\": [\"target_project_id\"]}}]', 23, 1),
(110, '2019-08-28 10:05:21.973300', '8', 'PR19-5 PPG/ WM', 2, '[{\"changed\": {\"fields\": [\"target_projectname\", \"target_project_id\"]}}]', 23, 1),
(111, '2019-08-28 15:55:15.990697', '2', '10 (5)(0)(Outbound Project (CUT & COMP)(CUT LABEL)(Paint))', 2, '[]', 22, 1),
(112, '2019-08-28 15:58:13.377310', '2', '10 (5)(0)(Outbound Project (CUT & COMP)(CUT LABEL)(Paint))', 2, '[{\"changed\": {\"fields\": [\"project_total_units\"]}}]', 22, 1),
(113, '2019-08-28 15:58:50.660281', '2', '10 (5)(0)(Outbound Project (CUT & COMP)(CUT LABEL)(Paint))', 2, '[{\"changed\": {\"fields\": [\"project_cost_gallon\"]}}]', 22, 1),
(114, '2019-08-29 14:26:26.047798', '6', '0 (0)(1170)(Outbound Project (Applicator Stickering)(STICKERING)(Applicator))', 2, '[{\"changed\": {\"fields\": [\"project_cost_unit\"]}}]', 22, 1),
(115, '2019-09-03 12:55:05.707509', '5', 'GDB Value Added (Roller Sorting)(SORTING)(Roller)', 2, '[{\"changed\": {\"fields\": [\"project_date\"]}}]', 18, 1),
(116, '2019-09-03 12:55:48.476281', '6', 'Outbound Project (Applicator Stickering)(STICKERING)(Applicator)', 2, '[{\"changed\": {\"fields\": [\"project_date\"]}}]', 18, 1),
(117, '2019-09-26 14:47:25.457894', '1', 'Outbound Project (CUT & COMP)(CUT LABEL)(Paint)', 2, '[{\"changed\": {\"fields\": [\"eighteen_year_target\"]}}]', 18, 1),
(118, '2019-09-30 13:04:20.958166', '310', '0 (0)(3770)(GDB Value Added (Roller Sorting)(Roller)(SORTING))', 1, '[{\"added\": {}}]', 22, 1),
(119, '2019-09-30 13:21:28.070877', '12', 'Others(\")', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(120, '2019-09-30 13:25:48.713024', '12', 'Others(\")', 2, '[{\"changed\": {\"fields\": [\"quartpint_id\"]}}]', 19, 1),
(121, '2019-09-30 13:26:43.926015', '310', '0 (0)(3770)(GDB Value Added (Roller Sorting)(SORTING)(Roller))', 3, '', 22, 1),
(122, '2019-09-30 13:29:41.965736', '12', 'Others(\")', 3, '', 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(2, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'gdb_app', 'history'),
(10, 'gdb_app', 'master'),
(9, 'gdb_app', 'product'),
(8, 'gdb_app', 'project'),
(13, 'gdb_app', 'relationship'),
(11, 'gdb_app', 'supervisor'),
(12, 'gdb_app', 'work'),
(20, 'labour', 'gdbapplabour'),
(21, 'labour', 'gdblabour'),
(18, 'master', 'master'),
(15, 'master', 'product'),
(14, 'master', 'project'),
(22, 'master', 'quartpint'),
(19, 'master', 'relationship'),
(17, 'master', 'supervisor'),
(16, 'master', 'work'),
(6, 'sessions', 'session'),
(23, 'target', 'gdbtarget');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-08-13 13:04:12.985836'),
(2, 'auth', '0001_initial', '2019-08-13 13:04:25.165716'),
(3, 'admin', '0001_initial', '2019-08-13 13:04:28.020806'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-08-13 13:04:28.095957'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-13 13:04:28.168333'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-08-13 13:04:29.491774'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-08-13 13:04:30.960914'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-08-13 13:04:32.095963'),
(9, 'auth', '0004_alter_user_username_opts', '2019-08-13 13:04:32.146655'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-08-13 13:04:33.032014'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-08-13 13:04:33.099971'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-08-13 13:04:33.179737'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-08-13 13:04:34.033754'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-08-13 13:04:35.719927'),
(15, 'gdb_app', '0001_initial', '2019-08-13 13:04:36.144777'),
(16, 'sessions', '0001_initial', '2019-08-13 13:04:37.082008'),
(17, 'gdb_app', '0002_project', '2019-08-14 07:08:27.894464'),
(18, 'gdb_app', '0003_product', '2019-08-14 07:21:38.455892'),
(19, 'gdb_app', '0004_auto_20190814_0809', '2019-08-14 08:09:13.443978'),
(20, 'gdb_app', '0005_auto_20190814_0942', '2019-08-14 09:42:26.036178'),
(21, 'gdb_app', '0006_auto_20190814_1119', '2019-08-14 11:19:41.027749'),
(22, 'gdb_app', '0007_remove_work_work_product_category', '2019-08-14 11:35:55.610624'),
(23, 'gdb_app', '0008_master_work_id', '2019-08-14 11:41:44.107581'),
(24, 'gdb_app', '0009_auto_20190814_1158', '2019-08-14 11:58:38.611740'),
(25, 'gdb_app', '0010_auto_20190814_1352', '2019-08-14 13:52:46.164286'),
(26, 'gdb_app', '0011_auto_20190814_1421', '2019-08-14 14:21:21.807179'),
(27, 'gdb_app', '0012_auto_20190814_1424', '2019-08-14 14:25:03.683312'),
(28, 'gdb_app', '0013_auto_20190814_1426', '2019-08-14 14:26:28.967813'),
(29, 'gdb_app', '0014_auto_20190814_1427', '2019-08-14 14:27:48.740586'),
(30, 'gdb_app', '0015_auto_20190814_1432', '2019-08-14 14:32:39.096974'),
(31, 'master', '0001_initial', '2019-08-21 12:41:00.827348'),
(32, 'master', '0002_product', '2019-08-21 12:41:16.737857'),
(33, 'master', '0003_work', '2019-08-21 12:41:34.901544'),
(34, 'master', '0004_supervisor', '2019-08-21 12:42:01.592046'),
(35, 'master', '0005_master', '2019-08-21 12:42:27.253467'),
(36, 'master', '0006_relationship', '2019-08-21 12:42:52.738661'),
(37, 'master', '0007_auto_20190822_0958', '2019-08-22 09:58:56.589096'),
(38, 'master', '0008_master_size', '2019-08-23 05:50:00.700488'),
(39, 'labour', '0001_initial', '2019-08-26 05:43:08.391986'),
(40, 'labour', '0002_gdblabour', '2019-08-26 05:54:29.833784'),
(41, 'master', '0009_auto_20190826_1011', '2019-08-26 10:11:17.991294'),
(42, 'master', '0010_quartpint_master_id', '2019-08-26 10:31:25.461313'),
(43, 'master', '0011_quartpint_others', '2019-08-27 06:58:27.294909'),
(44, 'master', '0012_auto_20190827_1212', '2019-08-27 12:12:20.736236'),
(45, 'master', '0013_auto_20190827_1214', '2019-08-27 12:14:43.625035'),
(46, 'target', '0001_initial', '2019-08-28 08:18:45.207306'),
(47, 'target', '0002_auto_20190828_0818', '2019-08-28 08:18:45.272783'),
(48, 'target', '0003_auto_20190828_0820', '2019-08-28 08:23:10.863857'),
(49, 'target', '0004_auto_20190828_0941', '2019-08-28 09:41:37.174968'),
(50, 'master', '0014_master_project_pl', '2019-08-29 11:03:45.490238'),
(51, 'master', '0015_auto_20190829_1124', '2019-08-29 11:24:35.799367'),
(52, 'master', '0016_auto_20190829_1125', '2019-08-29 11:25:24.847943'),
(53, 'labour', '0003_auto_20190830_0654', '2019-08-30 06:54:28.472065');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('02j5h9o5wgj93pg5axqhdukxki01ovij', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-11 07:38:37.728094'),
('05vvmyul1cv1qij94ryjtye7c7fdfgl7', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-15 12:47:26.715275'),
('0hp65lpj0zz2g1eumb9uj6aryqk83vg9', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 07:36:22.259333'),
('149v0k53iwad7gse6rn6vhpr9d9agmco', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-24 06:37:37.579403'),
('1dmua0mz4trjsngbbvz9asjecvhg497o', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-05 03:41:33.691507'),
('1fkfl9l8q604q1hlicrrdkza70b5htv8', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2022-02-02 05:09:18.473050'),
('21h9pkij80smuqjem00u7vkpwuzz1btf', 'OGUxZjQxM2QzMTAwNDdhZWQyYWQwMjZiMzJkNzBlNWM5YzI3YjA5Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmZTUzMWQ4NWIwZmEwYzJlY2YwOWExYzc4YmQ3ZDIzMzFkMDhlMmVlIn0=', '2019-09-05 06:44:45.701868'),
('2crabrtvt289ae7jdgmqyjf8roppl7m3', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-11-04 05:51:02.740949'),
('2nlimtnastuk67l0rp1gueafabak6bhx', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:36:14.470583'),
('30bi5xktglsccm209ne8ws7mv5jtta9j', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 07:55:39.003948'),
('36r6wydyvm1druxy5wts8mazg49e41ax', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-15 13:45:37.704057'),
('372unqchldxgq585abr05pnz2pzvxoop', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-04-22 18:39:38.737654'),
('3g751grgftvwjnuyseti90oobdtl5kch', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-04 06:36:00.711229'),
('3is2gid8kk6v1r2wg4x8vki0iw2ehzx5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-09 05:54:33.314652'),
('3s2iw9twy7g5jl0bye4a0yrs85l7vri9', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-10-13 11:42:51.665015'),
('3uazjlm78dggo4qr35cvcaaepceefumy', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-31 17:33:15.353933'),
('4c10mqxqtua5cf3f5v514o8neahajhkp', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-06 12:03:40.252102'),
('4md1xgknxo0jkwgem8gvqiw7qmuh59s2', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-09 13:04:32.465121'),
('4nbcctdnggzovz6c8bo8bg04x1qgme98', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-05-04 10:16:06.180121'),
('511du6c80x3ngezv5ageb2l8ihnlk2i9', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-01 14:18:28.952727'),
('52shzeroepz26h0iu6anguj6kztrueo3', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-17 13:27:22.142434'),
('5466ny39185duva1ysqmdjzarnjkk5cp', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-02-12 12:56:31.151343'),
('5q4xjzjsez3ane58d2zco26hput44j77', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-03 12:49:19.827892'),
('5z6a34dipshpa4zfllxmm1lif8f5x7kw', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-30 07:41:42.618650'),
('68v5cvh0mfm7omhv6nydak3xcre7c3ww', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 09:47:56.903718'),
('6hxhflagbew50l9otrv32gz6gy9gm6mz', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-21 02:38:58.195931'),
('6q1i0zcipzx49hop4hzsu8u67j6g3lji', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-09-30 05:34:15.448412'),
('6y29qm5silm5fyjwddedvhibu41dsupe', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-24 17:00:38.962570'),
('7e0dueyr8cb4x4upn1blmiuxzca6ph86', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-16 22:09:28.979448'),
('7no1jchz71rtfcmnwbwe1s7e9v0rmksm', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-04 18:06:07.253940'),
('83i0by25dl2j7x6nb9mrwbbfvxyajw2o', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-06-18 05:23:59.988292'),
('88r1i6h01ufx27js0qlrq4rprf4prk7m', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-11 07:27:58.424396'),
('96aoi48bt7tp5ad6d58qfq06j5gdj9r0', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-09 04:41:16.174012'),
('9e38nutpsmoudlzqo9emfvo5za7jsaz4', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 08:04:21.234766'),
('9el4olvcgrfbpx2yg9s6h45uqygllep6', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-02-12 09:44:43.376494'),
('9mckwejda0cczj9no5v2p4nanxkp09yo', 'MmM5MzgzMWRjYTY0YzEyNGQzZjk5NmNjY2E2ZjZkYmY3N2UyZjY5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmU1MzFkODViMGZhMGMyZWNmMDlhMWM3OGJkN2QyMzMxZDA4ZTJlZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-09-13 08:10:40.127732'),
('a56hr5fejig2yjuz4z6z839d4q050mag', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-21 06:40:00.426088'),
('aa9hra7sv4up46fapsaneax5fh3a5wyj', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-07-19 13:10:26.949939'),
('agxz2rteb8sm4agjn1vxsz585m0scjlv', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-18 21:00:17.335820'),
('b0urf1cwi2oc6zj91497ag3bbjqjhmqf', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-13 14:00:07.733132'),
('b4crmll3jeya1wj8bqe7jaqz7mvux5qb', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-17 06:35:38.826608'),
('bnw17cdow578miuaqyomwx2jdlcwtkgg', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-15 06:34:28.822373'),
('cuuhthgomvoougrv4bnlu4rde7l4v7ej', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-07-06 11:28:40.884425'),
('cyqqq0iq1o4yvcm588vrhmc314mvh0ip', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-15 14:08:05.294491'),
('dpg1dcrj6ajs2ae0ceg20vo2cfpzpz3r', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-04-24 12:48:32.742761'),
('dpgrl2kk6pznay9hxun3xw6z4i40wbs4', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-03 04:42:49.944452'),
('dqrunjsa12800q472iqk4v9beiqmxl0z', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-26 08:53:44.090268'),
('dzxf34jztysz927qdn8up6t64qb4o0d8', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-11 07:06:30.456049'),
('e74nqhvccri7y3e9h454st4thuqtn2qz', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-03-11 05:38:04.409055'),
('ecqjqv1a31zdpw0p7ccjxtei4itifn93', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-08-03 07:04:27.958759'),
('emxzcmz94c4up0aalq09gzuwn0zynsva', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:38:02.972765'),
('f2wab8vavbxeinzf6i0gw9b0j1fj3kms', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-22 08:33:21.682668'),
('fdi81f5xemeakjlkxipyafxjze7a73j5', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-04-13 09:24:22.242214'),
('gcb11ck5wiq17z6y9wxz4l5ic823rkv8', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-11-25 10:21:59.005797'),
('gg0jhasowwyyjubn1x8g1yhpu2w28kr6', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-19 03:02:51.171863'),
('gk38t9154laxzkrav63g234uxaq7g5bz', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-06 17:37:24.080961'),
('gqf19mxogm7rgy2zfvgf0ibhb8p83k1s', 'NDNlNmQyZGI1NzYzNGEwZDc0YmRmYTg4Y2Q1OWU5MTUxZjYzNzkyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZTUzMWQ4NWIwZmEwYzJlY2YwOWExYzc4YmQ3ZDIzMzFkMDhlMmVlIn0=', '2019-09-05 06:21:49.674573'),
('gxltbvynv0o78xjauruefpq29bnctkfj', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 11:26:32.243709'),
('gyamal0semkhoysibn0b3etfwnj1y385', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-21 05:22:59.978793'),
('gypzlc3xeikh2mrsd85ahjuuxr0mr0r8', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-10-20 14:41:23.594606'),
('h3qyvn07885jxv86i6wttqzrdi4ygq58', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-26 05:14:56.299686'),
('hr5g7isn6yaqcs0z5wdlelirnur22r3g', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-26 15:47:11.928516'),
('hrvosk6hd65e96q5qp2txtudw4pnynwm', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-05 10:32:31.740355'),
('hz906ii878om7bp7yixz2co8kebphfo6', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-27 13:39:30.765034'),
('hzl6qkt357kvsg4lfbj817kbx6mpk5gj', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-16 07:05:57.080126'),
('ia8cst92sdbimygt5sqiogw7mtbrb9x3', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-01 12:09:59.623730'),
('iboxqgh50xihfpt610viq4w3b05eips5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-25 13:35:09.488320'),
('ijqh58qk68ue18odjjq4q7o9fga6wecj', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-31 22:07:38.154303'),
('ipolgk2pdbk1jv072jbcurl4zlkmr2ph', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-12 10:09:43.814805'),
('iwi6m2nux351fau38qfrvetkj4gbpp77', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-01 13:54:43.389947'),
('jew9c1vdmadr2ucqth6tltn0fe5gkx6t', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-21 03:58:40.333171'),
('jmh02t9qwiebqjeuaxrjh6uf0b7ttgjy', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-17 12:52:23.946834'),
('jq693qpzko3rvavkzbs5a3pqdoad4kdg', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2022-07-04 12:29:33.298891'),
('jsvs0jgb0dwpz2kccr8hwp5xdvsl2od5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-13 13:25:16.755796'),
('k1yie6v8anops5v25jxa6m0baqe21yen', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 07:21:45.102195'),
('k4iq582etsrxp17mnrra5qzb0rygbg5x', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:27:20.241884'),
('k5lbbezzrs7lfs4fyr0j0fjcla24fdf9', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-12-04 06:34:17.836233'),
('k6dn19mps2hst8hypmgyxzp7d0twh4f6', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-06-09 07:36:48.019646'),
('kchiluqutncgl6w4o16i1giigeeuf2m0', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-01 17:23:58.263601'),
('ke4bcgfteos15b7mhg0mfwnu18di85py', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-21 06:41:49.377889'),
('kngowzai0mmuxm04ja4ejf87zg6d4o3p', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-19 05:59:51.364561'),
('l2w66z3n198o40lfwxv4u5tzq5z8xnll', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-07 10:48:35.420051'),
('l99v4b2xlb54hmjetvc9uke32lraa2f9', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-18 10:13:04.279304'),
('lb4c4ls0rumapgjs6wu080d58y7q2swb', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 07:37:59.620091'),
('lonzvphe26gtv3xcnxosmymo6fmfz4gu', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-08 12:54:42.683672'),
('lp4yw93u37owzfsofzmkknd0s00k77k5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:48:04.590410'),
('lpmmvq3iduuhkmzscqic05pkdd1ml4ug', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-20 15:04:29.691927'),
('lun53qulzxotura12ira7my0zz6f9d0d', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-08 12:54:18.823551'),
('m8rgawjt3o777ujythcv44jrx543tv26', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 08:04:42.563075'),
('me3tik0humk56ckmpylm4r6fwgdl58ne', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-29 06:03:34.915828'),
('mknklc6rl5zxte1souwr2psz7shzvg4k', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-26 11:43:10.308117'),
('ms02eq81768sbmkte4mglf9ye9oeqd5n', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-07 11:34:46.852248'),
('n2i2udw4ly6fp22de87qty6zxxpdax3m', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-25 13:08:17.857684'),
('ng9d5q59dgqzd9hrt4zbbbju8etstyt8', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-05-13 15:20:29.509126'),
('nk5ddlixvpdm1iic3s3gnwn3n12c517k', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-02-24 05:54:13.300886'),
('oel3crqmsswse0nf5s7rcqrmgzoj5urc', 'MzMxMDY4ZWQ2MDM2YzVhNmVkNGJkYThmYjVlZGQ3NTA4MDdjYmYyYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmU1MzFkODViMGZhMGMyZWNmMDlhMWM3OGJkN2QyMzMxZDA4ZTJlZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-09-02 11:26:37.053194'),
('og58d77rppgbbl84ix5jqefhtblmn6g1', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-02 16:36:39.683219'),
('ol8uj1y9npkokykkummvcrze7d2tfjh5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-13 12:37:16.973021'),
('p0fa22jxqp57xeas5jhumipkvaq9pje0', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-10-21 13:33:59.101745'),
('p0v6szv0g260mvcnea0jqdn4uqe2vnfq', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 13:21:02.454986'),
('pclfjmnceqbcbwrrx4g780we269osay8', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-05 10:39:53.360476'),
('pdlqmp5v3mdamljjb9br2hihmr9mf2yv', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-29 14:00:26.666407'),
('pjoug6l9j4bsrotlea1wf6wquk5k78ze', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-18 12:07:21.915582'),
('pkma7z8ckmeansbl5by0chtinlyi9oke', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 07:40:48.516561'),
('q1t6k2ysnvst8hkot2yhpu9bqutw8w0e', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-02-12 09:26:05.950699'),
('q6crfpq8yxnw5eaiv031u77zabculb8k', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-11-18 08:07:40.710902'),
('qks1egsf2rjecgyjxpkoue34ehw53z8p', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-28 08:09:04.900637'),
('qz1li26srx12od7umd1owbngjtz997bf', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-30 07:39:06.660655'),
('rhq3fb3hs6u0n5pe3nxzgo1xk0tylee6', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-27 13:44:56.065950'),
('rr5oqnkv3uv2zgy1zwyu9o0id1gs28bk', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-26 06:46:07.939663'),
('sh27awuqxclood93hbr2sinjnla8qrfl', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-07-02 13:43:56.859083'),
('sj4tv3zu0cy8oh0vpyry71ij2zqfc4so', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-05 10:34:08.708989'),
('slrtevqyjq27h3cothoejm8hccg3i4yv', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-07 06:27:49.138468'),
('sqylyel4a5myflnxnioumely8oxtrg93', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:30:55.483003'),
('t48upyey97q6equavrriqkvw3cf5cvwa', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-06 12:06:38.945141'),
('t81pt8b893o3l9h1ie73d2wj1q3yatd3', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-09-16 16:43:53.555444'),
('tazm9bdse1abut37d8orp1rexn2u0q1d', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-04-15 05:25:14.145567'),
('td2v3v2uk8npd8b5v8fywhnt7m2nb2w8', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:14:45.970280'),
('td9kaj5qkrkki4p1bwb09ku4pjkak6id', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-12-26 02:44:11.875206'),
('txhh2x3ucz87h6rpluxewf2ctk2xrwqg', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-03-05 06:01:07.520147'),
('tzuk9wtnbocfax8eceswe6n62day8wl5', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-18 07:37:42.117727'),
('u4sdgtmqpjj1xghvq5b4e4qkdiv77a1w', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-16 06:33:36.524370'),
('uglh5tmpixxfzxrkifnsot10frsw51ol', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2022-02-16 09:51:41.913327'),
('ulbrzhmjyiz3kmudjxj0z3q4uli6y6kc', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-07-07 05:30:42.712938'),
('ulngbt2wew2ze52nbl82timjfz2u3chr', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-10-10 07:55:02.956788'),
('und2wdiguhbd3jkrma75es1xrcz9oxly', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 07:38:48.104056'),
('up3otwrynqqo0700mw6ww7mm1hjiabht', 'N2M5YWY2MGZhMzE5OTEwMWRjNDNlN2UwOTM1N2U5MDRiYTEzZjBjMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlNTMxZDg1YjBmYTBjMmVjZjA5YTFjNzhiZDdkMjMzMWQwOGUyZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-09-06 06:46:45.809826'),
('v00f8wxjthuhcxqmiqbphssz0fxioc3o', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-31 06:31:13.986793'),
('v6q77k40e9kjabykpw8ksefncbv5kvzg', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-21 06:40:25.212464'),
('v7mop5sofi2t0tt9sg357rj6ew3ea99v', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-11-09 17:50:23.952915'),
('vg2tm9j5ewapsd5evjeyq7sz4fb94re0', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-01-16 05:56:05.218414'),
('vgebmg4y1wyv93d96frnl2rslby9o22b', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-05-01 09:02:56.521666'),
('vpiixwcda44jigqlsrgxzsef87ldeyql', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-09-14 04:42:18.440182'),
('vz1rutd732dmsczcsg139oc60jfk8tuj', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-21 06:44:57.393879'),
('wavp9o2cwqkgew3w1skibp9jwxo57nr3', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-09-21 09:26:17.113802'),
('weeoelsoc686sy0s902yjfwfg0jnzi53', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-08-13 12:36:34.074097'),
('wmq9g2gipp8gdb4rhyb7ouz831lu51fv', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-05-21 13:35:48.074469'),
('wt2pckat5ommzdf5uilw7ucjeab7h0w2', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-15 07:10:22.198566'),
('wuva7oh5u6uonkfl9g4209ymk8uisd1q', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-05-04 06:26:46.481420'),
('wxdqwzvo1is8omi5hb2ych3fm5dildlu', 'MmM5MzgzMWRjYTY0YzEyNGQzZjk5NmNjY2E2ZjZkYmY3N2UyZjY5NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmU1MzFkODViMGZhMGMyZWNmMDlhMWM3OGJkN2QyMzMxZDA4ZTJlZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-09-13 08:13:59.337496'),
('xixrg42e1ls5uqhzebzzo16xmw8jwvem', 'OGUxZjQxM2QzMTAwNDdhZWQyYWQwMjZiMzJkNzBlNWM5YzI3YjA5Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmZTUzMWQ4NWIwZmEwYzJlY2YwOWExYzc4YmQ3ZDIzMzFkMDhlMmVlIn0=', '2019-09-10 09:44:00.627447'),
('xw2yyv3f1m565g1oi6eh07lvtt57ijl0', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-28 05:56:01.760469'),
('yx25hwp0a6h9652uvkvowazfreo9reaj', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-04-01 16:25:09.159566'),
('z49otll3ikmw3w9bbwczgmudgulwmt5y', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-08 06:38:34.858685'),
('z4xnr6sozqi69eyml08ekqnodet2byya', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-02-17 21:54:53.837992'),
('z6m9kd7g6eerjff9vl6swk5qzoe598ai', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2019-11-28 06:54:51.168057'),
('z6q8lmgayueaykbvys3hvaq2kbajsh4x', 'NjQwMzlhYmFlYTBiZTkyODUyYTUxYjhjZTRhYjQzZjVmZWY3MGY2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUxM2Y1YmIxODMyZDVlMzczYjI0MDhjMDVlMjUxNzZhZDM3ZTUyIn0=', '2021-03-30 06:45:52.115107'),
('zgmy1evh16f90w9vx7z9pcyxnx0kl8j9', 'MjEyNjg2YmQ3NzA5MzQ4MWZiN2I4ODI5Nzg5YWMzOGNjZTUyMDVkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNmUxY2NlMTE4OGQwOGU4NTY0OTEwYWZmZmRhY2U4MTRjMTI4MWY4In0=', '2020-05-28 06:00:33.601967');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_app_master`
--

CREATE TABLE `gdb_app_master` (
  `id` int(11) NOT NULL,
  `project_date` date NOT NULL,
  `project_group` varchar(100) DEFAULT NULL,
  `project_shift` varchar(100) DEFAULT NULL,
  `project_q` varchar(100) DEFAULT NULL,
  `project_whse` int(11) NOT NULL,
  `project_tmp_labor_hrs` int(11) NOT NULL,
  `project_gdb_labor_hrs` int(11) NOT NULL,
  `project_tmp_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_gdb_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_total_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_description` longtext,
  `project_customer` varchar(100) DEFAULT NULL,
  `master_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_app_master`
--

INSERT INTO `gdb_app_master` (`id`, `project_date`, `project_group`, `project_shift`, `project_q`, `project_whse`, `project_tmp_labor_hrs`, `project_gdb_labor_hrs`, `project_tmp_labor_cost`, `project_gdb_labor_cost`, `project_total_labor_cost`, `project_description`, `project_customer`, `master_status`) VALUES
(1, '2019-04-01', 'Outbound Project', 'EVENING', 'S7948,S7664', 19, 3, 0, '43.50', NULL, '43.50', '1G and 5G cans were scraped and relabeled for outbound order', 'Resin, Pinturas', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_app_product`
--

CREATE TABLE `gdb_app_product` (
  `id` int(11) NOT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `product_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_app_product`
--

INSERT INTO `gdb_app_product` (`id`, `product_category`, `product_status`) VALUES
(1, 'CUT LABEL', 'active'),
(2, 'STICKERING', 'active'),
(3, 'SLEEVING', 'active'),
(4, 'SORTING', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_app_project`
--

CREATE TABLE `gdb_app_project` (
  `id` int(100) NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_app_project`
--

INSERT INTO `gdb_app_project` (`id`, `project_name`, `status`) VALUES
(1, 'Compactor', 'active'),
(2, 'CUT & COMP', 'active'),
(3, 'Ollie\'s Aerosol Sorting', 'active'),
(4, 'Roller Cover Sleeving', 'active'),
(5, 'Roller Sorting', 'active'),
(6, 'Applicator Stickering', 'active'),
(7, 'Aerosol Stickering', 'active'),
(8, 'Roller Sorting', 'active'),
(9, 'PR19-5 PPG/ WM ', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_app_supervisor`
--

CREATE TABLE `gdb_app_supervisor` (
  `id` int(11) NOT NULL,
  `supervisor_name` varchar(100) DEFAULT NULL,
  `supervisor_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_app_supervisor`
--

INSERT INTO `gdb_app_supervisor` (`id`, `supervisor_name`, `supervisor_status`) VALUES
(1, 'Laurie', 'active'),
(2, 'DEEPAK', 'active'),
(3, 'RAVI', 'active'),
(4, 'AMIT', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_app_work`
--

CREATE TABLE `gdb_app_work` (
  `id` int(11) NOT NULL,
  `work_type` varchar(100) DEFAULT NULL,
  `work_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_app_work`
--

INSERT INTO `gdb_app_work` (`id`, `work_type`, `work_status`) VALUES
(12, 'Aerosol', 'active'),
(14, 'Roller', 'active'),
(15, 'Applicator', 'active'),
(16, 'Paint', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_labour`
--

CREATE TABLE `gdb_labour` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `no_of_temp_labour` int(11) NOT NULL,
  `no_of_gdb_labour` int(11) NOT NULL,
  `temp_hours` decimal(6,2) NOT NULL,
  `gdb_hours` decimal(6,2) NOT NULL,
  `temp_cost` decimal(10,2) NOT NULL,
  `gdb_cost` decimal(10,2) NOT NULL,
  `labour_cost` decimal(10,2) NOT NULL,
  `profit` decimal(10,2) NOT NULL,
  `loss` decimal(10,2) NOT NULL,
  `net_pl` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_labour`
--

INSERT INTO `gdb_labour` (`id`, `date`, `no_of_temp_labour`, `no_of_gdb_labour`, `temp_hours`, `gdb_hours`, `temp_cost`, `gdb_cost`, `labour_cost`, `profit`, `loss`, `net_pl`) VALUES
(1, '2019-01-02', 31, 20, '248.00', '160.00', '3596.00', '1760.00', '5356.00', '647.00', '18.00', '629.00'),
(2, '2019-01-03', 31, 20, '248.00', '160.00', '3596.00', '1760.00', '5356.00', '806.16', '271.40', '534.76'),
(3, '2019-01-08', 34, 20, '272.00', '160.00', '3944.00', '1760.00', '5704.00', '511.81', '0.00', '511.81'),
(4, '2019-01-09', 34, 20, '272.00', '160.00', '3944.00', '1760.00', '5704.00', '759.41', '0.00', '759.41'),
(5, '2019-01-10', 39, 20, '312.00', '160.00', '4524.00', '1760.00', '6284.00', '996.45', '0.00', '996.45'),
(18, '2019-10-02', 31, 20, '248.00', '160.00', '3596.00', '1760.00', '5356.00', '647.00', '18.00', '629.00'),
(19, '2019-10-03', 31, 20, '248.00', '160.00', '3596.00', '1760.00', '5356.00', '806.16', '271.40', '534.76'),
(20, '2019-10-08', 34, 20, '272.00', '160.00', '3944.00', '1760.00', '5704.00', '511.81', '0.00', '511.81'),
(21, '2019-10-09', 34, 20, '272.00', '160.00', '3944.00', '1760.00', '5704.00', '759.41', '0.00', '759.41'),
(22, '2019-10-10', 39, 20, '312.00', '160.00', '4524.00', '1760.00', '6284.00', '996.45', '0.00', '996.45'),
(25, '2019-10-21', 31, 20, '248.00', '160.00', '3596.00', '1760.00', '5356.00', '806.16', '-792.48', '534.76'),
(33, '2019-12-11', 6, 9, '48.00', '72.00', '696.00', '792.00', '1488.00', '487.20', '0.00', '487.20'),
(34, '2019-09-13', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(35, '2019-09-16', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(36, '2019-09-17', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(37, '2019-09-18', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(38, '2019-09-19', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(39, '2019-09-20', 2, 3, '16.00', '24.00', '232.00', '264.00', '496.00', '0.00', '0.00', '0.00'),
(40, '2019-09-23', 3, 2, '22.00', '16.00', '311.75', '176.00', '487.75', '0.00', '0.00', '0.00'),
(41, '2019-09-24', 1, 3, '10.00', '24.00', '137.75', '264.00', '401.75', '0.00', '0.00', '0.00'),
(42, '2019-09-25', 6, 3, '35.00', '24.00', '500.25', '264.00', '764.25', '0.00', '0.00', '0.00'),
(43, '2019-09-26', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(44, '2019-09-27', 5, 2, '40.00', '16.00', '580.00', '176.00', '756.00', '0.00', '0.00', '0.00'),
(45, '2019-09-30', 3, 4, '24.00', '32.00', '348.00', '352.00', '700.00', '0.00', '0.00', '0.00'),
(46, '2019-10-01', 2, 4, '16.00', '32.00', '232.00', '352.00', '584.00', '0.00', '0.00', '0.00'),
(47, '2019-10-04', 5, 4, '36.00', '32.00', '522.00', '352.00', '874.00', '0.00', '0.00', '0.00'),
(48, '2019-10-07', 2, 4, '12.00', '32.00', '174.00', '352.00', '526.00', '0.00', '0.00', '0.00'),
(49, '2019-10-11', 8, 4, '64.00', '28.00', '928.00', '308.00', '1236.00', '0.00', '0.00', '0.00'),
(50, '2019-10-14', 6, 4, '48.00', '32.00', '696.00', '352.00', '1048.00', '0.00', '0.00', '0.00'),
(51, '2019-10-15', 4, 8, '32.00', '64.00', '464.00', '704.00', '1168.00', '0.00', '0.00', '0.00'),
(52, '2019-10-16', 4, 4, '26.00', '32.00', '377.00', '352.00', '729.00', '0.00', '0.00', '0.00'),
(53, '2019-10-17', 6, 4, '48.00', '32.00', '696.00', '352.00', '1048.00', '0.00', '0.00', '0.00'),
(54, '2019-10-18', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(55, '2019-10-22', 6, 2, '48.00', '16.00', '696.00', '176.00', '872.00', '0.00', '0.00', '0.00'),
(56, '2019-10-23', 7, 2, '56.00', '16.00', '812.00', '176.00', '988.00', '0.00', '0.00', '0.00'),
(57, '2019-10-24', 5, 2, '40.00', '16.00', '580.00', '176.00', '756.00', '0.00', '0.00', '0.00'),
(58, '2019-10-25', 3, 3, '24.00', '24.00', '348.00', '264.00', '612.00', '0.00', '0.00', '0.00'),
(59, '2019-10-28', 5, 2, '40.00', '16.00', '580.00', '176.00', '756.00', '0.00', '0.00', '0.00'),
(60, '2019-10-29', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(61, '2019-10-30', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(62, '2019-10-31', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(63, '2019-11-01', 2, 2, '13.00', '16.00', '188.50', '176.00', '364.50', '0.00', '0.00', '0.00'),
(64, '2019-11-04', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(65, '2019-11-05', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(66, '2019-11-06', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(67, '2019-11-07', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(68, '2019-11-08', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(69, '2019-11-11', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(70, '2019-11-12', 2, 2, '16.00', '16.00', '232.00', '176.00', '408.00', '0.00', '0.00', '0.00'),
(71, '2019-11-13', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(72, '2019-11-14', 4, 1, '32.00', '8.00', '464.00', '88.00', '552.00', '0.00', '0.00', '0.00'),
(73, '2019-11-15', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(74, '2019-11-18', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(75, '2019-11-19', 4, 1, '32.00', '8.00', '464.00', '88.00', '552.00', '0.00', '0.00', '0.00'),
(76, '2019-12-02', 5, 2, '40.00', '16.00', '580.00', '176.00', '756.00', '0.00', '0.00', '0.00'),
(77, '2019-12-03', 4, 2, '28.00', '16.00', '406.00', '176.00', '582.00', '0.00', '0.00', '0.00'),
(78, '2019-12-04', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(79, '2019-12-05', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(80, '2019-12-06', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(81, '2019-12-09', 3, 1, '24.00', '8.00', '348.00', '88.00', '436.00', '0.00', '0.00', '0.00'),
(82, '2019-12-10', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(83, '2019-12-13', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(84, '2019-12-16', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(85, '2019-12-17', 2, 1, '16.00', '8.00', '232.00', '88.00', '320.00', '0.00', '0.00', '0.00'),
(86, '2019-12-18', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(87, '2019-12-19', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(88, '2019-12-20', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(89, '2019-12-23', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(90, '2019-12-24', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(91, '2019-12-27', 3, 2, '24.00', '16.00', '348.00', '176.00', '524.00', '0.00', '0.00', '0.00'),
(92, '2019-12-30', 3, 1, '24.00', '8.00', '348.00', '88.00', '436.00', '0.00', '0.00', '0.00'),
(93, '2019-12-31', 4, 2, '32.00', '16.00', '464.00', '176.00', '640.00', '0.00', '0.00', '0.00'),
(114, '2020-08-03', 5, 9, '40.00', '72.00', '580.00', '792.00', '1372.00', '0.00', '0.00', '0.00'),
(115, '2020-08-04', 5, 9, '40.00', '72.00', '580.00', '792.00', '1372.00', '0.00', '0.00', '0.00'),
(116, '2020-08-05', 5, 9, '40.00', '72.00', '580.00', '792.00', '1372.00', '0.00', '0.00', '0.00'),
(117, '2020-08-06', 5, 9, '40.00', '72.00', '580.00', '792.00', '1372.00', '0.00', '0.00', '0.00'),
(118, '2020-08-07', 5, 9, '40.00', '72.00', '580.00', '792.00', '1372.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_master`
--

CREATE TABLE `gdb_master` (
  `project_master_id` int(155) NOT NULL,
  `project_date` date NOT NULL,
  `project_group` varchar(155) NOT NULL,
  `project_shift` varchar(155) NOT NULL,
  `project_q` text NOT NULL,
  `project_whse` int(155) NOT NULL,
  `project_id` int(155) NOT NULL,
  `product_id` int(155) NOT NULL,
  `supervisor_id` int(155) NOT NULL,
  `project_size` text NOT NULL,
  `project_unit_type` varchar(155) NOT NULL,
  `project_units` text NOT NULL,
  `project_total_units` int(155) NOT NULL,
  `project_total_gallons` int(155) NOT NULL,
  `project_cost_gallon` int(155) NOT NULL,
  `project_cost_unit` int(155) NOT NULL,
  `project_tmp_labor_hrs` int(100) NOT NULL,
  `project_gdb_labor_hrs` int(100) NOT NULL,
  `project_tmp_labor_cost` decimal(10,0) NOT NULL,
  `project_gdb_labor_cost` decimal(10,0) NOT NULL,
  `project_total_labor_cost` decimal(10,0) NOT NULL,
  `project_description` text NOT NULL,
  `project_customer` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_master`
--

INSERT INTO `gdb_master` (`project_master_id`, `project_date`, `project_group`, `project_shift`, `project_q`, `project_whse`, `project_id`, `product_id`, `supervisor_id`, `project_size`, `project_unit_type`, `project_units`, `project_total_units`, `project_total_gallons`, `project_cost_gallon`, `project_cost_unit`, `project_tmp_labor_hrs`, `project_gdb_labor_hrs`, `project_tmp_labor_cost`, `project_gdb_labor_cost`, `project_total_labor_cost`, `project_description`, `project_customer`) VALUES
(1, '2019-04-01', 'Outbound Project', 'Evening', 'S7948,S7664', 19, 1, 1, 1, '1,5', 'G', '130,25', 155, 255, 0, 0, 3, 0, '44', '0', '44', '1G and 5G cans were scraped and relabeled for outbound order', 'Resin, Pinturas');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_product`
--

CREATE TABLE `gdb_product` (
  `product_id` int(155) NOT NULL,
  `product_category` varchar(155) NOT NULL,
  `product_work_type` varchar(155) NOT NULL,
  `product_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_product`
--

INSERT INTO `gdb_product` (`product_id`, `product_category`, `product_work_type`, `product_status`) VALUES
(1, 'Paint', 'CUT LABEL', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_project`
--

CREATE TABLE `gdb_project` (
  `project_id` int(155) NOT NULL,
  `project_name` varchar(155) NOT NULL,
  `project_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_project`
--

INSERT INTO `gdb_project` (`project_id`, `project_name`, `project_status`) VALUES
(1, 'CUT & COMP', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gdb_supervisor`
--

CREATE TABLE `gdb_supervisor` (
  `supervisor_id` int(155) NOT NULL,
  `supervisor_name` varchar(155) NOT NULL,
  `supervisor_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gdb_supervisor`
--

INSERT INTO `gdb_supervisor` (`supervisor_id`, `supervisor_name`, `supervisor_status`) VALUES
(1, 'Deepak', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `master_master`
--

CREATE TABLE `master_master` (
  `id` int(11) NOT NULL,
  `project_date` date NOT NULL,
  `project_group` varchar(100) DEFAULT NULL,
  `project_shift` varchar(100) DEFAULT NULL,
  `project_q` varchar(100) DEFAULT NULL,
  `project_whse` varchar(100) NOT NULL,
  `project_tmp_labor_hrs` decimal(6,2) NOT NULL,
  `project_gdb_labor_hrs` decimal(6,2) NOT NULL,
  `project_tmp_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_gdb_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_total_labor_cost` decimal(6,2) DEFAULT NULL,
  `project_description` longtext,
  `project_customer` varchar(100) DEFAULT NULL,
  `master_status` varchar(20) NOT NULL,
  `product_id_id` int(11) DEFAULT NULL,
  `project_id_id` int(11) DEFAULT NULL,
  `supervisor_id_id` int(11) DEFAULT NULL,
  `work_id_id` int(11) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `project_pl` decimal(10,2) DEFAULT NULL,
  `eighteen_year_target` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_master`
--

INSERT INTO `master_master` (`id`, `project_date`, `project_group`, `project_shift`, `project_q`, `project_whse`, `project_tmp_labor_hrs`, `project_gdb_labor_hrs`, `project_tmp_labor_cost`, `project_gdb_labor_cost`, `project_total_labor_cost`, `project_description`, `project_customer`, `master_status`, `product_id_id`, `project_id_id`, `supervisor_id_id`, `work_id_id`, `size`, `project_pl`, `eighteen_year_target`) VALUES
(2193, '2019-11-01', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2194, '2019-09-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2195, '2019-09-16', 'Outbound Project', 'MORNING', 'S01365', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'Scraping the G5 pails and relabeling the G1 and G5 with DC ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2196, '2019-09-17', 'Outbound Project', 'MORNING', 'S01520', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'cut and comp the restricted brands ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2197, '2019-09-18', 'Outbound Project', 'MORNING', 'S1630', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'Cut and comp the restricted brands ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2198, '2019-09-19', 'Outbound Project', 'MORNING', 'S1496', '19', '24.00', '16.00', '348.00', '176.00', '524.00', ' Involves taking out quarts from boxes, sticker, pallatize them and break down cardboard boxes. ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2199, '2019-09-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '232.00', '264.00', '496.00', 'had only 2 people only the entire day. 2 left at lunch feeling sick but still we made 3168 units with the colors we had. 3 pallets  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2200, '2019-09-23', 'Outbound Project', 'MORNING', '', '19', '22.00', '16.00', '312.00', '176.00', '488.00', 'had teddy and linda hand relabel black aerosols ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2201, '2019-09-24', 'Outbound Project', 'MORNING', '', '19', '10.00', '24.00', '138.00', '264.00', '402.00', 'michael had to cut label. Linda and teddy had to relabel. William had to scrap all the 5 gallon buckets and relabel them. ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2202, '2019-09-25', 'Outbound Project', 'MORNING', '', '19', '35.00', '24.00', '500.00', '264.00', '764.00', 'we trained robert langwith on sleeving today. He has to dump the rollers on table and sleeve it and put it in a box and palletize it ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2203, '2019-09-26', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'had mike and william sort SPP quarts  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2204, '2019-09-27', 'Outbound Project', 'MORNING', 'S1496', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2205, '2019-09-30', 'Outbound Project', 'MORNING', '', '19', '24.00', '32.00', '348.00', '352.00', '700.00', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2206, '2019-10-01', 'Outbound Project', 'MORNING', 'S2761', '19', '16.00', '32.00', '232.00', '352.00', '584.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2207, '2019-10-02', 'Outbound Project', 'MORNING', 'S01855', '19', '32.00', '32.00', '464.00', '352.00', '816.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2208, '2019-10-03', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2209, '2019-10-04', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2210, '2019-10-07', 'Outbound Project', 'MORNING', 'S#2946', '19', '12.00', '32.00', '174.00', '352.00', '526.00', 'Separating the 12oz from 16oz; sorting the 12oz by colors and sticker the ollies sticker over the bar code and box them as raibow in a box.  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2211, '2019-10-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2212, '2019-10-09', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2213, '2019-10-10', 'Outbound Project', 'MORNING', 'S2761', '19', '52.00', '28.00', '754.00', '308.00', '1062.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2214, '2019-10-11', 'Outbound Project', 'MORNING', '', '19', '64.00', '28.00', '928.00', '308.00', '1236.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2215, '2019-10-14', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2216, '2019-10-15', 'Outbound Project', 'MORNING', '', '19', '32.00', '64.00', '464.00', '704.00', '1168.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2217, '2019-10-16', 'Outbound Project', 'MORNING', '', '19', '26.00', '32.00', '377.00', '352.00', '729.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2218, '2019-10-17', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2219, '2019-10-18', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2220, '2019-10-21', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2221, '2019-10-22', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2222, '2019-10-23', 'Outbound Project', 'MORNING', '', '19', '56.00', '16.00', '812.00', '176.00', '988.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2223, '2019-10-24', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2224, '2019-10-25', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '348.00', '264.00', '612.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2225, '2019-10-28', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2226, '2019-10-29', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2227, '2019-10-30', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2228, '2019-10-31', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2229, '2019-11-01', 'Outbound Project', 'MORNING', '', '19', '13.00', '16.00', '189.00', '176.00', '365.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2230, '2019-11-04', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2231, '2019-11-05', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2232, '2019-11-06', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2233, '2019-11-07', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2234, '2019-11-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2235, '2019-11-11', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2236, '2019-11-12', 'Outbound Project', 'MORNING', '', '19', '16.00', '16.00', '232.00', '176.00', '408.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2237, '2019-11-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2238, '2019-11-14', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2239, '2019-11-15', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2240, '2019-11-18', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2241, '2019-11-19', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2242, '2019-10-18', 'Outbound Project', 'MORNING', '', '19', '16.00', '8.00', '232.00', '88.00', '320.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2243, '2019-10-21', 'Outbound Project', 'MORNING', '', '19', '16.00', '16.00', '232.00', '176.00', '408.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2244, '2019-10-22', 'Outbound Project', 'MORNING', '', '19', '16.00', '16.00', '232.00', '176.00', '408.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2245, '2019-10-23', 'Outbound Project', 'MORNING', '', '19', '48.00', '8.00', '696.00', '88.00', '784.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2246, '2019-10-24', 'Outbound Project', 'MORNING', '', '19', '40.00', '8.00', '580.00', '88.00', '668.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2247, '2019-10-25', 'Outbound Project', 'MORNING', '', '19', '16.00', '8.00', '232.00', '88.00', '320.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2248, '2019-10-28', 'Outbound Project', 'MORNING', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2249, '2019-10-29', 'Outbound Project', 'MORNING', '', '19', '16.00', '8.00', '232.00', '88.00', '320.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2250, '2019-10-30', 'Outbound Project', 'MORNING', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2251, '2019-10-31', 'Outbound Project', 'MORNING', '', '19', '72.00', '16.00', '1044.00', '176.00', '1220.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2252, '2019-11-01', 'Outbound Project', 'MORNING', '', '19', '61.00', '16.00', '885.00', '176.00', '1061.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2253, '2019-11-04', 'Outbound Project', 'MORNING', '', '19', '80.00', '16.00', '1160.00', '176.00', '1336.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2254, '2019-11-05', 'Outbound Project', 'MORNING', '', '19', '64.00', '16.00', '928.00', '176.00', '1104.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2255, '2019-11-06', 'Outbound Project', 'MORNING', '', '19', '43.00', '16.00', '624.00', '176.00', '800.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2256, '2019-11-07', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2257, '2019-11-08', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2258, '2019-11-11', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2259, '2019-11-12', 'Outbound Project', 'MORNING', '', '19', '56.00', '0.00', '812.00', '0.00', '812.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2260, '2019-11-13', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2261, '2019-11-14', 'Outbound Project', 'MORNING', '', '19', '45.00', '8.00', '653.00', '88.00', '741.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2262, '2019-11-15', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2263, '2019-11-18', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2264, '2019-11-19', 'Outbound Project', 'MORNING', '', '19', '64.00', '16.00', '928.00', '176.00', '1104.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2265, '2019-11-20', 'Outbound Project', 'MORNING', '', '19', '72.00', '32.00', '1044.00', '352.00', '1396.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2266, '2019-11-21', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2267, '2019-11-22', 'Outbound Project', 'MORNING', '', '19', '80.00', '24.00', '1160.00', '264.00', '1424.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2268, '2019-11-25', 'Outbound Project', 'MORNING', '', '19', '16.00', '8.00', '232.00', '88.00', '320.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2269, '2019-11-26', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2270, '2019-11-27', 'Outbound Project', 'MORNING', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2271, '2019-12-02', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2272, '2019-12-03', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2273, '2019-09-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2274, '2019-09-16', 'Outbound Project', 'MORNING', 'S01365', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'Scraping the G5 pails and relabeling the G1 and G5 with DC ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2275, '2019-09-17', 'Outbound Project', 'MORNING', 'S01520', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'cut and comp the restricted brands ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2276, '2019-09-18', 'Outbound Project', 'MORNING', 'S1630', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'Cut and comp the restricted brands ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2277, '2019-09-19', 'Outbound Project', 'MORNING', 'S1496', '19', '24.00', '16.00', '348.00', '176.00', '524.00', ' Involves taking out quarts from boxes, sticker, pallatize them and break down cardboard boxes. ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2278, '2019-09-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '232.00', '264.00', '496.00', 'had only 2 people only the entire day. 2 left at lunch feeling sick but still we made 3168 units with the colors we had. 3 pallets  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2279, '2019-09-23', 'Outbound Project', 'MORNING', '', '19', '22.00', '16.00', '312.00', '176.00', '488.00', 'had teddy and linda hand relabel black aerosols ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2280, '2019-09-24', 'Outbound Project', 'MORNING', '', '19', '10.00', '24.00', '138.00', '264.00', '402.00', 'michael had to cut label. Linda and teddy had to relabel. William had to scrap all the 5 gallon buckets and relabel them. ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2281, '2019-09-25', 'Outbound Project', 'MORNING', '', '19', '35.00', '24.00', '500.00', '264.00', '764.00', 'we trained robert langwith on sleeving today. He has to dump the rollers on table and sleeve it and put it in a box and palletize it ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2282, '2019-09-26', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', 'had mike and william sort SPP quarts  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2283, '2019-09-27', 'Outbound Project', 'MORNING', 'S1496', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2284, '2019-09-30', 'Outbound Project', 'MORNING', '', '19', '24.00', '32.00', '348.00', '352.00', '700.00', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2285, '2019-10-01', 'Outbound Project', 'MORNING', 'S2761', '19', '16.00', '32.00', '232.00', '352.00', '584.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2286, '2019-10-02', 'Outbound Project', 'MORNING', 'S01855', '19', '32.00', '32.00', '464.00', '352.00', '816.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2287, '2019-10-03', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2288, '2019-10-04', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2289, '2019-10-07', 'Outbound Project', 'MORNING', 'S#2946', '19', '12.00', '32.00', '174.00', '352.00', '526.00', 'Separating the 12oz from 16oz; sorting the 12oz by colors and sticker the ollies sticker over the bar code and box them as raibow in a box.  ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2290, '2019-10-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2291, '2019-10-09', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2292, '2019-10-10', 'Outbound Project', 'MORNING', 'S2761', '19', '52.00', '28.00', '754.00', '308.00', '1062.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2293, '2019-10-11', 'Outbound Project', 'MORNING', '', '19', '64.00', '28.00', '928.00', '308.00', '1236.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2294, '2019-10-14', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2295, '2019-10-15', 'Outbound Project', 'MORNING', '', '19', '32.00', '64.00', '464.00', '704.00', '1168.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2296, '2019-10-16', 'Outbound Project', 'MORNING', '', '19', '26.00', '32.00', '377.00', '352.00', '729.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2297, '2019-10-17', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2298, '2019-10-18', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2299, '2019-10-21', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2300, '2019-10-22', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2301, '2019-10-23', 'Outbound Project', 'MORNING', '', '19', '56.00', '16.00', '812.00', '176.00', '988.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2302, '2019-10-24', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2303, '2019-10-25', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '348.00', '264.00', '612.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2304, '2019-10-28', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2305, '2019-10-29', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2306, '2019-10-30', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2307, '2019-10-31', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2308, '2019-11-01', 'Outbound Project', 'MORNING', '', '19', '13.00', '16.00', '189.00', '176.00', '365.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2309, '2019-11-04', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2310, '2019-11-05', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2311, '2019-11-06', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2312, '2019-11-07', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2313, '2019-11-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2314, '2019-11-11', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2315, '2019-11-12', 'Outbound Project', 'MORNING', '', '19', '16.00', '16.00', '232.00', '176.00', '408.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2316, '2019-11-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2317, '2019-11-14', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2318, '2019-11-15', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2319, '2019-11-18', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2320, '2019-11-19', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2321, '2019-12-04', 'Outbound Project', 'MORNING', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2322, '2019-12-05', 'Outbound Project', 'MORNING', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2323, '2019-12-06', 'Outbound Project', 'MORNING', '', '19', '32.00', '0.00', '464.00', '0.00', '464.00', '', 'OLLIE\'s', 'active', 18, 74, 8, 21, 'G1', NULL, NULL),
(2324, '2019-12-02', 'Outbound Project', 'Morning', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2326, '2019-12-03', 'Outbound Project', 'Morning', '', '19', '28.00', '16.00', '406.00', '176.00', '582.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2328, '2019-12-04', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2330, '2019-12-05', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2331, '2019-12-06', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2333, '2019-12-09', 'Outbound Project', 'Morning', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2335, '2019-12-10', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2336, '2019-12-11', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2348, '2019-09-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2349, '2019-09-16', 'Outbound Project', 'MORNING', 'S01365', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2350, '2019-09-17', 'Outbound Project', 'MORNING', 'S01520', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2351, '2019-09-18', 'Outbound Project', 'MORNING', 'S1630', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2352, '2019-09-19', 'Outbound Project', 'MORNING', 'S1496', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2353, '2019-09-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '232.00', '264.00', '496.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2354, '2019-09-23', 'Outbound Project', 'MORNING', '', '19', '22.00', '16.00', '312.00', '176.00', '488.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2355, '2019-09-24', 'Outbound Project', 'MORNING', '', '19', '10.00', '24.00', '138.00', '264.00', '402.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2356, '2019-09-25', 'Outbound Project', 'MORNING', '', '19', '35.00', '24.00', '500.00', '264.00', '764.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2357, '2019-09-26', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2358, '2019-09-27', 'Outbound Project', 'MORNING', 'S1496', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2359, '2019-09-30', 'Outbound Project', 'MORNING', '', '19', '24.00', '32.00', '348.00', '352.00', '700.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2360, '2019-10-01', 'Outbound Project', 'MORNING', 'S2761', '19', '16.00', '32.00', '232.00', '352.00', '584.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2361, '2019-10-02', 'Outbound Project', 'MORNING', 'S01855', '19', '32.00', '32.00', '464.00', '352.00', '816.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2362, '2019-10-03', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2363, '2019-10-04', 'Outbound Project', 'MORNING', '', '19', '36.00', '32.00', '522.00', '352.00', '874.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2364, '2019-10-07', 'Outbound Project', 'MORNING', 'S#2946', '19', '12.00', '32.00', '174.00', '352.00', '526.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2365, '2019-10-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2366, '2019-10-09', 'Outbound Project', 'MORNING', '', '19', '32.00', '28.00', '464.00', '308.00', '772.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2367, '2019-10-10', 'Outbound Project', 'MORNING', 'S2761', '19', '52.00', '28.00', '754.00', '308.00', '1062.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2368, '2019-10-11', 'Outbound Project', 'MORNING', '', '19', '64.00', '28.00', '928.00', '308.00', '1236.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2369, '2019-10-14', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2370, '2019-10-15', 'Outbound Project', 'MORNING', '', '19', '32.00', '64.00', '464.00', '704.00', '1168.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2371, '2019-10-16', 'Outbound Project', 'MORNING', '', '19', '26.00', '32.00', '377.00', '352.00', '729.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2372, '2019-10-17', 'Outbound Project', 'MORNING', '', '19', '48.00', '32.00', '696.00', '352.00', '1048.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2373, '2019-10-18', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2374, '2019-10-21', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2375, '2019-10-22', 'Outbound Project', 'MORNING', '', '19', '48.00', '16.00', '696.00', '176.00', '872.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2376, '2019-10-23', 'Outbound Project', 'MORNING', '', '19', '56.00', '16.00', '812.00', '176.00', '988.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2377, '2019-10-24', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2378, '2019-10-25', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '348.00', '264.00', '612.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2379, '2019-10-28', 'Outbound Project', 'MORNING', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2380, '2019-10-29', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2381, '2019-10-30', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2382, '2019-10-31', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2383, '2019-11-01', 'Outbound Project', 'MORNING', '', '19', '13.00', '16.00', '189.00', '176.00', '365.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2384, '2019-11-04', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2385, '2019-11-05', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2386, '2019-11-06', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2387, '2019-11-07', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2388, '2019-11-08', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2389, '2019-11-11', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2390, '2019-11-12', 'Outbound Project', 'MORNING', '', '19', '16.00', '16.00', '232.00', '176.00', '408.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2391, '2019-11-13', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2392, '2019-11-14', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2393, '2019-11-15', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2394, '2019-11-18', 'Outbound Project', 'MORNING', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2395, '2019-11-19', 'Outbound Project', 'MORNING', '', '19', '32.00', '8.00', '464.00', '88.00', '552.00', '', 'OLLIE\'s', 'active', 17, 50, 9, 21, 'G1', NULL, NULL),
(2396, '2019-12-02', 'Outbound Project', 'Morning', '', '19', '40.00', '16.00', '580.00', '176.00', '756.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2397, '2019-12-03', 'Outbound Project', 'Morning', '', '19', '28.00', '16.00', '406.00', '176.00', '582.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2398, '2019-12-04', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2399, '2019-12-05', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2400, '2019-12-06', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2401, '2019-12-09', 'Outbound Project', 'Morning', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2402, '2019-12-10', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2403, '2019-12-11', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 14, 21, 'G1', NULL, NULL),
(2404, '2019-12-13', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2406, '2019-12-16', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2408, '2019-12-17', 'Outbound Project', 'Morning', '', '19', '16.00', '8.00', '232.00', '88.00', '320.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2410, '2019-12-18', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2412, '2019-12-19', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2414, '2019-12-20', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2416, '2019-12-23', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2418, '2019-12-24', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2419, '2019-12-27', 'Outbound Project', 'Morning', '', '19', '24.00', '16.00', '348.00', '176.00', '524.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2421, '2019-12-30', 'Outbound Project', 'Morning', '', '19', '24.00', '8.00', '348.00', '88.00', '436.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2423, '2019-12-31', 'Outbound Project', 'Morning', '', '19', '32.00', '16.00', '464.00', '176.00', '640.00', '', 'OLLIE\'s', 'active', 19, 50, 8, 21, 'G1', NULL, NULL),
(2426, '2020-01-02', 'Outbound Project', 'MORNING', 'S11975', '19', '9.00', '4.00', '130.50', '44.00', '174.50', '', 'Chanel', 'active', 20, 86, 15, 22, 'G5', NULL, NULL),
(2427, '2020-01-03', 'Outbound Project', 'MORNING', '', '19', '8.00', '4.00', '0.00', '0.00', '0.00', '', 'M&A', 'active', 21, 86, 15, 22, 'G5', NULL, NULL),
(2428, '2020-01-06', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2429, '2020-01-06', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2430, '2020-01-07', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2431, '2020-01-07', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2432, '2020-01-08', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2433, '2020-01-08', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2434, '2020-01-09', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2435, '2020-01-09', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2436, '2020-01-10', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2437, '2020-01-10', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2438, '2020-01-13', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2439, '2020-01-13', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2440, '2020-01-14', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2441, '2020-01-14', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2442, '2020-01-15', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2443, '2020-01-15', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2444, '2020-01-16', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2445, '2020-01-16', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2446, '2020-01-17', 'Outbound Project', 'MORNING', '', '19', '8.00', '8.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2447, '2020-01-17', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2448, '2020-01-07', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2449, '2020-01-08', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2450, '2020-01-09', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2451, '2020-01-10', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2452, '2020-01-13', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2453, '2020-01-14', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '58.00', '22.00', '80.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2454, '2020-01-15', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2455, '2020-01-16', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '22.00', '486.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2456, '2020-01-17', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2457, '2020-01-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '232.00', '0.00', '232.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2458, '2020-01-20', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2459, '2020-01-21', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '232.00', '0.00', '232.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2460, '2020-01-21', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2461, '2020-01-21', 'Project', 'MORNING', '', '19', '4.00', '2.00', '58.00', '22.00', '80.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2462, '2020-01-21', 'Project', 'MORNING', '', '19', '8.00', '0.00', '116.00', '0.00', '116.00', '', '', 'active', 12, 89, 17, 24, '', NULL, NULL),
(2463, '2020-01-21', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '88.00', '88.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2524, '2020-01-22', 'Outbound Project', 'MORNING', '', '19', '4.00', '2.00', '464.00', '176.00', '640.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2565, '2020-01-29', 'Outbound Project', 'MORNING', '', '19', '1.00', '1.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2566, '2020-01-30', 'Outbound Project', 'MORNING', '', '19', '1.00', '1.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2567, '2020-01-31', 'Outbound Project', 'MORNING', '', '19', '1.00', '1.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2568, '2020-02-03', 'Outbound Project', 'MORNING', '', '19', '1.00', '1.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2569, '2020-02-04', 'Outbound Project', 'MORNING', '', '19', '1.00', '1.00', '116.00', '88.00', '204.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2635, '2020-02-05', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2636, '2020-02-05', 'Outbound Project', 'MORNING', '', '19', '0.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2637, '2020-02-06', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 22, '', NULL, NULL),
(2638, '2020-02-07', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 23, '', NULL, NULL),
(2639, '2020-02-07', 'Outbound Project', 'MORNING', '', '19', '0.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2664, '2020-02-10', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2665, '2020-02-12', 'Project', 'MORNING', '', '19', '20.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2666, '2020-02-13', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2667, '2020-02-14', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2668, '2020-02-17', 'Project', 'MORNING', '', '19', '12.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2669, '2020-02-18', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2670, '2020-02-19', 'Project', 'MORNING', '', '19', '12.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2671, '2020-02-20', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2672, '2020-02-21', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2673, '2020-02-24', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2674, '2020-02-25', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2675, '2020-02-26', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2676, '2020-02-27', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2677, '2020-02-28', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2678, '2020-03-02', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2679, '2020-03-03', 'Project', 'MORNING', '', '19', '20.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2680, '2020-03-04', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2681, '2020-03-05', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2682, '2020-03-06', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2683, '2020-03-09', 'Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2684, '2020-03-10', 'Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2685, '2020-02-10', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2686, '2020-02-12', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2687, '2020-02-13', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2688, '2020-02-14', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2689, '2020-02-17', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2690, '2020-02-18', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2691, '2020-02-19', 'Outbound Project', 'MORNING', '', '19', '8.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2692, '2020-02-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2693, '2020-02-21', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2694, '2020-02-24', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2695, '2020-02-25', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2696, '2020-02-26', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL);
INSERT INTO `master_master` (`id`, `project_date`, `project_group`, `project_shift`, `project_q`, `project_whse`, `project_tmp_labor_hrs`, `project_gdb_labor_hrs`, `project_tmp_labor_cost`, `project_gdb_labor_cost`, `project_total_labor_cost`, `project_description`, `project_customer`, `master_status`, `product_id_id`, `project_id_id`, `supervisor_id_id`, `work_id_id`, `size`, `project_pl`, `eighteen_year_target`) VALUES
(2697, '2020-02-27', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2698, '2020-02-28', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2699, '2020-03-02', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2700, '2020-03-03', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2701, '2020-03-04', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2702, '2020-03-05', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2703, '2020-03-06', 'Outbound Project', 'MORNING', '', '19', '16.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2704, '2020-03-09', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2705, '2020-03-10', 'Outbound Project', 'MORNING', '', '19', '24.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2726, '2020-02-12', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2727, '2020-02-13', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2728, '2020-02-14', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2729, '2020-02-17', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2730, '2020-02-18', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2731, '2020-02-19', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2732, '2020-02-20', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2733, '2020-02-21', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2734, '2020-02-24', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2735, '2020-02-25', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2736, '2020-02-26', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2737, '2020-02-27', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2738, '2020-02-28', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2739, '2020-03-02', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2740, '2020-03-03', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2741, '2020-03-04', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2742, '2020-03-05', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2743, '2020-03-06', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2744, '2020-03-09', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2745, '2020-03-10', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2746, '2020-03-13', 'Outbound Project', 'MORNING', '', '19', '24.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2747, '2020-03-14', 'Outbound Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2748, '2020-03-11', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2749, '2020-03-12', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2750, '2020-03-13', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2751, '2020-03-16', 'Project', 'MORNING', '', '19', '24.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2752, '2020-03-17', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2753, '2020-03-18', 'Project', 'MORNING', '', '19', '24.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2754, '2020-03-19', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2755, '2020-03-13', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2756, '2020-03-16', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2757, '2020-03-17', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2758, '2020-03-18', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2759, '2020-03-19', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 90, 17, 25, '', NULL, NULL),
(2763, '2020-03-16', 'Project', 'MORNING', '', '19', '8.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2764, '2020-03-17', 'Project', 'MORNING', '', '19', '8.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2765, '2020-03-18', 'Project', 'MORNING', '', '19', '8.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2766, '2020-03-19', 'Project', 'MORNING', '', '19', '8.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2767, '2020-03-20', 'Project', 'MORNING', '', '19', '8.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2768, '2020-03-23', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2769, '2020-03-24', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 15, 22, '', NULL, NULL),
(2770, '2020-03-16', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2771, '2020-03-17', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2772, '2020-03-18', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2773, '2020-03-19', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2774, '2020-03-20', 'Project', 'MORNING', '', '19', '16.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2775, '2020-03-23', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2776, '2020-03-24', 'Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 15, 23, '', NULL, NULL),
(2777, '2020-03-20', 'Project', 'MORNING', '', '19', '24.00', '14.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2778, '2020-03-23', 'Project', 'MORNING', '', '19', '8.00', '14.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2779, '2020-03-24', 'Project', 'MORNING', '', '19', '8.00', '24.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 88, 16, 21, '', NULL, NULL),
(2796, '2020-08-03', 'Outbound Project', 'MORNING', 'S14935', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'EL Perico', 'active', 24, 111, 11, 27, 'G5', NULL, NULL),
(2797, '2020-08-03', 'Outbound Project', 'MORNING', 'S14935', '19', '0.00', '8.00', '0.00', '88.00', '88.00', '', 'EL Perico', 'active', 24, 112, 11, 28, 'G5', NULL, NULL),
(2798, '2020-08-03', 'Outbound Project', 'MORNING', 'S14879', '19', '24.00', '0.00', '264.00', '0.00', '264.00', '', 'Chanel', 'active', 28, 113, 11, 29, 'G1', NULL, NULL),
(2799, '2020-08-04', 'Outbound Project', 'MORNING', '14961', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'A&K', 'active', 25, 114, 11, 27, 'G5', NULL, NULL),
(2800, '2020-08-04', 'Outbound Project', 'MORNING', '14961', '19', '0.00', '8.00', '0.00', '88.00', '88.00', '', 'A&K', 'active', 25, 115, 11, 28, 'G5', NULL, NULL),
(2801, '2020-08-04', 'Outbound Project', 'MORNING', '', '19', '24.00', '0.00', '264.00', '0.00', '264.00', '', 'ZEZE', 'active', 29, 116, 11, 29, 'G1', NULL, NULL),
(2802, '2020-08-05', 'Outbound Project', 'MORNING', 'S14734', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'Pintura Robeleos', 'active', 26, 117, 11, 27, 'G5', NULL, NULL),
(2803, '2020-08-05', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '176.00', '0.00', '176.00', '', 'ZEZE', 'active', 29, 116, 11, 29, 'G1', NULL, NULL),
(2804, '2020-08-06', 'Outbound Project', 'MORNING', 'S14822', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'American Paint', 'active', 27, 118, 11, 27, 'G5', NULL, NULL),
(2805, '2020-08-06', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '176.00', '0.00', '176.00', '', 'ZEZE', 'active', 29, 116, 11, 29, 'G1', NULL, NULL),
(2806, '2020-08-04', 'Outbound Project', 'MORNING', '', '19', '8.00', '0.00', '88.00', '0.00', '88.00', '', 'ZEZE', 'active', 29, 119, 11, 30, 'G1', NULL, NULL),
(2807, '2020-08-07', 'Outbound Project', 'MORNING', '', '19', '40.00', '32.00', '0.00', '0.00', '0.00', '', 'Ollies', 'active', 30, 88, 8, 21, 'G1', NULL, NULL),
(2810, '2020-08-10', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', 'ZEZE', 'active', 29, 116, 11, 29, 'G1', NULL, NULL),
(2811, '2020-08-10', 'Outbound Project', 'MORNING', '', '19', '40.00', '32.00', '0.00', '0.00', '0.00', '', 'Ollies', 'active', 30, 88, 8, 21, 'G1', NULL, NULL),
(2812, '2020-08-11', 'Outbound Project', 'MORNING', 'S14614', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', 'De Moin', 'active', 29, 86, 11, 30, 'G1', NULL, NULL),
(2813, '2020-08-11', 'Outbound Project', 'MORNING', 'S14995', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', 'CHANEL', 'active', 31, 87, 11, 27, 'G5', NULL, NULL),
(2814, '2020-08-12', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', 'ZEZE', 'active', 29, 116, 11, 29, 'G1', NULL, NULL),
(2815, '2020-08-12', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 32, 87, 11, 27, 'G5', NULL, NULL),
(2816, '2020-08-13', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', 'HH OK', 'active', 12, 86, 11, 23, 'G1', NULL, NULL),
(2817, '2020-08-13', 'Outbound Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 120, 11, 27, 'G5', NULL, NULL),
(2818, '2020-08-13', 'Outbound Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 121, 11, 28, 'G5', NULL, NULL),
(2819, '2020-08-14', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 122, 11, 29, 'G1', NULL, NULL),
(2820, '2020-08-14', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 120, 11, 27, 'G5', NULL, NULL),
(2821, '2020-08-17', 'Outbound Project', 'MORNING', '', '19', '0.00', '12.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 120, 11, 28, 'G5', NULL, NULL),
(2822, '2020-08-17', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 122, 11, 29, 'G1', NULL, NULL),
(2823, '2020-08-18', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 122, 11, 29, 'G1', NULL, NULL),
(2824, '2020-08-18', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 30, 'G1', NULL, NULL),
(2825, '2020-08-19', 'Outbound Project', 'MORNING', '', '19', '16.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 122, 11, 29, 'G1', NULL, NULL),
(2826, '2020-08-19', 'Outbound Project', 'MORNING', '', '19', '0.00', '8.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 30, 'G1', NULL, NULL),
(2827, '2020-08-03', 'Outbound Project', 'MORNING', 'S14935', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'EL Perico', 'active', 24, 87, 11, 27, 'G5', NULL, NULL),
(2828, '2020-08-03', 'Outbound Project', 'MORNING', 'S14935', '19', '0.00', '8.00', '0.00', '88.00', '88.00', '', 'EL Perico', 'active', 24, 86, 11, 28, 'G5', NULL, NULL),
(2829, '2020-08-04', 'Outbound Project', 'MORNING', '14961', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'A&K', 'active', 25, 87, 11, 27, 'G5', NULL, NULL),
(2830, '2020-08-04', 'Outbound Project', 'MORNING', '14961', '19', '0.00', '8.00', '0.00', '88.00', '88.00', '', 'A&K', 'active', 25, 86, 11, 28, 'G5', NULL, NULL),
(2831, '2020-08-05', 'Outbound Project', 'MORNING', 'S14734', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'Pintura Robeleos', 'active', 26, 87, 11, 27, 'G5', NULL, NULL),
(2832, '2020-08-05', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, 'G5', NULL, NULL),
(2833, '2020-08-06', 'Outbound Project', 'MORNING', 'S14822', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', 'American Paint', 'active', 27, 87, 11, 27, 'G5', NULL, NULL),
(2834, '2020-08-06', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, 'G5', NULL, NULL),
(2835, '2020-08-07', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2836, '2020-08-07', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2837, '2020-08-10', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2838, '2020-08-10', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2839, '2020-08-12', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2840, '2020-08-13', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2841, '2020-08-14', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2842, '2020-08-14', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2843, '2020-08-17', 'Outbound Project', 'MORNING', '', '19', '24.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2844, '2020-08-17', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2845, '2020-08-18', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2846, '2020-08-19', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2847, '2020-08-20', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2848, '2020-08-20', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2849, '2020-08-21', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2850, '2020-08-21', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2851, '2020-08-24', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2852, '2020-08-24', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '176.00', '176.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2853, '2020-08-25', 'Outbound Project', 'MORNING', '', '19', '0.00', '16.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2854, '2020-08-25', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2855, '2020-08-26', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2856, '2020-08-26', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 29, '', NULL, NULL),
(2857, '2020-08-27', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2858, '2020-08-27', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2859, '2020-08-28', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 87, 11, 27, '', NULL, NULL),
(2860, '2020-08-28', 'Outbound Project', 'MORNING', '', '19', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', 'active', 12, 86, 11, 28, '', NULL, NULL),
(2861, '2018-01-17', 'Outbound Project', 'MORNING', '', '19', '13.00', '0.00', '195.75', '0.00', '195.75', '', '', 'active', 5, 35, 4, 5, '', NULL, NULL),
(2862, '2018-01-19', 'Outbound Project', 'MORNING', 'S01365', '19', '3.00', '1.00', '43.50', '11.00', '54.50', 'Scraping the G5 pails and relabeling the G1 and G5 with DC ', 'Relabel', 'active', 6, 36, 5, 6, 'G1/G5', NULL, NULL),
(2863, '2018-01-22', 'Outbound Project', 'MORNING', 'S01520', '19', '15.00', '5.00', '228.38', '57.75', '286.13', 'cut and comp the restricted brands ', 'CUT & COMP', 'active', 6, 2, 5, 7, 'G1/G5', NULL, NULL),
(2864, '2018-01-29', 'Outbound Project', 'MORNING', 'S1630', '19', '3.00', '0.00', '43.50', '0.00', '43.50', 'Cut and comp the restricted brands ', 'CUT & COMP', 'active', 6, 2, 5, 7, 'G1/Quart', NULL, NULL),
(2865, '2018-01-31', 'Outbound Project', 'MORNING', 'S1496', '19', '7.00', '7.00', '101.50', '77.00', '178.50', ' Involves taking out quarts from boxes, sticker, pallatize them and break down cardboard boxes. ', '', 'active', 6, 37, 3, 8, '', NULL, NULL),
(2866, '2018-01-31', 'GDB Value Added', 'EVENING', '', '19', '31.00', '0.00', '449.50', '0.00', '449.50', 'had only 2 people only the entire day. 2 left at lunch feeling sick but still we made 3168 units with the colors we had. 3 pallets  ', '', 'active', 7, 38, 6, 5, 'Aerosol', NULL, NULL),
(2867, '2018-01-31', 'Outbound Project', 'EVENING', '', '19', '10.00', '0.00', '145.00', '0.00', '145.00', 'had teddy and linda hand relabel black aerosols ', '', 'active', 7, 39, 6, 6, 'Aerosol', NULL, NULL),
(2868, '2018-01-31', 'Outbound Project', 'EVENING', '', '19', '9.00', '0.00', '130.50', '0.00', '130.50', 'michael had to cut label. Linda and teddy had to relabel. William had to scrap all the 5 gallon buckets and relabel them. ', '', 'active', 6, 36, 6, 6, 'G1/G5', NULL, NULL),
(2869, '2018-01-31', 'GDB Value Added', 'EVENING', '', '19', '8.00', '0.00', '116.00', '0.00', '116.00', 'we trained robert langwith on sleeving today. He has to dump the rollers on table and sleeve it and put it in a box and palletize it ', '', 'active', 8, 4, 6, 9, 'Roller', NULL, NULL),
(2870, '2018-01-31', 'GDB Value Added', 'EVENING', '', '19', '4.00', '0.00', '58.00', '0.00', '58.00', 'had mike and william sort SPP quarts  ', '', 'active', 9, 40, 6, 5, 'Quart', NULL, NULL),
(2871, '2018-02-01', 'Outbound Project', 'MORNING', 'S1496', '19', '17.00', '8.00', '253.75', '88.00', '341.75', '', '', 'active', 6, 37, 3, 8, '', NULL, NULL),
(2872, '2018-05-21', 'Supplier Project ', 'MORNING', '', '19', '14.00', '3.00', '210.25', '38.50', '248.75', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', '', 'active', 10, 41, 2, 10, 'G1,G3,Quarts,Half Pints', NULL, NULL),
(2873, '2018-05-21', 'Outbound Project', 'MORNING', 'S2761', '19', '4.00', '13.00', '65.25', '143.00', '208.25', '', 'Ollies', 'active', 6, 42, 3, 8, '', NULL, NULL),
(2874, '2018-05-21', 'Outbound Project', 'MORNING', 'S01855', '19', '3.00', '10.00', '50.75', '110.00', '160.75', '', 'Kalifa\'s', 'active', 6, 2, 3, 7, 'G1/G5', NULL, NULL),
(2875, '2018-05-21', 'GDB Value Added', 'MORNING', '', '19', '28.00', '16.00', '409.63', '176.00', '585.63', '', 'ROLLER SORTING', 'active', 8, 5, 7, 5, '', NULL, NULL),
(2876, '2018-05-21', 'GDB Value Added', 'MORNING', '', '19', '9.00', '8.00', '130.50', '88.00', '218.50', '', 'ROLLER SLEEVING', 'active', 8, 4, 7, 11, '', NULL, NULL),
(2877, '2018-05-21', 'Outbound Project', 'MORNING', 'S#2946', '19', '48.00', '0.00', '696.00', '0.00', '696.00', 'Separating the 12oz from 16oz; sorting the 12oz by colors and sticker the ollies sticker over the bar code and box them as raibow in a box.  ', '', 'active', 7, 43, 5, 12, '12oz', NULL, NULL),
(2878, '2018-05-22', 'Outbound Project', 'EVENING', '', '19', '22.00', '0.00', '326.25', '0.00', '326.25', '', '', 'active', 5, 44, 4, 6, '', NULL, NULL),
(2879, '2018-05-22', 'Supplier Project ', 'MORNING', '', '19', '11.00', '13.00', '166.75', '145.75', '312.50', ' 1 gallon, 3 gallons, quarts, half pints, rollers of Rustoleum, Sherwin Williams and Valspar were sorted as part of the Rustoleum buy-back project ', '', 'active', 10, 41, 2, 10, 'G1,G3,Quarts,Half Pints, Rollers', NULL, NULL),
(2880, '2018-05-22', 'Outbound Project', 'MORNING', 'S2761', '19', '14.00', '21.00', '203.00', '231.00', '434.00', '', 'Ollies', 'active', 6, 42, 3, 8, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_product`
--

CREATE TABLE `master_product` (
  `id` int(11) NOT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `product_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_product`
--

INSERT INTO `master_product` (`id`, `product_category`, `product_status`) VALUES
(1, 'CUT LABEL', 'active'),
(2, 'STICKERING', 'active'),
(3, 'SLEEVING', 'active'),
(4, 'SORTING', 'active'),
(5, 'OTHER', 'active'),
(6, 'Paint', 'active'),
(7, 'Aerosol', 'active'),
(8, 'Roller', 'active'),
(9, 'SPP', 'active'),
(10, 'Rustoleum products', 'active'),
(11, 'Kit', 'active'),
(12, '', 'active'),
(13, 'Stain ', 'active'),
(14, 'Applicator', 'active'),
(15, 'Miscellaneous', 'active'),
(16, 'Base 2 ', 'active'),
(17, 'SOLID STAIN', 'active'),
(18, 'MIDTONE', 'active'),
(19, 'Semi Trans STAIN', 'active'),
(20, 'G5 DC blue', 'active'),
(21, 'GDB 102 G5 Summit ', 'active'),
(22, 'TESTING', 'active'),
(23, 'GDB 102 G5 DC blue', 'active'),
(24, 'Satin', 'active'),
(25, 'Semi Gloss', 'active'),
(26, 'Flat', 'active'),
(27, 'Africa Beige', 'active'),
(28, 'Evove', 'active'),
(29, 'Evolve', 'active'),
(30, 'Kilz', 'active'),
(31, 'Af colors', 'active'),
(32, 'white', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `master_project`
--

CREATE TABLE `master_project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `eighteen_year_target` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_project`
--

INSERT INTO `master_project` (`id`, `project_name`, `status`, `eighteen_year_target`) VALUES
(1, 'Compactor', 'active', 0),
(2, 'CUT & COMP', 'active', 0.18),
(3, 'Ollie\'s Aerosol Sorting', 'active', 0),
(4, 'Roller Cover Sleeving', 'active', 0.5),
(5, 'Roller Sorting', 'active', NULL),
(6, 'Applicator Stickering', 'active', 0.05),
(7, 'Aerosol Stickering', 'active', NULL),
(9, 'PR19-5 PPG/ WM ', 'active', NULL),
(35, 'Paint Sorting', 'active', 0),
(36, 'Relabel', 'active', 0.7),
(37, 'Paint Stickering (Quarts)', 'active', NULL),
(38, 'Bins Aerosol', 'active', 0),
(39, 'Ollie\'s Aerosol Relabel  ', 'active', 0.2),
(40, 'SPP Sort (Quarts)', 'active', NULL),
(41, 'RUSTOLEUM SORTING', 'active', NULL),
(42, 'Ollies Stickering and Boxing', 'active', 0),
(43, 'Ollies(PR18-17 buyback)', 'active', 0),
(44, 'Ollies 1G  Relabel', 'active', 0),
(45, 'Lowes 1G Pre-Sort', 'active', 0),
(46, 'Lowes 5G Sorting', 'active', 0),
(47, 'Roller Sort & Sleeve', 'active', NULL),
(48, 'POWDER COATING', 'active', 0.5),
(49, 'Olympic One Sorting', 'active', 0),
(50, 'Stain Tinting ', 'active', 0),
(51, 'Forklift', 'active', NULL),
(52, 'Recycling', 'active', NULL),
(53, 'Internal Works, MISC., Transfers ', 'active', NULL),
(54, 'Aerosol Sorting', 'active', NULL),
(55, 'Sample Room', 'active', NULL),
(56, 'Paint Stickering', 'active', NULL),
(57, 'Pressure Washing', 'active', NULL),
(58, 'Lowes Olympic Sorting  G1', 'active', NULL),
(59, '10 PC tray sets', 'active', NULL),
(60, ' Ollie\'s Aerosol Relabel  ', 'active', NULL),
(61, 'Aerosol Cut Label', 'active', NULL),
(62, 'Shieldmore', 'active', NULL),
(63, ' CUT & COMP ', 'active', NULL),
(64, 'Walmart Aerosols', 'active', NULL),
(65, '5245', 'active', NULL),
(66, '12.35', 'active', NULL),
(67, '123412513', 'active', NULL),
(68, '4/9/2019', 'active', NULL),
(69, '4/10/2019', 'active', NULL),
(70, '9\"', 'active', NULL),
(71, '45.76', 'active', NULL),
(72, '$', 'active', NULL),
(73, '', 'active', NULL),
(74, 'MIDTONE', 'active', NULL),
(75, 'TEST', 'active', NULL),
(76, 'TEST1', 'active', NULL),
(77, 'TEST2', 'active', NULL),
(78, 'TEST3', 'active', NULL),
(79, 'TEST4', 'active', NULL),
(80, 'TEST5', 'active', NULL),
(81, 'TEST6', 'active', NULL),
(82, 'TEST7', 'active', NULL),
(83, 'TEST8', 'active', NULL),
(84, 'TEST9', 'active', NULL),
(85, 'TEST10', 'active', NULL),
(86, 'Labeling', 'active', 0.02),
(87, 'Pouring', 'active', NULL),
(88, 'Tinting', 'active', 1),
(89, 'Tote Washing', 'active', NULL),
(90, 'Filtration', 'active', 0),
(91, 'Test Project1', 'active', NULL),
(92, 'Test Project2', 'active', NULL),
(93, 'Test Project3', 'active', NULL),
(94, 'Test Project4', 'active', NULL),
(95, 'Test Project5', 'active', NULL),
(96, 'Test Project6', 'active', NULL),
(97, 'Test Project7', 'active', NULL),
(98, 'Test Project8', 'active', NULL),
(99, 'Test Project9', 'active', NULL),
(100, 'Test Project10', 'active', NULL),
(101, 'Test Project11', 'active', NULL),
(102, 'Test Project12', 'active', NULL),
(103, 'Test Project13', 'active', NULL),
(104, 'Test Project14', 'active', NULL),
(105, 'Test Project15', 'active', NULL),
(106, 'Test Project16', 'active', NULL),
(107, 'Test Project17', 'active', NULL),
(108, 'Test Project18', 'active', NULL),
(109, 'Test Project19', 'active', NULL),
(110, 'Test Project20', 'active', NULL),
(111, 'Pouring EL Perico', 'active', NULL),
(112, 'Labeling EL Perico', 'active', NULL),
(113, 'Pouring Chanel', 'active', NULL),
(114, 'PouringA&K', 'active', NULL),
(115, 'Labeling A&K', 'active', 0),
(116, 'Pouring ZEZE', 'active', NULL),
(117, 'Pintura Robeleos', 'active', NULL),
(118, 'American Paint', 'active', 0.35),
(119, 'Labeling ZEZE', 'active', NULL),
(120, 'Pouring G5', 'active', NULL),
(121, 'Labeling G5', 'active', NULL),
(122, 'Pouring G1', 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_quartpint`
--

CREATE TABLE `master_quartpint` (
  `id` int(11) NOT NULL,
  `quarts` int(11) NOT NULL,
  `pints` int(11) NOT NULL,
  `master_id_id` int(11) DEFAULT NULL,
  `others` int(11) NOT NULL,
  `project_cost_gallon` decimal(6,3) DEFAULT NULL,
  `project_cost_unit` decimal(6,3) DEFAULT NULL,
  `project_total_gallons` double DEFAULT NULL,
  `project_total_units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_quartpint`
--

INSERT INTO `master_quartpint` (`id`, `quarts`, `pints`, `master_id_id`, `others`, `project_cost_gallon`, `project_cost_unit`, `project_total_gallons`, `project_total_units`) VALUES
(2188, 0, 0, 2193, 0, '0.000', '0.000', 0, 0),
(2189, 0, 0, 2194, 0, '0.760', '0.760', 1132.5, 1117),
(2190, 0, 0, 2195, 0, '0.610', '0.610', 444, 204),
(2191, 0, 0, 2196, 0, '0.760', '0.760', 1707, 751),
(2192, 0, 0, 2197, 0, '0.510', '0.510', 144, 132),
(2193, 0, 0, 2198, 0, '0.000', '0.227', 0, 2310),
(2194, 0, 0, 2199, 0, '0.590', '0.590', 0, 3168),
(2195, 0, 0, 2200, 0, '0.360', '0.430', 0, 1056),
(2196, 0, 0, 2201, 0, '0.350', '1.050', 290, 202),
(2197, 0, 0, 2202, 0, '0.370', '0.460', 0, 1152),
(2198, 0, 0, 2203, 0, '0.000', '1.860', 0, 344),
(2199, 0, 0, 2204, 0, '0.600', '0.600', 818.25, 3273),
(2200, 0, 0, 2205, 0, '0.480', '0.480', 1589.5, 914),
(2201, 0, 0, 2206, 0, '0.400', '0.400', 0, 4032),
(2202, 0, 0, 2207, 0, '0.490', '0.490', 910, 546),
(2203, 0, 0, 2208, 0, '0.520', '0.520', 0, 15000),
(2204, 0, 0, 2209, 0, '0.520', '0.520', 0, 5400),
(2205, 0, 0, 2210, 0, '0.360', '0.360', 0, 7200),
(2206, 0, 0, 2211, 0, '0.530', '0.530', 882, 882),
(2207, 0, 0, 2212, 0, '0.460', '0.460', 2232, 1584),
(2208, 0, 0, 2213, 0, '0.420', '0.420', 0, 5328),
(2209, 0, 0, 2214, 0, '0.560', '0.860', 0, 0),
(2210, 0, 0, 2215, 0, '0.610', '1.820', 0, 0),
(2211, 0, 0, 2216, 0, '0.790', '0.790', 0, 0),
(2212, 0, 0, 2217, 0, '0.690', '0.690', 0, 0),
(2213, 0, 0, 2218, 0, '0.550', '0.550', 0, 0),
(2214, 0, 0, 2219, 0, '0.440', '0.480', 0, 0),
(2215, 0, 0, 2220, 0, '0.810', '1.680', 0, 0),
(2216, 0, 0, 2221, 0, '0.830', '0.830', 0, 0),
(2217, 0, 0, 2222, 0, '0.590', '0.590', 0, 0),
(2218, 0, 0, 2223, 0, '0.510', '0.510', 0, 0),
(2219, 0, 0, 2224, 0, '0.420', '0.420', 0, 0),
(2220, 0, 0, 2225, 0, '0.400', '0.400', 0, 0),
(2221, 0, 0, 2226, 0, '0.300', '0.300', 0, 0),
(2222, 0, 0, 2227, 0, '0.300', '0.500', 0, 0),
(2223, 0, 0, 2228, 0, '0.600', '0.830', 0, 0),
(2224, 0, 0, 2229, 0, '0.290', '0.290', 0, 0),
(2225, 0, 0, 2230, 0, '0.610', '0.610', 0, 0),
(2226, 0, 0, 2231, 0, '0.300', '0.300', 0, 0),
(2227, 0, 0, 2232, 0, '0.340', '0.340', 0, 0),
(2228, 0, 0, 2233, 0, '0.610', '0.610', 0, 0),
(2229, 0, 0, 2234, 0, '0.410', '0.590', 0, 0),
(2230, 0, 0, 2235, 0, '0.500', '0.650', 0, 0),
(2231, 0, 0, 2236, 0, '0.490', '0.490', 0, 0),
(2232, 0, 0, 2237, 0, '0.510', '0.510', 0, 0),
(2233, 0, 0, 2238, 0, '0.530', '0.530', 0, 0),
(2234, 0, 0, 2239, 0, '0.310', '0.310', 0, 0),
(2235, 0, 0, 2240, 0, '0.300', '0.890', 0, 0),
(2236, 0, 0, 2241, 0, '1.520', '1.520', 0, 0),
(2237, 0, 0, 2242, 0, '0.520', '0.520', 0, 0),
(2238, 0, 0, 2243, 0, '0.650', '0.650', 0, 0),
(2239, 0, 0, 2244, 0, '0.750', '0.750', 0, 0),
(2240, 0, 0, 2245, 0, '0.800', '0.800', 0, 0),
(2241, 0, 0, 2246, 0, '1.040', '1.040', 0, 0),
(2242, 0, 0, 2247, 0, '0.520', '0.520', 0, 0),
(2243, 0, 0, 2248, 0, '0.510', '0.510', 0, 0),
(2244, 0, 0, 2249, 0, '0.520', '0.520', 0, 0),
(2245, 0, 0, 2250, 0, '0.640', '0.640', 0, 0),
(2246, 0, 0, 2251, 0, '0.670', '0.670', 0, 0),
(2247, 0, 0, 2252, 0, '0.470', '0.470', 0, 0),
(2248, 0, 0, 2253, 0, '0.280', '0.280', 0, 0),
(2249, 0, 0, 2254, 0, '0.630', '0.630', 0, 0),
(2250, 0, 0, 2255, 0, '0.550', '0.550', 0, 0),
(2251, 0, 0, 2256, 0, '0.690', '0.690', 0, 0),
(2252, 0, 0, 2257, 0, '0.370', '0.370', 0, 0),
(2253, 0, 0, 2258, 0, '0.460', '0.460', 0, 0),
(2254, 0, 0, 2259, 0, '0.300', '0.300', 0, 0),
(2255, 0, 0, 2260, 0, '0.410', '0.410', 0, 0),
(2256, 0, 0, 2261, 0, '0.740', '0.740', 0, 0),
(2257, 0, 0, 2262, 0, '0.370', '0.370', 0, 0),
(2258, 0, 0, 2263, 0, '0.440', '0.440', 0, 0),
(2259, 0, 0, 2264, 0, '1.020', '1.020', 0, 0),
(2260, 0, 0, 2265, 0, '1.420', '1.420', 0, 0),
(2261, 0, 0, 2266, 0, '0.440', '0.440', 0, 0),
(2262, 0, 0, 2267, 0, '1.310', '1.310', 0, 0),
(2263, 0, 0, 2268, 0, '0.690', '0.690', 0, 0),
(2264, 0, 0, 2269, 0, '0.510', '0.510', 0, 0),
(2265, 0, 0, 2270, 0, '0.340', '0.340', 0, 0),
(2266, 0, 0, 2271, 0, '0.660', '0.660', 0, 0),
(2267, 0, 0, 2272, 0, '0.000', '0.000', 0, 0),
(2268, 0, 0, 2273, 0, '0.760', '0.760', 1132.5, 1117),
(2269, 0, 0, 2274, 0, '0.610', '0.610', 444, 204),
(2270, 0, 0, 2275, 0, '0.760', '0.760', 1707, 751),
(2271, 0, 0, 2276, 0, '0.000', '4.848', 0, 132),
(2272, 0, 0, 2277, 0, '0.620', '0.620', 577.5, 2310),
(2273, 0, 0, 2278, 0, '0.590', '0.590', 0, 3168),
(2274, 0, 0, 2279, 0, '0.360', '0.430', 0, 1056),
(2275, 0, 0, 2280, 0, '0.350', '1.050', 290, 202),
(2276, 0, 0, 2281, 0, '0.370', '0.460', 0, 1152),
(2277, 0, 0, 2282, 0, '0.760', '0.760', 86, 344),
(2278, 0, 0, 2283, 0, '0.600', '0.600', 818.25, 3273),
(2279, 0, 0, 2284, 0, '0.480', '0.480', 1589.5, 914),
(2280, 0, 0, 2285, 0, '0.400', '0.400', 0, 4032),
(2281, 0, 0, 2286, 0, '0.490', '0.490', 910, 546),
(2282, 0, 0, 2287, 0, '0.520', '0.520', 0, 15000),
(2283, 0, 0, 2288, 0, '0.520', '0.520', 0, 5400),
(2284, 0, 0, 2289, 0, '0.360', '0.360', 0, 7200),
(2285, 0, 0, 2290, 0, '0.530', '0.530', 882, 882),
(2286, 0, 0, 2291, 0, '0.460', '0.460', 2232, 1584),
(2287, 0, 0, 2292, 0, '0.420', '0.420', 0, 5328),
(2288, 0, 0, 2293, 0, '0.560', '0.860', 1470, 1470),
(2289, 0, 0, 2294, 0, '0.610', '1.820', 984, 888),
(2290, 0, 0, 2295, 0, '0.790', '0.790', 630, 630),
(2291, 0, 0, 2296, 0, '0.690', '0.690', 1470, 1470),
(2292, 0, 0, 2297, 0, '0.550', '0.550', 354, 258),
(2293, 0, 0, 2298, 0, '0.440', '0.480', 720, 240),
(2294, 0, 0, 2299, 0, '0.810', '1.680', 630, 630),
(2295, 0, 0, 2300, 0, '0.830', '0.830', 630, 630),
(2296, 0, 0, 2301, 0, '0.590', '0.590', 630, 630),
(2297, 0, 0, 2302, 0, '0.510', '0.510', 420, 420),
(2298, 0, 0, 2303, 0, '0.420', '0.420', 840, 840),
(2299, 0, 0, 2304, 0, '0.400', '0.400', 1260, 1260),
(2300, 0, 0, 2305, 0, '0.300', '0.300', 1152, 384),
(2301, 0, 0, 2306, 0, '0.300', '0.500', 630, 630),
(2302, 0, 0, 2307, 0, '0.600', '0.830', 0, 0),
(2303, 0, 0, 2308, 0, '0.290', '0.290', 1050, 1050),
(2304, 0, 0, 2309, 0, '0.610', '0.610', 1680, 1680),
(2305, 0, 0, 2310, 0, '0.300', '0.300', 1260, 1260),
(2306, 0, 0, 2311, 0, '0.340', '0.340', 1260, 1260),
(2307, 0, 0, 2312, 0, '0.610', '0.610', 1728, 576),
(2308, 0, 0, 2313, 0, '0.410', '0.590', 630, 630),
(2309, 0, 0, 2314, 0, '0.500', '0.650', 1470, 1470),
(2310, 0, 0, 2315, 0, '0.490', '0.490', 210, 210),
(2311, 0, 0, 2316, 0, '0.510', '0.510', 1470, 1470),
(2312, 0, 0, 2317, 0, '0.530', '0.530', 840, 840),
(2313, 0, 0, 2318, 0, '0.310', '0.310', 0, 0),
(2314, 0, 0, 2319, 0, '0.300', '0.890', 1260, 1260),
(2315, 0, 0, 2320, 0, '1.520', '1.520', 1680, 1680),
(2316, 0, 0, 2321, 0, '0.520', '0.520', 840, 840),
(2317, 0, 0, 2322, 0, '0.520', '0.520', 840, 840),
(2318, 0, 0, 2323, 0, '1.100', '1.100', 420, 420),
(2319, 0, 0, 2324, 0, '0.510', '0.510', 1470, 1470),
(2321, 0, 0, 2326, 0, '0.350', '0.350', 1680, 1680),
(2323, 0, 0, 2328, 0, '0.610', '0.610', 1050, 1050),
(2325, 0, 0, 2330, 0, '0.300', '0.300', 2100, 2100),
(2326, 0, 0, 2331, 0, '0.830', '0.830', 630, 630),
(2328, 0, 0, 2333, 0, '0.690', '0.690', 630, 630),
(2330, 0, 0, 2335, 0, '0.420', '0.420', 1260, 1260),
(2331, 0, 0, 2336, 0, '0.310', '0.310', 1680, 1680),
(2343, 0, 0, 2348, 0, '0.760', '0.760', 1132.5, 1117),
(2344, 0, 0, 2349, 0, '0.610', '0.610', 444, 204),
(2345, 0, 0, 2350, 0, '0.760', '0.760', 1707, 751),
(2346, 0, 0, 2351, 0, '0.510', '0.510', 144, 132),
(2347, 0, 0, 2352, 0, '0.620', '0.620', 577.5, 2310),
(2348, 0, 0, 2353, 0, '0.590', '0.590', 0, 3168),
(2349, 0, 0, 2354, 0, '0.360', '0.430', 0, 1056),
(2350, 0, 0, 2355, 0, '0.350', '1.050', 290, 202),
(2351, 0, 0, 2356, 0, '0.370', '0.460', 0, 1152),
(2352, 0, 0, 2357, 0, '0.760', '0.760', 86, 344),
(2353, 0, 0, 2358, 0, '0.600', '0.600', 818.25, 3273),
(2354, 0, 0, 2359, 0, '0.480', '0.480', 1589.5, 914),
(2355, 0, 0, 2360, 0, '0.400', '0.400', 0, 4032),
(2356, 0, 0, 2361, 0, '0.490', '0.490', 910, 546),
(2357, 0, 0, 2362, 0, '0.520', '0.520', 0, 15000),
(2358, 0, 0, 2363, 0, '0.520', '0.520', 0, 5400),
(2359, 0, 0, 2364, 0, '0.360', '0.360', 0, 7200),
(2360, 0, 0, 2365, 0, '0.530', '0.530', 882, 882),
(2361, 0, 0, 2366, 0, '0.460', '0.460', 2232, 1584),
(2362, 0, 0, 2367, 0, '0.420', '0.420', 0, 5328),
(2363, 0, 0, 2368, 0, '0.560', '0.860', 1470, 1470),
(2364, 0, 0, 2369, 0, '0.610', '1.820', 984, 888),
(2365, 0, 0, 2370, 0, '0.790', '0.790', 630, 630),
(2366, 0, 0, 2371, 0, '0.690', '0.690', 1470, 1470),
(2367, 0, 0, 2372, 0, '0.550', '0.550', 354, 258),
(2368, 0, 0, 2373, 0, '0.440', '0.480', 720, 240),
(2369, 0, 0, 2374, 0, '0.810', '1.680', 630, 630),
(2370, 0, 0, 2375, 0, '0.830', '0.830', 630, 630),
(2371, 0, 0, 2376, 0, '0.590', '0.590', 630, 630),
(2372, 0, 0, 2377, 0, '0.510', '0.510', 420, 420),
(2373, 0, 0, 2378, 0, '0.420', '0.420', 840, 840),
(2374, 0, 0, 2379, 0, '0.400', '0.400', 1260, 1260),
(2375, 0, 0, 2380, 0, '0.300', '0.300', 1152, 384),
(2376, 0, 0, 2381, 0, '0.300', '0.500', 630, 630),
(2377, 0, 0, 2382, 0, '0.600', '0.830', 0, 0),
(2378, 0, 0, 2383, 0, '0.290', '0.290', 1050, 1050),
(2379, 0, 0, 2384, 0, '0.610', '0.610', 1680, 1680),
(2380, 0, 0, 2385, 0, '0.300', '0.300', 1260, 1260),
(2381, 0, 0, 2386, 0, '0.340', '0.340', 1260, 1260),
(2382, 0, 0, 2387, 0, '0.610', '0.610', 1728, 576),
(2383, 0, 0, 2388, 0, '0.410', '0.590', 630, 630),
(2384, 0, 0, 2389, 0, '0.500', '0.650', 1470, 1470),
(2385, 0, 0, 2390, 0, '0.490', '0.490', 210, 210),
(2386, 0, 0, 2391, 0, '0.510', '0.510', 1470, 1470),
(2387, 0, 0, 2392, 0, '0.530', '0.530', 840, 840),
(2388, 0, 0, 2393, 0, '0.310', '0.310', 0, 0),
(2389, 0, 0, 2394, 0, '0.300', '0.890', 1260, 1260),
(2390, 0, 0, 2395, 0, '1.520', '1.520', 1680, 1680),
(2391, 0, 0, 2396, 0, '0.510', '0.510', 1470, 1470),
(2392, 0, 0, 2397, 0, '0.350', '0.350', 1680, 1680),
(2393, 0, 0, 2398, 0, '0.610', '0.610', 1050, 1050),
(2394, 0, 0, 2399, 0, '0.300', '0.300', 2100, 2100),
(2395, 0, 0, 2400, 0, '0.830', '0.830', 630, 630),
(2396, 0, 0, 2401, 0, '0.690', '0.690', 630, 630),
(2397, 0, 0, 2402, 0, '0.420', '0.420', 1260, 1260),
(2398, 0, 0, 2403, 0, '0.310', '0.310', 1680, 1680),
(2399, 0, 0, 2404, 0, '0.420', '0.420', 1260, 1260),
(2401, 0, 0, 2406, 0, '0.380', '0.380', 1680, 1680),
(2403, 0, 0, 2408, 0, '0.300', '0.300', 1050, 1050),
(2405, 0, 0, 2410, 0, '0.380', '0.380', 1680, 1680),
(2407, 0, 0, 2412, 0, '0.610', '0.610', 1050, 1050),
(2409, 0, 0, 2414, 0, '0.440', '0.440', 1470, 1470),
(2411, 0, 0, 2416, 0, '0.380', '0.380', 1680, 1680),
(2413, 0, 0, 2418, 0, '0.610', '0.610', 1050, 1050),
(2414, 0, 0, 2419, 0, '1.250', '1.250', 420, 420),
(2416, 0, 0, 2421, 0, '0.350', '0.350', 1260, 1260),
(2418, 0, 0, 2423, 0, '0.300', '0.300', 2100, 2100),
(2421, 0, 35, 2426, 0, '0.044', '0.211', 3964.375, 827),
(2422, 0, 0, 2427, 0, '0.000', '0.180', 0, 792),
(2423, 0, 0, 2428, 0, '0.000', '0.260', 3960, 792),
(2424, 0, 0, 2429, 0, '0.000', '0.220', 3960, 792),
(2425, 0, 0, 2430, 0, '0.000', '0.260', 3960, 792),
(2426, 0, 0, 2431, 0, '0.000', '0.220', 3960, 792),
(2427, 0, 0, 2432, 0, '0.000', '0.260', 3960, 792),
(2428, 0, 0, 2433, 0, '0.000', '0.220', 3960, 792),
(2429, 0, 0, 2434, 0, '0.000', '0.260', 3960, 792),
(2430, 0, 0, 2435, 0, '0.000', '0.220', 3960, 792),
(2431, 0, 0, 2436, 0, '0.000', '0.260', 3960, 792),
(2432, 0, 0, 2437, 0, '0.000', '0.220', 3960, 792),
(2433, 0, 0, 2438, 0, '0.000', '0.260', 3960, 792),
(2434, 0, 0, 2439, 0, '0.000', '0.220', 3960, 792),
(2435, 0, 0, 2440, 0, '0.000', '0.260', 3960, 792),
(2436, 0, 0, 2441, 0, '0.000', '0.220', 3960, 792),
(2437, 0, 0, 2442, 0, '0.000', '0.260', 3960, 792),
(2438, 0, 0, 2443, 0, '0.000', '0.220', 3960, 792),
(2439, 0, 0, 2444, 0, '0.044', '0.143', 4590, 1422),
(2440, 0, 0, 2445, 0, '0.040', '0.220', 3960, 792),
(2441, 0, 0, 2446, 0, '0.050', '0.260', 3960, 792),
(2442, 0, 0, 2447, 0, '0.040', '0.220', 3960, 792),
(2443, 0, 0, 2448, 0, '0.300', '0.300', 2100, 2100),
(2444, 0, 0, 2449, 0, '0.300', '0.300', 2100, 2100),
(2445, 0, 0, 2450, 0, '0.300', '0.300', 2100, 2100),
(2446, 0, 0, 2451, 0, '0.300', '0.300', 2100, 2100),
(2447, 0, 0, 2452, 0, '0.300', '0.300', 2100, 2100),
(2448, 0, 0, 2453, 0, '0.038', '0.038', 2100, 2100),
(2449, 0, 0, 2454, 0, '0.300', '0.300', 2100, 2100),
(2450, 0, 0, 2455, 0, '0.231', '0.231', 2100, 2100),
(2451, 0, 0, 2456, 0, '0.300', '0.300', 2100, 2100),
(2452, 0, 0, 2457, 0, '0.260', '0.260', 880, 880),
(2453, 0, 0, 2458, 0, '0.220', '0.040', 3960, 792),
(2454, 0, 0, 2459, 0, '0.230', '0.230', 1020, 1020),
(2455, 0, 0, 2460, 0, '0.220', '0.040', 3960, 792),
(2456, 0, 0, 2461, 0, '0.190', '0.040', 2160, 432),
(2457, 0, 0, 2462, 0, '9.670', '0.000', 0, 12),
(2458, 0, 0, 2463, 0, '44.000', '0.130', 660, 2),
(2519, 0, 0, 2524, 0, '0.270', '1.330', 2400, 480),
(2560, 0, 0, 2565, 0, '0.190', '0.190', 1050, 1050),
(2561, 0, 0, 2566, 0, '0.120', '0.120', 1720, 1720),
(2562, 0, 0, 2567, 0, '0.190', '0.190', 1050, 1050),
(2563, 0, 0, 2568, 0, '0.050', '0.260', 3960, 792),
(2564, 0, 0, 2569, 0, '0.050', '0.260', 3960, 792),
(2630, 0, 0, 2635, 0, '0.000', '0.000', 0, 0),
(2631, 0, 0, 2636, 0, '0.000', '0.000', 0, 0),
(2632, 0, 0, 2637, 0, '0.000', '0.000', 0, 0),
(2633, 0, 0, 2638, 0, '0.000', '0.000', 0, 0),
(2634, 0, 0, 2639, 0, '0.000', '0.000', 0, 0),
(2659, 0, 0, 2664, 0, '0.000', '0.000', 720, 144),
(2660, 0, 0, 2665, 0, '0.000', '0.000', 1440, 288),
(2661, 0, 0, 2666, 0, '0.000', '0.000', 2640, 528),
(2662, 0, 0, 2667, 0, '0.000', '0.000', 2160, 432),
(2663, 0, 0, 2668, 0, '0.000', '0.000', 840, 168),
(2664, 0, 0, 2669, 0, '0.000', '0.000', 2160, 432),
(2665, 0, 0, 2670, 0, '0.000', '0.000', 480, 96),
(2666, 0, 0, 2671, 0, '0.000', '0.000', 1800, 360),
(2667, 0, 0, 2672, 0, '0.000', '0.000', 2160, 432),
(2668, 0, 0, 2673, 0, '0.000', '0.000', 480, 96),
(2669, 0, 0, 2674, 0, '0.000', '0.000', 1200, 240),
(2670, 0, 0, 2675, 0, '0.000', '0.000', 1680, 336),
(2671, 0, 0, 2676, 0, '0.000', '0.000', 2880, 576),
(2672, 0, 0, 2677, 0, '0.000', '0.000', 2280, 456),
(2673, 0, 0, 2678, 0, '0.000', '0.000', 3600, 720),
(2674, 0, 0, 2679, 0, '0.000', '0.000', 2880, 576),
(2675, 0, 0, 2680, 0, '0.000', '0.000', 2520, 504),
(2676, 0, 0, 2681, 0, '0.000', '0.000', 2520, 504),
(2677, 0, 0, 2682, 0, '0.000', '0.000', 1800, 360),
(2678, 0, 0, 2683, 0, '0.000', '0.000', 960, 192),
(2679, 0, 0, 2684, 0, '0.000', '0.000', 2400, 480),
(2680, 0, 0, 2685, 0, '0.000', '0.000', 0, 0),
(2681, 0, 0, 2686, 0, '0.000', '0.000', 0, 0),
(2682, 0, 0, 2687, 0, '0.000', '0.000', 0, 0),
(2683, 0, 0, 2688, 0, '0.000', '0.000', 0, 0),
(2684, 0, 0, 2689, 0, '0.000', '0.000', 0, 0),
(2685, 0, 0, 2690, 0, '0.000', '0.000', 0, 0),
(2686, 0, 0, 2691, 0, '0.000', '0.000', 0, 0),
(2687, 0, 0, 2692, 0, '0.000', '0.000', 0, 0),
(2688, 0, 0, 2693, 0, '0.000', '0.000', 0, 0),
(2689, 0, 0, 2694, 0, '0.000', '0.000', 0, 0),
(2690, 0, 0, 2695, 0, '0.000', '0.000', 0, 0),
(2691, 0, 0, 2696, 0, '0.000', '0.000', 0, 0),
(2692, 0, 0, 2697, 0, '0.000', '0.000', 0, 0),
(2693, 0, 0, 2698, 0, '0.000', '0.000', 0, 0),
(2694, 0, 0, 2699, 0, '0.000', '0.000', 0, 0),
(2695, 0, 0, 2700, 0, '0.000', '0.000', 0, 0),
(2696, 0, 0, 2701, 0, '0.000', '0.000', 0, 0),
(2697, 0, 0, 2702, 0, '0.000', '0.000', 0, 0),
(2698, 0, 0, 2703, 0, '0.000', '0.000', 0, 0),
(2699, 0, 0, 2704, 0, '0.000', '0.000', 0, 0),
(2700, 0, 0, 2705, 0, '0.000', '0.000', 0, 0),
(2721, 0, 0, 2726, 0, '0.000', '0.000', 0, 0),
(2722, 0, 0, 2727, 0, '0.000', '0.000', 0, 0),
(2723, 0, 0, 2728, 0, '0.000', '0.000', 0, 0),
(2724, 0, 0, 2729, 0, '0.000', '0.000', 0, 0),
(2725, 0, 0, 2730, 0, '0.000', '0.000', 0, 0),
(2726, 0, 0, 2731, 0, '0.000', '0.000', 0, 0),
(2727, 0, 0, 2732, 0, '0.000', '0.000', 0, 0),
(2728, 0, 0, 2733, 0, '0.000', '0.000', 0, 0),
(2729, 0, 0, 2734, 0, '0.000', '0.000', 0, 0),
(2730, 0, 0, 2735, 0, '0.000', '0.000', 0, 0),
(2731, 0, 0, 2736, 0, '0.000', '0.000', 0, 0),
(2732, 0, 0, 2737, 0, '0.000', '0.000', 0, 0),
(2733, 0, 0, 2738, 0, '0.000', '0.000', 0, 0),
(2734, 0, 0, 2739, 0, '0.000', '0.000', 0, 0),
(2735, 0, 0, 2740, 0, '0.000', '0.000', 0, 0),
(2736, 0, 0, 2741, 0, '0.000', '0.000', 0, 0),
(2737, 0, 0, 2742, 0, '0.000', '0.000', 0, 0),
(2738, 0, 0, 2743, 0, '0.000', '0.000', 0, 0),
(2739, 0, 0, 2744, 0, '0.000', '0.000', 0, 0),
(2740, 0, 0, 2745, 0, '0.000', '0.000', 0, 0),
(2741, 0, 0, 2746, 0, '0.000', '0.000', 0, 0),
(2742, 0, 0, 2747, 0, '0.000', '0.000', 0, 0),
(2743, 0, 0, 2748, 0, '0.000', '0.000', 0, 0),
(2744, 0, 0, 2749, 0, '0.000', '0.000', 0, 0),
(2745, 0, 0, 2750, 0, '0.000', '0.000', 0, 0),
(2746, 0, 0, 2751, 0, '0.000', '0.000', 0, 0),
(2747, 0, 0, 2752, 0, '0.000', '0.000', 0, 0),
(2748, 0, 0, 2753, 0, '0.000', '0.000', 0, 0),
(2749, 0, 0, 2754, 0, '0.000', '0.000', 0, 0),
(2750, 0, 0, 2755, 0, '0.000', '0.000', 2000, 0),
(2751, 0, 0, 2756, 0, '0.000', '0.000', 750, 0),
(2752, 0, 0, 2757, 0, '0.000', '0.000', 750, 0),
(2753, 0, 0, 2758, 0, '0.000', '0.000', 750, 3),
(2754, 0, 0, 2759, 0, '0.000', '0.000', 750, 3),
(2758, 0, 0, 2763, 0, '0.000', '0.000', 0, 0),
(2759, 0, 0, 2764, 0, '0.000', '0.000', 0, 0),
(2760, 0, 0, 2765, 0, '0.000', '0.000', 0, 0),
(2761, 0, 0, 2766, 0, '0.000', '0.000', 0, 0),
(2762, 0, 0, 2767, 0, '0.000', '0.000', 0, 0),
(2763, 0, 0, 2768, 0, '0.000', '0.000', 0, 0),
(2764, 0, 0, 2769, 0, '0.000', '0.000', 0, 0),
(2765, 0, 0, 2770, 0, '0.000', '0.000', 0, 0),
(2766, 0, 0, 2771, 0, '0.000', '0.000', 0, 0),
(2767, 0, 0, 2772, 0, '0.000', '0.000', 0, 0),
(2768, 0, 0, 2773, 0, '0.000', '0.000', 0, 0),
(2769, 0, 0, 2774, 0, '0.000', '0.000', 0, 0),
(2770, 0, 0, 2775, 0, '0.000', '0.000', 0, 0),
(2771, 0, 0, 2776, 0, '0.000', '0.000', 0, 0),
(2772, 0, 0, 2777, 0, '0.000', '0.000', 2640, 0),
(2773, 0, 0, 2778, 0, '0.000', '0.000', 480, 0),
(2774, 0, 0, 2779, 0, '0.000', '0.000', 1680, 0),
(2791, 0, 0, 2796, 0, '0.060', '0.280', 3120, 624),
(2792, 0, 0, 2797, 0, '0.000', '0.120', 0, 720),
(2793, 0, 0, 2798, 0, '0.280', '0.280', 960, 960),
(2794, 0, 0, 2799, 0, '0.050', '0.260', 3360, 672),
(2795, 0, 0, 2800, 0, '0.020', '0.120', 3600, 720),
(2796, 0, 0, 2801, 0, '0.060', '0.280', 4800, 960),
(2797, 0, 0, 2802, 0, '0.070', '0.330', 2640, 528),
(2798, 0, 0, 2803, 0, '0.210', '0.210', 840, 840),
(2799, 0, 0, 2804, 0, '0.050', '0.240', 3720, 744),
(2800, 0, 0, 2805, 0, '0.060', '0.280', 3150, 630),
(2801, 0, 0, 2806, 0, '0.040', '0.180', 2400, 480),
(2802, 0, 0, 2807, 0, '0.000', '0.000', 0, 0),
(2805, 0, 0, 2810, 0, '0.000', '0.000', 0, 0),
(2806, 0, 0, 2811, 0, '0.000', '0.000', 0, 0),
(2807, 0, 0, 2812, 0, '0.000', '0.000', 680, 680),
(2808, 0, 0, 2813, 0, '0.000', '0.000', 3360, 672),
(2809, 0, 0, 2814, 0, '0.000', '0.000', 2000, 400),
(2810, 0, 0, 2815, 0, '0.000', '0.000', 3360, 672),
(2811, 0, 0, 2816, 0, '0.000', '0.000', 0, 0),
(2812, 0, 0, 2817, 0, '0.000', '0.000', 1920, 384),
(2813, 0, 0, 2818, 0, '0.000', '0.000', 0, 480),
(2814, 0, 0, 2819, 0, '0.000', '0.000', 840, 840),
(2815, 0, 0, 2820, 0, '0.000', '0.000', 3000, 600),
(2816, 0, 0, 2821, 0, '0.000', '0.000', 2520, 504),
(2817, 0, 0, 2822, 0, '0.000', '0.000', 840, 840),
(2818, 0, 0, 2823, 0, '0.000', '0.000', 915, 915),
(2819, 0, 0, 2824, 0, '0.000', '0.000', 972, 972),
(2820, 0, 0, 2825, 0, '0.000', '0.000', 0, 813),
(2821, 0, 0, 2826, 0, '0.000', '0.000', 0, 686),
(2822, 0, 0, 2827, 0, '0.060', '0.280', 3120, 624),
(2823, 0, 0, 2828, 0, '0.000', '0.120', 0, 720),
(2824, 0, 0, 2829, 0, '0.050', '0.260', 3360, 672),
(2825, 0, 0, 2830, 0, '0.020', '0.120', 3600, 720),
(2826, 0, 0, 2831, 0, '0.070', '0.330', 2640, 528),
(2827, 0, 0, 2832, 0, '0.000', '0.000', 0, 0),
(2828, 0, 0, 2833, 0, '0.050', '0.240', 3720, 744),
(2829, 0, 0, 2834, 0, '0.000', '0.000', 0, 0),
(2830, 0, 0, 2835, 0, '0.000', '0.000', 0, 0),
(2831, 0, 0, 2836, 0, '0.000', '0.000', 0, 0),
(2832, 0, 0, 2837, 0, '0.000', '0.000', 0, 0),
(2833, 0, 0, 2838, 0, '0.000', '0.000', 0, 0),
(2834, 0, 0, 2839, 0, '0.000', '0.000', 0, 0),
(2835, 0, 0, 2840, 0, '0.000', '0.000', 0, 0),
(2836, 0, 0, 2841, 0, '0.000', '0.000', 0, 0),
(2837, 0, 0, 2842, 0, '0.000', '0.000', 0, 0),
(2838, 0, 0, 2843, 0, '0.000', '0.000', 0, 0),
(2839, 0, 0, 2844, 0, '0.000', '0.000', 0, 0),
(2840, 0, 0, 2845, 0, '0.000', '0.000', 0, 0),
(2841, 0, 0, 2846, 0, '0.000', '0.000', 0, 0),
(2842, 0, 0, 2847, 0, '0.000', '0.000', 0, 0),
(2843, 0, 0, 2848, 0, '0.000', '0.000', 0, 0),
(2844, 0, 0, 2849, 0, '0.000', '0.000', 0, 0),
(2845, 0, 0, 2850, 0, '0.000', '0.000', 0, 0),
(2846, 0, 0, 2851, 0, '0.000', '0.000', 0, 0),
(2847, 0, 0, 2852, 0, '0.054', '0.272', 3240, 648),
(2848, 0, 0, 2853, 0, '0.000', '0.000', 0, 0),
(2849, 0, 0, 2854, 0, '0.000', '0.000', 0, 0),
(2850, 0, 0, 2855, 0, '0.000', '0.000', 0, 0),
(2851, 0, 0, 2856, 0, '0.000', '0.000', 0, 0),
(2852, 0, 0, 2857, 0, '0.000', '0.000', 0, 0),
(2853, 0, 0, 2858, 0, '0.000', '0.000', 0, 0),
(2854, 0, 0, 2859, 0, '0.000', '0.000', 0, 0),
(2855, 0, 0, 2860, 0, '0.000', '0.000', 0, 0),
(2856, 300, 35, 2861, 0, '0.170', '0.180', 1132.5, 1117),
(2857, 0, 0, 2862, 0, '0.120', '0.270', 444, 204),
(2858, 0, 0, 2863, 0, '0.170', '0.380', 1707, 751),
(2859, 48, 0, 2864, 0, '0.300', '0.330', 144, 132),
(2860, 2310, 0, 2865, 0, '0.310', '0.080', 577.5, 2310),
(2861, 0, 0, 2866, 3168, '0.000', '0.140', 0, 3168),
(2862, 0, 0, 2867, 1056, '0.000', '0.140', 0, 1056),
(2863, 0, 0, 2868, 0, '0.450', '0.650', 290, 202),
(2864, 0, 0, 2869, 1152, '0.000', '0.100', 0, 1152),
(2865, 344, 0, 2870, 0, '0.670', '0.170', 86, 344),
(2866, 3273, 0, 2871, 0, '0.420', '0.100', 818.25, 3273),
(2867, 150, 20, 2872, 0, '0.160', '0.270', 1589.5, 914),
(2868, 0, 0, 2873, 4032, '0.000', '0.050', 0, 4032),
(2869, 0, 0, 2874, 0, '0.180', '0.290', 910, 546),
(2870, 0, 0, 2875, 15000, '0.000', '0.040', 0, 15000),
(2871, 0, 0, 2876, 5400, '0.000', '0.040', 0, 5400),
(2872, 0, 0, 2877, 7200, '0.000', '0.100', 0, 7200),
(2873, 0, 0, 2878, 0, '0.370', '0.370', 882, 882),
(2874, 0, 0, 2879, 0, '0.140', '0.200', 2232, 1584),
(2875, 0, 0, 2880, 5328, '0.000', '0.080', 0, 5328);

-- --------------------------------------------------------

--
-- Table structure for table `master_relationship`
--

CREATE TABLE `master_relationship` (
  `id` int(11) NOT NULL,
  `project_size` int(11) NOT NULL,
  `project_unit_type` varchar(100) DEFAULT NULL,
  `project_units` int(11) NOT NULL,
  `relationship_status` varchar(20) NOT NULL,
  `master_id_id` int(11) DEFAULT NULL,
  `quartpint_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_relationship`
--

INSERT INTO `master_relationship` (`id`, `project_size`, `project_unit_type`, `project_units`, `relationship_status`, `master_id_id`, `quartpint_id_id`) VALUES
(689, 1, 'Others', 0, 'active', 2193, 2188),
(690, 5, 'Others', 0, 'active', 2193, 2188),
(691, 0, 'Others', 0, 'active', 2193, 2188),
(692, 1, 'Others', 0, 'active', 2194, 2189),
(693, 5, 'Others', 0, 'active', 2194, 2189),
(694, 0, 'Others', 1117, 'active', 2194, 2189),
(695, 1, 'Others', 0, 'active', 2195, 2190),
(696, 5, 'Others', 0, 'active', 2195, 2190),
(697, 0, 'Others', 204, 'active', 2195, 2190),
(698, 1, 'Others', 0, 'active', 2196, 2191),
(699, 5, 'Others', 0, 'active', 2196, 2191),
(700, 0, 'Others', 751, 'active', 2196, 2191),
(701, 1, 'Others', 0, 'active', 2197, 2192),
(702, 5, 'Others', 0, 'active', 2197, 2192),
(703, 0, 'Others', 132, 'active', 2197, 2192),
(704, 1, 'Others', 0, 'active', 2198, 2193),
(705, 5, 'Others', 0, 'active', 2198, 2193),
(706, 0, 'Others', 2310, 'active', 2198, 2193),
(707, 1, 'Others', 0, 'active', 2199, 2194),
(708, 5, 'Others', 0, 'active', 2199, 2194),
(709, 0, 'Others', 3168, 'active', 2199, 2194),
(710, 1, 'Others', 0, 'active', 2200, 2195),
(711, 5, 'Others', 0, 'active', 2200, 2195),
(712, 0, 'Others', 1056, 'active', 2200, 2195),
(713, 1, 'Others', 0, 'active', 2201, 2196),
(714, 5, 'Others', 0, 'active', 2201, 2196),
(715, 0, 'Others', 202, 'active', 2201, 2196),
(716, 1, 'Others', 0, 'active', 2202, 2197),
(717, 5, 'Others', 0, 'active', 2202, 2197),
(718, 0, 'Others', 1152, 'active', 2202, 2197),
(719, 1, 'Others', 0, 'active', 2203, 2198),
(720, 5, 'Others', 0, 'active', 2203, 2198),
(721, 0, 'Others', 344, 'active', 2203, 2198),
(722, 1, 'Others', 0, 'active', 2204, 2199),
(723, 5, 'Others', 0, 'active', 2204, 2199),
(724, 0, 'Others', 3273, 'active', 2204, 2199),
(725, 1, 'Others', 0, 'active', 2205, 2200),
(726, 5, 'Others', 0, 'active', 2205, 2200),
(727, 0, 'Others', 914, 'active', 2205, 2200),
(728, 1, 'Others', 0, 'active', 2206, 2201),
(729, 5, 'Others', 0, 'active', 2206, 2201),
(730, 0, 'Others', 4032, 'active', 2206, 2201),
(731, 1, 'Others', 0, 'active', 2207, 2202),
(732, 5, 'Others', 0, 'active', 2207, 2202),
(733, 0, 'Others', 546, 'active', 2207, 2202),
(734, 1, 'Others', 0, 'active', 2208, 2203),
(735, 5, 'Others', 0, 'active', 2208, 2203),
(736, 0, 'Others', 15000, 'active', 2208, 2203),
(737, 1, 'Others', 0, 'active', 2209, 2204),
(738, 5, 'Others', 0, 'active', 2209, 2204),
(739, 0, 'Others', 5400, 'active', 2209, 2204),
(740, 1, 'Others', 0, 'active', 2210, 2205),
(741, 5, 'Others', 0, 'active', 2210, 2205),
(742, 0, 'Others', 7200, 'active', 2210, 2205),
(743, 1, 'Others', 0, 'active', 2211, 2206),
(744, 5, 'Others', 0, 'active', 2211, 2206),
(745, 0, 'Others', 882, 'active', 2211, 2206),
(746, 1, 'Others', 0, 'active', 2212, 2207),
(747, 5, 'Others', 0, 'active', 2212, 2207),
(748, 0, 'Others', 1584, 'active', 2212, 2207),
(749, 1, 'Others', 0, 'active', 2213, 2208),
(750, 5, 'Others', 0, 'active', 2213, 2208),
(751, 0, 'Others', 5328, 'active', 2213, 2208),
(752, 1, 'Others', 0, 'active', 2214, 2209),
(753, 5, 'Others', 0, 'active', 2214, 2209),
(754, 0, 'Others', 0, 'active', 2214, 2209),
(755, 1, 'Others', 0, 'active', 2215, 2210),
(756, 5, 'Others', 0, 'active', 2215, 2210),
(757, 0, 'Others', 0, 'active', 2215, 2210),
(758, 1, 'Others', 0, 'active', 2216, 2211),
(759, 5, 'Others', 0, 'active', 2216, 2211),
(760, 0, 'Others', 0, 'active', 2216, 2211),
(761, 1, 'Others', 0, 'active', 2217, 2212),
(762, 5, 'Others', 0, 'active', 2217, 2212),
(763, 0, 'Others', 0, 'active', 2217, 2212),
(764, 1, 'Others', 0, 'active', 2218, 2213),
(765, 5, 'Others', 0, 'active', 2218, 2213),
(766, 0, 'Others', 0, 'active', 2218, 2213),
(767, 1, 'Others', 0, 'active', 2219, 2214),
(768, 5, 'Others', 0, 'active', 2219, 2214),
(769, 0, 'Others', 0, 'active', 2219, 2214),
(770, 1, 'Others', 0, 'active', 2220, 2215),
(771, 5, 'Others', 0, 'active', 2220, 2215),
(772, 0, 'Others', 0, 'active', 2220, 2215),
(773, 1, 'Others', 0, 'active', 2221, 2216),
(774, 5, 'Others', 0, 'active', 2221, 2216),
(775, 0, 'Others', 0, 'active', 2221, 2216),
(776, 1, 'Others', 0, 'active', 2222, 2217),
(777, 5, 'Others', 0, 'active', 2222, 2217),
(778, 0, 'Others', 0, 'active', 2222, 2217),
(779, 1, 'Others', 0, 'active', 2223, 2218),
(780, 5, 'Others', 0, 'active', 2223, 2218),
(781, 0, 'Others', 0, 'active', 2223, 2218),
(782, 1, 'Others', 0, 'active', 2224, 2219),
(783, 5, 'Others', 0, 'active', 2224, 2219),
(784, 0, 'Others', 0, 'active', 2224, 2219),
(785, 1, 'Others', 0, 'active', 2225, 2220),
(786, 5, 'Others', 0, 'active', 2225, 2220),
(787, 0, 'Others', 0, 'active', 2225, 2220),
(788, 1, 'Others', 0, 'active', 2226, 2221),
(789, 5, 'Others', 0, 'active', 2226, 2221),
(790, 0, 'Others', 0, 'active', 2226, 2221),
(791, 1, 'Others', 0, 'active', 2227, 2222),
(792, 5, 'Others', 0, 'active', 2227, 2222),
(793, 0, 'Others', 0, 'active', 2227, 2222),
(794, 1, 'Others', 0, 'active', 2228, 2223),
(795, 5, 'Others', 0, 'active', 2228, 2223),
(796, 0, 'Others', 0, 'active', 2228, 2223),
(797, 1, 'Others', 0, 'active', 2229, 2224),
(798, 5, 'Others', 0, 'active', 2229, 2224),
(799, 0, 'Others', 0, 'active', 2229, 2224),
(800, 1, 'Others', 0, 'active', 2230, 2225),
(801, 5, 'Others', 0, 'active', 2230, 2225),
(802, 0, 'Others', 0, 'active', 2230, 2225),
(803, 1, 'Others', 0, 'active', 2231, 2226),
(804, 5, 'Others', 0, 'active', 2231, 2226),
(805, 0, 'Others', 0, 'active', 2231, 2226),
(806, 1, 'Others', 0, 'active', 2232, 2227),
(807, 5, 'Others', 0, 'active', 2232, 2227),
(808, 0, 'Others', 0, 'active', 2232, 2227),
(809, 1, 'Others', 0, 'active', 2233, 2228),
(810, 5, 'Others', 0, 'active', 2233, 2228),
(811, 0, 'Others', 0, 'active', 2233, 2228),
(812, 1, 'Others', 0, 'active', 2234, 2229),
(813, 5, 'Others', 0, 'active', 2234, 2229),
(814, 0, 'Others', 0, 'active', 2234, 2229),
(815, 1, 'Others', 0, 'active', 2235, 2230),
(816, 5, 'Others', 0, 'active', 2235, 2230),
(817, 0, 'Others', 0, 'active', 2235, 2230),
(818, 1, 'Others', 0, 'active', 2236, 2231),
(819, 5, 'Others', 0, 'active', 2236, 2231),
(820, 0, 'Others', 0, 'active', 2236, 2231),
(821, 1, 'Others', 0, 'active', 2237, 2232),
(822, 5, 'Others', 0, 'active', 2237, 2232),
(823, 0, 'Others', 0, 'active', 2237, 2232),
(824, 1, 'Others', 0, 'active', 2238, 2233),
(825, 5, 'Others', 0, 'active', 2238, 2233),
(826, 0, 'Others', 0, 'active', 2238, 2233),
(827, 1, 'Others', 0, 'active', 2239, 2234),
(828, 5, 'Others', 0, 'active', 2239, 2234),
(829, 0, 'Others', 0, 'active', 2239, 2234),
(830, 1, 'Others', 0, 'active', 2240, 2235),
(831, 5, 'Others', 0, 'active', 2240, 2235),
(832, 0, 'Others', 0, 'active', 2240, 2235),
(833, 1, 'Others', 0, 'active', 2241, 2236),
(834, 5, 'Others', 0, 'active', 2241, 2236),
(835, 0, 'Others', 0, 'active', 2241, 2236),
(836, 1, 'Others', 0, 'active', 2242, 2237),
(837, 5, 'Others', 0, 'active', 2242, 2237),
(838, 0, 'Others', 0, 'active', 2242, 2237),
(839, 1, 'Others', 0, 'active', 2243, 2238),
(840, 5, 'Others', 0, 'active', 2243, 2238),
(841, 0, 'Others', 0, 'active', 2243, 2238),
(842, 1, 'Others', 0, 'active', 2244, 2239),
(843, 5, 'Others', 0, 'active', 2244, 2239),
(844, 0, 'Others', 0, 'active', 2244, 2239),
(845, 1, 'Others', 0, 'active', 2245, 2240),
(846, 5, 'Others', 0, 'active', 2245, 2240),
(847, 0, 'Others', 0, 'active', 2245, 2240),
(848, 1, 'Others', 0, 'active', 2246, 2241),
(849, 5, 'Others', 0, 'active', 2246, 2241),
(850, 0, 'Others', 0, 'active', 2246, 2241),
(851, 1, 'Others', 0, 'active', 2247, 2242),
(852, 5, 'Others', 0, 'active', 2247, 2242),
(853, 0, 'Others', 0, 'active', 2247, 2242),
(854, 1, 'Others', 0, 'active', 2248, 2243),
(855, 5, 'Others', 0, 'active', 2248, 2243),
(856, 0, 'Others', 0, 'active', 2248, 2243),
(857, 1, 'Others', 0, 'active', 2249, 2244),
(858, 5, 'Others', 0, 'active', 2249, 2244),
(859, 0, 'Others', 0, 'active', 2249, 2244),
(860, 1, 'Others', 0, 'active', 2250, 2245),
(861, 5, 'Others', 0, 'active', 2250, 2245),
(862, 0, 'Others', 0, 'active', 2250, 2245),
(863, 1, 'Others', 0, 'active', 2251, 2246),
(864, 5, 'Others', 0, 'active', 2251, 2246),
(865, 0, 'Others', 0, 'active', 2251, 2246),
(866, 1, 'Others', 0, 'active', 2252, 2247),
(867, 5, 'Others', 0, 'active', 2252, 2247),
(868, 0, 'Others', 0, 'active', 2252, 2247),
(869, 1, 'Others', 0, 'active', 2253, 2248),
(870, 5, 'Others', 0, 'active', 2253, 2248),
(871, 0, 'Others', 0, 'active', 2253, 2248),
(872, 1, 'Others', 0, 'active', 2254, 2249),
(873, 5, 'Others', 0, 'active', 2254, 2249),
(874, 0, 'Others', 0, 'active', 2254, 2249),
(875, 1, 'Others', 0, 'active', 2255, 2250),
(876, 5, 'Others', 0, 'active', 2255, 2250),
(877, 0, 'Others', 0, 'active', 2255, 2250),
(878, 1, 'Others', 0, 'active', 2256, 2251),
(879, 5, 'Others', 0, 'active', 2256, 2251),
(880, 0, 'Others', 0, 'active', 2256, 2251),
(881, 1, 'Others', 0, 'active', 2257, 2252),
(882, 5, 'Others', 0, 'active', 2257, 2252),
(883, 0, 'Others', 0, 'active', 2257, 2252),
(884, 1, 'Others', 0, 'active', 2258, 2253),
(885, 5, 'Others', 0, 'active', 2258, 2253),
(886, 0, 'Others', 0, 'active', 2258, 2253),
(887, 1, 'Others', 0, 'active', 2259, 2254),
(888, 5, 'Others', 0, 'active', 2259, 2254),
(889, 0, 'Others', 0, 'active', 2259, 2254),
(890, 1, 'Others', 0, 'active', 2260, 2255),
(891, 5, 'Others', 0, 'active', 2260, 2255),
(892, 0, 'Others', 0, 'active', 2260, 2255),
(893, 1, 'Others', 0, 'active', 2261, 2256),
(894, 5, 'Others', 0, 'active', 2261, 2256),
(895, 0, 'Others', 0, 'active', 2261, 2256),
(896, 1, 'Others', 0, 'active', 2262, 2257),
(897, 5, 'Others', 0, 'active', 2262, 2257),
(898, 0, 'Others', 0, 'active', 2262, 2257),
(899, 1, 'Others', 0, 'active', 2263, 2258),
(900, 5, 'Others', 0, 'active', 2263, 2258),
(901, 0, 'Others', 0, 'active', 2263, 2258),
(902, 1, 'Others', 0, 'active', 2264, 2259),
(903, 5, 'Others', 0, 'active', 2264, 2259),
(904, 0, 'Others', 0, 'active', 2264, 2259),
(905, 1, 'Others', 0, 'active', 2265, 2260),
(906, 5, 'Others', 0, 'active', 2265, 2260),
(907, 0, 'Others', 0, 'active', 2265, 2260),
(908, 1, 'Others', 0, 'active', 2266, 2261),
(909, 5, 'Others', 0, 'active', 2266, 2261),
(910, 0, 'Others', 0, 'active', 2266, 2261),
(911, 1, 'Others', 0, 'active', 2267, 2262),
(912, 5, 'Others', 0, 'active', 2267, 2262),
(913, 0, 'Others', 0, 'active', 2267, 2262),
(914, 1, 'Others', 0, 'active', 2268, 2263),
(915, 5, 'Others', 0, 'active', 2268, 2263),
(916, 0, 'Others', 0, 'active', 2268, 2263),
(917, 1, 'Others', 0, 'active', 2269, 2264),
(918, 5, 'Others', 0, 'active', 2269, 2264),
(919, 0, 'Others', 0, 'active', 2269, 2264),
(920, 1, 'Others', 0, 'active', 2270, 2265),
(921, 5, 'Others', 0, 'active', 2270, 2265),
(922, 0, 'Others', 0, 'active', 2270, 2265),
(923, 1, 'Others', 0, 'active', 2271, 2266),
(924, 5, 'Others', 0, 'active', 2271, 2266),
(925, 0, 'Others', 0, 'active', 2271, 2266),
(926, 1, 'Others', 0, 'active', 2272, 2267),
(927, 5, 'Others', 0, 'active', 2272, 2267),
(928, 0, 'Others', 0, 'active', 2272, 2267),
(929, 1, 'Others', 0, 'active', 2273, 2268),
(930, 5, 'Others', 0, 'active', 2273, 2268),
(931, 0, 'Others', 1117, 'active', 2273, 2268),
(932, 1, 'Others', 0, 'active', 2274, 2269),
(933, 5, 'Others', 0, 'active', 2274, 2269),
(934, 0, 'Others', 204, 'active', 2274, 2269),
(935, 1, 'Others', 0, 'active', 2275, 2270),
(936, 5, 'Others', 0, 'active', 2275, 2270),
(937, 0, 'Others', 751, 'active', 2275, 2270),
(938, 1, 'Others', 0, 'active', 2276, 2271),
(939, 5, 'Others', 0, 'active', 2276, 2271),
(940, 0, 'Others', 132, 'active', 2276, 2271),
(941, 1, 'Others', 0, 'active', 2277, 2272),
(942, 5, 'Others', 0, 'active', 2277, 2272),
(943, 0, 'Others', 2310, 'active', 2277, 2272),
(944, 1, 'Others', 0, 'active', 2278, 2273),
(945, 5, 'Others', 0, 'active', 2278, 2273),
(946, 0, 'Others', 3168, 'active', 2278, 2273),
(947, 1, 'Others', 0, 'active', 2279, 2274),
(948, 5, 'Others', 0, 'active', 2279, 2274),
(949, 0, 'Others', 1056, 'active', 2279, 2274),
(950, 1, 'Others', 0, 'active', 2280, 2275),
(951, 5, 'Others', 0, 'active', 2280, 2275),
(952, 0, 'Others', 202, 'active', 2280, 2275),
(953, 1, 'Others', 0, 'active', 2281, 2276),
(954, 5, 'Others', 0, 'active', 2281, 2276),
(955, 0, 'Others', 1152, 'active', 2281, 2276),
(956, 1, 'Others', 0, 'active', 2282, 2277),
(957, 5, 'Others', 0, 'active', 2282, 2277),
(958, 0, 'Others', 344, 'active', 2282, 2277),
(959, 1, 'Others', 0, 'active', 2283, 2278),
(960, 5, 'Others', 0, 'active', 2283, 2278),
(961, 0, 'Others', 3273, 'active', 2283, 2278),
(962, 1, 'Others', 0, 'active', 2284, 2279),
(963, 5, 'Others', 0, 'active', 2284, 2279),
(964, 0, 'Others', 914, 'active', 2284, 2279),
(965, 1, 'Others', 0, 'active', 2285, 2280),
(966, 5, 'Others', 0, 'active', 2285, 2280),
(967, 0, 'Others', 4032, 'active', 2285, 2280),
(968, 1, 'Others', 0, 'active', 2286, 2281),
(969, 5, 'Others', 0, 'active', 2286, 2281),
(970, 0, 'Others', 546, 'active', 2286, 2281),
(971, 1, 'Others', 0, 'active', 2287, 2282),
(972, 5, 'Others', 0, 'active', 2287, 2282),
(973, 0, 'Others', 15000, 'active', 2287, 2282),
(974, 1, 'Others', 0, 'active', 2288, 2283),
(975, 5, 'Others', 0, 'active', 2288, 2283),
(976, 0, 'Others', 5400, 'active', 2288, 2283),
(977, 1, 'Others', 0, 'active', 2289, 2284),
(978, 5, 'Others', 0, 'active', 2289, 2284),
(979, 0, 'Others', 7200, 'active', 2289, 2284),
(980, 1, 'Others', 0, 'active', 2290, 2285),
(981, 5, 'Others', 0, 'active', 2290, 2285),
(982, 0, 'Others', 882, 'active', 2290, 2285),
(983, 1, 'Others', 0, 'active', 2291, 2286),
(984, 5, 'Others', 0, 'active', 2291, 2286),
(985, 0, 'Others', 1584, 'active', 2291, 2286),
(986, 1, 'Others', 0, 'active', 2292, 2287),
(987, 5, 'Others', 0, 'active', 2292, 2287),
(988, 0, 'Others', 5328, 'active', 2292, 2287),
(989, 1, 'Others', 0, 'active', 2293, 2288),
(990, 5, 'Others', 0, 'active', 2293, 2288),
(991, 0, 'Others', 1470, 'active', 2293, 2288),
(992, 1, 'Others', 0, 'active', 2294, 2289),
(993, 5, 'Others', 0, 'active', 2294, 2289),
(994, 0, 'Others', 888, 'active', 2294, 2289),
(995, 1, 'Others', 0, 'active', 2295, 2290),
(996, 5, 'Others', 0, 'active', 2295, 2290),
(997, 0, 'Others', 630, 'active', 2295, 2290),
(998, 1, 'Others', 0, 'active', 2296, 2291),
(999, 5, 'Others', 0, 'active', 2296, 2291),
(1000, 0, 'Others', 1470, 'active', 2296, 2291),
(1001, 1, 'Others', 0, 'active', 2297, 2292),
(1002, 5, 'Others', 0, 'active', 2297, 2292),
(1003, 0, 'Others', 258, 'active', 2297, 2292),
(1004, 1, 'Others', 0, 'active', 2298, 2293),
(1005, 5, 'Others', 0, 'active', 2298, 2293),
(1006, 0, 'Others', 240, 'active', 2298, 2293),
(1007, 1, 'Others', 0, 'active', 2299, 2294),
(1008, 5, 'Others', 0, 'active', 2299, 2294),
(1009, 0, 'Others', 630, 'active', 2299, 2294),
(1010, 1, 'Others', 0, 'active', 2300, 2295),
(1011, 5, 'Others', 0, 'active', 2300, 2295),
(1012, 0, 'Others', 630, 'active', 2300, 2295),
(1013, 1, 'Others', 0, 'active', 2301, 2296),
(1014, 5, 'Others', 0, 'active', 2301, 2296),
(1015, 0, 'Others', 630, 'active', 2301, 2296),
(1016, 1, 'Others', 0, 'active', 2302, 2297),
(1017, 5, 'Others', 0, 'active', 2302, 2297),
(1018, 0, 'Others', 420, 'active', 2302, 2297),
(1019, 1, 'Others', 0, 'active', 2303, 2298),
(1020, 5, 'Others', 0, 'active', 2303, 2298),
(1021, 0, 'Others', 840, 'active', 2303, 2298),
(1022, 1, 'Others', 0, 'active', 2304, 2299),
(1023, 5, 'Others', 0, 'active', 2304, 2299),
(1024, 0, 'Others', 1260, 'active', 2304, 2299),
(1025, 1, 'Others', 0, 'active', 2305, 2300),
(1026, 5, 'Others', 0, 'active', 2305, 2300),
(1027, 0, 'Others', 384, 'active', 2305, 2300),
(1028, 1, 'Others', 0, 'active', 2306, 2301),
(1029, 5, 'Others', 0, 'active', 2306, 2301),
(1030, 0, 'Others', 630, 'active', 2306, 2301),
(1031, 1, 'Others', 0, 'active', 2307, 2302),
(1032, 5, 'Others', 0, 'active', 2307, 2302),
(1033, 0, 'Others', 0, 'active', 2307, 2302),
(1034, 1, 'Others', 0, 'active', 2308, 2303),
(1035, 5, 'Others', 0, 'active', 2308, 2303),
(1036, 0, 'Others', 1050, 'active', 2308, 2303),
(1037, 1, 'Others', 0, 'active', 2309, 2304),
(1038, 5, 'Others', 0, 'active', 2309, 2304),
(1039, 0, 'Others', 1680, 'active', 2309, 2304),
(1040, 1, 'Others', 0, 'active', 2310, 2305),
(1041, 5, 'Others', 0, 'active', 2310, 2305),
(1042, 0, 'Others', 1260, 'active', 2310, 2305),
(1043, 1, 'Others', 0, 'active', 2311, 2306),
(1044, 5, 'Others', 0, 'active', 2311, 2306),
(1045, 0, 'Others', 1260, 'active', 2311, 2306),
(1046, 1, 'Others', 0, 'active', 2312, 2307),
(1047, 5, 'Others', 0, 'active', 2312, 2307),
(1048, 0, 'Others', 576, 'active', 2312, 2307),
(1049, 1, 'Others', 0, 'active', 2313, 2308),
(1050, 5, 'Others', 0, 'active', 2313, 2308),
(1051, 0, 'Others', 630, 'active', 2313, 2308),
(1052, 1, 'Others', 0, 'active', 2314, 2309),
(1053, 5, 'Others', 0, 'active', 2314, 2309),
(1054, 0, 'Others', 1470, 'active', 2314, 2309),
(1055, 1, 'Others', 0, 'active', 2315, 2310),
(1056, 5, 'Others', 0, 'active', 2315, 2310),
(1057, 0, 'Others', 210, 'active', 2315, 2310),
(1058, 1, 'Others', 0, 'active', 2316, 2311),
(1059, 5, 'Others', 0, 'active', 2316, 2311),
(1060, 0, 'Others', 1470, 'active', 2316, 2311),
(1061, 1, 'Others', 0, 'active', 2317, 2312),
(1062, 5, 'Others', 0, 'active', 2317, 2312),
(1063, 0, 'Others', 840, 'active', 2317, 2312),
(1064, 1, 'Others', 0, 'active', 2318, 2313),
(1065, 5, 'Others', 0, 'active', 2318, 2313),
(1066, 0, 'Others', 0, 'active', 2318, 2313),
(1067, 1, 'Others', 0, 'active', 2319, 2314),
(1068, 5, 'Others', 0, 'active', 2319, 2314),
(1069, 0, 'Others', 1260, 'active', 2319, 2314),
(1070, 1, 'Others', 0, 'active', 2320, 2315),
(1071, 5, 'Others', 0, 'active', 2320, 2315),
(1072, 0, 'Others', 1680, 'active', 2320, 2315),
(1073, 1, 'Others', 0, 'active', 2321, 2316),
(1074, 5, 'Others', 0, 'active', 2321, 2316),
(1075, 0, 'Others', 840, 'active', 2321, 2316),
(1076, 1, 'Others', 0, 'active', 2322, 2317),
(1077, 5, 'Others', 0, 'active', 2322, 2317),
(1078, 0, 'Others', 840, 'active', 2322, 2317),
(1079, 1, 'Others', 0, 'active', 2323, 2318),
(1080, 5, 'Others', 0, 'active', 2323, 2318),
(1081, 0, 'Others', 420, 'active', 2323, 2318),
(1082, 1, 'Others', 0, 'active', 2324, 2319),
(1083, 5, 'Others', 0, 'active', 2324, 2319),
(1084, 0, 'Others', 1470, 'active', 2324, 2319),
(1088, 1, 'Others', 0, 'active', 2326, 2321),
(1089, 5, 'Others', 0, 'active', 2326, 2321),
(1090, 0, 'Others', 1680, 'active', 2326, 2321),
(1094, 1, 'Others', 0, 'active', 2328, 2323),
(1095, 5, 'Others', 0, 'active', 2328, 2323),
(1096, 0, 'Others', 1050, 'active', 2328, 2323),
(1100, 1, 'Others', 0, 'active', 2330, 2325),
(1101, 5, 'Others', 0, 'active', 2330, 2325),
(1102, 0, 'Others', 2100, 'active', 2330, 2325),
(1103, 1, 'Others', 0, 'active', 2331, 2326),
(1104, 5, 'Others', 0, 'active', 2331, 2326),
(1105, 0, 'Others', 630, 'active', 2331, 2326),
(1109, 1, 'Others', 0, 'active', 2333, 2328),
(1110, 5, 'Others', 0, 'active', 2333, 2328),
(1111, 0, 'Others', 630, 'active', 2333, 2328),
(1115, 1, 'Others', 0, 'active', 2335, 2330),
(1116, 5, 'Others', 0, 'active', 2335, 2330),
(1117, 0, 'Others', 1260, 'active', 2335, 2330),
(1118, 1, 'Others', 0, 'active', 2336, 2331),
(1119, 5, 'Others', 0, 'active', 2336, 2331),
(1120, 0, 'Others', 1680, 'active', 2336, 2331),
(1154, 1, 'Others', 0, 'active', 2348, 2343),
(1155, 5, 'Others', 0, 'active', 2348, 2343),
(1156, 0, 'Others', 1117, 'active', 2348, 2343),
(1157, 1, 'Others', 0, 'active', 2349, 2344),
(1158, 5, 'Others', 0, 'active', 2349, 2344),
(1159, 0, 'Others', 204, 'active', 2349, 2344),
(1160, 1, 'Others', 0, 'active', 2350, 2345),
(1161, 5, 'Others', 0, 'active', 2350, 2345),
(1162, 0, 'Others', 751, 'active', 2350, 2345),
(1163, 1, 'Others', 0, 'active', 2351, 2346),
(1164, 5, 'Others', 0, 'active', 2351, 2346),
(1165, 0, 'Others', 132, 'active', 2351, 2346),
(1166, 1, 'Others', 0, 'active', 2352, 2347),
(1167, 5, 'Others', 0, 'active', 2352, 2347),
(1168, 0, 'Others', 2310, 'active', 2352, 2347),
(1169, 1, 'Others', 0, 'active', 2353, 2348),
(1170, 5, 'Others', 0, 'active', 2353, 2348),
(1171, 0, 'Others', 3168, 'active', 2353, 2348),
(1172, 1, 'Others', 0, 'active', 2354, 2349),
(1173, 5, 'Others', 0, 'active', 2354, 2349),
(1174, 0, 'Others', 1056, 'active', 2354, 2349),
(1175, 1, 'Others', 0, 'active', 2355, 2350),
(1176, 5, 'Others', 0, 'active', 2355, 2350),
(1177, 0, 'Others', 202, 'active', 2355, 2350),
(1178, 1, 'Others', 0, 'active', 2356, 2351),
(1179, 5, 'Others', 0, 'active', 2356, 2351),
(1180, 0, 'Others', 1152, 'active', 2356, 2351),
(1181, 1, 'Others', 0, 'active', 2357, 2352),
(1182, 5, 'Others', 0, 'active', 2357, 2352),
(1183, 0, 'Others', 344, 'active', 2357, 2352),
(1184, 1, 'Others', 0, 'active', 2358, 2353),
(1185, 5, 'Others', 0, 'active', 2358, 2353),
(1186, 0, 'Others', 3273, 'active', 2358, 2353),
(1187, 1, 'Others', 0, 'active', 2359, 2354),
(1188, 5, 'Others', 0, 'active', 2359, 2354),
(1189, 0, 'Others', 914, 'active', 2359, 2354),
(1190, 1, 'Others', 0, 'active', 2360, 2355),
(1191, 5, 'Others', 0, 'active', 2360, 2355),
(1192, 0, 'Others', 4032, 'active', 2360, 2355),
(1193, 1, 'Others', 0, 'active', 2361, 2356),
(1194, 5, 'Others', 0, 'active', 2361, 2356),
(1195, 0, 'Others', 546, 'active', 2361, 2356),
(1196, 1, 'Others', 0, 'active', 2362, 2357),
(1197, 5, 'Others', 0, 'active', 2362, 2357),
(1198, 0, 'Others', 15000, 'active', 2362, 2357),
(1199, 1, 'Others', 0, 'active', 2363, 2358),
(1200, 5, 'Others', 0, 'active', 2363, 2358),
(1201, 0, 'Others', 5400, 'active', 2363, 2358),
(1202, 1, 'Others', 0, 'active', 2364, 2359),
(1203, 5, 'Others', 0, 'active', 2364, 2359),
(1204, 0, 'Others', 7200, 'active', 2364, 2359),
(1205, 1, 'Others', 0, 'active', 2365, 2360),
(1206, 5, 'Others', 0, 'active', 2365, 2360),
(1207, 0, 'Others', 882, 'active', 2365, 2360),
(1208, 1, 'Others', 0, 'active', 2366, 2361),
(1209, 5, 'Others', 0, 'active', 2366, 2361),
(1210, 0, 'Others', 1584, 'active', 2366, 2361),
(1211, 1, 'Others', 0, 'active', 2367, 2362),
(1212, 5, 'Others', 0, 'active', 2367, 2362),
(1213, 0, 'Others', 5328, 'active', 2367, 2362),
(1214, 1, 'Others', 0, 'active', 2368, 2363),
(1215, 5, 'Others', 0, 'active', 2368, 2363),
(1216, 0, 'Others', 1470, 'active', 2368, 2363),
(1217, 1, 'Others', 0, 'active', 2369, 2364),
(1218, 5, 'Others', 0, 'active', 2369, 2364),
(1219, 0, 'Others', 888, 'active', 2369, 2364),
(1220, 1, 'Others', 0, 'active', 2370, 2365),
(1221, 5, 'Others', 0, 'active', 2370, 2365),
(1222, 0, 'Others', 630, 'active', 2370, 2365),
(1223, 1, 'Others', 0, 'active', 2371, 2366),
(1224, 5, 'Others', 0, 'active', 2371, 2366),
(1225, 0, 'Others', 1470, 'active', 2371, 2366),
(1226, 1, 'Others', 0, 'active', 2372, 2367),
(1227, 5, 'Others', 0, 'active', 2372, 2367),
(1228, 0, 'Others', 258, 'active', 2372, 2367),
(1229, 1, 'Others', 0, 'active', 2373, 2368),
(1230, 5, 'Others', 0, 'active', 2373, 2368),
(1231, 0, 'Others', 240, 'active', 2373, 2368),
(1232, 1, 'Others', 0, 'active', 2374, 2369),
(1233, 5, 'Others', 0, 'active', 2374, 2369),
(1234, 0, 'Others', 630, 'active', 2374, 2369),
(1235, 1, 'Others', 0, 'active', 2375, 2370),
(1236, 5, 'Others', 0, 'active', 2375, 2370),
(1237, 0, 'Others', 630, 'active', 2375, 2370),
(1238, 1, 'Others', 0, 'active', 2376, 2371),
(1239, 5, 'Others', 0, 'active', 2376, 2371),
(1240, 0, 'Others', 630, 'active', 2376, 2371),
(1241, 1, 'Others', 0, 'active', 2377, 2372),
(1242, 5, 'Others', 0, 'active', 2377, 2372),
(1243, 0, 'Others', 420, 'active', 2377, 2372),
(1244, 1, 'Others', 0, 'active', 2378, 2373),
(1245, 5, 'Others', 0, 'active', 2378, 2373),
(1246, 0, 'Others', 840, 'active', 2378, 2373),
(1247, 1, 'Others', 0, 'active', 2379, 2374),
(1248, 5, 'Others', 0, 'active', 2379, 2374),
(1249, 0, 'Others', 1260, 'active', 2379, 2374),
(1250, 1, 'Others', 0, 'active', 2380, 2375),
(1251, 5, 'Others', 0, 'active', 2380, 2375),
(1252, 0, 'Others', 384, 'active', 2380, 2375),
(1253, 1, 'Others', 0, 'active', 2381, 2376),
(1254, 5, 'Others', 0, 'active', 2381, 2376),
(1255, 0, 'Others', 630, 'active', 2381, 2376),
(1256, 1, 'Others', 0, 'active', 2382, 2377),
(1257, 5, 'Others', 0, 'active', 2382, 2377),
(1258, 0, 'Others', 0, 'active', 2382, 2377),
(1259, 1, 'Others', 0, 'active', 2383, 2378),
(1260, 5, 'Others', 0, 'active', 2383, 2378),
(1261, 0, 'Others', 1050, 'active', 2383, 2378),
(1262, 1, 'Others', 0, 'active', 2384, 2379),
(1263, 5, 'Others', 0, 'active', 2384, 2379),
(1264, 0, 'Others', 1680, 'active', 2384, 2379),
(1265, 1, 'Others', 0, 'active', 2385, 2380),
(1266, 5, 'Others', 0, 'active', 2385, 2380),
(1267, 0, 'Others', 1260, 'active', 2385, 2380),
(1268, 1, 'Others', 0, 'active', 2386, 2381),
(1269, 5, 'Others', 0, 'active', 2386, 2381),
(1270, 0, 'Others', 1260, 'active', 2386, 2381),
(1271, 1, 'Others', 0, 'active', 2387, 2382),
(1272, 5, 'Others', 0, 'active', 2387, 2382),
(1273, 0, 'Others', 576, 'active', 2387, 2382),
(1274, 1, 'Others', 0, 'active', 2388, 2383),
(1275, 5, 'Others', 0, 'active', 2388, 2383),
(1276, 0, 'Others', 630, 'active', 2388, 2383),
(1277, 1, 'Others', 0, 'active', 2389, 2384),
(1278, 5, 'Others', 0, 'active', 2389, 2384),
(1279, 0, 'Others', 1470, 'active', 2389, 2384),
(1280, 1, 'Others', 0, 'active', 2390, 2385),
(1281, 5, 'Others', 0, 'active', 2390, 2385),
(1282, 0, 'Others', 210, 'active', 2390, 2385),
(1283, 1, 'Others', 0, 'active', 2391, 2386),
(1284, 5, 'Others', 0, 'active', 2391, 2386),
(1285, 0, 'Others', 1470, 'active', 2391, 2386),
(1286, 1, 'Others', 0, 'active', 2392, 2387),
(1287, 5, 'Others', 0, 'active', 2392, 2387),
(1288, 0, 'Others', 840, 'active', 2392, 2387),
(1289, 1, 'Others', 0, 'active', 2393, 2388),
(1290, 5, 'Others', 0, 'active', 2393, 2388),
(1291, 0, 'Others', 0, 'active', 2393, 2388),
(1292, 1, 'Others', 0, 'active', 2394, 2389),
(1293, 5, 'Others', 0, 'active', 2394, 2389),
(1294, 0, 'Others', 1260, 'active', 2394, 2389),
(1295, 1, 'Others', 0, 'active', 2395, 2390),
(1296, 5, 'Others', 0, 'active', 2395, 2390),
(1297, 0, 'Others', 1680, 'active', 2395, 2390),
(1298, 1, 'Others', 0, 'active', 2396, 2391),
(1299, 5, 'Others', 0, 'active', 2396, 2391),
(1300, 0, 'Others', 1470, 'active', 2396, 2391),
(1301, 1, 'Others', 0, 'active', 2397, 2392),
(1302, 5, 'Others', 0, 'active', 2397, 2392),
(1303, 0, 'Others', 1680, 'active', 2397, 2392),
(1304, 1, 'Others', 0, 'active', 2398, 2393),
(1305, 5, 'Others', 0, 'active', 2398, 2393),
(1306, 0, 'Others', 1050, 'active', 2398, 2393),
(1307, 1, 'Others', 0, 'active', 2399, 2394),
(1308, 5, 'Others', 0, 'active', 2399, 2394),
(1309, 0, 'Others', 2100, 'active', 2399, 2394),
(1310, 1, 'Others', 0, 'active', 2400, 2395),
(1311, 5, 'Others', 0, 'active', 2400, 2395),
(1312, 0, 'Others', 630, 'active', 2400, 2395),
(1313, 1, 'Others', 0, 'active', 2401, 2396),
(1314, 5, 'Others', 0, 'active', 2401, 2396),
(1315, 0, 'Others', 630, 'active', 2401, 2396),
(1316, 1, 'Others', 0, 'active', 2402, 2397),
(1317, 5, 'Others', 0, 'active', 2402, 2397),
(1318, 0, 'Others', 1260, 'active', 2402, 2397),
(1319, 1, 'Others', 0, 'active', 2403, 2398),
(1320, 5, 'Others', 0, 'active', 2403, 2398),
(1321, 0, 'Others', 1680, 'active', 2403, 2398),
(1322, 1, 'Others', 0, 'active', 2404, 2399),
(1323, 5, 'Others', 0, 'active', 2404, 2399),
(1324, 0, 'Others', 1260, 'active', 2404, 2399),
(1328, 1, 'Others', 0, 'active', 2406, 2401),
(1329, 5, 'Others', 0, 'active', 2406, 2401),
(1330, 0, 'Others', 1680, 'active', 2406, 2401),
(1334, 1, 'Others', 0, 'active', 2408, 2403),
(1335, 5, 'Others', 0, 'active', 2408, 2403),
(1336, 0, 'Others', 1050, 'active', 2408, 2403),
(1340, 1, 'Others', 0, 'active', 2410, 2405),
(1341, 5, 'Others', 0, 'active', 2410, 2405),
(1342, 0, 'Others', 1680, 'active', 2410, 2405),
(1346, 1, 'Others', 0, 'active', 2412, 2407),
(1347, 5, 'Others', 0, 'active', 2412, 2407),
(1348, 0, 'Others', 1050, 'active', 2412, 2407),
(1352, 1, 'Others', 0, 'active', 2414, 2409),
(1353, 5, 'Others', 0, 'active', 2414, 2409),
(1354, 0, 'Others', 1470, 'active', 2414, 2409),
(1358, 1, 'Others', 0, 'active', 2416, 2411),
(1359, 5, 'Others', 0, 'active', 2416, 2411),
(1360, 0, 'Others', 1680, 'active', 2416, 2411),
(1364, 1, 'Others', 0, 'active', 2418, 2413),
(1365, 5, 'Others', 0, 'active', 2418, 2413),
(1366, 0, 'Others', 1050, 'active', 2418, 2413),
(1367, 1, 'Others', 0, 'active', 2419, 2414),
(1368, 5, 'Others', 0, 'active', 2419, 2414),
(1369, 0, 'Others', 420, 'active', 2419, 2414),
(1373, 1, 'Others', 0, 'active', 2421, 2416),
(1374, 5, 'Others', 0, 'active', 2421, 2416),
(1375, 0, 'Others', 1260, 'active', 2421, 2416),
(1379, 1, 'Others', 0, 'active', 2423, 2418),
(1380, 5, 'Others', 0, 'active', 2423, 2418),
(1381, 0, 'Others', 2100, 'active', 2423, 2418),
(1388, 1, 'G', 0, 'active', 2426, 2421),
(1389, 5, 'G', 792, 'active', 2426, 2421),
(1390, 1, 'G', 0, 'active', 2427, 2422),
(1391, 5, 'G', 792, 'active', 2427, 2422),
(1392, 1, 'G', 0, 'active', 2428, 2423),
(1393, 5, 'G', 792, 'active', 2428, 2423),
(1394, 1, 'G', 0, 'active', 2429, 2424),
(1395, 5, 'G', 792, 'active', 2429, 2424),
(1396, 1, 'G', 0, 'active', 2430, 2425),
(1397, 5, 'G', 792, 'active', 2430, 2425),
(1398, 1, 'G', 0, 'active', 2431, 2426),
(1399, 5, 'G', 792, 'active', 2431, 2426),
(1400, 1, 'G', 0, 'active', 2432, 2427),
(1401, 5, 'G', 792, 'active', 2432, 2427),
(1402, 1, 'G', 0, 'active', 2433, 2428),
(1403, 5, 'G', 792, 'active', 2433, 2428),
(1404, 1, 'G', 0, 'active', 2434, 2429),
(1405, 5, 'G', 792, 'active', 2434, 2429),
(1406, 1, 'G', 0, 'active', 2435, 2430),
(1407, 5, 'G', 792, 'active', 2435, 2430),
(1408, 1, 'G', 0, 'active', 2436, 2431),
(1409, 5, 'G', 792, 'active', 2436, 2431),
(1410, 1, 'G', 0, 'active', 2437, 2432),
(1411, 5, 'G', 792, 'active', 2437, 2432),
(1412, 1, 'G', 0, 'active', 2438, 2433),
(1413, 5, 'G', 792, 'active', 2438, 2433),
(1414, 1, 'G', 0, 'active', 2439, 2434),
(1415, 5, 'G', 792, 'active', 2439, 2434),
(1416, 1, 'G', 0, 'active', 2440, 2435),
(1417, 5, 'G', 792, 'active', 2440, 2435),
(1418, 1, 'G', 0, 'active', 2441, 2436),
(1419, 5, 'G', 792, 'active', 2441, 2436),
(1420, 1, 'G', 0, 'active', 2442, 2437),
(1421, 5, 'G', 792, 'active', 2442, 2437),
(1422, 1, 'G', 0, 'active', 2443, 2438),
(1423, 5, 'G', 792, 'active', 2443, 2438),
(1424, 1, 'G', 630, 'active', 2444, 2439),
(1425, 5, 'G', 792, 'active', 2444, 2439),
(1426, 1, 'G', 630, 'active', 2445, 2440),
(1427, 5, 'G', 792, 'active', 2445, 2440),
(1428, 1, 'G', 630, 'active', 2446, 2441),
(1429, 5, 'G', 792, 'active', 2446, 2441),
(1430, 1, 'G', 630, 'active', 2447, 2442),
(1431, 5, 'G', 792, 'active', 2447, 2442),
(1432, 1, 'G', 2100, 'active', 2448, 2443),
(1433, 5, 'G', 0, 'active', 2448, 2443),
(1434, 1, 'G', 2100, 'active', 2449, 2444),
(1435, 5, 'G', 0, 'active', 2449, 2444),
(1436, 1, 'G', 2100, 'active', 2450, 2445),
(1437, 5, 'G', 0, 'active', 2450, 2445),
(1438, 1, 'G', 2100, 'active', 2451, 2446),
(1439, 5, 'G', 0, 'active', 2451, 2446),
(1440, 1, 'G', 2100, 'active', 2452, 2447),
(1441, 5, 'G', 0, 'active', 2452, 2447),
(1442, 1, 'G', 2100, 'active', 2453, 2448),
(1443, 5, 'G', 0, 'active', 2453, 2448),
(1444, 1, 'G', 2100, 'active', 2454, 2449),
(1445, 5, 'G', 0, 'active', 2454, 2449),
(1446, 1, 'G', 2100, 'active', 2455, 2450),
(1447, 5, 'G', 0, 'active', 2455, 2450),
(1448, 1, 'G', 2100, 'active', 2456, 2451),
(1449, 5, 'G', 0, 'active', 2456, 2451),
(1450, 1, 'G', 880, 'active', 2457, 2452),
(1451, 5, 'G', 0, 'active', 2457, 2452),
(1452, 1, 'G', 792, 'active', 2458, 2453),
(1453, 5, 'G', 792, 'active', 2458, 2453),
(1454, 1, 'G', 1020, 'active', 2459, 2454),
(1455, 5, 'G', 0, 'active', 2459, 2454),
(1456, 1, 'G', 792, 'active', 2460, 2455),
(1457, 5, 'G', 792, 'active', 2460, 2455),
(1458, 1, 'G', 0, 'active', 2461, 2456),
(1459, 5, 'G', 432, 'active', 2461, 2456),
(1460, 1, 'Others', 0, 'active', 2462, 2457),
(1461, 5, 'Others', 0, 'active', 2462, 2457),
(1462, 0, 'Others', 12, 'active', 2462, 2457),
(1463, 1, 'Others', 0, 'active', 2463, 2458),
(1464, 5, 'Others', 0, 'active', 2463, 2458),
(1465, 0, 'Others', 2, 'active', 2463, 2458),
(1610, 1, 'G', 0, 'active', 2524, 2519),
(1611, 5, 'G', 480, 'active', 2524, 2519),
(1708, 1, 'G', 1050, 'active', 2565, 2560),
(1709, 5, 'G', 0, 'active', 2565, 2560),
(1710, 1, 'G', 1720, 'active', 2566, 2561),
(1711, 5, 'G', 0, 'active', 2566, 2561),
(1712, 1, 'G', 1050, 'active', 2567, 2562),
(1713, 5, 'G', 0, 'active', 2567, 2562),
(1714, 1, 'G', 0, 'active', 2568, 2563),
(1715, 5, 'G', 792, 'active', 2568, 2563),
(1716, 1, 'G', 0, 'active', 2569, 2564),
(1717, 5, 'G', 792, 'active', 2569, 2564),
(1874, 1, 'G', 1680, 'active', 2635, 2630),
(1875, 5, 'G', 0, 'active', 2635, 2630),
(1876, 1, 'G', 0, 'active', 2636, 2631),
(1877, 5, 'G', 864, 'active', 2636, 2631),
(1878, 1, 'G', 1680, 'active', 2637, 2632),
(1879, 5, 'G', 0, 'active', 2637, 2632),
(1880, 1, 'G', 1680, 'active', 2638, 2633),
(1881, 5, 'G', 0, 'active', 2638, 2633),
(1882, 1, 'G', 0, 'active', 2639, 2634),
(1883, 5, 'G', 792, 'active', 2639, 2634),
(1940, 1, 'G', 0, 'active', 2664, 2659),
(1941, 5, 'G', 144, 'active', 2664, 2659),
(1942, 1, 'G', 0, 'active', 2665, 2660),
(1943, 5, 'G', 288, 'active', 2665, 2660),
(1944, 1, 'G', 0, 'active', 2666, 2661),
(1945, 5, 'G', 528, 'active', 2666, 2661),
(1946, 1, 'G', 0, 'active', 2667, 2662),
(1947, 5, 'G', 432, 'active', 2667, 2662),
(1948, 1, 'G', 0, 'active', 2668, 2663),
(1949, 5, 'G', 168, 'active', 2668, 2663),
(1950, 1, 'G', 0, 'active', 2669, 2664),
(1951, 5, 'G', 432, 'active', 2669, 2664),
(1952, 1, 'G', 0, 'active', 2670, 2665),
(1953, 5, 'G', 96, 'active', 2670, 2665),
(1954, 1, 'G', 0, 'active', 2671, 2666),
(1955, 5, 'G', 360, 'active', 2671, 2666),
(1956, 1, 'G', 0, 'active', 2672, 2667),
(1957, 5, 'G', 432, 'active', 2672, 2667),
(1958, 1, 'G', 0, 'active', 2673, 2668),
(1959, 5, 'G', 96, 'active', 2673, 2668),
(1960, 1, 'G', 0, 'active', 2674, 2669),
(1961, 5, 'G', 240, 'active', 2674, 2669),
(1962, 1, 'G', 0, 'active', 2675, 2670),
(1963, 5, 'G', 336, 'active', 2675, 2670),
(1964, 1, 'G', 0, 'active', 2676, 2671),
(1965, 5, 'G', 576, 'active', 2676, 2671),
(1966, 1, 'G', 0, 'active', 2677, 2672),
(1967, 5, 'G', 456, 'active', 2677, 2672),
(1968, 1, 'G', 0, 'active', 2678, 2673),
(1969, 5, 'G', 720, 'active', 2678, 2673),
(1970, 1, 'G', 0, 'active', 2679, 2674),
(1971, 5, 'G', 576, 'active', 2679, 2674),
(1972, 1, 'G', 0, 'active', 2680, 2675),
(1973, 5, 'G', 504, 'active', 2680, 2675),
(1974, 1, 'G', 0, 'active', 2681, 2676),
(1975, 5, 'G', 504, 'active', 2681, 2676),
(1976, 1, 'G', 0, 'active', 2682, 2677),
(1977, 5, 'G', 360, 'active', 2682, 2677),
(1978, 1, 'G', 0, 'active', 2683, 2678),
(1979, 5, 'G', 192, 'active', 2683, 2678),
(1980, 1, 'G', 0, 'active', 2684, 2679),
(1981, 5, 'G', 480, 'active', 2684, 2679),
(1982, 1, 'G', 1680, 'active', 2685, 2680),
(1983, 5, 'G', 732, 'active', 2685, 2680),
(1984, 1, 'G', 0, 'active', 2686, 2681),
(1985, 5, 'G', 840, 'active', 2686, 2681),
(1986, 1, 'G', 1680, 'active', 2687, 2682),
(1987, 5, 'G', 732, 'active', 2687, 2682),
(1988, 1, 'G', 0, 'active', 2688, 2683),
(1989, 5, 'G', 840, 'active', 2688, 2683),
(1990, 1, 'G', 1680, 'active', 2689, 2684),
(1991, 5, 'G', 690, 'active', 2689, 2684),
(1992, 1, 'G', 0, 'active', 2690, 2685),
(1993, 5, 'G', 750, 'active', 2690, 2685),
(1994, 1, 'G', 0, 'active', 2691, 2686),
(1995, 5, 'G', 210, 'active', 2691, 2686),
(1996, 1, 'G', 0, 'active', 2692, 2687),
(1997, 5, 'G', 732, 'active', 2692, 2687),
(1998, 1, 'G', 840, 'active', 2693, 2688),
(1999, 5, 'G', 660, 'active', 2693, 2688),
(2000, 1, 'G', 0, 'active', 2694, 2689),
(2001, 5, 'G', 680, 'active', 2694, 2689),
(2002, 1, 'G', 840, 'active', 2695, 2690),
(2003, 5, 'G', 440, 'active', 2695, 2690),
(2004, 1, 'G', 840, 'active', 2696, 2691),
(2005, 5, 'G', 732, 'active', 2696, 2691),
(2006, 1, 'G', 0, 'active', 2697, 2692),
(2007, 5, 'G', 792, 'active', 2697, 2692),
(2008, 1, 'G', 0, 'active', 2698, 2693),
(2009, 5, 'G', 440, 'active', 2698, 2693),
(2010, 1, 'G', 0, 'active', 2699, 2694),
(2011, 5, 'G', 732, 'active', 2699, 2694),
(2012, 1, 'G', 0, 'active', 2700, 2695),
(2013, 5, 'G', 670, 'active', 2700, 2695),
(2014, 1, 'G', 0, 'active', 2701, 2696),
(2015, 5, 'G', 732, 'active', 2701, 2696),
(2016, 1, 'G', 0, 'active', 2702, 2697),
(2017, 5, 'G', 440, 'active', 2702, 2697),
(2018, 1, 'G', 0, 'active', 2703, 2698),
(2019, 5, 'G', 732, 'active', 2703, 2698),
(2020, 1, 'G', 0, 'active', 2704, 2699),
(2021, 5, 'G', 732, 'active', 2704, 2699),
(2022, 1, 'G', 630, 'active', 2705, 2700),
(2023, 5, 'G', 642, 'active', 2705, 2700),
(2066, 1, 'Others', 0, 'active', 2726, 2721),
(2067, 5, 'Others', 0, 'active', 2726, 2721),
(2068, 0, 'Others', 0, 'active', 2726, 2721),
(2069, 1, 'G', 1890, 'active', 2727, 2722),
(2070, 5, 'G', 0, 'active', 2727, 2722),
(2071, 1, 'G', 0, 'active', 2728, 2723),
(2072, 5, 'G', 660, 'active', 2728, 2723),
(2073, 1, 'G', 840, 'active', 2729, 2724),
(2074, 5, 'G', 0, 'active', 2729, 2724),
(2075, 1, 'G', 840, 'active', 2730, 2725),
(2076, 5, 'G', 0, 'active', 2730, 2725),
(2077, 1, 'G', 840, 'active', 2731, 2726),
(2078, 5, 'G', 0, 'active', 2731, 2726),
(2079, 1, 'G', 1050, 'active', 2732, 2727),
(2080, 5, 'G', 672, 'active', 2732, 2727),
(2081, 1, 'G', 1260, 'active', 2733, 2728),
(2082, 5, 'G', 0, 'active', 2733, 2728),
(2083, 1, 'G', 0, 'active', 2734, 2729),
(2084, 5, 'G', 792, 'active', 2734, 2729),
(2085, 1, 'Others', 0, 'active', 2735, 2730),
(2086, 5, 'Others', 0, 'active', 2735, 2730),
(2087, 0, 'Others', 0, 'active', 2735, 2730),
(2088, 1, 'G', 630, 'active', 2736, 2731),
(2089, 5, 'G', 0, 'active', 2736, 2731),
(2090, 1, 'G', 630, 'active', 2737, 2732),
(2091, 5, 'G', 0, 'active', 2737, 2732),
(2092, 1, 'G', 630, 'active', 2738, 2733),
(2093, 5, 'G', 0, 'active', 2738, 2733),
(2094, 1, 'G', 0, 'active', 2739, 2734),
(2095, 5, 'G', 288, 'active', 2739, 2734),
(2096, 1, 'G', 0, 'active', 2740, 2735),
(2097, 5, 'G', 432, 'active', 2740, 2735),
(2098, 1, 'G', 630, 'active', 2741, 2736),
(2099, 5, 'G', 0, 'active', 2741, 2736),
(2100, 1, 'G', 0, 'active', 2742, 2737),
(2101, 5, 'G', 408, 'active', 2742, 2737),
(2102, 1, 'G', 0, 'active', 2743, 2738),
(2103, 5, 'G', 480, 'active', 2743, 2738),
(2104, 1, 'G', 630, 'active', 2744, 2739),
(2105, 5, 'G', 0, 'active', 2744, 2739),
(2106, 1, 'G', 630, 'active', 2745, 2740),
(2107, 5, 'G', 0, 'active', 2745, 2740),
(2108, 1, 'G', 1680, 'active', 2746, 2741),
(2109, 5, 'G', 0, 'active', 2746, 2741),
(2110, 1, 'G', 1680, 'active', 2747, 2742),
(2111, 5, 'G', 0, 'active', 2747, 2742),
(2112, 1, 'G', 0, 'active', 2748, 2743),
(2113, 5, 'G', 480, 'active', 2748, 2743),
(2114, 1, 'G', 0, 'active', 2749, 2744),
(2115, 5, 'G', 576, 'active', 2749, 2744),
(2116, 1, 'G', 0, 'active', 2750, 2745),
(2117, 5, 'G', 792, 'active', 2750, 2745),
(2118, 1, 'G', 0, 'active', 2751, 2746),
(2119, 5, 'G', 720, 'active', 2751, 2746),
(2120, 1, 'G', 0, 'active', 2752, 2747),
(2121, 5, 'G', 792, 'active', 2752, 2747),
(2122, 1, 'G', 0, 'active', 2753, 2748),
(2123, 5, 'G', 648, 'active', 2753, 2748),
(2124, 1, 'G', 0, 'active', 2754, 2749),
(2125, 5, 'G', 672, 'active', 2754, 2749),
(2126, 1, 'Others', 0, 'active', 2755, 2750),
(2127, 5, 'Others', 0, 'active', 2755, 2750),
(2128, 0, 'Others', 0, 'active', 2755, 2750),
(2129, 1, 'Others', 0, 'active', 2756, 2751),
(2130, 5, 'Others', 0, 'active', 2756, 2751),
(2131, 0, 'Others', 0, 'active', 2756, 2751),
(2132, 1, 'Others', 0, 'active', 2757, 2752),
(2133, 5, 'Others', 0, 'active', 2757, 2752),
(2134, 0, 'Others', 0, 'active', 2757, 2752),
(2135, 1, 'Others', 0, 'active', 2758, 2753),
(2136, 5, 'Others', 0, 'active', 2758, 2753),
(2137, 0, 'Others', 0, 'active', 2758, 2753),
(2138, 1, 'Others', 0, 'active', 2759, 2754),
(2139, 5, 'Others', 0, 'active', 2759, 2754),
(2140, 0, 'Others', 0, 'active', 2759, 2754),
(2150, 1, 'G', 440, 'active', 2763, 2758),
(2151, 5, 'G', 0, 'active', 2763, 2758),
(2152, 1, 'G', 440, 'active', 2764, 2759),
(2153, 5, 'G', 792, 'active', 2764, 2759),
(2154, 1, 'G', 440, 'active', 2765, 2760),
(2155, 5, 'G', 792, 'active', 2765, 2760),
(2156, 1, 'G', 440, 'active', 2766, 2761),
(2157, 5, 'G', 660, 'active', 2766, 2761),
(2158, 1, 'G', 440, 'active', 2767, 2762),
(2159, 5, 'G', 144, 'active', 2767, 2762),
(2160, 1, 'G', 0, 'active', 2768, 2763),
(2161, 5, 'G', 256, 'active', 2768, 2763),
(2162, 1, 'G', 0, 'active', 2769, 2764),
(2163, 5, 'G', 188, 'active', 2769, 2764),
(2164, 1, 'G', 440, 'active', 2770, 2765),
(2165, 5, 'G', 660, 'active', 2770, 2765),
(2166, 1, 'G', 440, 'active', 2771, 2766),
(2167, 5, 'G', 576, 'active', 2771, 2766),
(2168, 1, 'G', 440, 'active', 2772, 2767),
(2169, 5, 'G', 744, 'active', 2772, 2767),
(2170, 1, 'G', 440, 'active', 2773, 2768),
(2171, 5, 'G', 792, 'active', 2773, 2768),
(2172, 1, 'G', 440, 'active', 2774, 2769),
(2173, 5, 'G', 840, 'active', 2774, 2769),
(2174, 1, 'G', 0, 'active', 2775, 2770),
(2175, 5, 'G', 256, 'active', 2775, 2770),
(2176, 1, 'G', 0, 'active', 2776, 2771),
(2177, 5, 'G', 188, 'active', 2776, 2771),
(2178, 1, 'G', 0, 'active', 2777, 2772),
(2179, 5, 'G', 528, 'active', 2777, 2772),
(2180, 1, 'G', 0, 'active', 2778, 2773),
(2181, 5, 'G', 96, 'active', 2778, 2773),
(2182, 1, 'G', 0, 'active', 2779, 2774),
(2183, 5, 'G', 336, 'active', 2779, 2774),
(2220, 1, 'G', 0, 'active', 2796, 2791),
(2221, 5, 'G', 624, 'active', 2796, 2791),
(2222, 1, 'G', 0, 'active', 2797, 2792),
(2223, 5, 'G', 720, 'active', 2797, 2792),
(2224, 1, 'G', 960, 'active', 2798, 2793),
(2225, 5, 'G', 0, 'active', 2798, 2793),
(2226, 1, 'G', 0, 'active', 2799, 2794),
(2227, 5, 'G', 672, 'active', 2799, 2794),
(2228, 1, 'G', 0, 'active', 2800, 2795),
(2229, 5, 'G', 720, 'active', 2800, 2795),
(2230, 1, 'G', 0, 'active', 2801, 2796),
(2231, 5, 'G', 960, 'active', 2801, 2796),
(2232, 1, 'G', 0, 'active', 2802, 2797),
(2233, 5, 'G', 528, 'active', 2802, 2797),
(2234, 1, 'G', 840, 'active', 2803, 2798),
(2235, 5, 'G', 0, 'active', 2803, 2798),
(2236, 1, 'G', 0, 'active', 2804, 2799),
(2237, 5, 'G', 744, 'active', 2804, 2799),
(2238, 1, 'G', 0, 'active', 2805, 2800),
(2239, 5, 'G', 630, 'active', 2805, 2800),
(2240, 1, 'G', 0, 'active', 2806, 2801),
(2241, 5, 'G', 480, 'active', 2806, 2801),
(2242, 1, 'G', 0, 'active', 2807, 2802),
(2243, 5, 'G', 1470, 'active', 2807, 2802),
(2249, 1, 'G', 0, 'active', 2810, 2805),
(2250, 5, 'G', 1260, 'active', 2810, 2805),
(2251, 1, 'G', 0, 'active', 2811, 2806),
(2252, 5, 'G', 1050, 'active', 2811, 2806),
(2253, 1, 'G', 680, 'active', 2812, 2807),
(2254, 5, 'G', 0, 'active', 2812, 2807),
(2255, 1, 'G', 0, 'active', 2813, 2808),
(2256, 5, 'G', 672, 'active', 2813, 2808),
(2257, 1, 'G', 400, 'active', 2814, 2809),
(2258, 5, 'G', 400, 'active', 2814, 2809),
(2259, 1, 'G', 0, 'active', 2815, 2810),
(2260, 5, 'G', 672, 'active', 2815, 2810),
(2261, 1, 'G', 1220, 'active', 2816, 2811),
(2262, 5, 'G', 0, 'active', 2816, 2811),
(2263, 1, 'G', 0, 'active', 2817, 2812),
(2264, 5, 'G', 384, 'active', 2817, 2812),
(2265, 1, 'G', 0, 'active', 2818, 2813),
(2266, 5, 'G', 480, 'active', 2818, 2813),
(2267, 1, 'G', 840, 'active', 2819, 2814),
(2268, 5, 'G', 0, 'active', 2819, 2814),
(2269, 1, 'G', 0, 'active', 2820, 2815),
(2270, 5, 'G', 600, 'active', 2820, 2815),
(2271, 1, 'G', 0, 'active', 2821, 2816),
(2272, 5, 'G', 504, 'active', 2821, 2816),
(2273, 1, 'G', 840, 'active', 2822, 2817),
(2274, 5, 'G', 0, 'active', 2822, 2817),
(2275, 1, 'G', 915, 'active', 2823, 2818),
(2276, 5, 'G', 0, 'active', 2823, 2818),
(2277, 1, 'G', 972, 'active', 2824, 2819),
(2278, 5, 'G', 0, 'active', 2824, 2819),
(2279, 1, 'G', 813, 'active', 2825, 2820),
(2280, 5, 'G', 0, 'active', 2825, 2820),
(2281, 1, 'G', 686, 'active', 2826, 2821),
(2282, 5, 'G', 0, 'active', 2826, 2821),
(2283, 1, 'G', 0, 'active', 2827, 2822),
(2284, 5, 'G', 624, 'active', 2827, 2822),
(2285, 1, 'G', 0, 'active', 2828, 2823),
(2286, 5, 'G', 720, 'active', 2828, 2823),
(2287, 1, 'G', 0, 'active', 2829, 2824),
(2288, 5, 'G', 672, 'active', 2829, 2824),
(2289, 1, 'G', 0, 'active', 2830, 2825),
(2290, 5, 'G', 720, 'active', 2830, 2825),
(2291, 1, 'G', 0, 'active', 2831, 2826),
(2292, 5, 'G', 528, 'active', 2831, 2826),
(2293, 1, 'Others', 0, 'active', 2832, 2827),
(2294, 5, 'Others', 0, 'active', 2832, 2827),
(2295, 0, 'Others', 0, 'active', 2832, 2827),
(2296, 1, 'G', 0, 'active', 2833, 2828),
(2297, 5, 'G', 744, 'active', 2833, 2828),
(2298, 1, 'Others', 0, 'active', 2834, 2829),
(2299, 5, 'Others', 0, 'active', 2834, 2829),
(2300, 0, 'Others', 0, 'active', 2834, 2829),
(2301, 1, 'Others', 0, 'active', 2835, 2830),
(2302, 5, 'Others', 0, 'active', 2835, 2830),
(2303, 0, 'Others', 0, 'active', 2835, 2830),
(2304, 1, 'Others', 0, 'active', 2836, 2831),
(2305, 5, 'Others', 0, 'active', 2836, 2831),
(2306, 0, 'Others', 0, 'active', 2836, 2831),
(2307, 1, 'Others', 0, 'active', 2837, 2832),
(2308, 5, 'Others', 0, 'active', 2837, 2832),
(2309, 0, 'Others', 0, 'active', 2837, 2832),
(2310, 1, 'Others', 0, 'active', 2838, 2833),
(2311, 5, 'Others', 0, 'active', 2838, 2833),
(2312, 0, 'Others', 0, 'active', 2838, 2833),
(2313, 1, 'Others', 0, 'active', 2839, 2834),
(2314, 5, 'Others', 0, 'active', 2839, 2834),
(2315, 0, 'Others', 0, 'active', 2839, 2834),
(2316, 1, 'G', 0, 'active', 2840, 2835),
(2317, 5, 'G', 600, 'active', 2840, 2835),
(2318, 1, 'Others', 0, 'active', 2841, 2836),
(2319, 5, 'Others', 0, 'active', 2841, 2836),
(2320, 0, 'Others', 0, 'active', 2841, 2836),
(2321, 1, 'Others', 0, 'active', 2842, 2837),
(2322, 5, 'Others', 0, 'active', 2842, 2837),
(2323, 0, 'Others', 0, 'active', 2842, 2837),
(2324, 1, 'G', 0, 'active', 2843, 2838),
(2325, 5, 'G', 768, 'active', 2843, 2838),
(2326, 1, 'Others', 0, 'active', 2844, 2839),
(2327, 5, 'Others', 0, 'active', 2844, 2839),
(2328, 0, 'Others', 0, 'active', 2844, 2839),
(2329, 1, 'Others', 0, 'active', 2845, 2840),
(2330, 5, 'Others', 0, 'active', 2845, 2840),
(2331, 0, 'Others', 0, 'active', 2845, 2840),
(2332, 1, 'Others', 0, 'active', 2846, 2841),
(2333, 5, 'Others', 0, 'active', 2846, 2841),
(2334, 0, 'Others', 0, 'active', 2846, 2841),
(2335, 1, 'Others', 0, 'active', 2847, 2842),
(2336, 5, 'Others', 0, 'active', 2847, 2842),
(2337, 0, 'Others', 0, 'active', 2847, 2842),
(2338, 1, 'Others', 0, 'active', 2848, 2843),
(2339, 5, 'Others', 0, 'active', 2848, 2843),
(2340, 0, 'Others', 0, 'active', 2848, 2843),
(2341, 1, 'Others', 0, 'active', 2849, 2844),
(2342, 5, 'Others', 0, 'active', 2849, 2844),
(2343, 0, 'Others', 0, 'active', 2849, 2844),
(2344, 1, 'Others', 0, 'active', 2850, 2845),
(2345, 5, 'Others', 0, 'active', 2850, 2845),
(2346, 0, 'Others', 0, 'active', 2850, 2845),
(2347, 1, 'Others', 0, 'active', 2851, 2846),
(2348, 5, 'Others', 0, 'active', 2851, 2846),
(2349, 0, 'Others', 0, 'active', 2851, 2846),
(2350, 1, 'G', 0, 'active', 2852, 2847),
(2351, 5, 'G', 648, 'active', 2852, 2847),
(2352, 1, 'G', 0, 'active', 2853, 2848),
(2353, 5, 'G', 480, 'active', 2853, 2848),
(2354, 1, 'Others', 0, 'active', 2854, 2849),
(2355, 5, 'Others', 0, 'active', 2854, 2849),
(2356, 0, 'Others', 0, 'active', 2854, 2849),
(2357, 1, 'Others', 0, 'active', 2855, 2850),
(2358, 5, 'Others', 0, 'active', 2855, 2850),
(2359, 0, 'Others', 0, 'active', 2855, 2850),
(2360, 1, 'Others', 0, 'active', 2856, 2851),
(2361, 5, 'Others', 0, 'active', 2856, 2851),
(2362, 0, 'Others', 0, 'active', 2856, 2851),
(2363, 1, 'Others', 0, 'active', 2857, 2852),
(2364, 5, 'Others', 0, 'active', 2857, 2852),
(2365, 0, 'Others', 0, 'active', 2857, 2852),
(2366, 1, 'Others', 0, 'active', 2858, 2853),
(2367, 5, 'Others', 0, 'active', 2858, 2853),
(2368, 0, 'Others', 0, 'active', 2858, 2853),
(2369, 1, 'Others', 0, 'active', 2859, 2854),
(2370, 5, 'Others', 0, 'active', 2859, 2854),
(2371, 0, 'Others', 0, 'active', 2859, 2854),
(2372, 1, 'Others', 0, 'active', 2860, 2855),
(2373, 5, 'Others', 0, 'active', 2860, 2855),
(2374, 0, 'Others', 0, 'active', 2860, 2855),
(2375, 1, 'G', 714, 'active', 2861, 2856),
(2376, 5, 'G', 68, 'active', 2861, 2856),
(2377, 1, 'G', 144, 'active', 2862, 2857),
(2378, 5, 'G', 60, 'active', 2862, 2857),
(2379, 1, 'G', 512, 'active', 2863, 2858),
(2380, 5, 'G', 239, 'active', 2863, 2858),
(2381, 1, 'G', 84, 'active', 2864, 2859),
(2382, 5, 'G', 0, 'active', 2864, 2859),
(2383, 1, 'G', 0, 'active', 2865, 2860),
(2384, 5, 'G', 0, 'active', 2865, 2860),
(2385, 1, 'Others', 0, 'active', 2866, 2861),
(2386, 5, 'Others', 0, 'active', 2866, 2861),
(2387, 0, 'Others', 3168, 'active', 2866, 2861),
(2388, 1, 'Others', 0, 'active', 2867, 2862),
(2389, 5, 'Others', 0, 'active', 2867, 2862),
(2390, 0, 'Others', 1056, 'active', 2867, 2862),
(2391, 1, 'G', 180, 'active', 2868, 2863),
(2392, 5, 'G', 22, 'active', 2868, 2863),
(2393, 1, 'Others', 0, 'active', 2869, 2864),
(2394, 5, 'Others', 0, 'active', 2869, 2864),
(2395, 0, 'Others', 1152, 'active', 2869, 2864),
(2396, 1, 'G', 0, 'active', 2870, 2865),
(2397, 5, 'G', 0, 'active', 2870, 2865),
(2398, 1, 'G', 0, 'active', 2871, 2866),
(2399, 5, 'G', 0, 'active', 2871, 2866),
(2400, 1, 'G', 420, 'active', 2872, 2867),
(2401, 5, 'G', 324, 'active', 2872, 2867),
(2402, 1, 'Others', 0, 'active', 2873, 2868),
(2403, 5, 'Others', 0, 'active', 2873, 2868),
(2404, 0, 'Others', 4032, 'active', 2873, 2868),
(2405, 1, 'G', 455, 'active', 2874, 2869),
(2406, 5, 'G', 91, 'active', 2874, 2869),
(2407, 1, 'Others', 0, 'active', 2875, 2870),
(2408, 5, 'Others', 0, 'active', 2875, 2870),
(2409, 0, 'Others', 15000, 'active', 2875, 2870),
(2410, 1, 'Others', 0, 'active', 2876, 2871),
(2411, 5, 'Others', 0, 'active', 2876, 2871),
(2412, 0, 'Others', 5400, 'active', 2876, 2871),
(2413, 1, 'Others', 0, 'active', 2877, 2872),
(2414, 5, 'Others', 0, 'active', 2877, 2872),
(2415, 0, 'Others', 7200, 'active', 2877, 2872),
(2416, 1, 'G', 882, 'active', 2878, 2873),
(2417, 5, 'G', 0, 'active', 2878, 2873),
(2418, 1, 'G', 1260, 'active', 2879, 2874),
(2419, 5, 'G', 324, 'active', 2879, 2874),
(2420, 1, 'Others', 0, 'active', 2880, 2875),
(2421, 5, 'Others', 0, 'active', 2880, 2875),
(2422, 0, 'Others', 5328, 'active', 2880, 2875);

-- --------------------------------------------------------

--
-- Table structure for table `master_supervisor`
--

CREATE TABLE `master_supervisor` (
  `id` int(11) NOT NULL,
  `supervisor_name` varchar(100) DEFAULT NULL,
  `supervisor_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_supervisor`
--

INSERT INTO `master_supervisor` (`id`, `supervisor_name`, `supervisor_status`) VALUES
(1, 'Laurie', 'active'),
(2, 'DEEPAK', 'active'),
(3, 'RAVI', 'active'),
(4, 'AMIT', 'active'),
(5, 'Rajan', 'active'),
(6, 'krishna', 'active'),
(7, 'RUPHUS', 'active'),
(8, 'Santosh', 'active'),
(9, 'Chandrakant', 'active'),
(10, '', 'active'),
(11, 'KUNAL', 'active'),
(12, 'Paul', 'active'),
(13, 'Praveen', 'active'),
(14, 'REN', 'active'),
(15, 'Brad', 'active'),
(16, 'Daniel', 'active'),
(17, 'Ed', 'active'),
(18, 'Test User1', 'active'),
(19, 'Test User2', 'active'),
(20, 'Test User3', 'active'),
(21, 'Test User4', 'active'),
(22, 'Test User5', 'active'),
(23, 'Test User6', 'active'),
(24, 'Test User7', 'active'),
(25, 'Test User8', 'active'),
(26, 'Test User9', 'active'),
(27, 'Test User10', 'active'),
(28, 'Test User11', 'active'),
(29, 'Test User12', 'active'),
(30, 'Test User13', 'active'),
(31, 'Test User14', 'active'),
(32, 'Test User15', 'active'),
(33, 'Test User16', 'active'),
(34, 'Test User17', 'active'),
(35, 'Test User18', 'active'),
(36, 'Test User19', 'active'),
(37, 'Test User20', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `master_work`
--

CREATE TABLE `master_work` (
  `id` int(11) NOT NULL,
  `work_type` varchar(100) DEFAULT NULL,
  `work_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_work`
--

INSERT INTO `master_work` (`id`, `work_type`, `work_status`) VALUES
(1, 'Aerosol', 'active'),
(2, 'Roller', 'active'),
(3, 'Applicator', 'active'),
(4, 'Paint', 'active'),
(5, 'SORTING', 'active'),
(6, 'RELABEL', 'active'),
(7, 'CUT & COMP', 'active'),
(8, 'STICKERING', 'active'),
(9, 'ROLLER SLEEVING', 'active'),
(10, 'RUSTOLEUM', 'active'),
(11, 'SLEEVING', 'active'),
(12, 'SORT&STICKER', 'active'),
(13, 'APPLICATORS', 'active'),
(14, 'CUT LABEL', 'active'),
(15, 'OTHER', 'active'),
(16, 'STICKERING&BOXING', 'active'),
(17, '', 'active'),
(18, 'POWERWASH', 'active'),
(19, 'FORKLIFT', 'active'),
(20, 'LUNCH', 'active'),
(21, 'TINTING', 'active'),
(22, 'Labeling', 'active'),
(23, 'Pouring', 'active'),
(24, 'Tote Washing', 'active'),
(25, 'Filtration', 'active'),
(26, 'TESTING', 'active'),
(27, 'pouring G5', 'active'),
(28, 'Labeling G5', 'active'),
(29, 'pouring G1', 'active'),
(30, 'Labeling G1', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `target_gdbtarget`
--

CREATE TABLE `target_gdbtarget` (
  `id` int(11) NOT NULL,
  `target_projectname` text NOT NULL,
  `target_cpu` decimal(10,2) NOT NULL,
  `target_cpg` decimal(10,2) NOT NULL,
  `target` decimal(10,2) NOT NULL,
  `target_project_id_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `target_size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `target_gdbtarget`
--

INSERT INTO `target_gdbtarget` (`id`, `target_projectname`, `target_cpu`, `target_cpg`, `target`, `target_project_id_id`, `status`, `target_size`) VALUES
(46, 'Stain Tinting', '0.75', '0.75', '0.60', 50, 1, 'units'),
(52, 'Labeling G1', '0.25', '0.25', '0.20', NULL, 1, 'gallons'),
(53, 'Labeling G5', '0.35', '0.07', '0.06', NULL, 1, 'gallons'),
(54, 'Plant Pouring G1', '0.30', '0.30', '0.24', NULL, 1, 'gallons'),
(55, 'Plant Pouring G5', '0.47', '0.09', '0.07', NULL, 1, 'gallons');

-- --------------------------------------------------------

--
-- Table structure for table `target_gdbtarget_old`
--

CREATE TABLE `target_gdbtarget_old` (
  `id` int(11) NOT NULL,
  `target_projectname` text NOT NULL,
  `target_project_id` int(11) NOT NULL,
  `target_cpu` decimal(10,2) NOT NULL,
  `target_cpg` decimal(10,2) NOT NULL,
  `target` decimal(10,2) NOT NULL,
  `target_project_id_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `target_gdbtarget_old`
--

INSERT INTO `target_gdbtarget_old` (`id`, `target_projectname`, `target_project_id`, `target_cpu`, `target_cpg`, `target`, `target_project_id_id`, `status`) VALUES
(1, 'Compactor', 1, '0.07', '0.07', '0.00', 1, 0),
(2, 'Ollie\'s Aerosol Sorting', 3, '0.07', '0.05', '0.06', 3, 0),
(3, 'CUT & COMP', 2, '0.51', '0.22', '0.18', 2, 0),
(4, 'Roller Cover Sleeving', 4, '0.08', '0.00', '0.06', 4, 0),
(5, 'Roller Sorting', 5, '0.05', '0.00', '0.04', 5, 0),
(6, 'Applicator Stickering', 6, '0.09', '0.00', '0.07', 6, 0),
(7, 'Aerosol Stickering', 7, '0.07', '0.00', '0.06', 7, 0),
(8, 'PR19-5 PPG/ WM', 9, '0.00', '0.00', '0.00', 9, 0);

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
-- Indexes for table `gdb_app_master`
--
ALTER TABLE `gdb_app_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_app_product`
--
ALTER TABLE `gdb_app_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_app_project`
--
ALTER TABLE `gdb_app_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_app_supervisor`
--
ALTER TABLE `gdb_app_supervisor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_app_work`
--
ALTER TABLE `gdb_app_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_labour`
--
ALTER TABLE `gdb_labour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdb_master`
--
ALTER TABLE `gdb_master`
  ADD PRIMARY KEY (`project_master_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `gdb_product`
--
ALTER TABLE `gdb_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `gdb_project`
--
ALTER TABLE `gdb_project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `gdb_supervisor`
--
ALTER TABLE `gdb_supervisor`
  ADD PRIMARY KEY (`supervisor_id`);

--
-- Indexes for table `master_master`
--
ALTER TABLE `master_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_master_product_id_id_19ed6779_fk_master_product_id` (`product_id_id`),
  ADD KEY `master_master_project_id_id_7c53f0ec_fk_master_project_id` (`project_id_id`),
  ADD KEY `master_master_supervisor_id_id_5da02cd9_fk_master_supervisor_id` (`supervisor_id_id`),
  ADD KEY `master_master_work_id_id_cbabbb73_fk_master_work_id` (`work_id_id`);

--
-- Indexes for table `master_product`
--
ALTER TABLE `master_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_project`
--
ALTER TABLE `master_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_quartpint`
--
ALTER TABLE `master_quartpint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_quartpint_master_id_id_bf608525_fk_master_master_id` (`master_id_id`);

--
-- Indexes for table `master_relationship`
--
ALTER TABLE `master_relationship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_relationship_master_id_id_160423e6_fk_master_master_id` (`master_id_id`),
  ADD KEY `master_relationship_quartpint_id_id_d8c55e3a_fk_master_qu` (`quartpint_id_id`);

--
-- Indexes for table `master_supervisor`
--
ALTER TABLE `master_supervisor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_work`
--
ALTER TABLE `master_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_gdbtarget`
--
ALTER TABLE `target_gdbtarget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_gdbtarget_target_project_id_id_c87bd43e_fk_master_pr` (`target_project_id_id`);

--
-- Indexes for table `target_gdbtarget_old`
--
ALTER TABLE `target_gdbtarget_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_gdbtarget_target_project_id_id_c87bd43e_fk_master_pr` (`target_project_id_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `gdb_app_master`
--
ALTER TABLE `gdb_app_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gdb_app_product`
--
ALTER TABLE `gdb_app_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gdb_app_project`
--
ALTER TABLE `gdb_app_project`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `gdb_app_supervisor`
--
ALTER TABLE `gdb_app_supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gdb_app_work`
--
ALTER TABLE `gdb_app_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `gdb_labour`
--
ALTER TABLE `gdb_labour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `gdb_master`
--
ALTER TABLE `gdb_master`
  MODIFY `project_master_id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gdb_product`
--
ALTER TABLE `gdb_product`
  MODIFY `product_id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gdb_project`
--
ALTER TABLE `gdb_project`
  MODIFY `project_id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gdb_supervisor`
--
ALTER TABLE `gdb_supervisor`
  MODIFY `supervisor_id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_master`
--
ALTER TABLE `master_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2881;

--
-- AUTO_INCREMENT for table `master_product`
--
ALTER TABLE `master_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `master_project`
--
ALTER TABLE `master_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `master_quartpint`
--
ALTER TABLE `master_quartpint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2876;

--
-- AUTO_INCREMENT for table `master_relationship`
--
ALTER TABLE `master_relationship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2423;

--
-- AUTO_INCREMENT for table `master_supervisor`
--
ALTER TABLE `master_supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `master_work`
--
ALTER TABLE `master_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `target_gdbtarget`
--
ALTER TABLE `target_gdbtarget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `target_gdbtarget_old`
--
ALTER TABLE `target_gdbtarget_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `gdb_project`
--
ALTER TABLE `gdb_project`
  ADD CONSTRAINT `gdb_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `gdb_master` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_master`
--
ALTER TABLE `master_master`
  ADD CONSTRAINT `master_master_product_id_id_19ed6779_fk_master_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `master_product` (`id`),
  ADD CONSTRAINT `master_master_project_id_id_7c53f0ec_fk_master_project_id` FOREIGN KEY (`project_id_id`) REFERENCES `master_project` (`id`),
  ADD CONSTRAINT `master_master_supervisor_id_id_5da02cd9_fk_master_supervisor_id` FOREIGN KEY (`supervisor_id_id`) REFERENCES `master_supervisor` (`id`),
  ADD CONSTRAINT `master_master_work_id_id_cbabbb73_fk_master_work_id` FOREIGN KEY (`work_id_id`) REFERENCES `master_work` (`id`);

--
-- Constraints for table `master_quartpint`
--
ALTER TABLE `master_quartpint`
  ADD CONSTRAINT `master_quartpint_master_id_id_bf608525_fk_master_master_id` FOREIGN KEY (`master_id_id`) REFERENCES `master_master` (`id`);

--
-- Constraints for table `master_relationship`
--
ALTER TABLE `master_relationship`
  ADD CONSTRAINT `master_relationship_master_id_id_160423e6_fk_master_master_id` FOREIGN KEY (`master_id_id`) REFERENCES `master_master` (`id`),
  ADD CONSTRAINT `master_relationship_quartpint_id_id_d8c55e3a_fk_master_qu` FOREIGN KEY (`quartpint_id_id`) REFERENCES `master_quartpint` (`id`);

--
-- Constraints for table `target_gdbtarget_old`
--
ALTER TABLE `target_gdbtarget_old`
  ADD CONSTRAINT `target_gdbtarget_target_project_id_id_c87bd43e_fk_master_pr` FOREIGN KEY (`target_project_id_id`) REFERENCES `master_project` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 08, 2026 at 05:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app`
--

-- --------------------------------------------------------

--
-- Table structure for table `create_account`
--

CREATE TABLE `create_account` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `create_account`
--

INSERT INTO `create_account` (`id`, `full_name`, `email`, `password`, `created_at`) VALUES
(1, 'Chandu', 'chandu1@example.com', '@#$%&123As', '2025-12-23 10:40:24'),
(2, 'Mavya Reddy', 'mavya1@gmail.com', '123', '2025-12-24 05:22:55'),
(3, 'MAVYA', 'mavya12@gmail.com', '123', '2025-12-29 05:16:50'),
(4, 'MAVYA', 'mavya12@gmail.comm', '123', '2025-12-29 05:17:23'),
(5, 'Reddy', 'reddy@g.c', '123', '2025-12-29 05:20:24'),
(6, 'Tharun Reddy', 'tharun@gmail.com', '!@#$', '2025-12-30 07:35:54'),
(7, 'tharun reddy', 'latha@gmail.com', '123', '2026-01-03 09:51:43'),
(8, 'Pooji', 'pooji@gmail.com', 'pooji@12', '2026-01-03 10:50:28'),
(9, 'Manasa', 'manasa@gmail.com', '123456', '2026-01-06 09:37:20'),
(10, 'Uma Reddy', 'uma@gmail.com', '!@#$%^', '2026-01-07 05:35:00'),
(11, 'Ankitha', 'ankitha@gmail.com', '12345678', '2026-01-07 05:56:43'),
(12, 'Varma', 'varma@gmail.com', '12345678', '2026-01-07 06:07:19'),
(13, 'Pavan Reddy', 'pavan@gmail.com', '12345678', '2026-01-07 06:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `interior_designs`
--

CREATE TABLE `interior_designs` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `design_title` varchar(255) DEFAULT NULL,
  `style` varchar(100) DEFAULT NULL,
  `best_for` varchar(255) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interior_designs`
--

INSERT INTO `interior_designs` (`id`, `request_id`, `design_title`, `style`, `best_for`, `image_url`, `created_at`) VALUES
(1, 2, 'Modern Minimalist Haven', 'Modern', 'A bright and minimalistic look with a functional layout, featuring a light-colored sectional sofa, a sleek glass coffee table, and a simple wooden TV stand.', 'http://localhost/smartroom/outputs/interior_2_0.png', '2025-12-26 07:30:50'),
(2, 2, 'Contemporary Cozy Corner', 'Modern', 'A cozy yet modern space with a focus on functionality. It includes a low-profile platform bed, minimalist nightstands, and a white dresser against a wall.', 'http://localhost/smartroom/outputs/interior_2_1.png', '2025-12-26 07:31:37'),
(3, 2, 'Neutral Tone Retreat', 'Modern', 'A calm and serene atmosphere achieved with neutral tones, fitted with a stylish desk, ergonomic chair, and shelves for storage.', 'http://localhost/smartroom/outputs/interior_2_2.png', '2025-12-26 07:32:37'),
(4, 2, 'Bright and Airy Workspace', 'Modern', 'An efficient workspace with a modern desk and a comfortable chair, complemented by wall-mounted storage and a standing lamp.', 'http://localhost/smartroom/outputs/interior_2_3.png', '2025-12-26 07:33:34'),
(5, 2, 'Simplistic Living Area', 'Modern', 'A functional living area with a focus on simplicity, including a chic loveseat, multi-functional coffee table, and decorative floor cushions for additional seating.', 'http://localhost/smartroom/outputs/interior_2_4.png', '2025-12-26 07:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `interior_images`
--

CREATE TABLE `interior_images` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `style` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interior_requests`
--

CREATE TABLE `interior_requests` (
  `id` int(11) NOT NULL,
  `room_image` varchar(255) DEFAULT NULL,
  `furniture_images` text DEFAULT NULL,
  `room_length` int(11) NOT NULL,
  `room_width` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `style_preference` varchar(100) NOT NULL,
  `match_furniture` tinyint(1) DEFAULT 0,
  `other_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `selected_interior_design_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interior_requests`
--

INSERT INTO `interior_requests` (`id`, `room_image`, `furniture_images`, `room_length`, `room_width`, `room_type`, `style_preference`, `match_furniture`, `other_details`, `created_at`, `selected_interior_design_id`) VALUES
(1, '1766733654_room.jpeg', '', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-26 07:20:54', NULL),
(2, '1766733671_room.jpeg', '1766733671_furniture_0.jpeg,1766733671_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-26 07:21:11', 3),
(3, '1766740748_room.jpeg', '1766740748_furniture_0.jpeg,1766740748_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-26 09:19:08', NULL),
(4, '1766817779_room.jpeg', '1766817779_furniture_0.jpeg,1766817779_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-27 06:42:59', NULL),
(5, '1766817934_room.jpeg', '1766817934_furniture_0.jpeg,1766817934_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-27 06:45:34', NULL),
(6, '1766818256_room.jpeg', '1766818256_furniture_0.jpeg,1766818256_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-27 06:50:56', NULL),
(7, '1766818344_room.jpeg', '1766818344_furniture_0.jpeg,1766818344_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-27 06:52:24', NULL),
(8, '1766818746_room.jpeg', '1766818746_furniture_0.jpeg,1766818746_furniture_1.jpeg', 12, 10, '0', 'Modern', 0, 'Bright,minimal look', '2025-12-27 06:59:06', NULL),
(9, '1766819300_room.jpeg', '1766819300_furniture_0.jpeg,1766819300_furniture_1.jpeg', 12, 10, 'Living Room', 'Modern', 0, 'Bright,minimal look', '2025-12-27 07:08:20', NULL),
(10, '1766819365_room.jpeg', '1766819365_furniture_0.jpeg,1766819365_furniture_1.jpeg', 12, 10, 'Living Room', 'Modern', 1, 'Bright,minimal look', '2025-12-27 07:09:25', 3),
(11, NULL, '', 12, 10, 'Living Room', 'Modern', 1, 'Bright,minimal look', '2026-01-03 04:01:01', NULL),
(12, NULL, '', 12, 10, 'Living Room', 'Modern', 1, 'Bright,minimal look', '2026-01-03 04:07:35', NULL),
(13, '1767414647_room.jpg', '', 10, 12, 'living_room', 'industrial', 0, '', '2026-01-03 04:30:47', NULL),
(14, '1767415376_room.jpg', '', 20, 20, 'living_room', 'boho', 0, '', '2026-01-03 04:42:56', NULL),
(15, '1767415396_room.jpg', '', 20, 20, 'living_room', 'boho', 0, '', '2026-01-03 04:43:16', NULL),
(16, '1767415440_room.jpg', '', 20, 20, 'bathroom', 'modern', 0, '', '2026-01-03 04:44:00', NULL),
(17, '1767415535_room.jpg', '', 20, 20, 'bathroom', 'modern', 0, '', '2026-01-03 04:45:35', NULL),
(18, '1767415565_room.jpg', '', 20, 20, 'bathroom', 'modern', 0, '', '2026-01-03 04:46:05', NULL),
(19, '1767416021_room.jpg', '', 12, 12, 'kitchen', 'scandinavian', 0, '', '2026-01-03 04:53:41', NULL),
(20, '1767416530_room.jpg', '', 10, 10, 'living_room', 'industrial', 0, 'Decent look', '2026-01-03 05:02:10', NULL),
(21, '1767416546_room.jpg', '', 10, 10, 'living_room', 'boho', 0, 'Decent look', '2026-01-03 05:02:26', NULL),
(22, '1767416871_room.jpg', '', 12, 15, 'bathroom', 'industrial', 0, '', '2026-01-03 05:07:51', NULL),
(23, '1767416959_room.jpg', '', 12, 15, 'bathroom', 'industrial', 0, '', '2026-01-03 05:09:19', NULL),
(24, '1767417224_room.jpg', '', 10, 10, 'living_room', 'minimalist', 0, '', '2026-01-03 05:13:44', NULL),
(25, '1767417493_room.jpg', '', 10, 10, 'living_room', 'industrial', 0, '', '2026-01-03 05:18:13', NULL),
(26, '1767417550_room.jpg', '', 10, 10, 'living_room', 'industrial', 0, '', '2026-01-03 05:19:10', NULL),
(27, '1767417723_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-03 05:22:03', NULL),
(28, '1767422106_room.jpg', '', 10, 10, 'living_room', 'industrial', 0, '', '2026-01-03 06:35:06', NULL),
(29, '1767422809_room.jpg', '', 10, 10, 'bathroom', 'modern', 0, '', '2026-01-03 06:46:49', NULL),
(30, '1767424791_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:19:51', NULL),
(31, '1767424802_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:20:02', NULL),
(32, '1767424812_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:20:12', NULL),
(33, '1767424817_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:20:17', NULL),
(34, '1767424865_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:21:05', NULL),
(35, '1767424911_room.jpg', '', 12, 12, 'kitchen', 'modern', 0, '', '2026-01-03 07:21:51', NULL),
(36, '1767424932_room.jpg', '', 12, 12, 'bedroom', 'minimalist', 0, '', '2026-01-03 07:22:12', NULL),
(37, '1767424949_room.jpg', '', 12, 12, 'bedroom', 'boho', 0, '', '2026-01-03 07:22:29', NULL),
(38, '1767424957_room.jpg', '', 12, 12, 'bedroom', 'boho', 0, '', '2026-01-03 07:22:37', NULL),
(39, '1767425071_room.jpg', '', 12, 12, 'bathroom', 'boho', 0, '', '2026-01-03 07:24:31', NULL),
(40, '1767425362_room.jpg', '', 12, 13, 'kitchen', 'industrial', 0, '', '2026-01-03 07:29:22', NULL),
(41, '1767425372_room.jpg', '', 12, 13, 'kitchen', 'industrial', 0, '', '2026-01-03 07:29:32', NULL),
(42, '1767425382_room.jpg', '', 12, 13, 'kitchen', 'minimalist', 0, '', '2026-01-03 07:29:42', NULL),
(43, '1767425898_room.jpg', '', 12, 12, 'living_room', 'scandinavian', 0, '', '2026-01-03 07:38:18', NULL),
(44, '1767426536_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 07:48:56', NULL),
(45, '1767427059_room.jpg', '', 12, 12, 'kitchen', 'industrial', 0, '', '2026-01-03 07:57:39', NULL),
(46, '1767427078_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-03 07:57:58', NULL),
(47, '1767427527_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 08:05:27', NULL),
(48, '1767427536_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 08:05:36', NULL),
(49, '1767431933_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-03 09:18:53', NULL),
(50, '1767436365_room.jpg', '', 12, 12, 'living_room', 'minimalist', 0, '', '2026-01-03 10:32:45', NULL),
(51, '1767437561_room.jpg', '', 12, 12, 'living_room', 'modern', 1, 'Descent Look', '2026-01-03 10:52:41', NULL),
(52, '1767437616_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-03 10:53:36', NULL),
(53, '1767596226_room.jpg', '', 12, 12, 'living_room', 'minimalist', 1, '', '2026-01-05 06:57:06', NULL),
(54, '1767596282_room.jpg', '', 12, 12, 'living_room', 'modern', 1, '', '2026-01-05 06:58:02', NULL),
(55, '1767600193_room.jpg', '', 12, 12, 'kitchen', 'modern', 0, '', '2026-01-05 08:03:13', NULL),
(56, '1767600206_room.jpg', '', 12, 12, 'kitchen', 'boho', 0, '', '2026-01-05 08:03:26', NULL),
(57, '1767600873_room.jpg', '', 12, 12, 'living_room', 'modern', 0, '', '2026-01-05 08:14:33', NULL),
(58, '1767603900_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-05 09:05:00', NULL),
(59, '1767604001_room.jpg', '', 12, 12, 'bedroom', 'boho', 0, '', '2026-01-05 09:06:41', NULL),
(60, '1767604382_room.jpg', '', 12, 12, 'kitchen', 'modern', 0, '', '2026-01-05 09:13:02', NULL),
(61, '1767604655_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-05 09:17:35', NULL),
(62, '1767606109_room.jpg', '', 12, 12, 'living_room', 'minimalist', 0, '', '2026-01-05 09:41:49', NULL),
(63, '1767606652_room.jpg', '', 20, 20, 'living_room', 'industrial', 0, '', '2026-01-05 09:50:52', NULL),
(64, '1767607150_room.jpg', '', 10, 10, 'kitchen', 'boho', 0, '', '2026-01-05 09:59:10', NULL),
(65, '1767691327_room.jpg', '', 12, 12, 'living_room', 'minimalist', 0, '', '2026-01-06 09:22:07', NULL),
(66, '1767691841_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-06 09:30:41', NULL),
(67, '1767693451_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-06 09:57:31', NULL),
(68, '1767758112_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-07 03:55:12', NULL),
(69, '1767758681_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-07 04:04:41', NULL),
(70, '1767758886_room.jpg', '', 12, 12, 'living_room', 'minimalist', 0, '', '2026-01-07 04:08:06', NULL),
(71, '1767759228_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-07 04:13:48', NULL),
(72, '1767759396_room.jpg', '', 25, 25, 'kitchen', 'industrial', 0, '', '2026-01-07 04:16:36', NULL),
(73, '1767759519_room.jpg', '', 12, 12, 'living_room', 'minimalist', 0, '', '2026-01-07 04:18:39', NULL),
(74, '1767759775_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-07 04:22:55', NULL),
(75, '1767760108_room.jpg', '', 12, 12, 'bathroom', 'boho', 0, '', '2026-01-07 04:28:28', NULL),
(76, '1767761914_room.jpg', '', 12, 12, 'bedroom', 'boho', 0, '', '2026-01-07 04:58:34', NULL),
(77, '1767762030_room.jpg', '', 12, 12, 'living_room', 'boho', 0, '', '2026-01-07 05:00:30', NULL),
(78, '1767762674_room.jpg', '', 12, 12, 'living_room', 'industrial', 0, '', '2026-01-07 05:11:14', NULL),
(79, '1767763271_room.jpg', '', 12, 12, 'bedroom', 'modern', 0, '', '2026-01-07 05:21:11', NULL),
(80, '1767764222_room.jpg', '', 12, 10, 'living_room', 'boho', 1, 'Pleasant Look', '2026-01-07 05:37:02', NULL),
(81, '1767766147_room.jpg', '', 12, 10, 'living_room', 'boho', 1, 'Descent look', '2026-01-07 06:09:07', NULL),
(82, '1767766452_room.jpg', '', 12, 10, 'living_room', 'boho', 1, 'Descent Look', '2026-01-07 06:14:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paint_images`
--

CREATE TABLE `paint_images` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `style` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paint_images`
--

INSERT INTO `paint_images` (`id`, `room_type`, `style`, `image_path`, `uploaded_at`) VALUES
(1, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7398.JPG', '2026-01-02 07:12:58'),
(2, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7399.JPG', '2026-01-02 07:12:58'),
(3, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7400.JPG', '2026-01-02 07:12:58'),
(4, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7401.JPG', '2026-01-02 07:12:59'),
(5, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7402.JPG', '2026-01-02 07:12:59'),
(6, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7403.JPG', '2026-01-02 07:12:59'),
(7, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7404.JPG', '2026-01-02 07:12:59'),
(8, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7405.JPG', '2026-01-02 07:12:59'),
(9, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7406.JPG', '2026-01-02 07:12:59'),
(10, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7407.JPG', '2026-01-02 07:12:59'),
(11, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7387.JPG', '2026-01-02 07:12:59'),
(12, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7388.JPG', '2026-01-02 07:12:59'),
(13, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7389.JPG', '2026-01-02 07:12:59'),
(14, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7390.JPG', '2026-01-02 07:12:59'),
(15, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7391.JPG', '2026-01-02 07:12:59'),
(16, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7392.JPG', '2026-01-02 07:12:59'),
(17, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7393.JPG', '2026-01-02 07:12:59'),
(18, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7394.JPG', '2026-01-02 07:12:59'),
(19, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7395.JPG', '2026-01-02 07:12:59'),
(20, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7396.JPG', '2026-01-02 07:12:59'),
(21, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7397.JPG', '2026-01-02 07:12:59'),
(22, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7391.JPG', '2026-01-02 07:12:59'),
(23, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7392.JPG', '2026-01-02 07:12:59'),
(24, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7393.JPG', '2026-01-02 07:12:59'),
(25, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7408.JPG', '2026-01-02 07:12:59'),
(26, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7409.JPG', '2026-01-02 07:12:59'),
(27, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7410.JPG', '2026-01-02 07:12:59'),
(28, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7411.JPG', '2026-01-02 07:12:59'),
(29, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7412.JPG', '2026-01-02 07:12:59'),
(30, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7413.JPG', '2026-01-02 07:12:59'),
(31, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7414.JPG', '2026-01-02 07:12:59'),
(32, 'paint_designs', 'Bathroom', 'uploads/images/paint_designs/Bathroom/IMG_7415.JPG', '2026-01-02 07:12:59'),
(33, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7281.JPG', '2026-01-02 07:12:59'),
(34, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7282.JPG', '2026-01-02 07:12:59'),
(35, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7283.JPG', '2026-01-02 07:12:59'),
(36, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7284.JPG', '2026-01-02 07:12:59'),
(37, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7285.JPG', '2026-01-02 07:12:59'),
(38, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7286.JPG', '2026-01-02 07:12:59'),
(39, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7287.JPG', '2026-01-02 07:12:59'),
(40, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7288.JPG', '2026-01-02 07:12:59'),
(41, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7289.JPG', '2026-01-02 07:12:59'),
(42, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7307.JPG', '2026-01-02 07:12:59'),
(43, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7308.JPG', '2026-01-02 07:12:59'),
(44, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7309.JPG', '2026-01-02 07:12:59'),
(45, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7310.JPG', '2026-01-02 07:12:59'),
(46, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7311.JPG', '2026-01-02 07:12:59'),
(47, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7312.JPG', '2026-01-02 07:12:59'),
(48, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7313.JPG', '2026-01-02 07:12:59'),
(49, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7314.JPG', '2026-01-02 07:12:59'),
(50, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7315.JPG', '2026-01-02 07:12:59'),
(51, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7316.JPG', '2026-01-02 07:12:59'),
(52, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7317.JPG', '2026-01-02 07:12:59'),
(53, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.10 PM (1).jpeg', '2026-01-02 07:12:59'),
(54, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.10 PM (2).jpeg', '2026-01-02 07:12:59'),
(55, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.10 PM.jpeg', '2026-01-02 07:12:59'),
(56, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (1).jpeg', '2026-01-02 07:12:59'),
(57, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (2).jpeg', '2026-01-02 07:12:59'),
(58, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (3).jpeg', '2026-01-02 07:12:59'),
(59, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (4).jpeg', '2026-01-02 07:12:59'),
(60, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (5).jpeg', '2026-01-02 07:12:59'),
(61, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM (6).jpeg', '2026-01-02 07:12:59'),
(62, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/WhatsApp Image 2025-12-30 at 9.39.11 PM.jpeg', '2026-01-02 07:12:59'),
(63, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7290.JPG', '2026-01-02 07:12:59'),
(64, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7291.JPG', '2026-01-02 07:12:59'),
(65, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7292.JPG', '2026-01-02 07:12:59'),
(66, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7293.JPG', '2026-01-02 07:12:59'),
(67, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7294.JPG', '2026-01-02 07:12:59'),
(68, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7295.JPG', '2026-01-02 07:12:59'),
(69, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7296.JPG', '2026-01-02 07:12:59'),
(70, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7297.JPG', '2026-01-02 07:12:59'),
(71, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7298.JPG', '2026-01-02 07:12:59'),
(72, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7299.JPG', '2026-01-02 07:12:59'),
(73, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7300.JPG', '2026-01-02 07:12:59'),
(74, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7301.JPG', '2026-01-02 07:12:59'),
(75, 'paint_designs', 'Bedroom', 'uploads/images/paint_designs/Bedroom/IMG_7302.JPG', '2026-01-02 07:12:59'),
(76, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7333.JPG', '2026-01-02 07:12:59'),
(77, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7334.JPG', '2026-01-02 07:12:59'),
(78, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7335.JPG', '2026-01-02 07:12:59'),
(79, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7336.JPG', '2026-01-02 07:12:59'),
(80, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7337.JPG', '2026-01-02 07:12:59'),
(81, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7338.JPG', '2026-01-02 07:12:59'),
(82, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7339.JPG', '2026-01-02 07:12:59'),
(83, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7340.JPG', '2026-01-02 07:12:59'),
(84, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7341.JPG', '2026-01-02 07:12:59'),
(85, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7342.JPG', '2026-01-02 07:12:59'),
(86, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7343.JPG', '2026-01-02 07:12:59'),
(87, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7362.JPG', '2026-01-02 07:12:59'),
(88, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7363.JPG', '2026-01-02 07:12:59'),
(89, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7364.JPG', '2026-01-02 07:12:59'),
(90, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7365.JPG', '2026-01-02 07:12:59'),
(91, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7366.JPG', '2026-01-02 07:12:59'),
(92, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7367.JPG', '2026-01-02 07:12:59'),
(93, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7368.JPG', '2026-01-02 07:12:59'),
(94, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7369.JPG', '2026-01-02 07:12:59'),
(95, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7370.JPG', '2026-01-02 07:12:59'),
(96, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7371.JPG', '2026-01-02 07:12:59'),
(97, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7372.JPG', '2026-01-02 07:12:59'),
(98, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7373.JPG', '2026-01-02 07:12:59'),
(99, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7374.JPG', '2026-01-02 07:12:59'),
(100, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7375.JPG', '2026-01-02 07:12:59'),
(101, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7318.JPG', '2026-01-02 07:12:59'),
(102, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7319.JPG', '2026-01-02 07:12:59'),
(103, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7320.JPG', '2026-01-02 07:12:59'),
(104, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7321.JPG', '2026-01-02 07:12:59'),
(105, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7322.JPG', '2026-01-02 07:12:59'),
(106, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7323.JPG', '2026-01-02 07:12:59'),
(107, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7324.JPG', '2026-01-02 07:12:59'),
(108, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7325.JPG', '2026-01-02 07:12:59'),
(109, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7326.JPG', '2026-01-02 07:12:59'),
(110, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7327.JPG', '2026-01-02 07:12:59'),
(111, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7328.JPG', '2026-01-02 07:12:59'),
(112, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7329.JPG', '2026-01-02 07:12:59'),
(113, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7330.JPG', '2026-01-02 07:12:59'),
(114, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7331.JPG', '2026-01-02 07:12:59'),
(115, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7344.JPG', '2026-01-02 07:12:59'),
(116, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7345.JPG', '2026-01-02 07:12:59'),
(117, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7346.JPG', '2026-01-02 07:12:59'),
(118, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7347.JPG', '2026-01-02 07:12:59'),
(119, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7348.JPG', '2026-01-02 07:12:59'),
(120, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7349.JPG', '2026-01-02 07:12:59'),
(121, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7350.JPG', '2026-01-02 07:12:59'),
(122, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7351.JPG', '2026-01-02 07:12:59'),
(123, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7352.JPG', '2026-01-02 07:12:59'),
(124, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7353.JPG', '2026-01-02 07:12:59'),
(125, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7354.JPG', '2026-01-02 07:12:59'),
(126, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7355.JPG', '2026-01-02 07:12:59'),
(127, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7356.JPG', '2026-01-02 07:12:59'),
(128, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7357.JPG', '2026-01-02 07:12:59'),
(129, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7358.JPG', '2026-01-02 07:12:59'),
(130, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7359.JPG', '2026-01-02 07:12:59'),
(131, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7360.JPG', '2026-01-02 07:12:59'),
(132, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7361.JPG', '2026-01-02 07:12:59'),
(133, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7376.JPG', '2026-01-02 07:12:59'),
(134, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7377.JPG', '2026-01-02 07:12:59'),
(135, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7378.JPG', '2026-01-02 07:12:59'),
(136, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7379.JPG', '2026-01-02 07:12:59'),
(137, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7380.JPG', '2026-01-02 07:12:59'),
(138, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7381.JPG', '2026-01-02 07:12:59'),
(139, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7382.JPG', '2026-01-02 07:12:59'),
(140, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7383.JPG', '2026-01-02 07:12:59'),
(141, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7384.JPG', '2026-01-02 07:12:59'),
(142, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7385.JPG', '2026-01-02 07:12:59'),
(143, 'paint_designs', 'Kitchen', 'uploads/images/paint_designs/Kitchen/IMG_7386.JPG', '2026-01-02 07:12:59'),
(144, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.05 PM (1).jpeg', '2026-01-02 07:12:59'),
(145, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.05 PM (2).jpeg', '2026-01-02 07:12:59'),
(146, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.05 PM.jpeg', '2026-01-02 07:12:59'),
(147, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (1).jpeg', '2026-01-02 07:12:59'),
(148, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (10).jpeg', '2026-01-02 07:12:59'),
(149, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (11).jpeg', '2026-01-02 07:12:59'),
(150, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (2).jpeg', '2026-01-02 07:12:59'),
(151, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (3).jpeg', '2026-01-02 07:12:59'),
(152, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (4).jpeg', '2026-01-02 07:12:59'),
(153, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (5).jpeg', '2026-01-02 07:12:59'),
(154, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (6).jpeg', '2026-01-02 07:12:59'),
(155, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (7).jpeg', '2026-01-02 07:12:59'),
(156, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (8).jpeg', '2026-01-02 07:12:59'),
(157, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM (9).jpeg', '2026-01-02 07:12:59'),
(158, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 11.01.06 PM.jpeg', '2026-01-02 07:12:59'),
(159, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.01 PM.jpeg', '2026-01-02 07:12:59'),
(160, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.04 PM.jpeg', '2026-01-02 07:12:59'),
(161, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.05 PM (1).jpeg', '2026-01-02 07:12:59'),
(162, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.05 PM.jpeg', '2026-01-02 07:12:59'),
(163, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.06 PM (1).jpeg', '2026-01-02 07:12:59'),
(164, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.06 PM (2).jpeg', '2026-01-02 07:12:59'),
(165, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.06 PM (3).jpeg', '2026-01-02 07:12:59'),
(166, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.06 PM.jpeg', '2026-01-02 07:12:59'),
(167, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.07 PM (1).jpeg', '2026-01-02 07:12:59'),
(168, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.07 PM (2).jpeg', '2026-01-02 07:12:59'),
(169, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.07 PM.jpeg', '2026-01-02 07:12:59'),
(170, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.34.08 PM.jpeg', '2026-01-02 07:12:59'),
(171, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design1.jpeg', '2026-01-02 07:12:59'),
(172, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design10.jpeg', '2026-01-02 07:12:59'),
(173, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design11.jpeg', '2026-01-02 07:12:59'),
(174, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design12.jpeg', '2026-01-02 07:12:59'),
(175, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design13.jpeg', '2026-01-02 07:12:59'),
(176, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design2.jpeg', '2026-01-02 07:12:59'),
(177, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design3.jpeg', '2026-01-02 07:12:59'),
(178, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design4.jpeg', '2026-01-02 07:12:59'),
(179, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design5.jpeg', '2026-01-02 07:12:59'),
(180, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design6.jpeg', '2026-01-02 07:12:59'),
(181, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design7.jpeg', '2026-01-02 07:12:59'),
(182, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design8.jpeg', '2026-01-02 07:12:59'),
(183, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/design9.jpeg', '2026-01-02 07:12:59'),
(184, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.40 PM (1).jpeg', '2026-01-02 07:12:59'),
(185, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.40 PM.jpeg', '2026-01-02 07:12:59'),
(186, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.43 PM (1).jpeg', '2026-01-02 07:12:59'),
(187, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.43 PM.jpeg', '2026-01-02 07:12:59'),
(188, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.44 PM (1).jpeg', '2026-01-02 07:12:59'),
(189, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.44 PM.jpeg', '2026-01-02 07:12:59'),
(190, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.45 PM (1).jpeg', '2026-01-02 07:12:59'),
(191, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.45 PM.jpeg', '2026-01-02 07:12:59'),
(192, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.46 PM (1).jpeg', '2026-01-02 07:12:59'),
(193, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.46 PM.jpeg', '2026-01-02 07:12:59'),
(194, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.47 PM (1).jpeg', '2026-01-02 07:12:59'),
(195, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.47 PM.jpeg', '2026-01-02 07:12:59'),
(196, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 9.25.48 PM.jpeg', '2026-01-02 07:12:59'),
(197, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (1).jpeg', '2026-01-02 07:12:59'),
(198, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (2).jpeg', '2026-01-02 07:12:59'),
(199, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (3).jpeg', '2026-01-02 07:12:59'),
(200, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (4).jpeg', '2026-01-02 07:12:59'),
(201, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (5).jpeg', '2026-01-02 07:12:59'),
(202, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (6).jpeg', '2026-01-02 07:12:59'),
(203, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (7).jpeg', '2026-01-02 07:12:59'),
(204, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM (8).jpeg', '2026-01-02 07:12:59'),
(205, 'paint_designs', 'Living Room', 'uploads/images/paint_designs/Living Room/WhatsApp Image 2025-12-30 at 8.56.05 PM.jpeg', '2026-01-02 07:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `paint_requests`
--

CREATE TABLE `paint_requests` (
  `id` int(11) NOT NULL,
  `room_image` varchar(255) NOT NULL,
  `sunlight_direction` varchar(50) DEFAULT NULL,
  `length_ft` int(11) DEFAULT NULL,
  `width_ft` int(11) DEFAULT NULL,
  `style_pattern` varchar(100) DEFAULT NULL,
  `match_furniture` tinyint(1) DEFAULT 0,
  `furniture_images` text DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `preferred_colours` varchar(100) DEFAULT NULL,
  `other_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paint_requests`
--

INSERT INTO `paint_requests` (`id`, `room_image`, `sunlight_direction`, `length_ft`, `width_ft`, `style_pattern`, `match_furniture`, `furniture_images`, `room_type`, `preferred_colours`, `other_details`, `created_at`) VALUES
(1, '1767064667_room.jpg', 'East', 0, 0, '0', 1, '[]', 'Living Room', '', 'Calm living room look', '2025-12-30 03:17:47'),
(2, '1767064776_room.jpg', 'East', 12, 10, '0', 1, '[]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2025-12-30 03:19:36'),
(3, '1767064858_room.jpg', 'East', 12, 10, '0', 1, '[\"uploads\\/1767064858_furn_0.jpg\",\"uploads\\/1767064858_furn_1.jpg\",\"uploads\\/1767064858_furn_2.jpg\"]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2025-12-30 03:20:58'),
(4, '1767077312_room.jpg', 'East', 12, 10, '0', 1, '[\"uploads\\/1767077312_furn_0.jpg\",\"uploads\\/1767077312_furn_1.jpg\",\"uploads\\/1767077312_furn_2.jpg\"]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2025-12-30 06:48:32'),
(5, '1767079097_room.jpg', 'West', 10, 10, '0', 1, '[]', 'Living Room', 'Pastel Blue', 'Descent look', '2025-12-30 07:18:17'),
(6, '1767079682_room.jpg', 'North', 20, 20, '0', 1, '[\"uploads\\/1767079682_furn_0.jpg\"]', 'Office', 'Neutral', 'Good look', '2025-12-30 07:28:02'),
(7, '1767080255_room.jpg', 'East', 20, 10, '0', 1, '[\"uploads\\/1767080255_furn_0.jpg\"]', 'Living Room', 'Ivory', '', '2025-12-30 07:37:35'),
(8, '1767080467_room.jpg', 'East', 12, 10, 'Modern', 1, '[\"uploads\\/1767080467_furn_0.jpg\",\"uploads\\/1767080467_furn_1.jpg\",\"uploads\\/1767080467_furn_2.jpg\"]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2025-12-30 07:41:07'),
(9, '1767080469_room.jpg', 'East', 12, 10, 'Modern', 1, '[\"uploads\\/1767080469_furn_0.jpg\",\"uploads\\/1767080469_furn_1.jpg\",\"uploads\\/1767080469_furn_2.jpg\"]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2025-12-30 07:41:09'),
(10, '1767080476_room.jpg', 'East', 20, 10, 'Minimal', 1, '[\"uploads\\/1767080476_furn_0.jpg\"]', 'Living Room', 'Ivory', '', '2025-12-30 07:41:16'),
(11, '1767080942_room.jpg', 'West', 10, 10, 'Contemporary', 0, '[]', 'Bedroom', 'Neutral', '', '2025-12-30 07:49:02'),
(12, '1767081341_room.jpg', 'West', 15, 15, 'Scandinavian', 0, '[]', 'Office', 'Soft Grey', '', '2025-12-30 07:55:41'),
(13, '1767082852_room.jpg', 'West', 10, 10, 'Classic', 0, '[]', 'Office', 'Ivory', '', '2025-12-30 08:20:52'),
(14, '1767083896_room.jpg', 'West', 20, 10, 'Contemporary', 0, '[]', 'Office', 'Soft Grey', '', '2025-12-30 08:38:16'),
(15, '1767084105_room.jpg', 'West', 20, 10, 'Contemporary', 0, '[]', 'Office', 'Soft Grey', '', '2025-12-30 08:41:45'),
(16, '1767084520_room.jpg', 'East', 10, 10, 'Classic', 0, '[]', 'Bedroom', 'Pastel Blue', '', '2025-12-30 08:48:40'),
(17, '1767084913_room.jpg', 'West', 10, 10, 'Contemporary', 0, '[]', 'Office', 'Pastel Blue', '', '2025-12-30 08:55:13'),
(18, '1767341324_room.jpg', 'East', 0, 0, 'Designer', 1, '[]', 'Living Room', '', '', '2026-01-02 08:08:44'),
(19, '1767344758_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-02 09:05:58'),
(20, '1767410201_room.jpg', 'East', 0, 0, 'Formal', 0, '[]', 'Kitchen', '', '', '2026-01-03 03:16:41'),
(21, '1767410216_room.jpg', 'East', 0, 0, 'Formal', 0, '[]', 'Living Room', '', '', '2026-01-03 03:16:56'),
(22, '1767410231_room.jpg', 'East', 0, 0, 'Calm & Fresh', 0, '[]', 'Living Room', '', '', '2026-01-03 03:17:11'),
(23, '1767410242_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-03 03:17:22'),
(24, '1767410251_room.jpg', 'East', 0, 0, 'Calm & Fresh', 0, '[]', 'Living Room', '', '', '2026-01-03 03:17:31'),
(25, '1767410259_room.jpg', 'East', 0, 0, 'Patterns', 0, '[]', 'Living Room', '', '', '2026-01-03 03:17:39'),
(26, '1767410268_room.jpg', 'East', 0, 0, 'Traditional', 0, '[]', 'Living Room', '', '', '2026-01-03 03:17:48'),
(27, '1767416276_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Kitchen', '', '', '2026-01-03 04:57:56'),
(28, '1767416299_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Kitchen', '', '', '2026-01-03 04:58:19'),
(29, '1767416314_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Bathroom', '', '', '2026-01-03 04:58:34'),
(30, '1767416322_room.jpg', 'West', 0, 0, 'Formal', 0, '[]', 'Bathroom', '', '', '2026-01-03 04:58:42'),
(31, '1767428489_room.jpg', 'North', 0, 0, 'Formal', 1, '[\"uploads\\/1767428489_furn_1.jpg\",\"uploads\\/1767428489_furn_0.jpg\"]', 'Living Room', '', '', '2026-01-03 08:21:29'),
(32, '1767428917_room.jpg', 'East', 0, 0, 'Patterns', 0, '[]', 'Bedroom', '', '', '2026-01-03 08:28:37'),
(33, '1767428929_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Bedroom', '', '', '2026-01-03 08:28:49'),
(34, '1767429186_room.jpg', 'West', 0, 0, 'Formal', 0, '[]', 'Living Room', '', '', '2026-01-03 08:33:06'),
(35, '1767429660_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Bedroom', '', '', '2026-01-03 08:41:00'),
(36, '1767429915_room.jpg', 'West', 0, 0, 'Formal', 0, '[]', 'Bathroom', '', '', '2026-01-03 08:45:15'),
(37, '1767430083_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-03 08:48:03'),
(38, '1767430441_room.jpg', 'East', 0, 0, 'Formal', 0, '[]', 'Living Room', '', '', '2026-01-03 08:54:01'),
(39, '1767430596_room.jpg', 'East', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-03 08:56:36'),
(40, '1767430626_room.jpg', 'East', 0, 0, 'Formal', 0, '[]', 'Kitchen', '', '', '2026-01-03 08:57:06'),
(41, '1767431206_room.jpg', 'East', 0, 0, 'Traditional', 0, '[]', 'Living Room', '', '', '2026-01-03 09:06:46'),
(42, '1767437483_room.jpg', 'East', 0, 0, 'Formal', 1, '[\"uploads\\/1767437483_furn_0.jpg\",\"uploads\\/1767437483_furn_1.jpg\"]', 'Living Room', '', 'Descent Look', '2026-01-03 10:51:24'),
(43, '1767600846_room.jpg', 'West', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-05 08:14:06'),
(44, '1767693408_room.jpg', 'East', 0, 0, 'Traditional', 0, '[]', 'Living Room', '', '', '2026-01-06 09:56:48'),
(45, '1767759304_room.jpg', 'East', 0, 0, 'Formal', 0, '[]', 'Bathroom', '', '', '2026-01-07 04:15:04'),
(46, '1767760568_room.jpg', 'North', 0, 0, 'Calm & Fresh', 0, '[]', 'Bathroom', '', '', '2026-01-07 04:36:08'),
(47, '1767760925_room.jpg', 'East', 12, 10, 'Modern', 1, '[]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2026-01-07 04:42:05'),
(48, '1767760953_room.jpg', 'East', 12, 10, 'Formal', 1, '[]', 'Living Room', 'Pastel Blue', 'Calm living room look', '2026-01-07 04:42:33'),
(49, '1767761239_room.jpg', 'East', 0, 0, 'Traditional', 0, '[]', 'Living Room', '', '', '2026-01-07 04:47:19'),
(50, '1767761394_room.jpg', 'West', 0, 0, 'Patterns', 0, '[]', 'Kitchen', '', '', '2026-01-07 04:49:54'),
(51, '1767761546_room.jpg', 'West', 0, 0, 'Calm & Fresh', 0, '[]', 'Bedroom', '', '', '2026-01-07 04:52:26'),
(52, '1767761594_room.jpg', 'East', 0, 0, 'Calm & Fresh', 0, '[]', 'Bedroom', '', '', '2026-01-07 04:53:14'),
(53, '1767761666_room.jpg', 'East', 0, 0, 'Traditional', 0, '[]', 'Living Room', '', '', '2026-01-07 04:54:26'),
(54, '1767761785_room.jpg', 'East', 0, 0, 'Patterns', 0, '[]', 'Kitchen', '', '', '2026-01-07 04:56:25'),
(55, '1767761859_room.jpg', 'West', 0, 0, 'Designer', 0, '[]', 'Kitchen', '', '', '2026-01-07 04:57:39'),
(56, '1767761877_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Bathroom', '', '', '2026-01-07 04:57:57'),
(57, '1767762073_room.jpg', 'West', 0, 0, 'Calm & Fresh', 0, '[]', 'Bathroom', '', '', '2026-01-07 05:01:13'),
(58, '1767762080_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Bathroom', '', '', '2026-01-07 05:01:20'),
(59, '1767762097_room.jpg', 'West', 0, 0, 'Designer', 0, '[]', 'Living Room', '', '', '2026-01-07 05:01:37'),
(60, '1767762243_room.jpg', 'West', 0, 0, 'Traditional', 0, '[]', 'Bathroom', '', '', '2026-01-07 05:04:03'),
(61, '1767764153_room.jpg', 'East', 0, 0, 'Traditional', 1, '[\"uploads\\/1767764153_furn_0.jpg\",\"uploads\\/1767764153_furn_1.jpg\"]', 'Living Room', '', 'Decent Look', '2026-01-07 05:35:53'),
(62, '1767766093_room.jpg', 'East', 0, 0, 'Designer', 1, '[\"uploads\\/1767766093_furn_0.jpg\"]', 'Living Room', '', 'Descent Look', '2026-01-07 06:08:13'),
(63, '1767766413_room.jpg', 'East', 0, 0, 'Formal', 1, '[\"uploads\\/1767766413_furn_0.jpg\"]', 'Living Room', '', 'Descent Look', '2026-01-07 06:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `room_products`
--

CREATE TABLE `room_products` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `product_name` varchar(120) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `product_url` text DEFAULT NULL,
  `image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_products`
--

INSERT INTO `room_products` (`id`, `room_type`, `product_name`, `category`, `price`, `product_url`, `image_url`) VALUES
(1, 'Living Room', '3 Seater Fabric Sofa', 'Furniture', 18999, 'https://amzn.in/d/eiPtf1C', 'https://m.media-amazon.com/images/I/5158fckeBaL._SX679_.jpg'),
(2, 'Living Room', '2 Seater Sofa', 'Furniture', 14999, 'https://amzn.in/d/g2oO1ei', 'https://m.media-amazon.com/images/I/6107HzeDqOL._SX679_.jpg'),
(3, 'Living Room', 'L Shape Sofa', 'Furniture', 20999, 'https://amzn.in/d/g9EjwiU', 'https://m.media-amazon.com/images/I/81oCfTiSXcL._SX679_.jpg'),
(4, 'Living Room', 'Wooden Coffee Table', 'Furniture', 3999, 'https://amzn.in/d/7eqmTzb', 'https://m.media-amazon.com/images/I/71ef96TuDtL._SX679_.jpg'),
(5, 'Living Room', 'Glass Coffee Table', 'Furniture', 3149, 'https://amzn.in/d/5lIJ3j0', 'https://m.media-amazon.com/images/I/917KimuNCgL._SX679_.jpg'),
(6, 'Living Room', 'TV Unit', 'Furniture', 4999, 'https://amzn.in/d/9pk36FR', 'https://m.media-amazon.com/images/I/71AYQ7+LDJL._SX679_.jpg'),
(7, 'Living Room', 'Wall Mounted TV Unit', 'Furniture', 6719, 'https://amzn.in/d/c3LDZZg', 'https://m.media-amazon.com/images/I/71l8IxZS5WL._SX679_.jpg'),
(8, 'Living Room', 'Bookshelf', 'Storage', 3499, 'https://amzn.in/d/a4KN9KX', 'https://m.media-amazon.com/images/I/715cy7r6NuL._SX679_.jpg'),
(9, 'Living Room', 'Corner Shelf', 'Storage', 1999, 'https://amzn.in/d/iNGjVdd', 'https://m.media-amazon.com/images/I/41tLzLokqZL.jpg'),
(10, 'Living Room', 'Wall Shelf', 'Storage', 1499, 'https://amzn.in/d/bt5HFkx', 'https://m.media-amazon.com/images/I/61w0VszjbwL._SX679_.jpg'),
(11, 'Living Room', 'Floor Lamp', 'Lighting', 999, 'https://amzn.in/d/hTWSQTQ', 'https://m.media-amazon.com/images/I/81rlAcUXzeL._SX425_.jpg'),
(12, 'Living Room', 'Table Lamp', 'Lighting', 1598, 'https://amzn.in/d/fRu0Poz', 'https://m.media-amazon.com/images/I/61sR4MwbslL._SX522_.jpg'),
(13, 'Living Room', 'LED Ceiling Light', 'Lighting', 2786, 'https://amzn.in/d/2SreG2k', 'https://m.media-amazon.com/images/I/51KqNsXyfQL._SX522_.jpg'),
(14, 'Living Room', 'Area Rug', 'Decor', 1799, 'https://amzn.in/d/d7z386V', 'https://m.media-amazon.com/images/I/81Sh0A9UnqL._SX679_.jpg'),
(15, 'Living Room', 'Curtains', 'Decor', 2089, 'https://amzn.in/d/bKcVhmU', 'https://m.media-amazon.com/images/I/71TPQjrvZIL._SX679_.jpg'),
(16, 'Living Room', 'Wall Art', 'Decor', 599, 'https://amzn.in/d/7ECaoMD', 'https://m.media-amazon.com/images/I/718Hub5DjgL._SX522_.jpg'),
(17, 'Living Room', 'Wall Clock', 'Decor', 499, 'https://amzn.in/d/efYMylo', 'https://m.media-amazon.com/images/I/714bAiZGL+L._SX679_.jpg'),
(18, 'Living Room', 'Indoor Plant', 'Decor', 320, 'https://amzn.in/d/07I467s', 'https://m.media-amazon.com/images/I/31YFcdPawqL.jpg'),
(19, 'Living Room', 'Plant Stand', 'Decor', 709, 'https://amzn.in/d/f639s1I', 'https://m.media-amazon.com/images/I/71Fi9hAqIfL._SX679_.jpg'),
(20, 'Living Room', 'Accent Chair', 'Furniture', 9999, 'https://amzn.in/d/5TWI6qb', 'https://m.media-amazon.com/images/I/71tSsgA46fL._SY879_.jpg'),
(21, 'Living Room', 'Pouffe', 'Furniture', 2499, 'https://amzn.in/d/iuB8iWZ', 'https://m.media-amazon.com/images/I/81ntBanSrNL._SX679_.jpg'),
(22, 'Living Room', 'Side Table', 'Furniture', 1999, 'https://amzn.in/d/0OeaMal', 'https://m.media-amazon.com/images/I/6150xP2VMkL._SX679_.jpg'),
(23, 'Living Room', 'Console Table', 'Furniture', 5999, 'https://amzn.in/d/4JrqOeX', 'https://m.media-amazon.com/images/I/81i3aKfDWnL._SX679_.jpg'),
(24, 'Living Room', 'Magazine Rack', 'Decor', 1299, 'https://amzn.in/d/fJXvgw5', 'https://m.media-amazon.com/images/I/41bo05TKdhL._SX679_.jpg'),
(25, 'Living Room', 'Cushion Covers', 'Decor', 298, 'https://amzn.in/d/4l3XvE1', 'https://m.media-amazon.com/images/I/71vs+LUGZuL._SX679_.jpg'),
(26, 'Living Room', 'Throw Blanket', 'Decor', 959, 'https://amzn.in/d/j66JLAb', 'https://m.media-amazon.com/images/I/81ayLbrlR2L._SX679_.jpg'),
(27, 'Living Room', 'Room Divider', 'Furniture', 1634, 'https://amzn.in/d/hWmfTAT', 'https://m.media-amazon.com/images/I/61wjwmz9QOL._SX679_.jpg'),
(28, 'Living Room', 'Wall Mirror', 'Decor', 1499, 'https://amzn.in/d/1ICtWJd', 'https://m.media-amazon.com/images/I/81x0PUHjMnL._SX679_.jpg'),
(29, 'Bedroom', 'Queen Size Bed', 'Furniture', 15999, 'https://www.amazon.in/s?k=queen+size+bed', 'https://m.media-amazon.com/images/I/71A5p0Z9g-L._SX679_.jpg'),
(30, 'Bedroom', 'King Size Bed', 'Furniture', 22999, 'https://www.amazon.in/s?k=king+size+bed', 'https://m.media-amazon.com/images/I/81Wc7fD1GWL._SX679_.jpg'),
(31, 'Bedroom', 'Single Bed', 'Furniture', 8999, 'https://www.amazon.in/s?k=single+bed', 'https://m.media-amazon.com/images/I/71g6pZC7tVL._SX679_.jpg'),
(32, 'Bedroom', 'Bed with Storage', 'Furniture', 19999, 'https://www.amazon.in/s?k=bed+with+storage', 'https://m.media-amazon.com/images/I/81kL6E9W4SL._SX679_.jpg'),
(33, 'Bedroom', 'Upholstered Bed', 'Furniture', 18999, 'https://www.amazon.in/s?k=upholstered+bed', 'https://m.media-amazon.com/images/I/71QK0f8Jr8L._SX679_.jpg'),
(34, 'Bedroom', 'Memory Foam Mattress', 'Mattress', 9999, 'https://www.amazon.in/s?k=memory+foam+mattress', 'https://m.media-amazon.com/images/I/71N0mF3wM7L._SX679_.jpg'),
(35, 'Bedroom', 'Spring Mattress', 'Mattress', 11999, 'https://www.amazon.in/s?k=spring+mattress', 'https://m.media-amazon.com/images/I/71C5K9fH5LL._SX679_.jpg'),
(36, 'Bedroom', 'Orthopedic Mattress', 'Mattress', 13999, 'https://www.amazon.in/s?k=orthopedic+mattress', 'https://m.media-amazon.com/images/I/71hD7T0GgVL._SX679_.jpg'),
(37, 'Bedroom', '3 Door Wardrobe', 'Storage', 17999, 'https://www.amazon.in/s?k=3+door+wardrobe', 'https://m.media-amazon.com/images/I/81nT8G2QnKL._SX679_.jpg'),
(38, 'Bedroom', '2 Door Wardrobe', 'Storage', 12999, 'https://www.amazon.in/s?k=2+door+wardrobe', 'https://m.media-amazon.com/images/I/71ZJf5E5zXL._SX679_.jpg'),
(39, 'Bedroom', 'Sliding Door Wardrobe', 'Storage', 25999, 'https://www.amazon.in/s?k=sliding+wardrobe', 'https://m.media-amazon.com/images/I/81X7T4WJZ6L._SX679_.jpg'),
(40, 'Bedroom', 'Bedside Table', 'Furniture', 2499, 'https://www.amazon.in/s?k=bedside+table', 'https://m.media-amazon.com/images/I/61ZJ5Zx6FVL._SX679_.jpg'),
(41, 'Bedroom', 'Night Stand', 'Furniture', 1999, 'https://www.amazon.in/s?k=night+stand', 'https://m.media-amazon.com/images/I/71xZP6WJ9YL._SX679_.jpg'),
(42, 'Bedroom', 'Dressing Table', 'Furniture', 6999, 'https://www.amazon.in/s?k=dressing+table', 'https://m.media-amazon.com/images/I/71Q4H5F6KSL._SX679_.jpg'),
(43, 'Bedroom', 'Wall Mirror', 'Decor', 2999, 'https://www.amazon.in/s?k=wall+mirror+bedroom', 'https://m.media-amazon.com/images/I/71QZ6FZJxRL._SX679_.jpg'),
(44, 'Bedroom', 'Full Length Mirror', 'Decor', 3999, 'https://www.amazon.in/s?k=full+length+mirror', 'https://m.media-amazon.com/images/I/71Z8Y9P7tZL._SX679_.jpg'),
(45, 'Bedroom', 'Table Lamp', 'Lighting', 1299, 'https://www.amazon.in/s?k=bedroom+table+lamp', 'https://m.media-amazon.com/images/I/61Zx5yZyBCL._SX679_.jpg'),
(46, 'Bedroom', 'Wall Light', 'Lighting', 1799, 'https://www.amazon.in/s?k=bedroom+wall+light', 'https://m.media-amazon.com/images/I/71Y5Zx7G9RL._SX679_.jpg'),
(47, 'Bedroom', 'Ceiling Light', 'Lighting', 2499, 'https://www.amazon.in/s?k=bedroom+ceiling+light', 'https://m.media-amazon.com/images/I/71J2C5W5JPL._SX679_.jpg'),
(48, 'Bedroom', 'Curtains', 'Decor', 1999, 'https://www.amazon.in/s?k=bedroom+curtains', 'https://m.media-amazon.com/images/I/81x8f4Bv7BL._SX679_.jpg'),
(49, 'Bedroom', 'Area Rug', 'Decor', 2999, 'https://www.amazon.in/s?k=bedroom+rug', 'https://m.media-amazon.com/images/I/71GJtF4mB6L._SX679_.jpg'),
(50, 'Bedroom', 'Bedsheet Set', 'Decor', 1499, 'https://www.amazon.in/s?k=bedsheet+set', 'https://m.media-amazon.com/images/I/71tG5XJ2LXL._SX679_.jpg'),
(51, 'Bedroom', 'Pillow Set', 'Decor', 999, 'https://www.amazon.in/s?k=pillow+set', 'https://m.media-amazon.com/images/I/71Wk7X6ZQ4L._SX679_.jpg'),
(52, 'Bedroom', 'Blanket', 'Decor', 1799, 'https://www.amazon.in/s?k=blanket', 'https://m.media-amazon.com/images/I/71JZ8ZJ6ZXL._SX679_.jpg'),
(53, 'Bedroom', 'Wall Art', 'Decor', 1499, 'https://www.amazon.in/s?k=bedroom+wall+art', 'https://m.media-amazon.com/images/I/61R7Z4ZQbXL._SX679_.jpg'),
(54, 'Bedroom', 'Photo Frame', 'Decor', 899, 'https://www.amazon.in/s?k=photo+frame', 'https://m.media-amazon.com/images/I/61YkZ6Z8G0L._SX679_.jpg'),
(55, 'Bedroom', 'Indoor Plant', 'Decor', 799, 'https://www.amazon.in/s?k=bedroom+indoor+plant', 'https://m.media-amazon.com/images/I/61CkZ8tB0RL._SX679_.jpg'),
(56, 'Kitchen', 'Mixer Grinder', 'Appliance', 4999, 'https://www.amazon.in/s?k=mixer+grinder', 'https://m.media-amazon.com/images/I/71n2E7M5dKL._SX679_.jpg'),
(57, 'Kitchen', 'Juicer Mixer Grinder', 'Appliance', 6999, 'https://www.amazon.in/s?k=juicer+mixer+grinder', 'https://m.media-amazon.com/images/I/71Z7K5HcB5L._SX679_.jpg'),
(58, 'Kitchen', 'Hand Blender', 'Appliance', 1999, 'https://www.amazon.in/s?k=hand+blender', 'https://m.media-amazon.com/images/I/61y9M6P9RQL._SX679_.jpg'),
(59, 'Kitchen', 'Induction Cooktop', 'Appliance', 2999, 'https://www.amazon.in/s?k=induction+cooktop', 'https://m.media-amazon.com/images/I/61ZP8YpD8YL._SX679_.jpg'),
(60, 'Kitchen', 'Gas Stove 2 Burner', 'Appliance', 3499, 'https://www.amazon.in/s?k=2+burner+gas+stove', 'https://m.media-amazon.com/images/I/71yZ3Z8k5VL._SX679_.jpg'),
(61, 'Kitchen', 'Gas Stove 3 Burner', 'Appliance', 4999, 'https://www.amazon.in/s?k=3+burner+gas+stove', 'https://m.media-amazon.com/images/I/71xK9Y8PZYL._SX679_.jpg'),
(62, 'Kitchen', 'Electric Kettle', 'Appliance', 1499, 'https://www.amazon.in/s?k=electric+kettle', 'https://m.media-amazon.com/images/I/61R8Y7kB9XL._SX679_.jpg'),
(63, 'Kitchen', 'Rice Cooker', 'Appliance', 2999, 'https://www.amazon.in/s?k=rice+cooker', 'https://m.media-amazon.com/images/I/71tY5QZ8pVL._SX679_.jpg'),
(64, 'Kitchen', 'OTG Oven', 'Appliance', 6499, 'https://www.amazon.in/s?k=otg+oven', 'https://m.media-amazon.com/images/I/71PZxZ8H3XL._SX679_.jpg'),
(65, 'Kitchen', 'Kitchen Chimney', 'Appliance', 11999, 'https://www.amazon.in/s?k=kitchen+chimney', 'https://m.media-amazon.com/images/I/61tL9U9nGXL._SX679_.jpg'),
(66, 'Kitchen', 'Water Purifier', 'Appliance', 8999, 'https://www.amazon.in/s?k=water+purifier', 'https://m.media-amazon.com/images/I/71ZQ5F8W8YL._SX679_.jpg'),
(67, 'Kitchen', 'Microwave Oven', 'Appliance', 7499, 'https://www.amazon.in/s?k=microwave+oven', 'https://m.media-amazon.com/images/I/71pP7Z8JHVL._SX679_.jpg'),
(68, 'Kitchen', 'Non Stick Cookware Set', 'Cookware', 2999, 'https://www.amazon.in/s?k=non+stick+cookware+set', 'https://m.media-amazon.com/images/I/71GJtF4mB6L._SX679_.jpg'),
(69, 'Kitchen', 'Pressure Cooker', 'Cookware', 2499, 'https://www.amazon.in/s?k=pressure+cooker', 'https://m.media-amazon.com/images/I/71Xk5H7YyVL._SX679_.jpg'),
(70, 'Kitchen', 'Kadai', 'Cookware', 1299, 'https://www.amazon.in/s?k=kadai', 'https://m.media-amazon.com/images/I/61yP8Y9Z8PL._SX679_.jpg'),
(71, 'Kitchen', 'Tawa', 'Cookware', 999, 'https://www.amazon.in/s?k=tawa', 'https://m.media-amazon.com/images/I/61Y6Z8xP7XL._SX679_.jpg'),
(72, 'Kitchen', 'Knife Set', 'Utensils', 1299, 'https://www.amazon.in/s?k=knife+set', 'https://m.media-amazon.com/images/I/71ZxP5Z7JPL._SX679_.jpg'),
(73, 'Kitchen', 'Cutting Board', 'Utensils', 799, 'https://www.amazon.in/s?k=cutting+board', 'https://m.media-amazon.com/images/I/61P8ZJY8xZL._SX679_.jpg'),
(74, 'Kitchen', 'Storage Containers Set', 'Storage', 1999, 'https://www.amazon.in/s?k=storage+containers+set', 'https://m.media-amazon.com/images/I/71C5ZxZ8BXL._SX679_.jpg'),
(75, 'Kitchen', 'Spice Box', 'Storage', 999, 'https://www.amazon.in/s?k=spice+box', 'https://m.media-amazon.com/images/I/61ZJ8Y6Z7XL._SX679_.jpg'),
(76, 'Kitchen', 'Wall Mounted Rack', 'Storage', 1499, 'https://www.amazon.in/s?k=kitchen+wall+rack', 'https://m.media-amazon.com/images/I/71YQ7ZJkRQL._SX679_.jpg'),
(77, 'Kitchen', 'Dish Drying Rack', 'Storage', 1299, 'https://www.amazon.in/s?k=dish+drying+rack', 'https://m.media-amazon.com/images/I/71FZJY7X8XL._SX679_.jpg'),
(78, 'Kitchen', 'Trash Bin', 'Utility', 999, 'https://www.amazon.in/s?k=kitchen+trash+bin', 'https://m.media-amazon.com/images/I/61Y5Z7J9xZL._SX679_.jpg'),
(79, 'Kitchen', 'Apron', 'Utility', 499, 'https://www.amazon.in/s?k=kitchen+apron', 'https://m.media-amazon.com/images/I/61Z8Y5X9ZXL._SX679_.jpg'),
(80, 'Kitchen', 'Dish Cloth Set', 'Utility', 399, 'https://www.amazon.in/s?k=dish+cloth', 'https://m.media-amazon.com/images/I/61PZ7Y8X9RL._SX679_.jpg'),
(81, 'Kitchen', 'Kitchen Towels', 'Utility', 699, 'https://www.amazon.in/s?k=kitchen+towels', 'https://m.media-amazon.com/images/I/71ZP5Y6X9XL._SX679_.jpg'),
(82, 'Kitchen', 'Water Bottle Set', 'Utility', 1299, 'https://www.amazon.in/s?k=water+bottle+set', 'https://m.media-amazon.com/images/I/71X9Z5J8HXL._SX679_.jpg'),
(83, 'Kitchen', 'Lunch Box Set', 'Utility', 1499, 'https://www.amazon.in/s?k=lunch+box+set', 'https://m.media-amazon.com/images/I/71Z6X9P8YXL._SX679_.jpg'),
(84, 'Kitchen', 'Kitchen Mat', 'Decor', 999, 'https://www.amazon.in/s?k=kitchen+mat', 'https://m.media-amazon.com/images/I/61Z7Y9P8XRL._SX679_.jpg'),
(85, 'Bathroom', 'Overhead Rain Shower', 'Fittings', 3499, 'https://www.amazon.in/s?k=rain+shower', 'https://m.media-amazon.com/images/I/61fH9Z8E9RL._SX679_.jpg'),
(86, 'Bathroom', 'Handheld Shower', 'Fittings', 1999, 'https://www.amazon.in/s?k=handheld+shower', 'https://m.media-amazon.com/images/I/61X7Z5Y8QXL._SX679_.jpg'),
(87, 'Bathroom', 'Shower Panel', 'Fittings', 12999, 'https://www.amazon.in/s?k=shower+panel', 'https://m.media-amazon.com/images/I/71Z8F7X9YXL._SX679_.jpg'),
(88, 'Bathroom', 'Wall Mounted Basin', 'Sanitary', 4499, 'https://www.amazon.in/s?k=wall+mounted+basin', 'https://m.media-amazon.com/images/I/71FZJY7X8XL._SX679_.jpg'),
(89, 'Bathroom', 'Counter Top Basin', 'Sanitary', 5999, 'https://www.amazon.in/s?k=counter+top+basin', 'https://m.media-amazon.com/images/I/71Z5X8Y7JXL._SX679_.jpg'),
(90, 'Bathroom', 'Wash Basin Mixer Tap', 'Sanitary', 2499, 'https://www.amazon.in/s?k=basin+mixer+tap', 'https://m.media-amazon.com/images/I/61ZP8Y7X9XL._SX679_.jpg'),
(91, 'Bathroom', 'Western Toilet', 'Sanitary', 10999, 'https://www.amazon.in/s?k=western+toilet', 'https://m.media-amazon.com/images/I/71Y5Z8X9PL._SX679_.jpg'),
(92, 'Bathroom', 'Wall Hung Toilet', 'Sanitary', 15999, 'https://www.amazon.in/s?k=wall+hung+toilet', 'https://m.media-amazon.com/images/I/71Z8X9Y5XL._SX679_.jpg'),
(93, 'Bathroom', 'Health Faucet', 'Sanitary', 999, 'https://www.amazon.in/s?k=health+faucet', 'https://m.media-amazon.com/images/I/61X5Z9Y8PL._SX679_.jpg'),
(94, 'Bathroom', 'Bathroom Mirror', 'Accessories', 2499, 'https://www.amazon.in/s?k=bathroom+mirror', 'https://m.media-amazon.com/images/I/71QZ6FZJxRL._SX679_.jpg'),
(95, 'Bathroom', 'LED Mirror', 'Accessories', 4999, 'https://www.amazon.in/s?k=led+bathroom+mirror', 'https://m.media-amazon.com/images/I/71Z8Y9P7tZL._SX679_.jpg'),
(96, 'Bathroom', 'Mirror Cabinet', 'Storage', 5999, 'https://www.amazon.in/s?k=bathroom+mirror+cabinet', 'https://m.media-amazon.com/images/I/71ZJ5X8Y9XL._SX679_.jpg'),
(97, 'Bathroom', 'Wall Mounted Cabinet', 'Storage', 3999, 'https://www.amazon.in/s?k=bathroom+wall+cabinet', 'https://m.media-amazon.com/images/I/71k8YF7R8YL._SX679_.jpg'),
(98, 'Bathroom', 'Under Sink Cabinet', 'Storage', 3499, 'https://www.amazon.in/s?k=under+sink+cabinet', 'https://m.media-amazon.com/images/I/71X8Y9Z5PL._SX679_.jpg'),
(99, 'Bathroom', 'Open Storage Rack', 'Storage', 2499, 'https://www.amazon.in/s?k=bathroom+storage+rack', 'https://m.media-amazon.com/images/I/71YQ7ZJkRQL._SX679_.jpg'),
(100, 'Bathroom', 'Towel Rod', 'Accessories', 899, 'https://www.amazon.in/s?k=towel+rod', 'https://m.media-amazon.com/images/I/61YkZ6Z8G0L._SX679_.jpg'),
(101, 'Bathroom', 'Towel Ring', 'Accessories', 699, 'https://www.amazon.in/s?k=towel+ring', 'https://m.media-amazon.com/images/I/61Z8Y5X9ZXL._SX679_.jpg'),
(102, 'Bathroom', 'Robe Hook', 'Accessories', 499, 'https://www.amazon.in/s?k=robe+hook', 'https://m.media-amazon.com/images/I/61PZ7Y8X9RL._SX679_.jpg'),
(103, 'Bathroom', 'Soap Dispenser', 'Accessories', 799, 'https://www.amazon.in/s?k=soap+dispenser', 'https://m.media-amazon.com/images/I/71X9Z5J8HXL._SX679_.jpg'),
(104, 'Bathroom', 'Soap Dish', 'Accessories', 399, 'https://www.amazon.in/s?k=soap+dish', 'https://m.media-amazon.com/images/I/61Z7Y9P8XRL._SX679_.jpg'),
(105, 'Bathroom', 'Toothbrush Holder', 'Accessories', 499, 'https://www.amazon.in/s?k=toothbrush+holder', 'https://m.media-amazon.com/images/I/61Y5Z7J9xZL._SX679_.jpg'),
(106, 'Bathroom', 'Bathroom Mat', 'Decor', 999, 'https://www.amazon.in/s?k=bathroom+mat', 'https://m.media-amazon.com/images/I/61Z7Y9P8XRL._SX679_.jpg'),
(107, 'Bathroom', 'Shower Curtain', 'Decor', 1299, 'https://www.amazon.in/s?k=shower+curtain', 'https://m.media-amazon.com/images/I/71ZP5Y6X9XL._SX679_.jpg'),
(108, 'Bathroom', 'Curtain Rod', 'Accessories', 899, 'https://www.amazon.in/s?k=curtain+rod', 'https://m.media-amazon.com/images/I/61ZJ8Y6Z7XL._SX679_.jpg'),
(109, 'Bathroom', 'Trash Bin', 'Utility', 999, 'https://www.amazon.in/s?k=bathroom+trash+bin', 'https://m.media-amazon.com/images/I/61Y5Z7J9xZL._SX679_.jpg'),
(110, 'Bathroom', 'Toilet Brush Set', 'Utility', 799, 'https://www.amazon.in/s?k=toilet+brush+set', 'https://m.media-amazon.com/images/I/71Wk7X6ZQ4L._SX679_.jpg'),
(111, 'Bathroom', 'Plunger', 'Utility', 499, 'https://www.amazon.in/s?k=toilet+plunger', 'https://m.media-amazon.com/images/I/61Z8Y5X9ZXL._SX679_.jpg'),
(112, 'Bathroom', 'Air Freshener', 'Utility', 399, 'https://www.amazon.in/s?k=bathroom+air+freshener', 'https://m.media-amazon.com/images/I/71JZ8ZJ6ZXL._SX679_.jpg'),
(113, 'Bathroom', 'Exhaust Fan', 'Appliance', 1999, 'https://www.amazon.in/s?k=bathroom+exhaust+fan', 'https://m.media-amazon.com/images/I/71Z6X9P8YXL._SX679_.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `create_account`
--
ALTER TABLE `create_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `interior_designs`
--
ALTER TABLE `interior_designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_images`
--
ALTER TABLE `interior_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_requests`
--
ALTER TABLE `interior_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paint_images`
--
ALTER TABLE `paint_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paint_requests`
--
ALTER TABLE `paint_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_products`
--
ALTER TABLE `room_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `create_account`
--
ALTER TABLE `create_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `interior_designs`
--
ALTER TABLE `interior_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interior_images`
--
ALTER TABLE `interior_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interior_requests`
--
ALTER TABLE `interior_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `paint_images`
--
ALTER TABLE `paint_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `paint_requests`
--
ALTER TABLE `paint_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `room_products`
--
ALTER TABLE `room_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

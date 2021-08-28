-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2021 at 02:01 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `options` text NOT NULL,
  `correct` enum('0','1') NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `options`, `correct`, `question_id`) VALUES
(1, '3', '0', 1),
(2, '4', '0', 1),
(3, '5', '0', 1),
(4, '7', '1', 1),
(5, '26', '1', 2),
(6, '10', '0', 2),
(7, '5', '0', 2),
(8, '7', '0', 2),
(9, 'holi', '0', 3),
(10, 'christmas', '0', 3),
(11, 'eid', '0', 3),
(12, 'diwali', '1', 3),
(13, '5', '0', 4),
(14, '2', '0', 4),
(15, '11', '1', 4),
(16, '20', '0', 4),
(17, 'hen', '0', 5),
(18, 'ostrich', '1', 5),
(19, 'crow', '0', 5),
(20, 'rabbit', '0', 5),
(21, '3', '1', 6),
(22, '5', '0', 6),
(23, '10', '0', 6),
(24, '20', '0', 6),
(25, '1', '0', 7),
(26, '2', '0', 7),
(27, '3', '0', 7),
(28, '52', '1', 7),
(29, 'Sun', '1', 8),
(30, 'Mars', '0', 8),
(31, 'Moon', '0', 8),
(32, 'Pluto', '0', 8),
(33, '5', '0', 9),
(34, '6', '0', 9),
(35, '2', '1', 9),
(36, '1', '0', 9),
(37, 'Cheetah', '1', 10),
(38, 'Rabbit', '0', 10),
(39, 'Dog', '0', 10),
(40, 'Cat', '0', 10),
(41, 'Tibet', '1', 11),
(42, 'India', '0', 11),
(43, 'Russia', '0', 11),
(44, 'USA', '0', 11),
(45, 'Oxygen', '0', 12),
(46, 'Hydroden', '0', 12),
(47, 'Nitrogen', '1', 12),
(48, 'Iodine', '0', 12),
(49, 'Mandarin', '1', 13),
(50, 'Hindi', '0', 13),
(51, 'English', '0', 13),
(52, 'Arabic', '0', 13),
(53, 'India', '1', 14),
(54, 'China', '0', 14),
(55, 'USA', '0', 14),
(56, 'UK', '0', 14),
(57, 'Black', '0', 15),
(58, 'Blue', '0', 15),
(59, 'Red', '0', 15),
(60, 'White', '1', 15),
(61, '5', '0', 16),
(62, '10', '0', 16),
(63, '2', '1', 16),
(64, '4', '0', 16),
(65, 'Sugar', '0', 17),
(66, 'Cotton', '0', 17),
(67, 'Steel', '0', 17),
(68, 'Diamond', '1', 17),
(69, 'France', '1', 18),
(70, 'Russia', '0', 18),
(71, 'India', '0', 18),
(72, 'Australia', '0', 18),
(73, 'Europe', '0', 19),
(74, 'India', '0', 19),
(75, 'Africa', '0', 19),
(76, 'Asia', '1', 19),
(77, 'Elbow', '0', 20),
(78, 'Ankle', '0', 20),
(79, 'Neck', '0', 20),
(80, 'Knee', '1', 20);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `questions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `questions`) VALUES
(1, 'How many days do we have in a week?'),
(2, 'How many letters are there in the English alphabet?'),
(3, 'Which festival is called the festival of light?'),
(4, 'How many players are there in a cricket team?'),
(5, 'What type of bird lays the largest eggs?'),
(6, 'How many sides are there in a triangle?'),
(7, ' How many weeks are there in one year?'),
(8, 'Which is the nearest star to planet earth?'),
(9, ' How many lungs does the human body have?'),
(10, 'Which is the fastest animal on the land?'),
(11, 'Which place is known as the roof of the world?'),
(12, 'Which gas is most abundant in the earth’s atmosphere?'),
(13, 'Which is the most widely spoken language in the world?'),
(14, 'The largest ‘Democracy’ in the world?'),
(15, 'What color symbolizes peace?'),
(16, 'How many Cricket world cups does India have'),
(17, 'Which is the hardest substance available on earth?'),
(18, 'Which country gifted The Statue of Liberty to the United States?'),
(19, 'Which is the largest continent in the world?'),
(20, 'What is the largest joint in the human body?');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `result` enum('0','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

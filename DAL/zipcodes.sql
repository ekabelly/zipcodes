-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2018 at 01:53 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zipcodes`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'USA', 'us'),
(4, 'Spain', 'es'),
(5, 'India', 'in'),
(6, 'Austria', 'at'),
(7, 'Australia', 'au'),
(8, 'Belgium', 'be'),
(9, 'Bulgaria', 'bg'),
(10, 'France', 'fr'),
(11, 'Great Britain', 'gb'),
(12, 'Hungary', 'hu');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `latitude`, `longitude`, `zipcode`) VALUES
(55, 'Janpath', '28.6333', '77.2167', 18),
(56, 'Rail Bhawan', '28.6333', '77.2167', 18),
(57, 'Connaught Place', '28.6333', '77.2167', 18),
(58, 'Sansadiya Soudha', '28.6333', '77.2167', 18),
(59, 'Sectt North', '28.6333', '77.2167', 18),
(60, 'Constitution House', '28.6333', '77.2167', 18),
(61, 'Eastern Court', '28.6333', '77.2167', 18),
(62, 'Supreme Court', '28.6333', '77.2167', 18),
(63, 'Parliament House', '28.6333', '77.2167', 18),
(64, 'Parliament Street H O', '28.6333', '77.2167', 18),
(65, 'Laxminarain Mandir', '28.6333', '77.2167', 18),
(66, 'New Delhi G P O', '28.6333', '77.2167', 18),
(67, 'Krishi Bhawan', '28.6333', '77.2167', 18),
(68, 'Lady Harding Medical College', '28.6333', '77.2167', 18),
(69, 'Election Commission', '28.6333', '77.2167', 18),
(70, 'North Avenue', '28.6333', '77.2167', 18),
(71, 'Pragati Maidan', '28.6333', '77.2167', 18),
(72, 'Patiala House', '28.6333', '77.2167', 18),
(73, 'Shastri Bhawan', '28.6333', '77.2167', 18),
(74, 'Beverly Hills', '34.0901', '-118.4065', 19),
(75, 'Budapest', '47.5011', '19.0469', 20),
(76, 'Budapest', '47.5', '19.0833', 21),
(77, 'Budapest', '47.5', '19.0833', 22),
(78, 'Budapest', '47.5', '19.0833', 23),
(79, 'Budapest', '47.5', '19.0833', 24),
(80, 'Budapest', '47.482', '19.0536', 25),
(81, 'FelsÅ‘szÃ¶lnÃ¶k', '46.8797', '16.1731', 26);

-- --------------------------------------------------------

--
-- Table structure for table `zipcodes`
--

CREATE TABLE `zipcodes` (
  `id` int(11) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zipcodes`
--

INSERT INTO `zipcodes` (`id`, `zipcode`, `country`) VALUES
(1, 1234, 4),
(2, 1234, 1),
(3, 1111, 4),
(6, 110011, 5),
(7, 110001, 5),
(8, 110021, 5),
(9, 110031, 5),
(10, 110061, 5),
(11, 110091, 5),
(12, 110071, 5),
(13, 855126, 5),
(14, 855121, 5),
(15, 855119, 5),
(16, 855117, 5),
(17, 855116, 5),
(18, 110001, 5),
(19, 90210, 1),
(20, 1011, 12),
(21, 1012, 12),
(22, 1015, 12),
(23, 1022, 12),
(24, 1037, 12),
(25, 1111, 12),
(26, 9985, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zipcode` (`zipcode`);

--
-- Indexes for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `zipcodes`
--
ALTER TABLE `zipcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`zipcode`) REFERENCES `zipcodes` (`id`);

--
-- Constraints for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD CONSTRAINT `zipcodes_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

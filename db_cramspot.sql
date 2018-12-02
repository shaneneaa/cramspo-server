-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2018 at 01:00 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cramspot`
--

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `feed_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `contactnum`) VALUES
(2, 'fdsf', 'adasfasdf', 'saddsaf', '$2b$05$rnV4y6bRVdlv9JWig.yh0OJKOwXWmlnHnf.2dh8s2F55fBzB..HY6', 468954),
(3, 'fdsf', 'adasfasdf', 'saddsaf', '$2b$05$aiUXRPch7xASQqw47Eov0ej4r66MT2zEMtOPGKBcxNRu4LZhMVTo2', 468954),
(4, 'ver', 'legaspi', 'ver@g.com', '$2b$05$yTN5uYlAPUfq4eyj0ajpXuqTdgmkUu8cm8c09LWDu.K1nUdcLlayq', 29531321),
(5, 'shane', 'royena', 'royenashane@gmail.com', '$2b$05$JUXtFvaJ9wzhhL1KNYJbNeOw0MvgxCMIuLNlIK4wr3lfRkblDv1Ze', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `workspace`
--

CREATE TABLE `workspace` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amenities` varchar(255) NOT NULL,
  `location_no` varchar(255) NOT NULL,
  `location_street` varchar(255) NOT NULL,
  `location_barangay` varchar(255) NOT NULL,
  `location_city` varchar(255) NOT NULL,
  `location_province` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rate_type` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `isVerify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workspace`
--

INSERT INTO `workspace` (`space_id`, `user_id`, `picture`, `rate`, `amenities`, `location_no`, `location_street`, `location_barangay`, `location_city`, `location_province`, `type`, `rate_type`, `capacity`, `isVerify`) VALUES
(3, 5, '', '121', 'wefwf', '123', 'fdsdaf', 'fdsdfs', '', 'sfsfsdf', 'Corporate Office', '', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`space_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workspace`
--
ALTER TABLE `workspace`
  MODIFY `space_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workspace`
--
ALTER TABLE `workspace`
  ADD CONSTRAINT `workspace_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

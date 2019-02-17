-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2019 at 07:30 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

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
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `availability_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `mon-in` time NOT NULL,
  `mon-out` time NOT NULL,
  `tue-in` time NOT NULL,
  `tue_out` time NOT NULL,
  `wed-in` time NOT NULL,
  `wed-out` time NOT NULL,
  `thu-in` time NOT NULL,
  `thu-out` time NOT NULL,
  `fri-in` time NOT NULL,
  `fri-out` time NOT NULL,
  `sat-in` time NOT NULL,
  `sat-out` time NOT NULL,
  `sun-in` time NOT NULL,
  `sun-out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` (`feed_id`, `user_id`, `message`, `date_added`) VALUES
(3, 4, 'cute', '2018-12-13 14:54:57'),
(4, 4, 'ko', '2018-12-13 15:16:01'),
(5, 4, 'hehe', '2018-12-13 15:16:21'),
(6, 5, 'sasad', '2019-01-03 10:06:00'),
(7, 5, 'asdsad', '2019-01-03 11:29:01'),
(8, 5, 'looking workspace sa olongapo', '2019-01-08 17:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `from_user` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `body` varchar(255) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `isVerify` tinyint(1) NOT NULL DEFAULT '0',
  `workspace_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `desk_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workspace`
--

INSERT INTO `workspace` (`space_id`, `user_id`, `picture`, `rate`, `amenities`, `location_no`, `location_street`, `location_barangay`, `location_city`, `location_province`, `type`, `rate_type`, `capacity`, `isVerify`, `workspace_image`, `title`, `description`, `desk_quantity`) VALUES
(8, 5, '', '150', 'wifi, laptop', '61', 'Lower', 'Kalaklan', 'Olongapo City', 'Zambales', 'Coworking Space', 'day', 3, 1, 'http://localhost:3000/images/workspace/5a9dq7vsjpcp6w46.jpg', '', '', 1),
(12, 5, '', '12', 'qwq', '1', 'wq', 'wq', 'wq', 'qw', 'Startup Office', 'day', 1, 1, 'http://localhost:3000/images/workspace/5a9dq68gjqzdnugd.jpg', 'qwqwqwqw', 'qwew', 1),
(13, 5, '', '120', '24/7 Option, Café/ Restaurant, Catering Available, Coffee/ Tea/ Filtered Water', '12', 'Acacia', 'Gordon Heights', 'Olongapo City', 'Zambales', 'Startup Office', 'hour', 8, 1, 'http://localhost:3000/images/workspace/5a9dq7kwjr3ia58t.jpg', 'Elevator Factory', 'A huddle Room or focus Room or team Room. The huddle rooms are quiet and comfortable. They come with projection which you can hit wirelessly if you have an iOS device.', 5),
(14, 5, '', '60', 'Coffee/ Tea/ Filtered Water, Shared Kitchen, WiFi', '21', 'Gordon Ave', 'New Kalalake', 'Olongapo City', 'Zambales', 'Coworking Space', 'hour', 5, 1, 'http://localhost:3000/images/workspace/5a9dq6p4jr81yr1i.png', 'Outlet Coworking', 'Outlet Coworking is a community of multi-disciplinary innovative professionals in a beautiful shared work-space in the heart of Midtown Sacramento. Coworking, meeting rooms, desk space, private offices and event space. Convenient Location in Midtown. 2110', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`availability_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking id`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `to_user` (`to_user`),
  ADD KEY `from_user` (`from_user`),
  ADD KEY `workspace_id` (`workspace_id`);

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
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `availability_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workspace`
--
ALTER TABLE `workspace`
  MODIFY `space_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`to_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`from_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`space_id`);

--
-- Constraints for table `workspace`
--
ALTER TABLE `workspace`
  ADD CONSTRAINT `workspace_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

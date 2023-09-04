-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 07:35 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'shiva', 'shivaji'),
(2, 'sharat', 'sagar'),
(3, 'seema', 'seema');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `first_name`, `last_name`, `phone`, `city`, `state`, `pincode`) VALUES
(32199, 'uppi', 'nandu', 999555336666, 'jodhapur', 'rajastan', 577601);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
(7, 'SUPRITH', '123'),
(1, 'divya', '1234'),
(8, 'seema', '12345678'),
(6, 'seema', 'seema1234'),
(10, 'sharat', 'sharat'),
(3, 'sharat', 'sharath'),
(4, 'shiva', 'shivaji'),
(9, 'sindhu', 'sinshi123');

-- --------------------------------------------------------

--
-- Table structure for table `maintained_by`
--

CREATE TABLE `maintained_by` (
  `room_no` int(10) NOT NULL,
  `emp_id` varchar(20) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintained_by`
--

INSERT INTO `maintained_by` (`room_no`, `emp_id`, `emp_name`, `phone`) VALUES
(1, '1111', 'harsha', 9988776655);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `reservation_id` int(10) NOT NULL,
  `transaction_id` int(10) NOT NULL,
  `mode_of_payment` varchar(20) NOT NULL,
  `amount` int(10) NOT NULL,
  `date_of_payment` date NOT NULL,
  `booked_agent` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`reservation_id`, `transaction_id`, `mode_of_payment`, `amount`, `date_of_payment`, `booked_agent`) VALUES
(22222, 6546, 'Credit', 1000, '2018-11-27', 'naveen');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(20) NOT NULL,
  `cust_id` int(20) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `no_adults` int(10) NOT NULL,
  `reserv_date` date NOT NULL,
  `room_no` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `cust_id`, `check_in`, `check_out`, `status`, `no_adults`, `reserv_date`, `room_no`) VALUES
(22222, 32199, '1998-05-31', '2018-11-27', 'AC', 2, '2018-11-27', 9);

--
-- Triggers `reservation`
--
DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `reservation` FOR EACH ROW INSERT INTO res_trigger VALUES(OLD.reservation_id,OLD.cust_id,OLD.check_in,OLD.check_out,OLD.status,OLD.nO_adults,OLD.reserv_date,OLD.room_no,NOW(),'DELETED')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `reservation` FOR EACH ROW INSERT INTO res_trigger VALUES(new.reservation_id,new.cust_id,new.check_in,new.check_out,new.status,new.nO_adults,new.reserv_date,new.room_no,NOW(),'INSERTED')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `res_trigger`
--

CREATE TABLE `res_trigger` (
  `reservation_id` int(20) NOT NULL,
  `cust_id` int(20) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `no_adults` int(10) NOT NULL,
  `reserv_date` date NOT NULL,
  `room_no` int(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `action` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_trigger`
--

INSERT INTO `res_trigger` (`reservation_id`, `cust_id`, `check_in`, `check_out`, `status`, `no_adults`, `reserv_date`, `room_no`, `date_time`, `action`) VALUES
(11111, 12345, '2018-11-29', '2018-11-30', 'ac', 4, '2018-11-26', 3, '0000-00-00 00:00:00', 'INSERTED'),
(12345, 12345, '2018-11-25', '2018-11-30', 'genaral', 2, '2018-11-25', 2, '0000-00-00 00:00:00', 'DELETED'),
(12355, 98765, '2018-11-24', '2018-11-30', 'genaral', 4, '2018-11-27', 4, '2018-11-27 11:23:00', 'INSERTED'),
(22222, 32199, '1998-05-31', '2018-11-27', 'AC', 2, '2018-11-27', 9, '2018-11-27 11:32:14', 'INSERTED'),
(99999, 99999, '2018-11-27', '2018-11-30', 'genaral', 4, '2018-11-27', 4, '2018-11-27 11:56:56', 'INSERTED');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_no` int(10) NOT NULL,
  `room_type` varchar(20) NOT NULL,
  `no_of_adults` int(10) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_no`, `room_type`, `no_of_adults`, `amount`) VALUES
(1, 'GENARAL', 1, 1000),
(2, 'genaral', 2, 1500),
(3, 'ac', 4, 3000),
(4, 'genaral', 4, 3000),
(5, 'genaral', 1, 1000),
(6, 'AC', 1, 1500),
(7, 'GENARAL', 3, 2500),
(8, 'GENARAL', 3, 2000),
(9, 'AC', 2, 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`,`password`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`password`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `maintained_by`
--
ALTER TABLE `maintained_by`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `room_no` (`room_no`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `res_trigger`
--
ALTER TABLE `res_trigger`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maintained_by`
--
ALTER TABLE `maintained_by`
  ADD CONSTRAINT `maintained_by_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `rooms` (`room_no`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `rooms` (`room_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `res_trigger`
--
ALTER TABLE `res_trigger`
  ADD CONSTRAINT `res_trigger_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `rooms` (`room_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

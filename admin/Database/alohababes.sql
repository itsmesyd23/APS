-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2020 at 12:29 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alohababes`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `name`, `type`) VALUES
(1, 'admin', 'password', 'Human Resource', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_timein` time NOT NULL,
  `attendance_timeout` time NOT NULL,
  `attendance_hour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_attendance`
--

INSERT INTO `emp_attendance` (`attendance_id`, `employee_id`, `employee_name`, `attendance_date`, `attendance_timein`, `attendance_timeout`, `attendance_hour`) VALUES
(1, '251324524', 'Enciso, Sydney', '2020-02-07', '06:00:00', '18:50:56', 12),
(2, '251324524', 'Enciso, Sydney', '2020-02-08', '06:00:00', '18:50:56', 12),
(3, '251324524', 'Enciso, Sydney', '2020-02-09', '06:00:00', '18:50:56', 12),
(4, '251324524', 'Enciso, Sydney', '2020-02-10', '06:00:00', '18:50:56', 12);

-- --------------------------------------------------------

--
-- Table structure for table `emp_list`
--

CREATE TABLE `emp_list` (
  `emp_id` int(11) NOT NULL,
  `emp_card` varchar(100) NOT NULL,
  `emp_fname` varchar(100) NOT NULL,
  `emp_lname` varchar(100) NOT NULL,
  `emp_position` int(11) NOT NULL,
  `emp_address` varchar(100) NOT NULL,
  `emp_contact` varchar(100) NOT NULL,
  `emp_gender` varchar(100) NOT NULL,
  `emp_timein` time NOT NULL,
  `emp_timeout` time NOT NULL,
  `sched_id` int(11) NOT NULL,
  `emp_regdate` date NOT NULL,
  `emp_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_list`
--

INSERT INTO `emp_list` (`emp_id`, `emp_card`, `emp_fname`, `emp_lname`, `emp_position`, `emp_address`, `emp_contact`, `emp_gender`, `emp_timein`, `emp_timeout`, `sched_id`, `emp_regdate`, `emp_photo`) VALUES
(1, '251324524', 'Sydney', 'Enciso', 1, 'Marikina City', '09396341135', 'Male', '06:00:00', '17:00:00', 1, '2020-02-07', 'img/avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `emp_position`
--

CREATE TABLE `emp_position` (
  `pos_id` int(11) NOT NULL,
  `position_title` varchar(100) NOT NULL,
  `position_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_position`
--

INSERT INTO `emp_position` (`pos_id`, `position_title`, `position_rate`) VALUES
(1, 'Web Developer', 650),
(2, 'Jr. Web Developer', 450);

-- --------------------------------------------------------

--
-- Table structure for table `emp_sched`
--

CREATE TABLE `emp_sched` (
  `sched_id` int(11) NOT NULL,
  `sched_in` time NOT NULL,
  `sched_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_sched`
--

INSERT INTO `emp_sched` (`sched_id`, `sched_in`, `sched_out`) VALUES
(1, '06:00:00', '17:00:00'),
(2, '07:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `salary_deduct`
--

CREATE TABLE `salary_deduct` (
  `deduct_id` int(11) NOT NULL,
  `deduct_desc` varchar(100) NOT NULL,
  `deduct_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary_deduct`
--

INSERT INTO `salary_deduct` (`deduct_id`, `deduct_desc`, `deduct_amount`) VALUES
(1, 'SSS', 250),
(2, 'PhilHealth', 250),
(3, 'Pag-Ibig', 250);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `emp_list`
--
ALTER TABLE `emp_list`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `emp_position`
--
ALTER TABLE `emp_position`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `emp_sched`
--
ALTER TABLE `emp_sched`
  ADD PRIMARY KEY (`sched_id`);

--
-- Indexes for table `salary_deduct`
--
ALTER TABLE `salary_deduct`
  ADD PRIMARY KEY (`deduct_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emp_list`
--
ALTER TABLE `emp_list`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emp_position`
--
ALTER TABLE `emp_position`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_sched`
--
ALTER TABLE `emp_sched`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_deduct`
--
ALTER TABLE `salary_deduct`
  MODIFY `deduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

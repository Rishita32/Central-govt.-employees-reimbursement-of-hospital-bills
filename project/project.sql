-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2020 at 01:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `medicines_table`
--

CREATE TABLE `medicines_table` (
  `med_name` varchar(30) NOT NULL,
  `med_type` varchar(30) NOT NULL,
  `med_id` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicines_table`
--

INSERT INTO `medicines_table` (`med_name`, `med_type`, `med_id`, `cost`, `status`) VALUES
('Monobenzone Cream', 'Cream', 10, 299, 'Not Available'),
('Demelan Ointment', 'Cream', 12, 145, 'Available'),
('Fusidic Cream', 'Cream', 13, 75, 'Available'),
('Adapalene Gel ', 'Gel', 15, 259, 'Available'),
('Mederma Scar Gel', 'Gel', 16, 450, 'Available'),
('Hydroquinone , Mometasone ,Tre', 'Cream', 22, 175, 'Not Available'),
('Glutathione Injection', 'Injection', 32, 499, 'Available'),
('MEDICATIONAlpha Glucosidase In', 'Diabetic Tablet', 45, 599, 'Not Available');

-- --------------------------------------------------------

--
-- Table structure for table `memo_table`
--

CREATE TABLE `memo_table` (
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `cardtype` varchar(20) NOT NULL,
  `id` int(20) NOT NULL,
  `Relation` varchar(20) NOT NULL,
  `age` int(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `symptoms` text NOT NULL,
  `fstatus` varchar(20) DEFAULT 'pending',
  `form_type` varchar(20) DEFAULT 'memo',
  `submit_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `memo_table`
--

INSERT INTO `memo_table` (`firstname`, `lastname`, `cardtype`, `id`, `Relation`, `age`, `gender`, `symptoms`, `fstatus`, `form_type`, `submit_time`) VALUES
('Bapu', 'Mote', 'Retired', 4524, 'wife', 45, 'female', '', 'rejected', 'memo', '2020-05-19 01:35:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicines_table`
--
ALTER TABLE `medicines_table`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `memo_table`
--
ALTER TABLE `memo_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicines_table`
--
ALTER TABLE `medicines_table`
  MODIFY `med_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `memo_table`
--
ALTER TABLE `memo_table`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4525;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 03:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rushrider`
--

-- --------------------------------------------------------

--
-- Table structure for table `businessaccount`
--

CREATE TABLE `businessaccount` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `businessName` text NOT NULL,
  `businessAddress` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `businessaccount`
--

INSERT INTO `businessaccount` (`id`, `email`, `businessName`, `businessAddress`, `password`) VALUES
(1, 'adamufura98@gmail.com', 'Adamu Fura Inc.', 'Continental, Katsina', '$2y$10$69a1KLbS98jjPQvOSKzNhemR3euFiy27O0mg5P4je0SBDusThLSSu');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `phonenumber` varchar(200) NOT NULL,
  `for_email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `email`, `fullname`, `address`, `phonenumber`, `for_email`) VALUES
(1, 'fati@gmail.com', 'Fatima Suleiman', 'Sardauna Estate', '08123456789', 'adamufura98@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `businessEmail` varchar(200) NOT NULL,
  `rider_email` varchar(200) NOT NULL,
  `customerEmail` varchar(200) NOT NULL,
  `deliveryPrice` varchar(50) NOT NULL,
  `tracking_code` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'PENDING',
  `current_location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `title`, `description`, `businessEmail`, `rider_email`, `customerEmail`, `deliveryPrice`, `tracking_code`, `status`, `current_location`) VALUES
(1, 'Samosa', 'Samosa 100 PCS', 'adamufura98@gmail.com', 'shehu@gmail.com', 'fati@gmail.com', '', 'MZBXYQ', 'DELIVERED', 'Central Market'),
(2, 'Phone Charger', 'Single Iphone charger', 'adamufura98@gmail.com', 'shehu@gmail.com', 'fati@gmail.com', '', 'BWBPCS', 'DECLINED', ''),
(3, 'Drinks', 'Fearles 2 cartons', 'adamufura98@gmail.com', 'shehu@gmail.com', 'fati@gmail.com', '', '6DOPND', 'PENDING', 'central market'),
(4, 'Samosa', 'Samosa 1PCS', 'adamufura98@gmail.com', 'shehu@gmail.com', 'fati@gmail.com', '', 'V958GJ', 'ACCEPTED', '');

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `id` int(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rider`
--

INSERT INTO `rider` (`id`, `email`, `fullname`, `phonenumber`, `password`) VALUES
(1, 'shehu@gmail.com', 'Shehu Suleiman', '08123456789', '$2y$10$o5jPKP5vJ2JiHN8s6Dnl0Olb6tvFpEW6AnldLsTWfYE2zZEbWguGa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businessaccount`
--
ALTER TABLE `businessaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businessaccount`
--
ALTER TABLE `businessaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rider`
--
ALTER TABLE `rider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

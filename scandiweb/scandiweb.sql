-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 01:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scandiweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute_type`
--

CREATE TABLE `attribute_type` (
  `attribute_type_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `attribute_type_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute_type`
--

INSERT INTO `attribute_type` (`attribute_type_id`, `type_id`, `attribute_type_name`, `unit`) VALUES
(1, 1, 'Size', 'MB'),
(2, 2, 'Weight', 'KG'),
(3, 3, 'Dimension', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `sku` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(60,2) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`sku`, `product_name`, `price`, `type_id`) VALUES
('asdasd-444', 'Ahmed salah', '12.00', 2),
('asdasd-4445566', 'Ahmed salah', '12.00', 3),
('JVC200125', 'Acme DISC', '1.00', 1),
('JVC200126', 'Acme DISC', '1.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_value`
--

CREATE TABLE `product_value` (
  `sku` varchar(100) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_value`
--

INSERT INTO `product_value` (`sku`, `attribute_type_id`, `value`) VALUES
('JVC200125', 1, '700'),
('JVC200126', 1, '700'),
('asdasd-444', 2, '5000'),
('asdasd-4445566', 3, '11*11*11');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'DVD'),
(2, 'Furniture'),
(3, 'Book');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_type`
--
ALTER TABLE `attribute_type`
  ADD PRIMARY KEY (`attribute_type_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`sku`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `product_value`
--
ALTER TABLE `product_value`
  ADD KEY `attribute_type_id` (`attribute_type_id`),
  ADD KEY `sku` (`sku`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_type`
--
ALTER TABLE `attribute_type`
  ADD CONSTRAINT `attribute_type_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `product_value`
--
ALTER TABLE `product_value`
  ADD CONSTRAINT `product_value_ibfk_2` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`),
  ADD CONSTRAINT `product_value_ibfk_3` FOREIGN KEY (`sku`) REFERENCES `product` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

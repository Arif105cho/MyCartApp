-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 06:55 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mycartapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcart`
--

CREATE TABLE `addcart` (
  `idd` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `detail` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addcart`
--

INSERT INTO `addcart` (`idd`, `name`, `detail`, `price`) VALUES
(101, 'mobile', 'it has good cam', 12000),
(102, 'pillow', 'Soft comfertabl', 200),
(104, 'mobile', 'it has good cam', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cate_name`) VALUES
(2, 'folks'),
(101, 'Electronics'),
(102, 'grocery'),
(103, 'sports'),
(104, 'Clothes');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`) VALUES
(101, 'Electronic');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_specification` varchar(20) DEFAULT NULL,
  `pro_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_specification`, `pro_price`) VALUES
(101, 'Vivo', 'good camera', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `product_spac` varchar(30) DEFAULT NULL,
  `product_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productss`
--

CREATE TABLE `productss` (
  `id` int(11) NOT NULL,
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_detail` varchar(15) DEFAULT NULL,
  `pro_price` float DEFAULT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productss`
--

INSERT INTO `productss` (`id`, `pro_name`, `pro_detail`, `pro_price`, `cat_id`) VALUES
(101, 'mobile', 'it has good cam', 12000, 101),
(102, 'headphone', 'it has good cam', 1000, 101),
(103, 'charger', 'it has good cam', 200, 101),
(104, 'pillow', 'Soft comfertabl', 200, 102),
(105, 'carpet', 'long lasting', 500, 102),
(106, 'Maat', 'long felixible', 300, 102),
(107, 'Bat', 'be MS', 200, 103),
(108, 'VollyBall', 'perfct', 500, 103),
(109, 'Basket', 'good jump', 300, 103),
(110, 'Shirts', 'Smooth fit', 599, 104);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `idd` int(11) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `detail` varchar(12) DEFAULT NULL,
  `price` varchar(12) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bill` varchar(12) DEFAULT NULL,
  `date` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`idd`, `name`, `detail`, `price`, `quantity`, `bill`, `date`) VALUES
(101, 'pillow', 'soft and smo', '200', NULL, '200', '2022-5-27'),
(102, 'maat', 'long flexibl', '200', 2, '600', '2022-5-27');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(23) NOT NULL,
  `pass` varchar(23) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`user_id`, `username`, `pass`, `mobile`, `email`) VALUES
(101, 'admin', '123', '63965685177', 'admin@123'),
(104, 'aksha', '1234', '98897779', 'ashd@gmail'),
(0, 'arif', '123', '12423344', 'arif@123'),
(102, 'ashraf', '1234', '9568544478', 'ashraf@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addcart`
--
ALTER TABLE `addcart`
  ADD PRIMARY KEY (`idd`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `productss`
--
ALTER TABLE `productss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD KEY `idd` (`idd`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD UNIQUE KEY `user_id_3` (`user_id`),
  ADD UNIQUE KEY `user_id_4` (`user_id`),
  ADD UNIQUE KEY `user_id_5` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addcart`
--
ALTER TABLE `addcart`
  ADD CONSTRAINT `addcart_ibfk_1` FOREIGN KEY (`idd`) REFERENCES `userdetails` (`user_id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `cate_id` FOREIGN KEY (`id`) REFERENCES `product` (`pro_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `id` FOREIGN KEY (`pro_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`idd`) REFERENCES `addcart` (`idd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2023 at 05:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apna_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_tbl`
--

CREATE TABLE `cart_tbl` (
  `cart_id` int(11) NOT NULL,
  `Pid` int(11) NOT NULL,
  `Uid` int(11) NOT NULL,
  `PQTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_tbl`
--

INSERT INTO `cart_tbl` (`cart_id`, `Pid`, `Uid`, `PQTY`) VALUES
(1, 25, 1, 1),
(15, 25, 13, 1),
(17, 21, 1, 2),
(18, 24, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`cat_id`, `cat_name`) VALUES
(11, 'men'),
(12, 'Women'),
(13, 'sport shoes'),
(14, 'baby\'s wear');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_message`
--

CREATE TABLE `inquiry_message` (
  `message_id` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `product_id` int(11) NOT NULL,
  `p_name` text NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `size` varchar(100) NOT NULL,
  `cat_id` int(25) NOT NULL,
  `image_url` text NOT NULL,
  `brand` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`product_id`, `p_name`, `description`, `price`, `size`, `cat_id`, `image_url`, `brand`) VALUES
(21, 'shirt', 'this is the cotton shirt with flower print', 1546, 'xl', 11, 'f4.jpg', 'zara'),
(22, 'women top', 'this is top with blue colour', 2500, 'xl', 12, 'product-2.png', 'nike'),
(23, 'shoes', 'Green colour nike shoes', 15000, '8', 13, 'product-8.png', 'nike'),
(24, 'sandal ', 'Girls footwear hill ', 1540, '8', 12, 'product-9.png', 'zara'),
(25, 'Hoodie', 'Nike Men\'s Hoodie - Imported Hoodie Red', 2500, 'l', 11, 'product-1.png', 'nike'),
(26, 'sunglass', 'sunglass for man', 14500, 'free', 11, 'product-4.png', 'zara'),
(27, 'shirt', 'ppppp', 12, 'sa', 11, 'blog-2.png', 'sa');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `U_email` varchar(45) NOT NULL,
  `Phone_no` bigint(10) NOT NULL,
  `Password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `User_name`, `U_email`, `Phone_no`, `Password`) VALUES
(1, 'vaibhav', 'v@gmail.com', 8347355721, 'v@56340'),
(13, 'yash', 'y@gmail.com', 11564641, 'yash123'),
(14, 'yash', 'yash@gmail.com', 4567891230, 'yash123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `Pid` (`Pid`),
  ADD KEY `Uid` (`Uid`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `inquiry_message`
--
ALTER TABLE `inquiry_message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `inquiry_message`
--
ALTER TABLE `inquiry_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD CONSTRAINT `cart_tbl_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `product_tbl` (`product_id`),
  ADD CONSTRAINT `cart_tbl_ibfk_2` FOREIGN KEY (`Uid`) REFERENCES `user_details` (`user_id`);

--
-- Constraints for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD CONSTRAINT `product_tbl_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category_table` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

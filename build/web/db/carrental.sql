-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 12, 2024 at 06:07 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `bid` int(50) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `usermail` varchar(50) NOT NULL,
  `carname` varchar(50) NOT NULL,
  `dat` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  `amt` varchar(50) NOT NULL,
  `sta` varchar(50) NOT NULL,
  `tamt` varchar(50) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bid`, `cid`, `uid`, `usermail`, `carname`, `dat`, `day`, `amt`, `sta`, `tamt`) VALUES
(1, '3', 'sri', 'sri@gmail.com', 'hyundri', '2024-02-29', '5', '200', 'accepted', '1000'),
(2, '2', 'Gow', 'gow23@gmail.com', 'swift', '2024-02-22', '5', '500', 'paid', '2500'),
(3, '2', 'rindhi', 'rindhi@gmail.com', 'swift', '2024-02-10', '5', '2000', 'requested', '10000'),
(4, '4', 'risi', 'risi@gmail.com', 'audi', '2024-02-13', '2', '10000', 'paid', '20000'),
(6, '3', 'shri', 'shri@gmail.com', 'toyota', '2024-02-07', '2', '3000', 'accepted', '6000');

-- --------------------------------------------------------

--
-- Table structure for table `carreg`
--

CREATE TABLE IF NOT EXISTS `carreg` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `carname` varchar(50) NOT NULL,
  `carnum` varchar(50) NOT NULL,
  `carcap` varchar(50) NOT NULL,
  `fuel` varchar(50) NOT NULL,
  `rent` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `carreg`
--

INSERT INTO `carreg` (`id`, `carname`, `carnum`, `carcap`, `fuel`, `rent`) VALUES
(2, 'swift', '46563', '4', 'petrol', '500'),
(3, 'toyota', '456', '7', 'petrol', '3000'),
(4, 'audi', '45789', '4', 'petrol', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `usertbl`
--

CREATE TABLE IF NOT EXISTS `usertbl` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `U_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `usertbl`
--

INSERT INTO `usertbl` (`id`, `first_name`, `U_name`, `password`, `address`, `mobile`, `email_id`) VALUES
(1, 'rindhi', 'rindhi', '1234', 'mdu', '97676543424', 'risi@gmail.com'),
(2, 'risi', 'risi', '1234', 'cbe', '9767654342', 'risi@gmail.com'),
(3, 'shri', 'shri', '1234', 'mdu', '9767654342', 'shri@gmail.com');

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2024 at 09:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Set character set to utf8mb4
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Create `moviedatabase`
CREATE DATABASE IF NOT EXISTS `moviedatabase`;
USE `moviedatabase`;

-- Create `cast` table
CREATE TABLE `cast` (
  `castid` INT NOT NULL AUTO_INCREMENT,
  `movieid` INT NOT NULL,
  `starid` INT NOT NULL,
  `roleid` INT NOT NULL,
  `roledescription` VARCHAR(1000) NOT NULL,
  `castname` VARCHAR(50) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `datedeleted` DATETIME NOT NULL,
  `deletedby` INT NOT NULL,
  PRIMARY KEY (`castid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `directors` table
CREATE TABLE `directors` (
  `directorid` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `dateofbirth` DATE NOT NULL,
  `passportphoto` VARCHAR(1000) NOT NULL,
  `nationality` VARCHAR(50) NOT NULL,
  `addedby` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `deletedby` INT NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`directorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `genres` table
CREATE TABLE `genres` (
  `genreid` INT NOT NULL AUTO_INCREMENT,
  `genrename` VARCHAR(100) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `deletedby` INT NOT NULL,
  PRIMARY KEY (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `languages` table
CREATE TABLE `languages` (
  `languageid` INT NOT NULL AUTO_INCREMENT,
  `languagename` VARCHAR(20) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `deletedby` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`languageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `media` table
CREATE TABLE `media` (
  `mediaid` INT NOT NULL AUTO_INCREMENT,
  `medianame` VARCHAR(50) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `deletedby` INT NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`mediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movie` table
CREATE TABLE `movie` (
  `movieid` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `releasedate` DATETIME NOT NULL,
  `runningtime` TIME NOT NULL,
  `synopsis` VARCHAR(1000) NOT NULL,
  `cover` VARCHAR(100) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deletedby` TINYINT(1) NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `moviegenres` table
CREATE TABLE `moviegenres` (
  `movieid` INT NOT NULL,
  `genreid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `deletedby` INT NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  INDEX (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movielanguages` table
CREATE TABLE `movielanguages` (
  `movieid` INT NOT NULL,
  `languageid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `datedeleted` DATETIME NOT NULL,
  `deletedby` TINYINT(1) NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `moviemedia` table
CREATE TABLE `moviemedia` (
  `movieid` INT NOT NULL,
  `mediaid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `datedeleted` DATETIME NOT NULL,
  `deletedby` INT NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movieproductioncompanies` table
CREATE TABLE `movieproductioncompanies` (
  `movieid` INT NOT NULL,
  `companyid` INT NOT NULL,
  `userid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  `deletedby` TINYINT(1) NOT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movierating` table
CREATE TABLE `movierating` (
  `movieid` INT NOT NULL,
  `ratingid` INT NOT NULL,
  `userid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movieresolution` table
CREATE TABLE `movieresolution` (
  `movieid` INT NOT NULL,
  `resolutionid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `deletedby` INT NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `movieroles` table
CREATE TABLE `movieroles` (
  `roleid` INT NOT NULL AUTO_INCREMENT,
  `roledescription` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `objects` table
CREATE TABLE `objects` (
  `objectid` INT NOT NULL AUTO_INCREMENT,
  `objectname` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `privileges` table
CREATE TABLE `privileges` (
  `userid` INT NOT NULL,
  `objectid` INT NOT NULL,
  `valid` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `productioncompanies` table
CREATE TABLE `productioncompanies` (
  `companyid` INT NOT NULL AUTO_INCREMENT,
  `companyname` VARCHAR(200) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  `deletedby` INT NOT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `rating` table
CREATE TABLE `rating` (
  `ratingid` INT NOT NULL AUTO_INCREMENT,
  `rating` TINYINT(1) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `deletedby` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`ratingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `resolution` table
CREATE TABLE `resolution` (
  `resolutionid` INT NOT NULL AUTO_INCREMENT,
  `resolutiondescription` VARCHAR(50) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `addedby` INT NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `deletedby` TINYINT(1) NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`resolutionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `role` table
CREATE TABLE `role` (
  `roleid` INT NOT NULL AUTO_INCREMENT,
  `roledescription` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `star` table
CREATE TABLE `star` (
  `starid` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `dateofbirth` DATE NOT NULL,
  `passportphoto` VARCHAR(1000) NOT NULL,
  `nationality` VARCHAR(50) NOT NULL,
  `addedby` INT NOT NULL,
  `dateadded` DATETIME NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `deletedby` INT NOT NULL,
  `datedeleted` DATETIME NOT NULL,
  PRIMARY KEY (`starid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create `user` table
CREATE TABLE `user` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `dateadded` DATETIME NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Revert character set settings
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

COMMIT;

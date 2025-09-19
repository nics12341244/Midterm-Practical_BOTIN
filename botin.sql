-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2025 at 06:57 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `botin`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `employeeID` int NOT NULL,
  `date` date NOT NULL,
  `timeIn` time(6) NOT NULL,
  `timeOut` time(6) NOT NULL,
  `late` int NOT NULL,
  `overtime` int NOT NULL,
  KEY `employeeID` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`employeeID`, `date`, `timeIn`, `timeOut`, `late`, `overtime`) VALUES
(66677, '2025-09-18', '05:00:00.000000', '16:00:00.000000', 5, 3),
(1010, '2025-08-16', '07:00:00.000000', '18:00:00.000000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `departmentID` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `Dept Head` varchar(25) NOT NULL,
  `Office Location` varchar(25) NOT NULL,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`departmentID`),
  KEY `employeeID` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentID`, `name`, `lastname`, `Dept Head`, `Office Location`, `employeeID`) VALUES
(565, 'Nicole', 'Botin', 'Mr. Ted', 'Bacolod', 66677),
(576, 'James', 'Dean', 'Ms. Val', 'Iloilo', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employeeID` int NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeID`, `name`, `lastname`, `department`, `position`, `email`, `username`, `password`) VALUES
(1010, 'James', 'Dean', 'HR', 'Assistant HR', 'jamesdean@gmail.com', 'james777', 'pa55word'),
(66677, 'Nicole', 'Botin', 'IT', 'IT Technical Support', 'botinnicole@gmail.com', 'nics0103', 'botin333');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `payrollID` int NOT NULL,
  `employeeID` int NOT NULL,
  `salaryID` int NOT NULL,
  `payPeriodStart` date NOT NULL,
  `payPeriodEnd` date NOT NULL,
  `netPay` int NOT NULL,
  PRIMARY KEY (`payrollID`),
  KEY `employeeID` (`employeeID`),
  KEY `salaryID` (`salaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`payrollID`, `employeeID`, `salaryID`, `payPeriodStart`, `payPeriodEnd`, `netPay`) VALUES
(666, 66677, 111, '2025-09-09', '2025-09-18', 50000),
(777, 1010, 222, '2025-09-10', '2025-09-19', 45000);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
CREATE TABLE IF NOT EXISTS `salaries` (
  `salaryID` int NOT NULL,
  `Salary` int NOT NULL,
  `amount incentives` int NOT NULL,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`salaryID`),
  KEY `employeeID` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`salaryID`, `Salary`, `amount incentives`, `employeeID`) VALUES
(111, 45000, 5000, 66677),
(222, 55000, 3000, 1010);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `payroll_ibfk_2` FOREIGN KEY (`salaryID`) REFERENCES `salaries` (`salaryID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

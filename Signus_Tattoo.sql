-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2025 at 09:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Signus_Tattoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentID` varchar(10) NOT NULL,
  `ClientID` varchar(10) NOT NULL,
  `ArtistID` varchar(10) NOT NULL,
  `AppointmentDate` date NOT NULL,
  `TimeStart` time NOT NULL,
  `TimeEnd` time NOT NULL,
  `Status` varchar(20) NOT NULL,
  `TotalPrice` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentID`, `ClientID`, `ArtistID`, `AppointmentDate`, `TimeStart`, `TimeEnd`, `Status`, `TotalPrice`) VALUES
('AP001', 'C001', 'A001', '2025-11-02', '10:00:00', '11:30:00', 'Completed', 3000.00),
('AP002', 'C002', 'A001', '2025-11-05', '13:00:00', '14:00:00', 'Completed', 2500.00),
('AP003', 'C003', 'A001', '2025-11-07', '15:00:00', '16:30:00', 'Booked', 3200.00),
('AP004', 'C004', 'A001', '2025-11-08', '09:00:00', '10:00:00', 'No-Show', 2000.00),
('AP005', 'C005', 'A001', '2025-11-10', '11:00:00', '12:30:00', 'Completed', 4000.00),
('AP006', 'C006', 'A001', '2025-11-12', '14:00:00', '15:00:00', 'Cancelled', 2200.00),
('AP007', 'C007', 'A001', '2025-11-14', '16:00:00', '17:00:00', 'Booked', 3500.00),
('AP008', 'C008', 'A001', '2025-11-15', '09:30:00', '10:30:00', 'Completed', 3800.00),
('AP009', 'C009', 'A001', '2025-11-18', '10:00:00', '11:00:00', 'Completed', 2800.00),
('AP010', 'C010', 'A001', '2025-11-20', '13:30:00', '14:30:00', 'No-Show', 2300.00);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `ArtistID` varchar(10) NOT NULL,
  `ArtistName` varchar(100) NOT NULL,
  `AvailabilityStatus` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`ArtistID`, `ArtistName`, `AvailabilityStatus`) VALUES
('A001', 'Jopee Flores', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` varchar(10) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `FullName`, `ContactNumber`, `Email`, `DateCreated`) VALUES
('C001', 'Angelica Bermundo', '09172458123', 'angelica.b@example.com', '2025-10-29 08:14:11'),
('C002', 'Mikaela Rodriguez', '09215589046', 'mikaela.r@example.com', '2025-10-29 08:14:11'),
('C003', 'Trisha Castillo', '09087721345', 'trisha.c@example.com', '2025-10-29 08:14:11'),
('C004', 'Monica Candelaria', '09953346712', 'monica.c@example.com', '2025-10-29 08:14:11'),
('C005', 'Joshua Perez', '09184526678', 'josh.p@example.com', '2025-10-29 08:14:11'),
('C006', 'Maria Dizon', '09357765932', 'maria.d@example.com', '2025-10-29 08:14:11'),
('C007', 'Patrick Santos', '09208894133', 'patrick.s@example.com', '2025-10-29 08:14:11'),
('C008', 'Vanessa Cruz', '09912457810', 'vanessa.c@example.com', '2025-10-29 08:14:11'),
('C009', 'John Reyes', '09071124489', 'john.r@example.com', '2025-10-29 08:14:11'),
('C010', 'Charlene Garcia', '09226673201', 'charlene.g@example.com', '2025-10-29 08:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` varchar(10) NOT NULL,
  `AppointmentID` varchar(10) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `AppointmentID`, `Rating`, `Comments`) VALUES
('F001', 'AP001', 5, 'Great service, highly recommended!'),
('F002', 'AP002', 4, 'Nice work, will book again.'),
('F003', 'AP005', 5, 'Amazing detail and shading!'),
('F004', 'AP008', 4, 'Fast and clean results.'),
('F005', 'AP009', 5, 'Excellent experience!'),
('F006', 'AP003', NULL, 'Pending feedback'),
('F007', 'AP004', NULL, 'No feedback - no-show'),
('F008', 'AP006', NULL, 'No feedback - cancelled'),
('F009', 'AP007', NULL, 'Pending feedback'),
('F010', 'AP010', NULL, 'No feedback - no-show');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(10) NOT NULL,
  `AppointmentID` varchar(10) NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT 0.00,
  `PaymentStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `AppointmentID`, `PaymentDate`, `Amount`, `PaymentStatus`) VALUES
('P001', 'AP001', '2025-11-02', 3000.00, 'Paid'),
('P002', 'AP002', '2025-11-05', 2500.00, 'Paid'),
('P003', 'AP003', '2025-11-07', 1600.00, 'Pending'),
('P004', 'AP005', '2025-11-10', 4000.00, 'Paid'),
('P005', 'AP007', '2025-11-14', 1750.00, 'Partial'),
('P006', 'AP008', '2025-11-15', 3800.00, 'Paid'),
('P007', 'AP009', '2025-11-18', 2800.00, 'Paid'),
('P008', 'AP004', NULL, 0.00, 'Unpaid'),
('P009', 'AP006', NULL, 0.00, 'Refunded'),
('P010', 'AP010', NULL, 0.00, 'Unpaid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `ArtistID` (`ArtistID`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`ArtistID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `AppointmentID` (`AppointmentID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `AppointmentID` (`AppointmentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

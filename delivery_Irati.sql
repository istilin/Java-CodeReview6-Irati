-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 08, 2020 at 03:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MailDeliveryService_Irati`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address` char(100) NOT NULL,
  `zip` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address`, `zip`) VALUES
('Pintor Pablo Uranga Nº16 3ªB', '01008'),
('Pintor Ricardo Sacristan Nº32, 5ºizda', '01008'),
('Tarragona 8', '01010'),
('Friedrichstraße 41', '01067'),
('Hietzinger Hauptstraße 1A', '1130'),
('Thomas-Morus-Gasse 12/7/9', '1130'),
('Thomas-Morus-Gasse 14/6/4', '1130'),
('Thomas-Morus-Gasse 16/5/7', '1130'),
('Elterlainplatz 20/1', '1170'),
('Elterleinplatz 1/9a', '1170'),
('Elterleinplatz 12', '1170'),
('555 Xizang Middle Rd', '200000'),
('Castellon de la Plana 10, 3B', '38005'),
('Wagner-Jauregg-Weg 15', '4020');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city` char(50) NOT NULL,
  `county` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`, `county`) VALUES
('Vitoria-Gasteiz', 'Alava'),
('Dresden', 'Dresden'),
('Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
('Shanghai', 'Shanghai'),
('Linz', 'Upper Austria'),
('Vienna', 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `county` char(50) NOT NULL,
  `country` char(50) NOT NULL,
  `WorldZone` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`county`, `country`, `WorldZone`) VALUES
('Alava', 'Spain', 'EU'),
('Dresden', 'Germany', 'EU'),
('Santa Cruz de Tenerife', 'Spain', 'Rest of Europe'),
('Shanghai', 'China', 'Rest of World'),
('Upper Austria', 'Austria', 'Austria'),
('Vienna', 'Austria', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(6) NOT NULL,
  `customerFirstName` char(50) NOT NULL,
  `customerLastName` char(50) NOT NULL,
  `customerAddress` char(100) NOT NULL,
  `customerNumber` bigint(20) NOT NULL,
  `customerEmail` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `customerFirstName`, `customerLastName`, `customerAddress`, `customerNumber`, `customerEmail`) VALUES
(201, 'Irati', 'Larreina', 'Elterleinplatz 1/9a', 34645889129, 'ilarreina@gmail.com'),
(202, 'Max', 'Wolfy', 'Thomas-Morus-Gasse 16/5/7', 43892735482, 'maxwolfy@gmail.com'),
(203, 'Asia', 'Ohara', '555 Xizang Middle Rd', 989273492847, 'asiaohara@gmail.com'),
(204, 'Naza', 'Rena', 'Castellon de la Plana 10, 3B', 34689749354, 'nazarena@gmail.com'),
(205, 'Ama', 'Txo', 'Pintor Ricardo Sacristan Nº32, 5ºizda', 34652754818, 'amatxo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryProcess`
--

CREATE TABLE `deliveryProcess` (
  `processId` int(10) NOT NULL,
  `pickupTime` date NOT NULL,
  `deliveryTime` date NOT NULL,
  `pickupAddress` char(100) NOT NULL,
  `senderId` int(11) NOT NULL,
  `recipientId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `packageKindId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveryProcess`
--

INSERT INTO `deliveryProcess` (`processId`, `pickupTime`, `deliveryTime`, `pickupAddress`, `senderId`, `recipientId`, `employeeId`, `packageKindId`) VALUES
(501, '2020-03-02', '2020-04-13', 'Elterleinplatz 12', 201, 203, 303, 14),
(502, '2020-07-01', '2020-07-03', 'Thomas-Morus-Gasse 16/5/7', 202, 201, 301, 1),
(503, '2020-07-27', '2020-08-04', 'Wagner-Jauregg-Weg 15', 201, 205, 302, 5),
(504, '2020-03-01', '2020-03-06', 'Elterleinplatz 1/9a', 201, 204, 303, 9);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(6) NOT NULL,
  `employeeFirstName` char(50) NOT NULL,
  `employeeLastName` char(50) NOT NULL,
  `employeeAddress` char(100) NOT NULL,
  `employeePhone` bigint(15) NOT NULL,
  `employeeEmail` char(50) NOT NULL,
  `PostofficeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `employeeFirstName`, `employeeLastName`, `employeeAddress`, `employeePhone`, `employeeEmail`, `PostofficeId`) VALUES
(301, 'Simon', 'Blaha', 'Thomas-Morus-Gasse 12/7/9', 43939847298472, 'simonblaha@codefactory.edu', 101),
(302, 'Theodora', 'Patkos', 'Thomas-Morus-Gasse 14/6/4', 433984572040, 'theopatkos@codefactory.edu', 103),
(303, 'Marina', 'Tukalo', 'Elterlainplatz 20/1', 449823897429, 'marinatukalo@codefactory.edu', 102);

-- --------------------------------------------------------

--
-- Table structure for table `packageKind`
--

CREATE TABLE `packageKind` (
  `packageKindId` int(1) NOT NULL,
  `packageKindName` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packageKind`
--

INSERT INTO `packageKind` (`packageKindId`, `packageKindName`) VALUES
(3, 'Eco Letter L'),
(2, 'Eco Letter M'),
(1, 'Eco Letter S'),
(4, 'Eco Letter XL'),
(7, 'Eco Package L'),
(6, 'Eco Package M'),
(5, 'Eco Package S'),
(10, 'Priority Letter L'),
(9, 'Priority Letter M'),
(8, 'Priority Letter S'),
(11, 'Priority Letter XL'),
(14, 'Priority Package L'),
(13, 'Priority Package M'),
(12, 'Priority Package S');

-- --------------------------------------------------------

--
-- Table structure for table `Postoffice`
--

CREATE TABLE `Postoffice` (
  `PostofficeId` int(6) NOT NULL,
  `PostofficeAddress` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Postoffice`
--

INSERT INTO `Postoffice` (`PostofficeId`, `PostofficeAddress`) VALUES
(102, 'Elterleinplatz 12'),
(101, 'Hietzinger Hauptstraße 1A'),
(103, 'Wagner-Jauregg-Weg 15');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `packageKindId` int(11) NOT NULL,
  `worldZoneId` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`packageKindId`, `worldZoneId`, `price`) VALUES
(1, 1, 0.74),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1.5),
(2, 1, 1.3),
(2, 2, 1.75),
(2, 3, 1.75),
(2, 4, 2.55),
(3, 1, 4.1),
(3, 2, 5.6),
(3, 3, 5.6),
(3, 4, 10.25),
(4, 1, 4.1),
(4, 2, 9.9),
(4, 3, 9.9),
(4, 4, 21.8),
(5, 1, 4.3),
(5, 2, 13.93),
(5, 3, 13.93),
(5, 4, 21.93),
(6, 1, 6.01),
(6, 2, 15.28),
(6, 3, 15.28),
(6, 4, 30.43),
(7, 1, 8.81),
(7, 2, 19.28),
(7, 3, 19.28),
(7, 4, 51.03),
(8, 1, 0.85),
(8, 2, 1),
(8, 3, 1),
(8, 4, 1.8),
(9, 1, 1.35),
(9, 2, 2.1),
(9, 3, 2.1),
(9, 4, 2.75),
(10, 1, 2.75),
(10, 2, 7),
(10, 3, 7),
(10, 4, 12.35),
(11, 1, 4.3),
(11, 2, 12.9),
(11, 3, 12.9),
(11, 4, 24.2),
(12, 1, 4.3),
(12, 2, 14.28),
(12, 3, 14.28),
(12, 4, 22.23),
(13, 1, 11.99),
(13, 2, 19.28),
(13, 3, 19.28),
(13, 4, 49.98),
(14, 1, 14.99),
(14, 2, 29.28),
(14, 3, 29.28),
(14, 4, 102.53);

-- --------------------------------------------------------

--
-- Table structure for table `worldZones`
--

CREATE TABLE `worldZones` (
  `zoneId` int(11) NOT NULL,
  `deliveryKind` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worldZones`
--

INSERT INTO `worldZones` (`zoneId`, `deliveryKind`) VALUES
(1, 'Austria'),
(2, 'EU'),
(3, 'Rest of Europe'),
(4, 'Rest of World');

-- --------------------------------------------------------

--
-- Table structure for table `Zips`
--

CREATE TABLE `Zips` (
  `zip` char(10) NOT NULL,
  `city` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Zips`
--

INSERT INTO `Zips` (`zip`, `city`) VALUES
('01067', 'Dresden'),
('4020', 'Linz'),
('38005', 'Santa Cruz de Tenerife'),
('200000', 'Shanghai'),
('1130', 'Vienna'),
('1170', 'Vienna'),
('01008', 'Vitoria-Gasteiz'),
('01010', 'Vitoria-Gasteiz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city`),
  ADD KEY `county` (`county`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`county`),
  ADD KEY `country` (`country`),
  ADD KEY `WorldZone` (`WorldZone`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `customerAddress` (`customerAddress`);

--
-- Indexes for table `deliveryProcess`
--
ALTER TABLE `deliveryProcess`
  ADD PRIMARY KEY (`processId`),
  ADD KEY `pickupAddress` (`pickupAddress`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `recipientId` (`recipientId`),
  ADD KEY `postofficeId` (`employeeId`),
  ADD KEY `packageKindId` (`packageKindId`),
  ADD KEY `postofficeId_2` (`employeeId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD KEY `employeeAddress` (`employeeAddress`),
  ADD KEY `PostofficeId` (`PostofficeId`);

--
-- Indexes for table `packageKind`
--
ALTER TABLE `packageKind`
  ADD PRIMARY KEY (`packageKindId`),
  ADD UNIQUE KEY `packageKindName` (`packageKindName`);

--
-- Indexes for table `Postoffice`
--
ALTER TABLE `Postoffice`
  ADD PRIMARY KEY (`PostofficeId`),
  ADD KEY `PostofficeAddress` (`PostofficeAddress`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`packageKindId`,`worldZoneId`),
  ADD KEY `packageKindId` (`packageKindId`),
  ADD KEY `worldZoneId` (`worldZoneId`);

--
-- Indexes for table `worldZones`
--
ALTER TABLE `worldZones`
  ADD PRIMARY KEY (`zoneId`),
  ADD UNIQUE KEY `deliveryKind` (`deliveryKind`);

--
-- Indexes for table `Zips`
--
ALTER TABLE `Zips`
  ADD PRIMARY KEY (`zip`),
  ADD KEY `city` (`city`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `Zips` (`zip`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`county`) REFERENCES `counties` (`county`);

--
-- Constraints for table `counties`
--
ALTER TABLE `counties`
  ADD CONSTRAINT `counties_ibfk_1` FOREIGN KEY (`WorldZone`) REFERENCES `worldZones` (`deliveryKind`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customerAddress`) REFERENCES `addresses` (`address`);

--
-- Constraints for table `deliveryProcess`
--
ALTER TABLE `deliveryProcess`
  ADD CONSTRAINT `deliveryprocess_ibfk_3` FOREIGN KEY (`pickupAddress`) REFERENCES `addresses` (`address`),
  ADD CONSTRAINT `deliveryprocess_ibfk_6` FOREIGN KEY (`senderId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `deliveryprocess_ibfk_7` FOREIGN KEY (`recipientId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `deliveryprocess_ibfk_8` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `deliveryprocess_ibfk_9` FOREIGN KEY (`packageKindId`) REFERENCES `packageKind` (`packageKindId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employeeAddress`) REFERENCES `addresses` (`address`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`PostofficeId`) REFERENCES `Postoffice` (`PostofficeId`);

--
-- Constraints for table `Postoffice`
--
ALTER TABLE `Postoffice`
  ADD CONSTRAINT `postoffice_ibfk_1` FOREIGN KEY (`PostofficeAddress`) REFERENCES `addresses` (`address`);

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`worldZoneId`) REFERENCES `worldZones` (`zoneId`),
  ADD CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`packageKindId`) REFERENCES `packageKind` (`packageKindId`);

--
-- Constraints for table `Zips`
--
ALTER TABLE `Zips`
  ADD CONSTRAINT `zips_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`city`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

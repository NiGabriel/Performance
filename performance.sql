-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2022 at 07:42 PM
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
-- Database: `performance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `last_login` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `position`, `role`, `last_login`) VALUES
(2, 'nigibril1@gmail.com', '123', 'gabe', 'gg', 'Infrastructure_&_Network_sec', 'admin', 0),
(4, 'emeramcengirinshuti@gmail.com', 'N4sh4mw3@2020', 'Amante', 'Mia', 'IT&Admin', 'admin', 0),
(5, 'randa', 'N4sh4mw3@2020', 'CALLUM', 'ARERA', 'IT&Admin', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignedmilestone`
--

CREATE TABLE `assignedmilestone` (
  `goal` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `category` varchar(30) NOT NULL,
  `inputdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `weight` int(11) NOT NULL,
  `staffname` varchar(30) NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignedmilestone`
--

INSERT INTO `assignedmilestone` (`goal`, `description`, `target`, `category`, `inputdate`, `enddate`, `weight`, `staffname`, `departmentname`) VALUES
(2, 'DDDD', '76', 'KPI_assessment', '2022-09-03 10:26:00', '2022-09-30 10:26:00', 18, 'gabe_kk', 'HR&Administration'),
(3, 'wwwww', '12 to be achieved', 'KPI_assessment', '2022-09-01 17:32:00', '2022-09-30 17:37:00', 20, 'CALLUM_ARERA', 'Branches_coordination');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `catename` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `catename`) VALUES
(3, 'Competency_assessment'),
(1, 'KPI_assessment');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `depid` int(11) NOT NULL,
  `dename` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`depid`, `dename`) VALUES
(5, 'Branches_coordination'),
(1, 'Finance'),
(2, 'HR&Administration'),
(4, 'ICT'),
(6, 'Strategy,_M&E');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `staffname`, `description`, `date`, `departmentname`) VALUES
(1, 'Kim_Karoli', 'I achieved few targets because of rate purchasing products', '2022-08-26 12:57:30', 'HR&Administration');

-- --------------------------------------------------------

--
-- Table structure for table `human_resource`
--

CREATE TABLE `human_resource` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `human_resource`
--

INSERT INTO `human_resource` (`id`, `username`, `password`, `firstname`, `lastname`, `telephone`, `email`, `role`) VALUES
(1, 'hr', 'N4sh4mw3@2020', 'Sibomana', 'Theo', '0788976656', 'nigibril1@gmail.com', 'human_resource'),
(3, 'ramba', 'N4sh4mw3@2020', 'James', 'Harera', '0877778', 'james@gmail.com', 'human_resource');

-- --------------------------------------------------------

--
-- Table structure for table `jobposition`
--

CREATE TABLE `jobposition` (
  `pid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobposition`
--

INSERT INTO `jobposition` (`pid`, `pname`) VALUES
(5, 'Archiving_officer'),
(10, 'Business_advisor'),
(7, 'Financial_reporting'),
(9, 'Fund_recovery&Reconc.'),
(4, 'Human_resource'),
(3, 'Infrastructure_&_Network_sec'),
(11, 'Investment_Analyist'),
(12, 'IT&Admin'),
(14, 'Legal'),
(13, 'Monitoring&Evaluation'),
(8, 'Software_development');

-- --------------------------------------------------------

--
-- Table structure for table `milestone`
--

CREATE TABLE `milestone` (
  `goal` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `category` varchar(30) NOT NULL,
  `inputdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `weight` int(11) NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `milestone`
--

INSERT INTO `milestone` (`goal`, `description`, `target`, `category`, `inputdate`, `enddate`, `weight`, `departmentname`) VALUES
(2, 'DDDD', '76', 'KPI_assessment', '2022-09-03 10:26:00', '2022-09-30 10:26:00', 18, 'HR&Administration'),
(3, 'wwwww', '12 to be achieved', 'KPI_assessment', '2022-09-01 17:32:00', '2022-09-30 17:37:00', 20, 'Branches_coordination');

-- --------------------------------------------------------

--
-- Table structure for table `pendingmilestone`
--

CREATE TABLE `pendingmilestone` (
  `goal` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `actualachieved` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `category` varchar(30) NOT NULL,
  `inputdate` datetime NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `goal` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `actualachieved` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `midyearrating` double NOT NULL,
  `endyearrating` double NOT NULL,
  `averageannualscore` double NOT NULL,
  `totalpoint` double NOT NULL,
  `category` varchar(30) NOT NULL,
  `inputdate` datetime NOT NULL,
  `rankdate` datetime NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `departmentname` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `rolename` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `rolename`) VALUES
(1, 'admin'),
(4, 'human_resource'),
(2, 'staff'),
(3, 'supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `departmentname` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `firstname`, `lastname`, `position`, `departmentname`, `telephone`, `email`, `role`) VALUES
(2, 'staff@gmail.com', 'N4sh4mw3@2020', 'Kim', 'Karoli', 'Archiving_officer', 'Strategy,_M&E', '0788976656', 'staff@gmail.com', 'staff'),
(4, 'amante', 'N4sh4mw3@2020', 'Eme', 'Nishimwe', 'Archiving_officer', 'Branches_coordination', '0788810828', 'nigibril1@gmail.com', 'staff'),
(5, 'gabe', '123', 'gabe', 'gari', 'Business_advisor', 'HR&Administration', '0788976656', 'gabe@gmail.com', 'staff'),
(6, 'veve', '123', 'gabe', 'kk', 'Fund_recovery&Reconc.', 'HR&Administration', '0788976656', 'veve@gmail.com', 'staff'),
(7, 'ven', '123', 'Bizii', 'Zephanie', 'IT&Admin', 'HR&Administration', '0782336578', 'sss@gg.bb', 'admin'),
(8, 'randa', 'N4sh4mw3@2020', 'CALLUM', 'ARERA', 'Legal', 'Branches_coordination', '0782225797', 'randa@gmail.com', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `departmentname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`id`, `username`, `password`, `firstname`, `lastname`, `position`, `telephone`, `email`, `role`, `departmentname`) VALUES
(4, 'supervisor', 'N4sh4mw3@2020', 'Venuste', 'Ven', 'Human_resource', '0788976657', 'nigibril1@gmail.com', 'supervisor', 'HR&Administration'),
(6, 'veve', '123', 'Venuste', 'James', 'IT&Admin', '0788871075', 'venutia4@gmail.com', 'supervisor', 'Branches_coordination');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role` (`role`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `assignedmilestone`
--
ALTER TABLE `assignedmilestone`
  ADD KEY `category` (`category`),
  ADD KEY `departmentname` (`departmentname`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catename` (`catename`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depid`) USING BTREE,
  ADD UNIQUE KEY `dename` (`dename`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `departmentname` (`departmentname`);

--
-- Indexes for table `human_resource`
--
ALTER TABLE `human_resource`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`telephone`,`email`),
  ADD KEY `human_resource_ibfk_1` (`role`);

--
-- Indexes for table `jobposition`
--
ALTER TABLE `jobposition`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pname` (`pname`);

--
-- Indexes for table `milestone`
--
ALTER TABLE `milestone`
  ADD PRIMARY KEY (`goal`),
  ADD UNIQUE KEY `description` (`description`,`target`),
  ADD KEY `milestone_ibfk_1` (`departmentname`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `pendingmilestone`
--
ALTER TABLE `pendingmilestone`
  ADD UNIQUE KEY `actualachieved` (`actualachieved`),
  ADD KEY `category` (`category`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `description` (`description`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD KEY `actualachieved` (`actualachieved`),
  ADD KEY `description` (`description`),
  ADD KEY `category` (`category`),
  ADD KEY `departmentname` (`departmentname`),
  ADD KEY `goal` (`goal`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rolename` (`rolename`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`telephone`,`email`),
  ADD KEY `departmentid` (`departmentname`),
  ADD KEY `position` (`position`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `position` (`position`),
  ADD KEY `role` (`role`),
  ADD KEY `departmentname` (`departmentname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `depid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `human_resource`
--
ALTER TABLE `human_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobposition`
--
ALTER TABLE `jobposition`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `milestone`
--
ALTER TABLE `milestone`
  MODIFY `goal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`rolename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`position`) REFERENCES `jobposition` (`pname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignedmilestone`
--
ALTER TABLE `assignedmilestone`
  ADD CONSTRAINT `assignedmilestone_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`catename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignedmilestone_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `human_resource`
--
ALTER TABLE `human_resource`
  ADD CONSTRAINT `human_resource_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`rolename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `milestone`
--
ALTER TABLE `milestone`
  ADD CONSTRAINT `milestone_ibfk_1` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `milestone_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`catename`);

--
-- Constraints for table `pendingmilestone`
--
ALTER TABLE `pendingmilestone`
  ADD CONSTRAINT `pendingmilestone_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`catename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendingmilestone_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`catename`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`position`) REFERENCES `jobposition` (`pname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`role`) REFERENCES `role` (`rolename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`position`) REFERENCES `jobposition` (`pname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supervisor_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`rolename`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supervisor_ibfk_3` FOREIGN KEY (`departmentname`) REFERENCES `department` (`dename`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

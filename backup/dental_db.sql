-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2017 at 02:49 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dental_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `curesubject_history_tb`
--

CREATE TABLE `curesubject_history_tb` (
  `id` int(11) NOT NULL,
  `curesubject_id` int(11) NOT NULL,
  `treatment_history_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `curesubject_history_tb`
--

INSERT INTO `curesubject_history_tb` (`id`, `curesubject_id`, `treatment_history_id`) VALUES
(1, 2, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `curesubject_tb`
--

CREATE TABLE `curesubject_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `max` int(11) NOT NULL,
  `min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `curesubject_tb`
--

INSERT INTO `curesubject_tb` (`id`, `name`, `max`, `min`) VALUES
(2, 'ฝ่าฟันครุต', 5000, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `employee_tb`
--

CREATE TABLE `employee_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `ssn` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `systemaccount` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_tb`
--

INSERT INTO `employee_tb` (`id`, `name`, `lastname`, `phone`, `email`, `status`, `address`, `username`, `password`, `salary`, `ssn`, `systemaccount`) VALUES
(1, 'มานพ', 'พิมพการ', '882603692', '0kaiyats0@gmail.com', 'แพทย์', '16 ซอย10 ข อ.เมือง จ.เชียงใหม่, 5000', 'test', 'test', 30000, '1500000000000', '1,2,3,4,7,8,'),
(2, 'ชาญชัย', 'เชี่ยวชาญ', '0831546775', '', 'แพทย์', '', 'test2', 'test2', 30000, '1523345454545', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicrecord_tb`
--

CREATE TABLE `medicrecord_tb` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `HN` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicrecord_tb`
--

INSERT INTO `medicrecord_tb` (`id`, `date`, `HN`) VALUES
(1, '0000-00-00', '1'),
(7, '2016-12-22', '2');

-- --------------------------------------------------------

--
-- Table structure for table `medicsupply_history_tb`
--

CREATE TABLE `medicsupply_history_tb` (
  `id` int(11) NOT NULL,
  `treatment_history_id` int(11) NOT NULL,
  `medicsupply_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicsupply_history_tb`
--

INSERT INTO `medicsupply_history_tb` (`id`, `treatment_history_id`, `medicsupply_id`, `amount`) VALUES
(1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `medicsupply_record_tb`
--

CREATE TABLE `medicsupply_record_tb` (
  `id` int(11) NOT NULL,
  `medicsupply_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicsupply_record_tb`
--

INSERT INTO `medicsupply_record_tb` (`id`, `medicsupply_id`, `employee_id`, `date`, `amount`) VALUES
(2, -1, 0, '2017-01-08', 100);

-- --------------------------------------------------------

--
-- Table structure for table `medicsupply_tb`
--

CREATE TABLE `medicsupply_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `redate` date NOT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sh_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicsupply_tb`
--

INSERT INTO `medicsupply_tb` (`id`, `name`, `detail`, `amount`, `redate`, `unit`, `sh_amount`) VALUES
(1, 'ยาเคลือบฟัน', 'ยา', 90, '2017-01-13', 'หลอด', 50);

-- --------------------------------------------------------

--
-- Table structure for table `patient_tb`
--

CREATE TABLE `patient_tb` (
  `HN` int(11) NOT NULL,
  `SSN` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `bloodtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `marry` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `national` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `religion` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `emer1_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `emer1_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `emer2_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `emer2_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `addr_num` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `addr_swine` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `addr_district` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `addr_canton` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `addr_province` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `addr_work` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `medical_history` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `disease` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `treatment` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `addr_road` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_tb`
--

INSERT INTO `patient_tb` (`HN`, `SSN`, `title`, `gender`, `name`, `lastname`, `birthday`, `age`, `bloodtype`, `marry`, `national`, `religion`, `phone`, `email`, `emer1_name`, `emer1_phone`, `emer2_name`, `emer2_phone`, `addr_num`, `addr_swine`, `addr_district`, `addr_canton`, `addr_province`, `zipcode`, `job`, `addr_work`, `medical_history`, `disease`, `treatment`, `addr_road`) VALUES
(1, '1509908456215', 'นางสาว', 'หญิง', 'นาริกา', 'บรรดาลศักดิ์', '2000-09-25', 12, 'AB', 'สมรส', 'ไทย', 'คริสต์', '088263336', 'asdsad@sd.com', 'กับกาน กากา', '0122356548', 'กานกับ กากา', '0122356123', '1', '20', 'ป่าซาง', 'เมือง', 'อุดร', '51232', 'นักศึกษา', 'ม.อุดร', 'แพ้ยาซิลิฟิลีน', 'หอบหืด', 'ประกันสุขภาพ\0', 'เปี่ยงดล'),
(2, '1242424242224', 'นาย', 'ชาย', 'กรการ', 'กิจการ', '0000-00-00', 0, 'A', 'โสด', '', 'พุทธ', '088156565', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'เงินสด', ''),
(3, '1515115155555', 'นาย', 'ชาย', 'สมศรี', 'สมสม', '2016-12-30', 0, 'A', 'โสด', '', 'พุทธ', '0888888888', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'เงินสด', '');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_tb`
--

CREATE TABLE `schedule_tb` (
  `schedule_id` int(11) NOT NULL,
  `detail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `end` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `HN` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schedule_tb`
--

INSERT INTO `schedule_tb` (`schedule_id`, `detail`, `start`, `end`, `date`, `HN`) VALUES
(1, 'ฝ่าฟันครุท', '8.15', '12.00', '2017-01-08', '1'),
(3, 'ถอนฟัน2', '9.30', '10.00', '2017-01-06', '1'),
(4, 'ขูดหินปูน', '10.00', '11.30', '2016-12-20', '2'),
(5, 'ถอนฟัน', '10.00', '13.00', '2016-12-23', '1'),
(6, 'ถอนฟัน', '8.00', '13.00', '2016-12-22', '1'),
(7, 'aaa', '11.00', '11.30', '2016-12-21', '1'),
(8, 'ถอนฟัน', '11.00', '12.00', '2016-12-31', '2');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_history_tb`
--

CREATE TABLE `treatment_history_tb` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `payment` int(20) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_earn` int(30) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `treatment_history_tb`
--

INSERT INTO `treatment_history_tb` (`id`, `date`, `payment`, `employee_id`, `employee_earn`, `patient_id`) VALUES
(1, '2017-01-01', 3000, 1, 1500, 1),
(2, '2017-01-01', 3000, 2, 2000, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curesubject_history_tb`
--
ALTER TABLE `curesubject_history_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curesubject_tb`
--
ALTER TABLE `curesubject_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_tb`
--
ALTER TABLE `employee_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicrecord_tb`
--
ALTER TABLE `medicrecord_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicsupply_history_tb`
--
ALTER TABLE `medicsupply_history_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicsupply_record_tb`
--
ALTER TABLE `medicsupply_record_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicsupply_tb`
--
ALTER TABLE `medicsupply_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_tb`
--
ALTER TABLE `patient_tb`
  ADD PRIMARY KEY (`HN`),
  ADD UNIQUE KEY `HN` (`HN`);

--
-- Indexes for table `schedule_tb`
--
ALTER TABLE `schedule_tb`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `treatment_history_tb`
--
ALTER TABLE `treatment_history_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curesubject_history_tb`
--
ALTER TABLE `curesubject_history_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medicrecord_tb`
--
ALTER TABLE `medicrecord_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `medicsupply_history_tb`
--
ALTER TABLE `medicsupply_history_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `medicsupply_record_tb`
--
ALTER TABLE `medicsupply_record_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medicsupply_tb`
--
ALTER TABLE `medicsupply_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `patient_tb`
--
ALTER TABLE `patient_tb`
  MODIFY `HN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `schedule_tb`
--
ALTER TABLE `schedule_tb`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

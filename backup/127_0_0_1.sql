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
CREATE DATABASE IF NOT EXISTS `dental_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `dental_db`;

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;--
-- Database: `kaburng_web`
--
CREATE DATABASE IF NOT EXISTS `kaburng_web` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kaburng_web`;

-- --------------------------------------------------------

--
-- Table structure for table `about_txt`
--

CREATE TABLE `about_txt` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `detail` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `about_txt`
--

INSERT INTO `about_txt` (`id`, `topic`, `detail`) VALUES
(1, 'กระเบื้องว่าวโบราณบ้านอุ๊ยคำ', '   กระเบื้องว่าวโบราณบ้านอุ๊ยคำ ขอเชิญชวนท่าน ร่วมอนุรักษ์ศิลปะ หัตถกรรม เอกลักษณ์ของชาวล้านนา กระเบื้องว่าวโบราณบ้านอุ๊ยคำเป็นงานหัตถกรรม ของบรรพบุรุษ ที่ได้มอบงานศิลปะหัตถกรรมฝีมืออันมีคุณค่าทางจิตใจ ให้ลูกหลานได้สืบทอด เป็นมรดกอันทรงคุณค่า ไม่ให้สูญหายไปจาก แผ่นดินล้านนาและแผ่นดินไทย .  '),
(2, 'การผลิต', '  กระเบื้องว่าวโบราณบ้านอุ๊ยคำ ได้ผลิดกระเบื้อง หลากหลายรูปแบบ มีทั้กระเบื้องว่าวเล็ก,ว่าวใหญ่,ว่าวปลายตัด ลายน้ำไหล,ลายเกล็ดปลา,กระเบื้องร่องเมือง และใหม่ล่าสุด ทางโรงงานได้ผลิดกระเบื้องลายไม้ ซึ่งเราผลิดมาเพื่อใช้แทนกระเบื้องแป้นเกล็ด ซึ่งบระเบื้องแป้นเกล็ดทำมาจากไม้ซึ่งนานๆเข้า ก็จะผุพังไปกาลเวลา กระเบื้องลายไม้ของเราทำจากปูนซีเมนต์พร้อมลงสีและพิมลายไม้ลงไปในตัวกระเบื้อง เรียนแบบกระเบื้องแป้นเกล็ดได้10000% '),
(3, 'ใช้วัสดุที่มีคุณภาพ', '  กระเบื้องว่าวโบราณบ้านอุ๊ยคำ ใช้วัสดุที่มีคุณภาพ มีความแข็งแรงทนทาน ทนต่อทุกสภาพอากาศและไม่ทำลายสิ่งแวดล้อม เราผสมประสานกับเทคโนโลยีสมัยใหม่ แต่คงความเป็นเอกลักษณ์ ของชาวล้านนา มีโรงงานผลิดได้มาตฐานและยินดีให้คำปรึกษา เรื่องกระเบื้อง โดยผู้เชี่ยวชาญ ด้านกระเบื้องหางว่าว ปัญหาเรื่องบ้านจะหมดไปถ้าท่านวางใจให้กระเบื้องว่าวโบราณบ้านอุ๊ยคำได้มีส่วนร่วมเป็นส่วนหนึ่ง ของที่อยู่อาศัยของบ้านคุณ ตลอดไป สร้างบ้านครั้งใด นึกถึงเรา กระเบื้องว่าวโบราณบ้านอุ๊ยคำ.'),
(4, 'ทางร้านรับทำกระเบิ้อง', '');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge`
--

CREATE TABLE `knowledge` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `detail` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `knowledge`
--

INSERT INTO `knowledge` (`id`, `name`, `detail`) VALUES
('k1', 'กระเบื้องว่าวบ้านอุ๊ยคำ คือ ?', '<p>เนื้อหาข</p>\r\n\r\n<p>dfdsf</p>\r\n\r\n<p>sdfsdf</p>\r\n\r\n<p>sdf</p>\r\n'),
('k2', 'การเลือกซื้อวัสดุมุงหลังคา มีอะไรที่ต้องคำนึงถึงบ้าน', 'เนื้อหา');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `detail` varchar(300) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `detail`, `type`) VALUES
('1p', 'กระเบื้อง011', 'เนื้อหากระเบื้องงงงงงงงง ', 0),
('2p', 'กระเบื้อง02', 'เนื้อหากระเบื้อง', 0),
('3p', 'กระเบื้อง03', 'เนื้อหากระเบื้อง', 0),
('4p', 'กระเบื้อง04', 'เนื้อหากระเบื้อง', 0),
('5p', 'GG', 'GG', 0),
('6p', 'กระเบื้องเหลือว', 'สวยมักๆ', 0),
('7p', 'dfss', 'dssd ', 0),
('8p', 'sdsd', 'sds', 0),
('9p', 'FFFF', 'FFFFF', 0),
('10p', 'dfd', 'dfdf', 0),
('11p', 'chan', ' chan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_kaburng`
--

CREATE TABLE `product_kaburng` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `pa_size` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `color_price` varchar(200) NOT NULL,
  `wood_price` varchar(200) NOT NULL,
  `krube_price` varchar(200) NOT NULL,
  `toromal_price` varchar(200) NOT NULL,
  `size` varchar(200) NOT NULL,
  `first_pa_size` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_kaburng`
--

INSERT INTO `product_kaburng` (`id`, `name`, `pa_size`, `price`, `color_price`, `wood_price`, `krube_price`, `toromal_price`, `size`, `first_pa_size`, `weight`, `color`) VALUES
(1, 'กระเบื้องว่าวใหญ่', '25x36x1 ระยะแป 15 ซม.', '9 บาท', '12 บาท', '15 บาท', '17 บาท', '26 บาท', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..'),
(2, 'กระเบื้องว่าวเล็ก', '17x29x1 ระยะแป 10 ซ.ม.', '5 บาท', '7 บาท', '8 บาท', '10 บาท', '56 แผ่น', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..'),
(3, 'กระเบื้องว่าวปลายตัด', '18x29x1 ระยะแป 20 ซ.ม', '6 บาท', '8 บาท', '9 บาท', '11 บาท', '56 แผ่น', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..'),
(4, 'กระเบื้องว่าวปลายโค้ง', '18x36x1 ระยะแป 16 ซ.ม', '9 บาท', '12 บาท', '13 บาท', '15 บาท', '38 แผ่น', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..'),
(5, 'กระเบื้องร่องเมืองใหญ่', '24x39x1 ระยะแป 30 ซ.ม', '9 บาท', '12 บาท', '-', '-', '20 ต่อ ตรม.', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..'),
(6, 'กระเบื้องร่องเมืองเล็ก', '20x30x1 ระยะแป 24 ซ.ม', '7 บาท', '9 บาท', '-', '-', '25 ต่อ ตรม.', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..', 'รอข้อมูล..');

-- --------------------------------------------------------

--
-- Table structure for table `welcome_txt`
--

CREATE TABLE `welcome_txt` (
  `id` int(11) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `detail` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `welcome_txt`
--

INSERT INTO `welcome_txt` (`id`, `topic`, `detail`) VALUES
(1, 'กระเบื้องว่าวโบราณบ้านอุ๊ยคำ', '   กระเบื้องว่าวโบราณบ้านอุ๊ยคำ ขอเชิญชวนท่าน ร่วมอนุรักษ์ศิลปะ หัตถกรรม เอกลักษณ์ของชาวล้านนา กระเบื้องว่าวโบราณบ้านอุ๊ยคำเป็นงานหัตถกรรม ของบรรพบุรุษ ที่ได้มอบงานศิลปะหัตถกรรมฝีมืออันมีคุณค่าทางจิตใจ ให้ลูกหลานได้สืบทอด เป็นมรดกอันทรงคุณค่า ไม่ให้สูญหายไปจาก แผ่นดินล้านนาและแผ่นดินไทย .  ');
--
-- Database: `kyp`
--
CREATE DATABASE IF NOT EXISTS `kyp` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `kyp`;

-- --------------------------------------------------------

--
-- Table structure for table `booking_table`
--

CREATE TABLE `booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `R1_status` int(11) NOT NULL,
  `R1_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R1_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R1_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R2_status` int(11) NOT NULL,
  `R2_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R2_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R2_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R3_status` int(11) NOT NULL,
  `R3_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R3_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R3_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R4_status` int(11) NOT NULL,
  `R4_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R4_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R4_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R5_status` int(11) NOT NULL,
  `R5_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R5_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R5_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R6_status` int(11) NOT NULL,
  `R6_booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R6_booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `R6_booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_table`
--

INSERT INTO `booking_table` (`seat_number`, `R1_status`, `R1_booking_name`, `R1_booking_email`, `R1_booking_phone`, `R2_status`, `R2_booking_name`, `R2_booking_email`, `R2_booking_phone`, `R3_status`, `R3_booking_name`, `R3_booking_email`, `R3_booking_phone`, `R4_status`, `R4_booking_name`, `R4_booking_email`, `R4_booking_phone`, `R5_status`, `R5_booking_name`, `R5_booking_email`, `R5_booking_phone`, `R6_status`, `R6_booking_name`, `R6_booking_email`, `R6_booking_phone`) VALUES
('1', 0, 'unbooking', 'unbooking', 'unbooking', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', ''),
('2', 0, 'unbooking', 'unbooking', 'unbooking', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', ''),
('3', 0, 'unbooking', 'unbooking', 'unbooking', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r1_booking_table`
--

CREATE TABLE `r1_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r1_booking_table`
--

INSERT INTO `r1_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 2),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'หก', 'หก', 'หก', 1),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'หก', 'หก', 'หก', 1),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'หก', 'หก', 'หก', 1),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'หก', 'หก', 'หก', 1),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `r2_booking_table`
--

CREATE TABLE `r2_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r2_booking_table`
--

INSERT INTO `r2_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 0),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'unbooking', 'unbooking', 'unbooking', 0),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'unbooking', 'unbooking', 'unbooking', 0),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'unbooking', 'unbooking', 'unbooking', 0),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'unbooking', 'unbooking', 'unbooking', 0),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `r3_booking_table`
--

CREATE TABLE `r3_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r3_booking_table`
--

INSERT INTO `r3_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 0),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'unbooking', 'unbooking', 'unbooking', 0),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'unbooking', 'unbooking', 'unbooking', 0),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'unbooking', 'unbooking', 'unbooking', 0),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'unbooking', 'unbooking', 'unbooking', 0),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `r4_booking_table`
--

CREATE TABLE `r4_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r4_booking_table`
--

INSERT INTO `r4_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 0),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'unbooking', 'unbooking', 'unbooking', 0),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'unbooking', 'unbooking', 'unbooking', 0),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'unbooking', 'unbooking', 'unbooking', 0),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'unbooking', 'unbooking', 'unbooking', 0),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `r5_booking_table`
--

CREATE TABLE `r5_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r5_booking_table`
--

INSERT INTO `r5_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 0),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'unbooking', 'unbooking', 'unbooking', 0),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'unbooking', 'unbooking', 'unbooking', 0),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'unbooking', 'unbooking', 'unbooking', 0),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'unbooking', 'unbooking', 'unbooking', 0),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `r6_booking_table`
--

CREATE TABLE `r6_booking_table` (
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `booking_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `booking_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `r6_booking_table`
--

INSERT INTO `r6_booking_table` (`seat_number`, `booking_name`, `booking_email`, `booking_phone`, `status`) VALUES
('A01A', 'unbooking', 'unbooking', 'unbooking', 0),
('C01A', 'unbooking', 'unbooking', 'unbooking', 0),
('A01B', 'unbooking', 'unbooking', 'unbooking', 0),
('C01B', 'unbooking', 'unbooking', 'unbooking', 0),
('A01C', 'unbooking', 'unbooking', 'unbooking', 0),
('C01C', 'unbooking', 'unbooking', 'unbooking', 0),
('A01D', 'unbooking', 'unbooking', 'unbooking', 0),
('C01D', 'unbooking', 'unbooking', 'unbooking', 0),
('A01E', 'unbooking', 'unbooking', 'unbooking', 0),
('C01E', 'unbooking', 'unbooking', 'unbooking', 0),
('A01F', 'unbooking', 'unbooking', 'unbooking', 0),
('C01F', 'unbooking', 'unbooking', 'unbooking', 0),
('A01G', 'unbooking', 'unbooking', 'unbooking', 0),
('C01G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02A', 'unbooking', 'unbooking', 'unbooking', 0),
('C02A', 'unbooking', 'unbooking', 'unbooking', 0),
('A02B', 'unbooking', 'unbooking', 'unbooking', 0),
('C02B', 'unbooking', 'unbooking', 'unbooking', 0),
('A02C', 'unbooking', 'unbooking', 'unbooking', 0),
('C02C', 'unbooking', 'unbooking', 'unbooking', 0),
('A02D', 'unbooking', 'unbooking', 'unbooking', 0),
('C02D', 'unbooking', 'unbooking', 'unbooking', 0),
('A02E', 'unbooking', 'unbooking', 'unbooking', 0),
('C02E', 'unbooking', 'unbooking', 'unbooking', 0),
('A02F', 'unbooking', 'unbooking', 'unbooking', 0),
('C02F', 'unbooking', 'unbooking', 'unbooking', 0),
('A02G', 'unbooking', 'unbooking', 'unbooking', 0),
('C02G', 'unbooking', 'unbooking', 'unbooking', 0),
('A02H', 'unbooking', 'unbooking', 'unbooking', 0),
('C02H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03A', 'unbooking', 'unbooking', 'unbooking', 0),
('C03A', 'unbooking', 'unbooking', 'unbooking', 0),
('A03B', 'unbooking', 'unbooking', 'unbooking', 0),
('C03B', 'unbooking', 'unbooking', 'unbooking', 0),
('A03C', 'unbooking', 'unbooking', 'unbooking', 0),
('C03C', 'unbooking', 'unbooking', 'unbooking', 0),
('A03D', 'unbooking', 'unbooking', 'unbooking', 0),
('C03D', 'unbooking', 'unbooking', 'unbooking', 0),
('A03E', 'unbooking', 'unbooking', 'unbooking', 0),
('C03E', 'unbooking', 'unbooking', 'unbooking', 0),
('A03F', 'unbooking', 'unbooking', 'unbooking', 0),
('C03F', 'unbooking', 'unbooking', 'unbooking', 0),
('A03G', 'unbooking', 'unbooking', 'unbooking', 0),
('C03G', 'unbooking', 'unbooking', 'unbooking', 0),
('A03H', 'unbooking', 'unbooking', 'unbooking', 0),
('C03H', 'unbooking', 'unbooking', 'unbooking', 0),
('A03I', 'unbooking', 'unbooking', 'unbooking', 0),
('C03I', 'unbooking', 'unbooking', 'unbooking', 0),
('A03J', 'unbooking', 'unbooking', 'unbooking', 0),
('C03J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04A', 'unbooking', 'unbooking', 'unbooking', 0),
('C04A', 'unbooking', 'unbooking', 'unbooking', 0),
('A04B', 'unbooking', 'unbooking', 'unbooking', 0),
('C04B', 'unbooking', 'unbooking', 'unbooking', 0),
('A04C', 'unbooking', 'unbooking', 'unbooking', 0),
('C04C', 'unbooking', 'unbooking', 'unbooking', 0),
('A04D', 'unbooking', 'unbooking', 'unbooking', 0),
('C04D', 'unbooking', 'unbooking', 'unbooking', 0),
('A04E', 'unbooking', 'unbooking', 'unbooking', 0),
('C04E', 'unbooking', 'unbooking', 'unbooking', 0),
('A04F', 'unbooking', 'unbooking', 'unbooking', 0),
('C04F', 'unbooking', 'unbooking', 'unbooking', 0),
('A04G', 'unbooking', 'unbooking', 'unbooking', 0),
('C04G', 'unbooking', 'unbooking', 'unbooking', 0),
('A04H', 'unbooking', 'unbooking', 'unbooking', 0),
('C04H', 'unbooking', 'unbooking', 'unbooking', 0),
('A04I', 'unbooking', 'unbooking', 'unbooking', 0),
('C04I', 'unbooking', 'unbooking', 'unbooking', 0),
('A04J', 'unbooking', 'unbooking', 'unbooking', 0),
('C04J', 'unbooking', 'unbooking', 'unbooking', 0),
('A04K', 'unbooking', 'unbooking', 'unbooking', 0),
('C04K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05A', 'unbooking', 'unbooking', 'unbooking', 0),
('C05A', 'unbooking', 'unbooking', 'unbooking', 0),
('A05B', 'unbooking', 'unbooking', 'unbooking', 0),
('C05B', 'unbooking', 'unbooking', 'unbooking', 0),
('A05C', 'unbooking', 'unbooking', 'unbooking', 0),
('C05C', 'unbooking', 'unbooking', 'unbooking', 0),
('A05D', 'unbooking', 'unbooking', 'unbooking', 0),
('C05D', 'unbooking', 'unbooking', 'unbooking', 0),
('A05E', 'unbooking', 'unbooking', 'unbooking', 0),
('C05E', 'unbooking', 'unbooking', 'unbooking', 0),
('A05F', 'unbooking', 'unbooking', 'unbooking', 0),
('C05F', 'unbooking', 'unbooking', 'unbooking', 0),
('A05G', 'unbooking', 'unbooking', 'unbooking', 0),
('C05G', 'unbooking', 'unbooking', 'unbooking', 0),
('A05H', 'unbooking', 'unbooking', 'unbooking', 0),
('C05H', 'unbooking', 'unbooking', 'unbooking', 0),
('A05I', 'unbooking', 'unbooking', 'unbooking', 0),
('C05I', 'unbooking', 'unbooking', 'unbooking', 0),
('A05J', 'unbooking', 'unbooking', 'unbooking', 0),
('C05J', 'unbooking', 'unbooking', 'unbooking', 0),
('A05K', 'unbooking', 'unbooking', 'unbooking', 0),
('C05K', 'unbooking', 'unbooking', 'unbooking', 0),
('A05L', 'unbooking', 'unbooking', 'unbooking', 0),
('C05L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06A', 'unbooking', 'unbooking', 'unbooking', 0),
('C06A', 'unbooking', 'unbooking', 'unbooking', 0),
('A06B', 'unbooking', 'unbooking', 'unbooking', 0),
('C06B', 'unbooking', 'unbooking', 'unbooking', 0),
('A06C', 'unbooking', 'unbooking', 'unbooking', 0),
('C06C', 'unbooking', 'unbooking', 'unbooking', 0),
('A06D', 'unbooking', 'unbooking', 'unbooking', 0),
('C06D', 'unbooking', 'unbooking', 'unbooking', 0),
('A06E', 'unbooking', 'unbooking', 'unbooking', 0),
('C06E', 'unbooking', 'unbooking', 'unbooking', 0),
('A06F', 'unbooking', 'unbooking', 'unbooking', 0),
('C06F', 'unbooking', 'unbooking', 'unbooking', 0),
('A06G', 'unbooking', 'unbooking', 'unbooking', 0),
('C06G', 'unbooking', 'unbooking', 'unbooking', 0),
('A06H', 'unbooking', 'unbooking', 'unbooking', 0),
('C06H', 'unbooking', 'unbooking', 'unbooking', 0),
('A06I', 'unbooking', 'unbooking', 'unbooking', 0),
('C06I', 'unbooking', 'unbooking', 'unbooking', 0),
('A06J', 'unbooking', 'unbooking', 'unbooking', 0),
('C06J', 'unbooking', 'unbooking', 'unbooking', 0),
('A06K', 'unbooking', 'unbooking', 'unbooking', 0),
('C06K', 'unbooking', 'unbooking', 'unbooking', 0),
('A06L', 'unbooking', 'unbooking', 'unbooking', 0),
('C06L', 'unbooking', 'unbooking', 'unbooking', 0),
('A06M', 'unbooking', 'unbooking', 'unbooking', 0),
('C06M', 'unbooking', 'unbooking', 'unbooking', 0),
('A06N', 'unbooking', 'unbooking', 'unbooking', 0),
('C06N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07A', 'unbooking', 'unbooking', 'unbooking', 0),
('C07A', 'unbooking', 'unbooking', 'unbooking', 0),
('A07B', 'unbooking', 'unbooking', 'unbooking', 0),
('C07B', 'unbooking', 'unbooking', 'unbooking', 0),
('A07C', 'unbooking', 'unbooking', 'unbooking', 0),
('C07C', 'unbooking', 'unbooking', 'unbooking', 0),
('A07D', 'unbooking', 'unbooking', 'unbooking', 0),
('C07D', 'unbooking', 'unbooking', 'unbooking', 0),
('A07E', 'unbooking', 'unbooking', 'unbooking', 0),
('C07E', 'unbooking', 'unbooking', 'unbooking', 0),
('A07F', 'unbooking', 'unbooking', 'unbooking', 0),
('C07F', 'unbooking', 'unbooking', 'unbooking', 0),
('A07G', 'unbooking', 'unbooking', 'unbooking', 0),
('C07G', 'unbooking', 'unbooking', 'unbooking', 0),
('A07H', 'unbooking', 'unbooking', 'unbooking', 0),
('C07H', 'unbooking', 'unbooking', 'unbooking', 0),
('A07I', 'unbooking', 'unbooking', 'unbooking', 0),
('C07I', 'unbooking', 'unbooking', 'unbooking', 0),
('A07J', 'unbooking', 'unbooking', 'unbooking', 0),
('C07J', 'unbooking', 'unbooking', 'unbooking', 0),
('A07K', 'unbooking', 'unbooking', 'unbooking', 0),
('C07K', 'unbooking', 'unbooking', 'unbooking', 0),
('A07L', 'unbooking', 'unbooking', 'unbooking', 0),
('C07L', 'unbooking', 'unbooking', 'unbooking', 0),
('A07M', 'unbooking', 'unbooking', 'unbooking', 0),
('C07M', 'unbooking', 'unbooking', 'unbooking', 0),
('A07N', 'unbooking', 'unbooking', 'unbooking', 0),
('C07N', 'unbooking', 'unbooking', 'unbooking', 0),
('A07O', 'unbooking', 'unbooking', 'unbooking', 0),
('C07O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08A', 'unbooking', 'unbooking', 'unbooking', 0),
('C08A', 'unbooking', 'unbooking', 'unbooking', 0),
('A08B', 'unbooking', 'unbooking', 'unbooking', 0),
('C08B', 'unbooking', 'unbooking', 'unbooking', 0),
('A08C', 'unbooking', 'unbooking', 'unbooking', 0),
('C08C', 'unbooking', 'unbooking', 'unbooking', 0),
('A08D', 'unbooking', 'unbooking', 'unbooking', 0),
('C08D', 'unbooking', 'unbooking', 'unbooking', 0),
('A08E', 'unbooking', 'unbooking', 'unbooking', 0),
('C08E', 'unbooking', 'unbooking', 'unbooking', 0),
('A08F', 'unbooking', 'unbooking', 'unbooking', 0),
('C08F', 'unbooking', 'unbooking', 'unbooking', 0),
('A08G', 'unbooking', 'unbooking', 'unbooking', 0),
('C08G', 'unbooking', 'unbooking', 'unbooking', 0),
('A08H', 'unbooking', 'unbooking', 'unbooking', 0),
('C08H', 'unbooking', 'unbooking', 'unbooking', 0),
('A08I', 'unbooking', 'unbooking', 'unbooking', 0),
('C08I', 'unbooking', 'unbooking', 'unbooking', 0),
('A08J', 'unbooking', 'unbooking', 'unbooking', 0),
('C08J', 'unbooking', 'unbooking', 'unbooking', 0),
('A08K', 'unbooking', 'unbooking', 'unbooking', 0),
('C08K', 'unbooking', 'unbooking', 'unbooking', 0),
('A08L', 'unbooking', 'unbooking', 'unbooking', 0),
('C08L', 'unbooking', 'unbooking', 'unbooking', 0),
('A08M', 'unbooking', 'unbooking', 'unbooking', 0),
('C08M', 'unbooking', 'unbooking', 'unbooking', 0),
('A08N', 'unbooking', 'unbooking', 'unbooking', 0),
('C08N', 'unbooking', 'unbooking', 'unbooking', 0),
('A08O', 'unbooking', 'unbooking', 'unbooking', 0),
('C08O', 'unbooking', 'unbooking', 'unbooking', 0),
('A08P', 'unbooking', 'unbooking', 'unbooking', 0),
('C08P', 'unbooking', 'unbooking', 'unbooking', 0),
('A08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('C08Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09A', 'unbooking', 'unbooking', 'unbooking', 0),
('A09B', 'unbooking', 'unbooking', 'unbooking', 0),
('A09C', 'unbooking', 'unbooking', 'unbooking', 0),
('A09D', 'unbooking', 'unbooking', 'unbooking', 0),
('A09E', 'unbooking', 'unbooking', 'unbooking', 0),
('A09F', 'unbooking', 'unbooking', 'unbooking', 0),
('A09G', 'unbooking', 'unbooking', 'unbooking', 0),
('A09H', 'unbooking', 'unbooking', 'unbooking', 0),
('A09I', 'unbooking', 'unbooking', 'unbooking', 0),
('A09J', 'unbooking', 'unbooking', 'unbooking', 0),
('A09K', 'unbooking', 'unbooking', 'unbooking', 0),
('A09L', 'unbooking', 'unbooking', 'unbooking', 0),
('A09M', 'unbooking', 'unbooking', 'unbooking', 0),
('A09N', 'unbooking', 'unbooking', 'unbooking', 0),
('A09O', 'unbooking', 'unbooking', 'unbooking', 0),
('A09P', 'unbooking', 'unbooking', 'unbooking', 0),
('A09Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A09R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10A', 'unbooking', 'unbooking', 'unbooking', 0),
('A10B', 'unbooking', 'unbooking', 'unbooking', 0),
('A10C', 'unbooking', 'unbooking', 'unbooking', 0),
('A10D', 'unbooking', 'unbooking', 'unbooking', 0),
('A10E', 'unbooking', 'unbooking', 'unbooking', 0),
('A10F', 'unbooking', 'unbooking', 'unbooking', 0),
('A10G', 'unbooking', 'unbooking', 'unbooking', 0),
('A10H', 'unbooking', 'unbooking', 'unbooking', 0),
('A10I', 'unbooking', 'unbooking', 'unbooking', 0),
('A10J', 'unbooking', 'unbooking', 'unbooking', 0),
('A10K', 'unbooking', 'unbooking', 'unbooking', 0),
('A10L', 'unbooking', 'unbooking', 'unbooking', 0),
('A10M', 'unbooking', 'unbooking', 'unbooking', 0),
('A10N', 'unbooking', 'unbooking', 'unbooking', 0),
('A10O', 'unbooking', 'unbooking', 'unbooking', 0),
('A10P', 'unbooking', 'unbooking', 'unbooking', 0),
('A10Q', 'unbooking', 'unbooking', 'unbooking', 0),
('A10R', 'unbooking', 'unbooking', 'unbooking', 0),
('A10S', 'unbooking', 'unbooking', 'unbooking', 0),
('A10T', 'unbooking', 'unbooking', 'unbooking', 0),
('A10U', 'unbooking', 'unbooking', 'unbooking', 0),
('A10V', 'unbooking', 'unbooking', 'unbooking', 0),
('A10W', 'unbooking', 'unbooking', 'unbooking', 0),
('A10X', 'unbooking', 'unbooking', 'unbooking', 0),
('C09A', 'unbooking', 'unbooking', 'unbooking', 0),
('C09B', 'unbooking', 'unbooking', 'unbooking', 0),
('C09C', 'unbooking', 'unbooking', 'unbooking', 0),
('C09D', 'unbooking', 'unbooking', 'unbooking', 0),
('C09E', 'unbooking', 'unbooking', 'unbooking', 0),
('C09F', 'unbooking', 'unbooking', 'unbooking', 0),
('C09G', 'unbooking', 'unbooking', 'unbooking', 0),
('C09H', 'unbooking', 'unbooking', 'unbooking', 0),
('C09I', 'unbooking', 'unbooking', 'unbooking', 0),
('C09J', 'unbooking', 'unbooking', 'unbooking', 0),
('C09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10A', 'unbooking', 'unbooking', 'unbooking', 0),
('B10B', 'unbooking', 'unbooking', 'unbooking', 0),
('B10C', 'unbooking', 'unbooking', 'unbooking', 0),
('B10D', 'unbooking', 'unbooking', 'unbooking', 0),
('B10E', 'unbooking', 'unbooking', 'unbooking', 0),
('B10F', 'unbooking', 'unbooking', 'unbooking', 0),
('B10G', 'unbooking', 'unbooking', 'unbooking', 0),
('B10H', 'unbooking', 'unbooking', 'unbooking', 0),
('B10I', 'unbooking', 'unbooking', 'unbooking', 0),
('B10J', 'unbooking', 'unbooking', 'unbooking', 0),
('B10K', 'unbooking', 'unbooking', 'unbooking', 0),
('B10L', 'unbooking', 'unbooking', 'unbooking', 0),
('B10M', 'unbooking', 'unbooking', 'unbooking', 0),
('B10N', 'unbooking', 'unbooking', 'unbooking', 0),
('B10O', 'unbooking', 'unbooking', 'unbooking', 0),
('B09A', 'unbooking', 'unbooking', 'unbooking', 0),
('B09B', 'unbooking', 'unbooking', 'unbooking', 0),
('B09C', 'unbooking', 'unbooking', 'unbooking', 0),
('B09D', 'unbooking', 'unbooking', 'unbooking', 0),
('B09E', 'unbooking', 'unbooking', 'unbooking', 0),
('B09F', 'unbooking', 'unbooking', 'unbooking', 0),
('B09G', 'unbooking', 'unbooking', 'unbooking', 0),
('B09H', 'unbooking', 'unbooking', 'unbooking', 0),
('B09I', 'unbooking', 'unbooking', 'unbooking', 0),
('B09J', 'unbooking', 'unbooking', 'unbooking', 0),
('B09K', 'unbooking', 'unbooking', 'unbooking', 0),
('B09L', 'unbooking', 'unbooking', 'unbooking', 0),
('B09M', 'unbooking', 'unbooking', 'unbooking', 0),
('B08A', 'unbooking', 'unbooking', 'unbooking', 0),
('B08B', 'unbooking', 'unbooking', 'unbooking', 0),
('B08C', 'unbooking', 'unbooking', 'unbooking', 0),
('B08D', 'unbooking', 'unbooking', 'unbooking', 0),
('B08E', 'unbooking', 'unbooking', 'unbooking', 0),
('B08F', 'unbooking', 'unbooking', 'unbooking', 0),
('B08G', 'unbooking', 'unbooking', 'unbooking', 0),
('B08H', 'unbooking', 'unbooking', 'unbooking', 0),
('B08I', 'unbooking', 'unbooking', 'unbooking', 0),
('B08J', 'unbooking', 'unbooking', 'unbooking', 0),
('B08K', 'unbooking', 'unbooking', 'unbooking', 0),
('B08L', 'unbooking', 'unbooking', 'unbooking', 0),
('B08M', 'unbooking', 'unbooking', 'unbooking', 0),
('B07A', 'unbooking', 'unbooking', 'unbooking', 0),
('B07B', 'unbooking', 'unbooking', 'unbooking', 0),
('B07C', 'unbooking', 'unbooking', 'unbooking', 0),
('B07D', 'unbooking', 'unbooking', 'unbooking', 0),
('B07E', 'unbooking', 'unbooking', 'unbooking', 0),
('B07F', 'unbooking', 'unbooking', 'unbooking', 0),
('B07G', 'unbooking', 'unbooking', 'unbooking', 0),
('B07H', 'unbooking', 'unbooking', 'unbooking', 0),
('B07I', 'unbooking', 'unbooking', 'unbooking', 0),
('B07J', 'unbooking', 'unbooking', 'unbooking', 0),
('B07K', 'unbooking', 'unbooking', 'unbooking', 0),
('B07L', 'unbooking', 'unbooking', 'unbooking', 0),
('B07M', 'unbooking', 'unbooking', 'unbooking', 0),
('B06A', 'unbooking', 'unbooking', 'unbooking', 0),
('B06B', 'unbooking', 'unbooking', 'unbooking', 0),
('B06C', 'unbooking', 'unbooking', 'unbooking', 0),
('B06D', 'unbooking', 'unbooking', 'unbooking', 0),
('B06E', 'unbooking', 'unbooking', 'unbooking', 0),
('B06F', 'unbooking', 'unbooking', 'unbooking', 0),
('B06G', 'unbooking', 'unbooking', 'unbooking', 0),
('B06H', 'unbooking', 'unbooking', 'unbooking', 0),
('B06I', 'unbooking', 'unbooking', 'unbooking', 0),
('B06J', 'unbooking', 'unbooking', 'unbooking', 0),
('B06K', 'unbooking', 'unbooking', 'unbooking', 0),
('B06L', 'unbooking', 'unbooking', 'unbooking', 0),
('B06M', 'unbooking', 'unbooking', 'unbooking', 0),
('B05A', 'unbooking', 'unbooking', 'unbooking', 0),
('B05B', 'unbooking', 'unbooking', 'unbooking', 0),
('B05C', 'unbooking', 'unbooking', 'unbooking', 0),
('B05D', 'unbooking', 'unbooking', 'unbooking', 0),
('B05E', 'unbooking', 'unbooking', 'unbooking', 0),
('B05F', 'unbooking', 'unbooking', 'unbooking', 0),
('B05G', 'unbooking', 'unbooking', 'unbooking', 0),
('B05H', 'unbooking', 'unbooking', 'unbooking', 0),
('B05I', 'unbooking', 'unbooking', 'unbooking', 0),
('B05J', 'unbooking', 'unbooking', 'unbooking', 0),
('B05K', 'unbooking', 'unbooking', 'unbooking', 0),
('B05L', 'unbooking', 'unbooking', 'unbooking', 0),
('B05M', 'unbooking', 'unbooking', 'unbooking', 0),
('B04A', 'unbooking', 'unbooking', 'unbooking', 0),
('B04B', 'unbooking', 'unbooking', 'unbooking', 0),
('B04C', 'unbooking', 'unbooking', 'unbooking', 0),
('B04D', 'unbooking', 'unbooking', 'unbooking', 0),
('B04E', 'unbooking', 'unbooking', 'unbooking', 0),
('B04F', 'unbooking', 'unbooking', 'unbooking', 0),
('B04G', 'unbooking', 'unbooking', 'unbooking', 0),
('B04H', 'unbooking', 'unbooking', 'unbooking', 0),
('B04I', 'unbooking', 'unbooking', 'unbooking', 0),
('B04J', 'unbooking', 'unbooking', 'unbooking', 0),
('B04K', 'unbooking', 'unbooking', 'unbooking', 0),
('B04L', 'unbooking', 'unbooking', 'unbooking', 0),
('B04M', 'unbooking', 'unbooking', 'unbooking', 0),
('B03A', 'unbooking', 'unbooking', 'unbooking', 0),
('B03B', 'unbooking', 'unbooking', 'unbooking', 0),
('B03C', 'unbooking', 'unbooking', 'unbooking', 0),
('B03D', 'unbooking', 'unbooking', 'unbooking', 0),
('B03E', 'unbooking', 'unbooking', 'unbooking', 0),
('B03F', 'unbooking', 'unbooking', 'unbooking', 0),
('B03G', 'unbooking', 'unbooking', 'unbooking', 0),
('B03H', 'unbooking', 'unbooking', 'unbooking', 0),
('B03I', 'unbooking', 'unbooking', 'unbooking', 0),
('B03J', 'unbooking', 'unbooking', 'unbooking', 0),
('B03K', 'unbooking', 'unbooking', 'unbooking', 0),
('B03L', 'unbooking', 'unbooking', 'unbooking', 0),
('B03M', 'unbooking', 'unbooking', 'unbooking', 0),
('B02A', 'unbooking', 'unbooking', 'unbooking', 0),
('B02B', 'unbooking', 'unbooking', 'unbooking', 0),
('B02C', 'unbooking', 'unbooking', 'unbooking', 0),
('B02D', 'unbooking', 'unbooking', 'unbooking', 0),
('B02E', 'unbooking', 'unbooking', 'unbooking', 0),
('B02F', 'unbooking', 'unbooking', 'unbooking', 0),
('B02G', 'unbooking', 'unbooking', 'unbooking', 0),
('B02H', 'unbooking', 'unbooking', 'unbooking', 0),
('B02I', 'unbooking', 'unbooking', 'unbooking', 0),
('B02J', 'unbooking', 'unbooking', 'unbooking', 0),
('B02K', 'unbooking', 'unbooking', 'unbooking', 0),
('B02L', 'unbooking', 'unbooking', 'unbooking', 0),
('B02M', 'unbooking', 'unbooking', 'unbooking', 0),
('B01A', 'unbooking', 'unbooking', 'unbooking', 0),
('B01B', 'unbooking', 'unbooking', 'unbooking', 0),
('B01C', 'unbooking', 'unbooking', 'unbooking', 0),
('B01D', 'unbooking', 'unbooking', 'unbooking', 0),
('B01E', 'unbooking', 'unbooking', 'unbooking', 0),
('B01F', 'unbooking', 'unbooking', 'unbooking', 0),
('B01G', 'unbooking', 'unbooking', 'unbooking', 0),
('B01H', 'unbooking', 'unbooking', 'unbooking', 0),
('B01I', 'unbooking', 'unbooking', 'unbooking', 0),
('B01J', 'unbooking', 'unbooking', 'unbooking', 0),
('B01K', 'unbooking', 'unbooking', 'unbooking', 0),
('B01L', 'unbooking', 'unbooking', 'unbooking', 0),
('B01M', 'unbooking', 'unbooking', 'unbooking', 0);
--
-- Database: `ninetyonedb`
--
CREATE DATABASE IF NOT EXISTS `ninetyonedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ninetyonedb`;

-- --------------------------------------------------------

--
-- Table structure for table `ads_table`
--

CREATE TABLE `ads_table` (
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ads_table`
--

INSERT INTO `ads_table` (`name`, `url`) VALUES
('S1', ''),
('S2', ''),
('S3', ''),
('S4', ''),
('L2', ''),
('L3', '');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_day`
--

CREATE TABLE `timetable_day` (
  `id` varchar(100) NOT NULL,
  `time_start` time NOT NULL,
  `time_stop` time NOT NULL,
  `name` varchar(100) NOT NULL,
  `dj` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable_day`
--

INSERT INTO `timetable_day` (`id`, `time_start`, `time_stop`, `name`, `dj`) VALUES
('S1', '08:00:00', '11:00:00', 'รายการ1', 'ดีเจ1 '),
('S2', '11:00:00', '00:00:00', 'รายการ2', 'ดีเจ2');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_holiday`
--

CREATE TABLE `timetable_holiday` (
  `id` varchar(100) NOT NULL,
  `time_start` time NOT NULL,
  `time_stop` time NOT NULL,
  `name` varchar(100) NOT NULL,
  `dj` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable_holiday`
--

INSERT INTO `timetable_holiday` (`id`, `time_start`, `time_stop`, `name`, `dj`) VALUES
('S1', '07:00:00', '08:00:00', 'รายการ1', 'ดีเจ1  '),
('S2', '09:00:00', '10:00:00', 'รายการ2', 'ดีเจ2 ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `id`, `pass`) VALUES
('admin', 'admin', 'admin');
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"dental_db","table":"treatment_history_tb"},{"db":"dental_db","table":"employee_tb"},{"db":"dental_db","table":"medicsupply_record_tb"},{"db":"dental_db","table":"medicsupply_tb"},{"db":"dental_db","table":"medicsupply_history_tb"},{"db":"dental_db","table":"curesubject_history_tb"},{"db":"dental_db","table":"midecsupply_record_tb"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'dental_db', 'employee_tb', '{"sorted_col":"`employee_tb`.`systemaccount` ASC"}', '2017-01-08 06:44:11'),
('root', 'dental_db', 'medicsupply_history_tb', '{"sorted_col":"`medicsupply_history_tb`.`medicsupply_id` ASC"}', '2017-01-08 05:02:40');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-01-05 07:49:59', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

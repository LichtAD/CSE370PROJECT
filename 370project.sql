-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 08:33 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `370project`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(11) NOT NULL,
  `c_title` varchar(50) DEFAULT NULL,
  `c_prereq` varchar(50) DEFAULT NULL,
  `c_credit` int(11) DEFAULT NULL,
  `c_sec` int(11) DEFAULT NULL,
  `c_ass` int(11) DEFAULT NULL,
  `exm_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `c_title`, `c_prereq`, `c_credit`, `c_sec`, `c_ass`, `exm_no`) VALUES
(1, 'CSE110', 'cse101', 3, 22, 4, 1),
(2, 'cse111', 'cse110', 3, 11, 5, 2),
(4, 'cse221', 'cse220', 4, 15, 5, 3),
(5, 'cse220', 'cse111', 3, 12, 4, 4),
(6, 'cse230', 'None', 2, 15, 11, 5),
(7, 'EEE101', 'eee092', 3, 12, 4, 6),
(9, 'ENG102', 'ENG101', 3, 22, 3, 4),
(10, 'BBA101', '', 3, 11, 3, 3),
(11, 'ARC101', '', 3, 15, 4, 2),
(12, 'PHR101', '', 3, 19, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `d_id` int(11) NOT NULL,
  `d_build_no` varchar(100) DEFAULT NULL,
  `d_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`d_id`, `d_build_no`, `d_name`) VALUES
(1, 'ub1', 'CSE'),
(2, 'ub7', 'EEE'),
(3, 'ub2', 'BBA'),
(5, 'ub5', 'ARC');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_no` int(11) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_course` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_no`, `exam_date`, `exam_course`) VALUES
(1, '2022-12-27', 'cse331'),
(2, '2023-01-02', 'cse350'),
(3, '2022-12-04', 'cse110'),
(4, '2022-12-22', 'cse220'),
(5, '2022-12-19', 'cse111'),
(6, '2023-01-01', 'cse371');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `f_age` int(11) DEFAULT NULL,
  `f_gender` varchar(50) DEFAULT NULL,
  `f_phone` int(30) DEFAULT NULL,
  `f_email` varchar(50) DEFAULT NULL,
  `f_title` varchar(100) DEFAULT NULL,
  `f_dept` varchar(50) DEFAULT NULL,
  `pay_id` int(11) NOT NULL,
  `f_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`f_id`, `f_name`, `f_age`, `f_gender`, `f_phone`, `f_email`, `f_title`, `f_dept`, `pay_id`, `f_amount`) VALUES
(9, 'faculty', 22, 'Male', 74474, 'faculty@gmail.com', 'Lecturer', 'BBA', 2, 3),
(10, 'rahim', 33, 'Male', 3333, 'rahim@gmail.com', 'Lecturer', 'BBA', 4, 5555);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_course`
--

CREATE TABLE `faculty_course` (
  `faculty_name` varchar(100) NOT NULL,
  `faculty_course1` varchar(100) NOT NULL,
  `faculty_course2` varchar(100) NOT NULL,
  `faculty_course3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty_course`
--

INSERT INTO `faculty_course` (`faculty_name`, `faculty_course1`, `faculty_course2`, `faculty_course3`) VALUES
('faculty', 'cse110', 'cse220', 'cse230'),
('rahim', 'EEE101', 'CSE110', 'cse220');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL,
  `p_date` date DEFAULT NULL,
  `p_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`p_id`, `p_date`, `p_method`) VALUES
(1, '2022-12-30', 'Online'),
(2, '2023-01-26', 'Online'),
(3, '2022-12-29', 'Cash'),
(4, '2022-12-23', 'Cash'),
(5, '2023-01-20', 'Online'),
(6, '2022-12-04', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `st_name` varchar(100) NOT NULL,
  `st_course1` varchar(100) NOT NULL,
  `st_course2` varchar(100) NOT NULL,
  `st_course3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_course`
--

INSERT INTO `student_course` (`st_name`, `st_course1`, `st_course2`, `st_course3`) VALUES
('yamin', 'cse110', 'cse220', 'cse221'),
('shakil', 'cse230', 'EEE101', 'CSE110'),
('shakil', 'cse110', 'cse111', 'cse484');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `phone` int(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  `pay_id` int(30) NOT NULL,
  `s_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `phone`, `email`, `usertype`, `password`, `dept_id`, `pay_id`, `s_amount`) VALUES
(1, 'admin', 3646, 'admin@gmail.com', 'admin', '1234', 1, 1, 0),
(2, 'student', 73846, 'student@gmail.com', 'student', '1234', 1, 2, 10),
(3, 'shakil', 644849, 'shakil@gmail.com', 'student', '1234', 2, 4, 200),
(5, 'yamin', 12345, 'yamin@gmail.com', 'student', '1234', 3, 5, 10),
(17, 'sajid', 87744, 'sajid@gmail.com', 'student', '1234', 5, 4, 94875),
(19, 'faculty', 8484, 'faculty@gmail.com', 'faculty', '1234', 1, 1, 1000),
(26, 'rahim', NULL, NULL, 'faculty', '1234', 1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `course_exam` (`exm_no`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_no`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `faculty_payment` (`pay_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `student_payment` (`pay_id`),
  ADD KEY `student_dept` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_exam` FOREIGN KEY (`exm_no`) REFERENCES `exam` (`exam_no`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_payment` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`p_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `student_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`d_id`),
  ADD CONSTRAINT `student_payment` FOREIGN KEY (`pay_id`) REFERENCES `payment` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

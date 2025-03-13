-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 12:26 AM
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
-- Database: `acaflow_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adm_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('MIS','Registrar','Accounting') NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adm_id`, `username`, `hashed_password`, `first_name`, `last_name`, `email`, `role`, `status`) VALUES
('000101', 'registrartest', '$2y$10$dKK7Xo.BwvqaoWHldgJuwudUvs.5FdF4HKouvnEjbDF8hHrpazOL2', 'John', 'Doe', 'johndoe@example.com', 'Registrar', 'Active'),
('000202', 'accountingtest', '$2y$10$WW9jL8Hl5/8eRbqiRTxVB.PC/TNxtHZKMMloRN/EsCWDgLKfs4X3u', 'Scotty', 'Knows', 'scottyknows@example.com', 'Accounting', 'Active'),
('000303', 'mistest', '$2y$10$GhFr1O778S3iHPzNIG9zNevbhcWR6W.sa34deTi9EDohffi7.991m', 'Michael', 'Oxmol', 'mikeoxmol@example.com', 'MIS', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_courses`
--

CREATE TABLE `assigned_courses` (
  `record_id` int(11) NOT NULL,
  `edp_code` varchar(10) NOT NULL,
  `tc_assigned` varchar(20) NOT NULL,
  `admin_responsible` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assigned_courses`
--

INSERT INTO `assigned_courses` (`record_id`, `edp_code`, `tc_assigned`, `admin_responsible`) VALUES
(1, '000000', '100111', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clearance`
--

CREATE TABLE `clearance` (
  `clearance_id` int(11) NOT NULL,
  `st_id` varchar(20) NOT NULL,
  `tc_assigned` varchar(20) NOT NULL,
  `edp_code` varchar(10) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `status` enum('Pending','Cleared','Not Cleared') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_code` varchar(20) NOT NULL,
  `course_description` text NOT NULL,
  `program_code` varchar(10) DEFAULT NULL,
  `curriculum_year` year(4) NOT NULL,
  `units` int(11) NOT NULL,
  `semester` enum('1st Semester','2nd Semester') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_code`, `course_description`, `program_code`, `curriculum_year`, `units`, `semester`) VALUES
('Math 101', 'College Mathematics', 'BSIT', '2021', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `course_prerequisites`
--

CREATE TABLE `course_prerequisites` (
  `prereq_code` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `prereq_course` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demographic_profile`
--

CREATE TABLE `demographic_profile` (
  `profile_id` int(11) NOT NULL,
  `st_id` varchar(20) DEFAULT NULL,
  `program_enrolled` varchar(10) DEFAULT NULL,
  `curriculum_year` year(4) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_initial` char(1) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_code` varchar(10) NOT NULL,
  `dept_name` text NOT NULL,
  `dept_head` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_code`, `dept_name`, `dept_head`) VALUES
('CCS', 'College of Computer Studies', 'Mr. Carlo Petalver, MIT');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_courses`
--

CREATE TABLE `enrolled_courses` (
  `record_id` int(11) NOT NULL,
  `edp_code` varchar(10) NOT NULL,
  `st_enrolled` varchar(20) NOT NULL,
  `admin_responsible` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `st_id` varchar(20) NOT NULL,
  `edp_code` varchar(10) NOT NULL,
  `course_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `record_id` int(11) NOT NULL,
  `edp_code` varchar(10) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `st_id` varchar(20) NOT NULL,
  `midterm_grade` decimal(4,2) DEFAULT NULL,
  `final_grade` decimal(4,2) DEFAULT NULL,
  `remarks` enum('Pending','Passed','Failed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offered_courses`
--

CREATE TABLE `offered_courses` (
  `edp_code` varchar(10) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `scheduled_days` set('M','T','W','Th','F','Sat') DEFAULT NULL,
  `scheduled_start` time NOT NULL,
  `scheduled_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offered_courses`
--

INSERT INTO `offered_courses` (`edp_code`, `course_code`, `scheduled_days`, `scheduled_start`, `scheduled_end`) VALUES
('000000', 'Math 101', 'M,W,F', '08:00:00', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `st_id` varchar(20) NOT NULL,
  `total_due` decimal(10,2) NOT NULL,
  `midterms_due` decimal(10,2) DEFAULT NULL,
  `finals_due` decimal(10,2) DEFAULT NULL,
  `midterms_payment_status` enum('Pending','Paid') DEFAULT 'Pending',
  `finals_payment_status` enum('Pending','Paid') DEFAULT 'Pending',
  `changed_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `st_id`, `total_due`, `midterms_due`, `finals_due`, `midterms_payment_status`, `finals_payment_status`, `changed_by`) VALUES
(1, '23079569', 41000.00, 20500.00, 20500.00, 'Paid', 'Paid', '000202');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_code` varchar(10) NOT NULL,
  `department` varchar(10) DEFAULT NULL,
  `program_name` text NOT NULL,
  `program_head` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_code`, `department`, `program_name`, `program_head`) VALUES
('BSIT', 'CCS', 'Bachelor of Science in Information Technology', 'Mr. Carlo Petalver, MIT');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `st_id` varchar(20) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`st_id`, `hashed_password`, `status`) VALUES
('23079569', '$2y$10$fAZHKWlW/8d3.yA2aODf0e6L6tfjyXb0dFyAQpSuYW7ylsfg7u79a', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tc_id` varchar(20) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `department` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tc_id`, `hashed_password`, `first_name`, `last_name`, `department`, `email`, `status`) VALUES
('100111', '$2y$10$akGnFU29wypO2y6XhwumKekKo4o4p2HLzCcMaa9iJYzdMExrp8gjK', 'test', 'teacher', 'CCS', 'janedoe@example.com', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adm_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `assigned_courses`
--
ALTER TABLE `assigned_courses`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `edp_code` (`edp_code`),
  ADD KEY `tc_assigned` (`tc_assigned`),
  ADD KEY `admin_responsible` (`admin_responsible`);

--
-- Indexes for table `clearance`
--
ALTER TABLE `clearance`
  ADD PRIMARY KEY (`clearance_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `tc_assigned` (`tc_assigned`),
  ADD KEY `edp_code` (`edp_code`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `program_code` (`program_code`);

--
-- Indexes for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  ADD PRIMARY KEY (`prereq_code`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `prereq_course` (`prereq_course`);

--
-- Indexes for table `demographic_profile`
--
ALTER TABLE `demographic_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `st_id` (`st_id`),
  ADD KEY `program_enrolled` (`program_enrolled`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_code`);

--
-- Indexes for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `edp_code` (`edp_code`),
  ADD KEY `st_enrolled` (`st_enrolled`),
  ADD KEY `admin_responsible` (`admin_responsible`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `edp_code` (`edp_code`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `edp_code` (`edp_code`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `st_id` (`st_id`);

--
-- Indexes for table `offered_courses`
--
ALTER TABLE `offered_courses`
  ADD PRIMARY KEY (`edp_code`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `payments_ibfk_2` (`changed_by`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_code`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tc_id`),
  ADD KEY `department` (`department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_courses`
--
ALTER TABLE `assigned_courses`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clearance`
--
ALTER TABLE `clearance`
  MODIFY `clearance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  MODIFY `prereq_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demographic_profile`
--
ALTER TABLE `demographic_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_courses`
--
ALTER TABLE `assigned_courses`
  ADD CONSTRAINT `assigned_courses_ibfk_1` FOREIGN KEY (`edp_code`) REFERENCES `offered_courses` (`edp_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `assigned_courses_ibfk_2` FOREIGN KEY (`tc_assigned`) REFERENCES `teachers` (`tc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assigned_courses_ibfk_3` FOREIGN KEY (`admin_responsible`) REFERENCES `admins` (`adm_id`) ON DELETE SET NULL;

--
-- Constraints for table `clearance`
--
ALTER TABLE `clearance`
  ADD CONSTRAINT `clearance_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clearance_ibfk_2` FOREIGN KEY (`tc_assigned`) REFERENCES `teachers` (`tc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clearance_ibfk_3` FOREIGN KEY (`edp_code`) REFERENCES `offered_courses` (`edp_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `clearance_ibfk_4` FOREIGN KEY (`course_code`) REFERENCES `offered_courses` (`course_code`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`program_code`) REFERENCES `programs` (`program_code`) ON DELETE SET NULL;

--
-- Constraints for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  ADD CONSTRAINT `course_prerequisites_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_prerequisites_ibfk_2` FOREIGN KEY (`prereq_course`) REFERENCES `courses` (`course_code`) ON DELETE CASCADE;

--
-- Constraints for table `demographic_profile`
--
ALTER TABLE `demographic_profile`
  ADD CONSTRAINT `demographic_profile_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `demographic_profile_ibfk_2` FOREIGN KEY (`program_enrolled`) REFERENCES `programs` (`program_code`) ON DELETE SET NULL;

--
-- Constraints for table `enrolled_courses`
--
ALTER TABLE `enrolled_courses`
  ADD CONSTRAINT `enrolled_courses_ibfk_1` FOREIGN KEY (`edp_code`) REFERENCES `offered_courses` (`edp_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrolled_courses_ibfk_2` FOREIGN KEY (`st_enrolled`) REFERENCES `students` (`st_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrolled_courses_ibfk_3` FOREIGN KEY (`admin_responsible`) REFERENCES `admins` (`adm_id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`edp_code`) REFERENCES `offered_courses` (`edp_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`course_code`) REFERENCES `offered_courses` (`course_code`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`edp_code`) REFERENCES `offered_courses` (`edp_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `offered_courses` (`course_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`) ON DELETE CASCADE;

--
-- Constraints for table `offered_courses`
--
ALTER TABLE `offered_courses`
  ADD CONSTRAINT `offered_courses_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `admins` (`adm_id`);

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`department`) REFERENCES `departments` (`dept_code`) ON DELETE SET NULL;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`department`) REFERENCES `departments` (`dept_code`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

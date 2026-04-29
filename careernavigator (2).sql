-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2026 at 07:54 PM
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
-- Database: `careernavigator`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_questions`
--

CREATE TABLE `assessment_questions` (
  `id` int(11) NOT NULL,
  `phase` int(11) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_questions`
--

INSERT INTO `assessment_questions` (`id`, `phase`, `career`, `difficulty`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `skill_id`) VALUES
(1, 1, NULL, 'easy', '5 + 7 = ?', '10', '11', '12', '13', 'C', 'numerical', NULL),
(2, 1, NULL, 'easy', '9 × 3 = ?', '21', '24', '27', '30', 'C', 'numerical', NULL),
(3, 1, NULL, 'easy', '15 - 6 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(4, 1, NULL, 'easy', '12 ÷ 3 = ?', '2', '3', '4', '5', 'C', 'numerical', NULL),
(5, 1, NULL, 'easy', 'Square of 6 = ?', '30', '32', '36', '40', 'C', 'numerical', NULL),
(6, 1, NULL, 'easy', '10 + 15 = ?', '20', '25', '30', '35', 'B', 'numerical', NULL),
(7, 1, NULL, 'easy', '20 - 8 = ?', '10', '11', '12', '13', 'C', 'numerical', NULL),
(8, 1, NULL, 'easy', '4 × 7 = ?', '26', '27', '28', '30', 'C', 'numerical', NULL),
(9, 1, NULL, 'easy', '18 ÷ 2 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(10, 1, NULL, 'easy', 'Cube of 3 = ?', '9', '18', '27', '36', 'C', 'numerical', NULL),
(11, 1, NULL, 'medium', 'What comes next? 2,4,6,8, ?', '9', '10', '11', '12', 'B', 'numerical', NULL),
(12, 1, NULL, 'medium', 'What comes next? 5,10,15,20, ?', '22', '23', '24', '25', 'D', 'numerical', NULL),
(13, 1, NULL, 'medium', 'What comes next? 3,6,9,12, ?', '14', '15', '16', '17', 'B', 'numerical', NULL),
(14, 1, NULL, 'medium', 'What comes next? 7,14,21,28, ?', '32', '34', '35', '36', 'C', 'numerical', NULL),
(15, 1, NULL, 'medium', 'What comes next? 1,4,9,16, ?', '20', '25', '30', '36', 'B', 'numerical', NULL),
(16, 1, NULL, 'easy', 'If CAT = DBU then DOG = ?', 'EPH', 'EPG', 'EOH', 'DPH', 'A', 'logical', NULL),
(17, 1, NULL, 'easy', 'Find odd one out', 'Apple', 'Banana', 'Carrot', 'Mango', 'C', 'logical', NULL),
(18, 1, NULL, 'easy', 'Which is largest?', '12', '21', '19', '17', 'B', 'logical', NULL),
(19, 1, NULL, 'easy', 'If 2=4, 3=9, 4=?', '12', '14', '16', '18', 'C', 'logical', NULL),
(20, 1, NULL, 'easy', 'Mirror of LEFT', 'TFEL', 'TFLE', 'TELF', 'FLET', 'A', 'logical', NULL),
(21, 1, NULL, 'medium', 'If A=1 B=2 then C=?', '2', '3', '4', '5', 'B', 'logical', NULL),
(22, 1, NULL, 'medium', 'Find next: 11,13,15,17, ?', '18', '19', '20', '21', 'B', 'logical', NULL),
(23, 1, NULL, 'medium', 'Odd number', '6', '9', '12', '15', 'A', 'logical', NULL),
(24, 1, NULL, 'medium', 'Even number', '7', '9', '11', '14', 'D', 'logical', NULL),
(25, 1, NULL, 'medium', 'Which is smallest?', '8', '5', '9', '7', 'B', 'logical', NULL),
(26, 1, NULL, 'easy', 'Synonym of Big', 'Small', 'Huge', 'Tiny', 'Short', 'B', 'verbal', NULL),
(27, 1, NULL, 'easy', 'Synonym of Fast', 'Quick', 'Slow', 'Late', 'Lazy', 'A', 'verbal', NULL),
(28, 1, NULL, 'easy', 'Opposite of Hot', 'Warm', 'Cold', 'Heat', 'Boil', 'B', 'verbal', NULL),
(29, 1, NULL, 'easy', 'Opposite of Happy', 'Joy', 'Smile', 'Sad', 'Excited', 'C', 'verbal', NULL),
(30, 1, NULL, 'easy', 'Plural of Child', 'Childs', 'Children', 'Childrens', 'Childes', 'B', 'verbal', NULL),
(31, 1, NULL, 'medium', '25 + 17 = ?', '40', '41', '42', '43', 'C', 'numerical', NULL),
(32, 1, NULL, 'medium', '30 - 12 = ?', '16', '17', '18', '19', 'C', 'numerical', NULL),
(33, 1, NULL, 'medium', '7 × 8 = ?', '54', '55', '56', '58', 'C', 'numerical', NULL),
(34, 1, NULL, 'medium', '45 ÷ 5 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(35, 1, NULL, 'medium', 'Square of 8', '60', '62', '64', '66', 'C', 'numerical', NULL),
(36, 1, NULL, 'medium', 'Next number 10,20,30, ?', '35', '40', '45', '50', 'B', 'numerical', NULL),
(37, 1, NULL, 'medium', 'Next number 1,3,5,7, ?', '8', '9', '10', '11', 'B', 'numerical', NULL),
(38, 1, NULL, 'medium', 'Next number 4,8,12,16, ?', '18', '19', '20', '22', 'C', 'numerical', NULL),
(39, 1, NULL, 'medium', 'Next number 6,12,18,24, ?', '28', '30', '32', '36', 'B', 'numerical', NULL),
(40, 1, NULL, 'medium', 'Next number 9,18,27, ?', '30', '36', '45', '54', 'B', 'numerical', NULL),
(41, 1, NULL, 'easy', 'Odd one', 'Tiger', 'Lion', 'Cow', 'Leopard', 'C', 'logical', NULL),
(42, 1, NULL, 'easy', 'Odd one', 'Car', 'Bus', 'Bike', 'Tree', 'D', 'logical', NULL),
(43, 1, NULL, 'easy', 'Odd one', 'Pen', 'Book', 'Pencil', 'Laptop', 'D', 'logical', NULL),
(44, 1, NULL, 'easy', 'Odd one', 'Red', 'Blue', 'Green', 'Dog', 'D', 'logical', NULL),
(45, 1, NULL, 'easy', 'Odd one', 'January', 'March', 'Monday', 'April', 'C', 'logical', NULL),
(46, 1, NULL, 'medium', 'Synonym of Smart', 'Intelligent', 'Weak', 'Lazy', 'Slow', 'A', 'verbal', NULL),
(47, 1, NULL, 'medium', 'Synonym of Begin', 'Start', 'Stop', 'Close', 'End', 'A', 'verbal', NULL),
(48, 1, NULL, 'medium', 'Opposite of Rich', 'Wealthy', 'Poor', 'Luxury', 'Gold', 'B', 'verbal', NULL),
(49, 1, NULL, 'medium', 'Opposite of Early', 'Soon', 'Late', 'Fast', 'First', 'B', 'verbal', NULL),
(50, 1, NULL, 'medium', 'Plural of Mouse', 'Mouses', 'Mice', 'Mouse', 'Mices', 'B', 'verbal', NULL),
(51, 1, NULL, 'easy', '6 + 9', '14', '15', '16', '17', 'B', 'numerical', NULL),
(52, 1, NULL, 'easy', '8 + 11', '18', '19', '20', '21', 'B', 'numerical', NULL),
(53, 1, NULL, 'easy', '14 - 5', '7', '8', '9', '10', 'C', 'numerical', NULL),
(54, 1, NULL, 'easy', '16 - 7', '7', '8', '9', '10', 'C', 'numerical', NULL),
(55, 1, NULL, 'easy', '3 × 9', '24', '25', '27', '30', 'C', 'numerical', NULL),
(56, 1, NULL, 'easy', '5 × 6', '28', '29', '30', '31', 'C', 'numerical', NULL),
(57, 1, NULL, 'easy', '8 × 4', '30', '31', '32', '33', 'C', 'numerical', NULL),
(58, 1, NULL, 'easy', '9 × 5', '40', '45', '48', '50', 'B', 'numerical', NULL),
(59, 1, NULL, 'easy', '36 ÷ 6', '5', '6', '7', '8', 'B', 'numerical', NULL),
(60, 1, NULL, 'easy', '49 ÷ 7', '5', '6', '7', '8', 'C', 'numerical', NULL),
(61, 1, NULL, 'medium', 'Next: 2,3,5,7, ?', '9', '10', '11', '12', 'C', 'logical', NULL),
(62, 1, NULL, 'medium', 'Next: 1,1,2,3,5, ?', '6', '7', '8', '9', 'C', 'logical', NULL),
(63, 1, NULL, 'medium', 'Next: 4,6,9,13, ?', '16', '17', '18', '19', 'C', 'logical', NULL),
(64, 1, NULL, 'medium', 'Next: 5,9,17,33, ?', '49', '55', '65', '70', 'C', 'logical', NULL),
(65, 1, NULL, 'medium', 'Next: 3,6,12,24, ?', '36', '42', '48', '60', 'C', 'logical', NULL),
(66, 1, NULL, 'easy', 'Opposite of Up', 'Above', 'Down', 'Top', 'High', 'B', 'verbal', NULL),
(67, 1, NULL, 'easy', 'Opposite of Open', 'Start', 'Close', 'Unlock', 'Wide', 'B', 'verbal', NULL),
(68, 1, NULL, 'easy', 'Synonym of Easy', 'Hard', 'Simple', 'Tough', 'Rough', 'B', 'verbal', NULL),
(69, 1, NULL, 'easy', 'Synonym of Clean', 'Dirty', 'Pure', 'Dust', 'Mess', 'B', 'verbal', NULL),
(70, 1, NULL, 'easy', 'Opposite of Light', 'Dark', 'Bright', 'Glow', 'Shine', 'A', 'verbal', NULL),
(71, 1, NULL, 'medium', '18 + 24', '40', '41', '42', '44', 'C', 'numerical', NULL),
(72, 1, NULL, 'medium', '50 - 19', '29', '30', '31', '32', 'C', 'numerical', NULL),
(73, 1, NULL, 'medium', '12 × 4', '44', '46', '48', '50', 'C', 'numerical', NULL),
(74, 1, NULL, 'medium', '64 ÷ 8', '6', '7', '8', '9', 'C', 'numerical', NULL),
(75, 1, NULL, 'medium', 'Square of 9', '72', '81', '90', '99', 'B', 'numerical', NULL),
(76, 1, NULL, 'easy', '5 + 7 = ?', '10', '11', '12', '13', 'C', 'numerical', NULL),
(77, 1, NULL, 'easy', '9 × 3 = ?', '21', '24', '27', '30', 'C', 'numerical', NULL),
(78, 1, NULL, 'easy', '15 - 6 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(79, 1, NULL, 'easy', '12 ÷ 3 = ?', '2', '3', '4', '5', 'C', 'numerical', NULL),
(80, 1, NULL, 'easy', 'Square of 6 = ?', '30', '32', '36', '40', 'C', 'numerical', NULL),
(81, 1, NULL, 'easy', '10 + 15 = ?', '20', '25', '30', '35', 'B', 'numerical', NULL),
(82, 1, NULL, 'easy', '20 - 8 = ?', '10', '11', '12', '13', 'C', 'numerical', NULL),
(83, 1, NULL, 'easy', '4 × 7 = ?', '26', '27', '28', '30', 'C', 'numerical', NULL),
(84, 1, NULL, 'easy', '18 ÷ 2 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(85, 1, NULL, 'easy', 'Cube of 3 = ?', '9', '18', '27', '36', 'C', 'numerical', NULL),
(86, 1, NULL, 'medium', 'What comes next? 2,4,6,8, ?', '9', '10', '11', '12', 'B', 'numerical', NULL),
(87, 1, NULL, 'medium', 'What comes next? 5,10,15,20, ?', '22', '23', '24', '25', 'D', 'numerical', NULL),
(88, 1, NULL, 'medium', 'What comes next? 3,6,9,12, ?', '14', '15', '16', '17', 'B', 'numerical', NULL),
(89, 1, NULL, 'medium', 'What comes next? 7,14,21,28, ?', '32', '34', '35', '36', 'C', 'numerical', NULL),
(90, 1, NULL, 'medium', 'What comes next? 1,4,9,16, ?', '20', '25', '30', '36', 'B', 'numerical', NULL),
(91, 1, NULL, 'easy', 'If CAT = DBU then DOG = ?', 'EPH', 'EPG', 'EOH', 'DPH', 'A', 'logical', NULL),
(92, 1, NULL, 'easy', 'Find odd one out', 'Apple', 'Banana', 'Carrot', 'Mango', 'C', 'logical', NULL),
(93, 1, NULL, 'easy', 'Which is largest?', '12', '21', '19', '17', 'B', 'logical', NULL),
(94, 1, NULL, 'easy', 'If 2=4, 3=9, 4=?', '12', '14', '16', '18', 'C', 'logical', NULL),
(95, 1, NULL, 'easy', 'Mirror of LEFT', 'TFEL', 'TFLE', 'TELF', 'FLET', 'A', 'logical', NULL),
(96, 1, NULL, 'medium', 'If A=1 B=2 then C=?', '2', '3', '4', '5', 'B', 'logical', NULL),
(97, 1, NULL, 'medium', 'Find next: 11,13,15,17, ?', '18', '19', '20', '21', 'B', 'logical', NULL),
(98, 1, NULL, 'medium', 'Odd number', '6', '9', '12', '15', 'A', 'logical', NULL),
(99, 1, NULL, 'medium', 'Even number', '7', '9', '11', '14', 'D', 'logical', NULL),
(100, 1, NULL, 'medium', 'Which is smallest?', '8', '5', '9', '7', 'B', 'logical', NULL),
(101, 1, NULL, 'easy', 'Synonym of Big', 'Small', 'Huge', 'Tiny', 'Short', 'B', 'verbal', NULL),
(102, 1, NULL, 'easy', 'Synonym of Fast', 'Quick', 'Slow', 'Late', 'Lazy', 'A', 'verbal', NULL),
(103, 1, NULL, 'easy', 'Opposite of Hot', 'Warm', 'Cold', 'Heat', 'Boil', 'B', 'verbal', NULL),
(104, 1, NULL, 'easy', 'Opposite of Happy', 'Joy', 'Smile', 'Sad', 'Excited', 'C', 'verbal', NULL),
(105, 1, NULL, 'easy', 'Plural of Child', 'Childs', 'Children', 'Childrens', 'Childes', 'B', 'verbal', NULL),
(106, 1, NULL, 'medium', '25 + 17 = ?', '40', '41', '42', '43', 'C', 'numerical', NULL),
(107, 1, NULL, 'medium', '30 - 12 = ?', '16', '17', '18', '19', 'C', 'numerical', NULL),
(108, 1, NULL, 'medium', '7 × 8 = ?', '54', '55', '56', '58', 'C', 'numerical', NULL),
(109, 1, NULL, 'medium', '45 ÷ 5 = ?', '7', '8', '9', '10', 'C', 'numerical', NULL),
(110, 1, NULL, 'medium', 'Square of 8', '60', '62', '64', '66', 'C', 'numerical', NULL),
(111, 1, NULL, 'medium', 'Next number 10,20,30, ?', '35', '40', '45', '50', 'B', 'numerical', NULL),
(112, 1, NULL, 'medium', 'Next number 1,3,5,7, ?', '8', '9', '10', '11', 'B', 'numerical', NULL),
(113, 1, NULL, 'medium', 'Next number 4,8,12,16, ?', '18', '19', '20', '22', 'C', 'numerical', NULL),
(114, 1, NULL, 'medium', 'Next number 6,12,18,24, ?', '28', '30', '32', '36', 'B', 'numerical', NULL),
(115, 1, NULL, 'medium', 'Next number 9,18,27, ?', '30', '36', '45', '54', 'B', 'numerical', NULL),
(116, 1, NULL, 'easy', 'Odd one', 'Tiger', 'Lion', 'Cow', 'Leopard', 'C', 'logical', NULL),
(117, 1, NULL, 'easy', 'Odd one', 'Car', 'Bus', 'Bike', 'Tree', 'D', 'logical', NULL),
(118, 1, NULL, 'easy', 'Odd one', 'Pen', 'Book', 'Pencil', 'Laptop', 'D', 'logical', NULL),
(119, 1, NULL, 'easy', 'Odd one', 'Red', 'Blue', 'Green', 'Dog', 'D', 'logical', NULL),
(120, 1, NULL, 'easy', 'Odd one', 'January', 'March', 'Monday', 'April', 'C', 'logical', NULL),
(121, 1, NULL, 'medium', 'Synonym of Smart', 'Intelligent', 'Weak', 'Lazy', 'Slow', 'A', 'verbal', NULL),
(122, 1, NULL, 'medium', 'Synonym of Begin', 'Start', 'Stop', 'Close', 'End', 'A', 'verbal', NULL),
(123, 1, NULL, 'medium', 'Opposite of Rich', 'Wealthy', 'Poor', 'Luxury', 'Gold', 'B', 'verbal', NULL),
(124, 1, NULL, 'medium', 'Opposite of Early', 'Soon', 'Late', 'Fast', 'First', 'B', 'verbal', NULL),
(125, 1, NULL, 'medium', 'Plural of Mouse', 'Mouses', 'Mice', 'Mouse', 'Mices', 'B', 'verbal', NULL),
(126, 1, NULL, 'easy', '6 + 9', '14', '15', '16', '17', 'B', 'numerical', NULL),
(127, 1, NULL, 'easy', '8 + 11', '18', '19', '20', '21', 'B', 'numerical', NULL),
(128, 1, NULL, 'easy', '14 - 5', '7', '8', '9', '10', 'C', 'numerical', NULL),
(129, 1, NULL, 'easy', '16 - 7', '7', '8', '9', '10', 'C', 'numerical', NULL),
(130, 1, NULL, 'easy', '3 × 9', '24', '25', '27', '30', 'C', 'numerical', NULL),
(131, 1, NULL, 'easy', '5 × 6', '28', '29', '30', '31', 'C', 'numerical', NULL),
(132, 1, NULL, 'easy', '8 × 4', '30', '31', '32', '33', 'C', 'numerical', NULL),
(133, 1, NULL, 'easy', '9 × 5', '40', '45', '48', '50', 'B', 'numerical', NULL),
(134, 1, NULL, 'easy', '36 ÷ 6', '5', '6', '7', '8', 'B', 'numerical', NULL),
(135, 1, NULL, 'easy', '49 ÷ 7', '5', '6', '7', '8', 'C', 'numerical', NULL),
(136, 1, NULL, 'medium', 'Next: 2,3,5,7, ?', '9', '10', '11', '12', 'C', 'logical', NULL),
(137, 1, NULL, 'medium', 'Next: 1,1,2,3,5, ?', '6', '7', '8', '9', 'C', 'logical', NULL),
(138, 1, NULL, 'medium', 'Next: 4,6,9,13, ?', '16', '17', '18', '19', 'C', 'logical', NULL),
(139, 1, NULL, 'medium', 'Next: 5,9,17,33, ?', '49', '55', '65', '70', 'C', 'logical', NULL),
(140, 1, NULL, 'medium', 'Next: 3,6,12,24, ?', '36', '42', '48', '60', 'C', 'logical', NULL),
(141, 1, NULL, 'easy', 'Opposite of Up', 'Above', 'Down', 'Top', 'High', 'B', 'verbal', NULL),
(142, 1, NULL, 'easy', 'Opposite of Open', 'Start', 'Close', 'Unlock', 'Wide', 'B', 'verbal', NULL),
(143, 1, NULL, 'easy', 'Synonym of Easy', 'Hard', 'Simple', 'Tough', 'Rough', 'B', 'verbal', NULL),
(144, 1, NULL, 'easy', 'Synonym of Clean', 'Dirty', 'Pure', 'Dust', 'Mess', 'B', 'verbal', NULL),
(145, 1, NULL, 'easy', 'Opposite of Light', 'Dark', 'Bright', 'Glow', 'Shine', 'A', 'verbal', NULL),
(146, 1, NULL, 'medium', '18 + 24', '40', '41', '42', '44', 'C', 'numerical', NULL),
(147, 1, NULL, 'medium', '50 - 19', '29', '30', '31', '32', 'C', 'numerical', NULL),
(148, 1, NULL, 'medium', '12 × 4', '44', '46', '48', '50', 'C', 'numerical', NULL),
(149, 1, NULL, 'medium', '64 ÷ 8', '6', '7', '8', '9', 'C', 'numerical', NULL),
(150, 1, NULL, 'medium', 'Square of 9', '72', '81', '90', '99', 'B', 'numerical', NULL),
(151, 1, NULL, 'difficult', 'If 3x + 5 = 20, what is x?', '3', '4', '5', '6', 'B', 'numerical', NULL),
(152, 1, NULL, 'difficult', 'Find the next number: 2, 6, 12, 20, 30, ?', '36', '40', '42', '48', 'C', 'numerical', NULL),
(153, 1, NULL, 'difficult', 'If 7y - 2 = 26, find y', '3', '4', '5', '6', 'D', 'numerical', NULL),
(154, 1, NULL, 'difficult', 'A train 120 m long passes a pole in 10 sec. Speed?', '10 m/s', '12 m/s', '15 m/s', '18 m/s', 'C', 'numerical', NULL),
(155, 1, NULL, 'difficult', 'Average of 5, 10, 15, 20, 25, 30?', '15', '17.5', '20', '22.5', 'B', 'numerical', NULL),
(156, 1, NULL, 'difficult', 'If 5^x = 125, x = ?', '2', '3', '4', '5', 'B', 'numerical', NULL),
(157, 1, NULL, 'difficult', '12% of 250 = ?', '25', '30', '35', '40', 'B', 'numerical', NULL),
(158, 1, NULL, 'difficult', 'Solve: (15 × 4) ÷ 3 + 6 = ?', '20', '26', '36', '46', 'B', 'numerical', NULL),
(159, 1, NULL, 'difficult', 'Next in series: 1,4,9,16,25, ?', '30', '35', '36', '49', 'C', 'numerical', NULL),
(160, 1, NULL, 'difficult', 'Find x: 2x/3 = 8', '10', '11', '12', '13', 'C', 'numerical', NULL),
(161, 1, NULL, 'difficult', 'If MONDAY = 1234567, FRIDAY = ?', '615427', '652174', '612547', '654217', 'D', 'logical', NULL),
(162, 1, NULL, 'difficult', 'Find odd one: 121, 144, 169, 196, 225, 256, 289', '144', '169', '196', '225', 'D', 'logical', NULL),
(163, 1, NULL, 'difficult', 'What comes next: 2, 6, 12, 20, 30, ?', '36', '40', '42', '48', 'C', 'logical', NULL),
(164, 1, NULL, 'difficult', 'If A=1, B=2,…Z=26, then CODE=?', '34', '36', '38', '40', 'B', 'logical', NULL),
(165, 1, NULL, 'difficult', 'Find missing: 3, 9, 27, ?, 243', '54', '72', '81', '90', 'C', 'logical', NULL),
(166, 1, NULL, 'difficult', 'Next in pattern: 5, 10, 20, 40, ?', '60', '70', '80', '80', 'D', 'logical', NULL),
(167, 1, NULL, 'difficult', 'If 2 pencils = 5 pens, 6 pencils = ? pens', '12', '15', '16', '18', 'B', 'logical', NULL),
(168, 1, NULL, 'difficult', 'Find odd one: 31, 37, 41, 47, 51', '31', '37', '41', '51', 'D', 'logical', NULL),
(169, 1, NULL, 'difficult', 'Letter series: Z, X, V, T, ?', 'R', 'S', 'Q', 'P', 'A', 'logical', NULL),
(170, 1, NULL, 'difficult', 'Next in series: 1,1,2,6,24, ?', '120', '100', '96', '144', 'A', 'logical', NULL),
(171, 1, NULL, 'difficult', 'Synonym of Abundant', 'Plentiful', 'Scarce', 'Rare', 'Little', 'A', 'verbal', NULL),
(172, 1, NULL, 'difficult', 'Antonym of Obscure', 'Clear', 'Dark', 'Hidden', 'Vague', 'A', 'verbal', NULL),
(173, 1, NULL, 'difficult', 'Which word does not belong?', 'Courage', 'Bravery', 'Fear', 'Valor', 'C', 'verbal', NULL),
(174, 1, NULL, 'difficult', 'Choose correct analogy: Book : Read :: Knife : ?', 'Cut', 'Sharp', 'Edge', 'Carve', 'A', 'verbal', NULL),
(175, 1, NULL, 'difficult', 'Opposite of Complex', 'Simple', 'Intricate', 'Difficult', 'Complicated', 'A', 'verbal', NULL),
(176, 2, NULL, 'difficult', 'I enjoy working on multiple tasks at the same time.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(177, 2, NULL, 'difficult', 'I prefer structured tasks over unstructured tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(178, 2, NULL, 'difficult', 'I handle stressful situations calmly.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(179, 2, NULL, 'difficult', 'I take initiative even when not asked.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(180, 2, NULL, 'difficult', 'I prefer working in a team rather than alone.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(181, 2, NULL, 'difficult', 'I enjoy analyzing complex problems.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(182, 2, NULL, 'difficult', 'I adapt quickly to changes in the work environment.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(183, 2, NULL, 'difficult', 'I prefer following rules than taking risks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(184, 2, NULL, 'difficult', 'I am good at understanding other people’s emotions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(185, 2, NULL, 'difficult', 'I enjoy making decisions quickly without overthinking.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(186, 2, NULL, 'difficult', 'I find it easy to motivate others.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(187, 2, NULL, 'difficult', 'I am comfortable handling criticism.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(188, 2, NULL, 'difficult', 'I like to plan my day in advance.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(189, 2, NULL, 'difficult', 'I often think about long-term consequences before acting.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(190, 2, NULL, 'difficult', 'I enjoy taking challenging tasks even if I might fail.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(191, 2, NULL, 'difficult', 'I handle unexpected problems efficiently.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(192, 2, NULL, 'difficult', 'I enjoy tasks that require creative thinking.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(193, 2, NULL, 'difficult', 'I remain calm when deadlines are tight.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(194, 2, NULL, 'difficult', 'I value accuracy more than speed in my work.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(195, 2, NULL, 'difficult', 'I enjoy taking leadership roles in group activities.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(196, 2, NULL, 'difficult', 'I prefer to solve problems independently.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(197, 2, NULL, 'difficult', 'I am comfortable working under pressure.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(198, 2, NULL, 'difficult', 'I can easily switch between tasks without losing focus.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(199, 2, NULL, 'difficult', 'I prefer tasks with clear instructions over vague tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(200, 2, NULL, 'difficult', 'I enjoy helping colleagues improve their performance.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(201, 2, NULL, 'difficult', 'I consider myself highly self-motivated.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(202, 2, NULL, 'easy', 'I enjoy socializing with new people.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(203, 2, NULL, 'easy', 'I feel comfortable asking for help when needed.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(204, 2, NULL, 'easy', 'I like routine tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(205, 2, NULL, 'easy', 'I enjoy working in groups.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(206, 2, NULL, 'easy', 'I am comfortable with new technology.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(207, 2, NULL, 'medium', 'I take time to consider all options before making a decision.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(208, 2, NULL, 'medium', 'I stay focused even when tasks are boring.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(209, 2, NULL, 'medium', 'I enjoy debating ideas with others.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(210, 2, NULL, 'medium', 'I like planning ahead for tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(211, 2, NULL, 'medium', 'I adapt my work style according to the team.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(212, 2, NULL, 'easy', 'I enjoy helping others with their tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(213, 2, NULL, 'easy', 'I like working independently.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(214, 2, NULL, 'easy', 'I feel energized when meeting new people.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(215, 2, NULL, 'easy', 'I prefer clear instructions before starting a task.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(216, 2, NULL, 'easy', 'I enjoy learning new skills.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(217, 2, NULL, 'easy', 'I handle stress well.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(218, 2, NULL, 'easy', 'I like variety in my work.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(219, 2, NULL, 'easy', 'I feel comfortable expressing my opinion.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(220, 2, NULL, 'easy', 'I am patient when solving problems.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(221, 2, NULL, 'easy', 'I prefer structured environments.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(222, 2, NULL, 'easy', 'I enjoy working on creative tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(223, 2, NULL, 'easy', 'I follow instructions carefully.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(224, 2, NULL, 'easy', 'I am a good listener.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(225, 2, NULL, 'easy', 'I feel motivated by challenges.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(226, 2, NULL, 'easy', 'I adapt easily to changes.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(227, 2, NULL, 'easy', 'I enjoy helping solve conflicts.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(228, 2, NULL, 'easy', 'I like to plan my day in advance.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(229, 2, NULL, 'easy', 'I am comfortable making decisions quickly.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(230, 2, NULL, 'easy', 'I am detail-oriented.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(231, 2, NULL, 'easy', 'I enjoy teaching or mentoring others.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(232, 2, NULL, 'easy', 'I prefer working with clear rules.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(233, 2, NULL, 'easy', 'I remain calm under pressure.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(234, 2, NULL, 'easy', 'I enjoy discussing abstract ideas.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(235, 2, NULL, 'easy', 'I like to take initiative in tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(236, 2, NULL, 'easy', 'I prefer working with others rather than alone.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(237, 2, NULL, 'easy', 'I stay organized in my daily life.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(238, 2, NULL, 'easy', 'I feel comfortable with uncertainty.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(239, 2, NULL, 'easy', 'I enjoy reading and learning new information.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(240, 2, NULL, 'easy', 'I prefer solving problems step by step.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(241, 2, NULL, 'easy', 'I enjoy being recognized for my achievements.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(242, 2, NULL, 'easy', 'I handle criticism well.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(243, 2, NULL, 'medium', 'I consider the long-term consequences before acting.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(244, 2, NULL, 'medium', 'I analyze data before drawing conclusions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(245, 2, NULL, 'medium', 'I enjoy solving complex problems.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(246, 2, NULL, 'medium', 'I like to take calculated risks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(247, 2, NULL, 'medium', 'I can manage multiple tasks efficiently.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(248, 2, NULL, 'medium', 'I am comfortable leading a team.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(249, 2, NULL, 'medium', 'I enjoy debates and defending my viewpoint.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'B', 'psychometric', NULL),
(250, 2, NULL, 'medium', 'I adapt my approach depending on the situation.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(251, 2, NULL, 'medium', 'I consider other people’s opinions before making decisions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(252, 2, NULL, 'medium', 'I enjoy learning new methodologies.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(253, 2, NULL, 'medium', 'I can stay focused on a task even when interrupted.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(254, 2, NULL, 'medium', 'I enjoy analyzing patterns in data or behavior.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(255, 2, NULL, 'medium', 'I prefer tasks that require creative problem solving.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(256, 2, NULL, 'medium', 'I am comfortable making decisions with incomplete information.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(257, 2, NULL, 'medium', 'I can remain calm in stressful situations.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(258, 2, NULL, 'medium', 'I enjoy explaining complex ideas to others.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(259, 2, NULL, 'medium', 'I think logically when solving problems.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(260, 2, NULL, 'medium', 'I can adapt quickly to unexpected changes.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(261, 2, NULL, 'medium', 'I often plan ahead to avoid mistakes.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(262, 2, NULL, 'medium', 'I enjoy exploring multiple solutions to a problem.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(263, 2, NULL, 'medium', 'I am confident expressing my ideas in a group.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(264, 2, NULL, 'medium', 'I evaluate situations carefully before acting.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(265, 2, NULL, 'medium', 'I enjoy challenging tasks that require critical thinking.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(266, 2, NULL, 'medium', 'I can handle multiple responsibilities simultaneously.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(267, 2, NULL, 'medium', 'I remain objective when making decisions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(268, 2, NULL, 'medium', 'I am comfortable working under deadlines.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(269, 2, NULL, 'medium', 'I enjoy tasks that require attention to detail.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(270, 2, NULL, 'medium', 'I can handle criticism without taking it personally.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(271, 2, NULL, 'medium', 'I enjoy collaborative problem-solving sessions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(272, 2, NULL, 'medium', 'I often think about long-term consequences of decisions.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(273, 2, NULL, 'medium', 'I am motivated to complete tasks even without supervision.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(274, 2, NULL, 'medium', 'I like exploring new ways to improve processes.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(275, 2, NULL, 'medium', 'I can balance creativity with practical constraints.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(276, 2, NULL, 'medium', 'I enjoy solving puzzles and logical challenges.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(277, 2, NULL, 'medium', 'I am capable of working independently on complex tasks.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(278, 2, NULL, 'medium', 'I adjust my behavior based on feedback from others.', 'Strongly Agree', 'Agree', 'Disagree', 'Strongly Disagree', 'A', 'psychometric', NULL),
(879, 3, 'Software Developer', 'easy', 'What does CPU stand for?', 'Central Processing Unit', 'Control Unit', 'Central Program Unit', 'Compute Unit', 'A', 'fundamentals', 1),
(880, 3, 'Software Developer', 'easy', 'Which is a programming language?', 'HTML', 'CSS', 'Python', 'XML', 'C', 'fundamentals', 1),
(881, 3, 'Software Developer', 'easy', 'What is RAM?', 'Storage', 'Memory', 'CPU', 'OS', 'B', 'fundamentals', 1),
(882, 3, 'Software Developer', 'medium', 'Which data structure uses FIFO?', 'Stack', 'Queue', 'Tree', 'Graph', 'B', 'dsa', 2),
(883, 3, 'Software Developer', 'medium', 'Which is used for backend?', 'HTML', 'CSS', 'Node.js', 'Figma', 'C', 'backend', 2),
(884, 3, 'Software Developer', 'medium', 'Which is database?', 'MySQL', 'HTML', 'CSS', 'JS', 'A', 'database', 2),
(885, 3, 'Software Developer', 'difficult', 'Binary search complexity?', 'O(n)', 'O(log n)', 'O(n log n)', 'O(1)', 'B', 'algorithms', 13),
(886, 3, 'Software Developer', 'difficult', 'Which is NoSQL DB?', 'MySQL', 'MongoDB', 'Oracle', 'Postgres', 'B', 'database', 6),
(887, 3, 'Software Developer', 'difficult', 'What is polymorphism?', 'Many forms', 'One form', 'None', 'Error', 'A', 'oop', 3),
(888, 3, 'Web Developer', 'easy', 'HTML stands for?', 'Hyper Text Markup Language', 'Hyper Tool', 'High Text', 'None', 'A', 'frontend', 10),
(889, 3, 'Web Developer', 'easy', 'CSS used for?', 'Logic', 'Styling', 'Database', 'Backend', 'B', 'frontend', 5),
(890, 3, 'Web Developer', 'easy', 'JS is?', 'Language', 'DB', 'OS', 'Tool', 'A', 'frontend', 1),
(891, 3, 'Web Developer', 'medium', 'React is?', 'Framework', 'Library', 'Language', 'DB', 'B', 'frontend', 7),
(892, 3, 'Web Developer', 'medium', 'REST API is?', 'Protocol', 'Architecture', 'Language', 'DB', 'B', 'backend', 5),
(893, 3, 'Web Developer', 'medium', 'Which for backend?', 'CSS', 'HTML', 'Node.js', 'Figma', 'C', 'backend', 5),
(894, 3, 'Web Developer', 'difficult', 'HTTP status 404?', 'OK', 'Error', 'Not Found', 'Server', 'C', 'web', 6),
(895, 3, 'Web Developer', 'difficult', 'JWT used for?', 'Auth', 'Design', 'DB', 'Testing', 'A', 'auth', 6),
(896, 3, 'Web Developer', 'difficult', 'DOM means?', 'Data Object Model', 'Document Object Model', 'Design Model', 'None', 'B', 'frontend', 6),
(897, 3, 'Data Scientist', 'easy', 'Python used for?', 'DS', 'HTML', 'CSS', 'UI', 'A', 'ds', 3),
(898, 3, 'Data Scientist', 'easy', 'Pandas used for?', 'Data', 'Design', 'UI', 'Backend', 'A', 'ds', 9),
(899, 3, 'Data Scientist', 'easy', 'CSV is?', 'File', 'DB', 'Code', 'API', 'A', 'ds', 7),
(900, 3, 'Data Scientist', 'medium', 'Overfitting means?', 'Simple model', 'Complex model', 'No data', 'Error', 'B', 'ml', 8),
(901, 3, 'Data Scientist', 'medium', 'Which is ML algo?', 'Regression', 'HTML', 'CSS', 'JS', 'A', 'ml', 10),
(902, 3, 'Data Scientist', 'medium', 'Train-test split?', 'Divide data', 'Delete data', 'Store data', 'None', 'A', 'ml', 8),
(903, 3, 'Data Scientist', 'difficult', 'KNN is?', 'Classification', 'Sorting', 'Searching', 'UI', 'A', 'ml', 9),
(904, 3, 'Data Scientist', 'difficult', 'Loss function?', 'Error measure', 'UI', 'DB', 'None', 'A', 'ml', 9),
(905, 3, 'Data Scientist', 'difficult', 'Gradient descent?', 'Optimization', 'Sorting', 'Search', 'None', 'A', 'ml', 9),
(906, 3, 'AI Engineer', 'easy', 'AI stands for?', 'Artificial Intelligence', 'Auto', 'Advanced', 'None', 'A', 'ai', 10),
(907, 3, 'AI Engineer', 'easy', 'ML is subset of?', 'AI', 'DB', 'UI', 'OS', 'A', 'ai', 10),
(908, 3, 'AI Engineer', 'easy', 'TensorFlow is?', 'Library', 'DB', 'UI', 'OS', 'A', 'ai', 10),
(909, 3, 'AI Engineer', 'medium', 'Neural network inspired by?', 'Brain', 'CPU', 'RAM', 'OS', 'A', 'ai', 10),
(910, 3, 'AI Engineer', 'medium', 'Supervised learning?', 'Labeled data', 'No data', 'Random', 'None', 'A', 'ai', 10),
(911, 3, 'AI Engineer', 'medium', 'Epoch means?', 'Iteration', 'Error', 'Model', 'None', 'A', 'ai', 10),
(912, 3, 'AI Engineer', 'difficult', 'Backpropagation?', 'Error correction', 'Forward', 'UI', 'DB', 'A', 'ai', 12),
(913, 3, 'AI Engineer', 'difficult', 'Activation function?', 'Output', 'Input', 'DB', 'None', 'A', 'ai', 12),
(914, 3, 'AI Engineer', 'difficult', 'CNN used for?', 'Images', 'Text', 'DB', 'None', 'A', 'ai', 12),
(915, 3, 'Cybersecurity Analyst', 'easy', 'Virus is?', 'Malware', 'Tool', 'OS', 'App', 'A', 'security', 13),
(916, 3, 'Cybersecurity Analyst', 'easy', 'Firewall used for?', 'Security', 'Speed', 'Design', 'DB', 'A', 'security', 13),
(917, 3, 'Cybersecurity Analyst', 'easy', 'HTTPS is?', 'Secure HTTP', 'Fast', 'UI', 'DB', 'A', 'security', 13),
(918, 3, 'Cybersecurity Analyst', 'medium', 'Phishing is?', 'Attack', 'Tool', 'OS', 'None', 'A', 'security', 14),
(919, 3, 'Cybersecurity Analyst', 'medium', 'Encryption?', 'Secure data', 'Delete data', 'Copy', 'None', 'A', 'security', 14),
(920, 3, 'Cybersecurity Analyst', 'medium', 'VPN used for?', 'Privacy', 'Speed', 'Design', 'None', 'A', 'security', 14),
(921, 3, 'Cybersecurity Analyst', 'difficult', 'SQL Injection?', 'DB attack', 'UI', 'OS', 'None', 'A', 'security', 6),
(922, 3, 'Cybersecurity Analyst', 'difficult', 'XSS attack?', 'Web attack', 'DB', 'OS', 'None', 'A', 'security', 15),
(923, 3, 'Cybersecurity Analyst', 'difficult', 'Zero-day?', 'Unknown bug', 'UI', 'DB', 'None', 'A', 'security', 15),
(924, 3, 'Software Developer', 'easy', 'What is an algorithm?', 'Step process', 'Language', 'Tool', 'DB', 'A', 'basics', 13),
(925, 3, 'Software Developer', 'easy', 'Which is OS?', 'Windows', 'HTML', 'CSS', 'JS', 'A', 'basics', 1),
(926, 3, 'Software Developer', 'medium', 'Stack follows?', 'FIFO', 'LIFO', 'Random', 'None', 'B', 'dsa', 2),
(927, 3, 'Software Developer', 'medium', 'Array index starts from?', '0', '1', '-1', '2', 'A', 'dsa', 2),
(928, 3, 'Software Developer', 'difficult', 'Merge sort complexity?', 'O(n)', 'O(log n)', 'O(n log n)', 'O(1)', 'C', 'algo', 3),
(929, 3, 'Software Developer', 'difficult', 'Recursion uses?', 'Stack', 'Queue', 'Tree', 'Graph', 'A', 'algo', 3),
(930, 3, 'Software Developer', 'easy', 'Compiler does?', 'Translate code', 'Run code', 'Delete code', 'Store code', 'A', 'basics', 1),
(931, 3, 'Software Developer', 'medium', 'Linked list uses?', 'Pointers', 'Arrays', 'Stack', 'Queue', 'A', 'dsa', 2),
(932, 3, 'Software Developer', 'difficult', 'Heap is?', 'Tree', 'Graph', 'Array', 'Stack', 'A', 'dsa', 3),
(933, 3, 'Software Developer', 'medium', 'Binary tree max children?', '2', '3', '4', '1', 'A', 'dsa', 2),
(934, 3, 'Web Developer', 'easy', 'HTML tag for link?', '<a>', '<p>', '<div>', '<h1>', 'A', 'frontend', 10),
(935, 3, 'Web Developer', 'easy', 'CSS property for color?', 'color', 'font', 'size', 'bg', 'A', 'frontend', 5),
(936, 3, 'Web Developer', 'medium', 'JS used for?', 'Logic', 'Style', 'DB', 'Server', 'A', 'frontend', 1),
(937, 3, 'Web Developer', 'medium', 'Local storage stores?', 'Data', 'Images', 'Code', 'CSS', 'A', 'frontend', 5),
(938, 3, 'Web Developer', 'difficult', 'Flexbox used for?', 'Layout', 'DB', 'Logic', 'API', 'A', 'frontend', 5),
(939, 3, 'Web Developer', 'difficult', 'Async JS means?', 'Non-blocking', 'Blocking', 'Sync', 'None', 'A', 'js', 1),
(940, 3, 'Web Developer', 'easy', 'HTML stands for?', 'Markup', 'Language', 'Tool', 'None', 'A', 'frontend', 10),
(941, 3, 'Web Developer', 'medium', 'API returns?', 'Data', 'UI', 'Style', 'DB', 'A', 'backend', 5),
(942, 3, 'Web Developer', 'difficult', 'CORS means?', 'Cross origin', 'Server', 'DB', 'None', 'A', 'web', 6),
(943, 3, 'Web Developer', 'medium', 'Bootstrap is?', 'Framework', 'Language', 'DB', 'OS', 'A', 'frontend', 5),
(944, 3, 'Data Scientist', 'easy', 'NumPy used for?', 'Arrays', 'UI', 'DB', 'OS', 'A', 'ds', 7),
(945, 3, 'Data Scientist', 'easy', 'Mean is?', 'Average', 'Sum', 'Median', 'Mode', 'A', 'stats', 7),
(946, 3, 'Data Scientist', 'medium', 'Variance measures?', 'Spread', 'Mean', 'Count', 'None', 'A', 'stats', 8),
(947, 3, 'Data Scientist', 'medium', 'Outlier is?', 'Extreme value', 'Average', 'Normal', 'None', 'A', 'stats', 8),
(948, 3, 'Data Scientist', 'difficult', 'PCA used for?', 'Dim reduction', 'Sorting', 'Search', 'None', 'A', 'ml', 9),
(949, 3, 'Data Scientist', 'difficult', 'Bias means?', 'Error', 'Accuracy', 'Data', 'None', 'A', 'ml', 9),
(950, 3, 'Data Scientist', 'easy', 'Dataset is?', 'Data collection', 'Code', 'UI', 'None', 'A', 'ds', 7),
(951, 3, 'Data Scientist', 'medium', 'Correlation shows?', 'Relation', 'Error', 'Size', 'None', 'A', 'stats', 8),
(952, 3, 'Data Scientist', 'difficult', 'Confusion matrix?', 'Evaluation', 'Training', 'Data', 'None', 'A', 'ml', 9),
(953, 3, 'Data Scientist', 'medium', 'Feature means?', 'Input', 'Output', 'Error', 'None', 'A', 'ml', 8),
(954, 3, 'AI Engineer', 'easy', 'AI example?', 'Chatbot', 'Table', 'Chair', 'Pen', 'A', 'ai', 10),
(955, 3, 'AI Engineer', 'easy', 'ML needs?', 'Data', 'UI', 'CSS', 'HTML', 'A', 'ai', 10),
(956, 3, 'AI Engineer', 'medium', 'Label means?', 'Output', 'Input', 'Error', 'None', 'A', 'ai', 11),
(957, 3, 'AI Engineer', 'medium', 'Model is?', 'Function', 'UI', 'DB', 'None', 'A', 'ai', 11),
(958, 3, 'AI Engineer', 'difficult', 'Overfitting occurs when?', 'Too complex', 'Too simple', 'No data', 'None', 'A', 'ai', 12),
(959, 3, 'AI Engineer', 'difficult', 'Underfitting means?', 'Too simple', 'Too complex', 'Perfect', 'None', 'A', 'ai', 12),
(960, 3, 'AI Engineer', 'easy', 'Dataset size?', 'Data count', 'UI', 'DB', 'None', 'A', 'ai', 10),
(961, 3, 'AI Engineer', 'medium', 'Epoch means?', 'Cycle', 'Error', 'Data', 'None', 'A', 'ai', 10),
(962, 3, 'AI Engineer', 'difficult', 'RNN used for?', 'Sequence', 'Image', 'DB', 'None', 'A', 'ai', 12),
(963, 3, 'AI Engineer', 'medium', 'Loss function?', 'Error', 'UI', 'DB', 'None', 'A', 'ai', 11),
(964, 3, 'Cybersecurity Analyst', 'easy', 'Password should be?', 'Strong', 'Weak', 'Short', 'None', 'A', 'security', 13),
(965, 3, 'Cybersecurity Analyst', 'easy', 'Antivirus does?', 'Protect', 'Delete', 'Store', 'None', 'A', 'security', 13),
(966, 3, 'Cybersecurity Analyst', 'medium', 'Malware is?', 'Harmful', 'Safe', 'UI', 'None', 'A', 'security', 14),
(967, 3, 'Cybersecurity Analyst', 'medium', 'Trojan is?', 'Malware', 'Tool', 'OS', 'None', 'A', 'security', 14),
(968, 3, 'Cybersecurity Analyst', 'difficult', 'Brute force attack?', 'Guessing', 'Coding', 'UI', 'None', 'A', 'security', 15),
(969, 3, 'Cybersecurity Analyst', 'difficult', 'Hashing is?', 'One-way', 'Two-way', 'UI', 'None', 'A', 'security', 15),
(970, 3, 'Cybersecurity Analyst', 'easy', 'Login needs?', 'Auth', 'CSS', 'HTML', 'None', 'A', 'security', 13),
(971, 3, 'Cybersecurity Analyst', 'medium', 'Spyware does?', 'Spy', 'Protect', 'Store', 'None', 'A', 'security', 14),
(972, 3, 'Cybersecurity Analyst', 'difficult', 'Encryption key?', 'Secret', 'Public', 'None', 'All', 'A', 'security', 15),
(973, 3, 'Cybersecurity Analyst', 'medium', '2FA means?', 'Two factor', 'Single', 'None', 'All', 'A', 'security', 14),
(974, 3, 'Cloud Engineer', 'easy', 'AWS is?', 'Cloud', 'OS', 'UI', 'DB', 'A', 'cloud', 16),
(975, 3, 'Cloud Engineer', 'easy', 'Cloud means?', 'Remote server', 'Local', 'UI', 'None', 'A', 'cloud', 16),
(976, 3, 'Cloud Engineer', 'medium', 'SaaS means?', 'Software service', 'Server', 'Storage', 'None', 'A', 'cloud', 17),
(977, 3, 'Cloud Engineer', 'medium', 'Storage service?', 'S3', 'EC2', 'Lambda', 'None', 'A', 'cloud', 17),
(978, 3, 'Cloud Engineer', 'difficult', 'Virtualization?', 'VM', 'UI', 'DB', 'None', 'A', 'cloud', 18),
(979, 3, 'Cloud Engineer', 'difficult', 'Auto scaling?', 'Scale', 'Stop', 'Delete', 'None', 'A', 'cloud', 18),
(980, 3, 'Cloud Engineer', 'easy', 'Cloud benefit?', 'Scalable', 'Slow', 'Local', 'None', 'A', 'cloud', 16),
(981, 3, 'Cloud Engineer', 'medium', 'Region means?', 'Location', 'Speed', 'DB', 'None', 'A', 'cloud', 17),
(982, 3, 'Cloud Engineer', 'difficult', 'Load balancer?', 'Distribute', 'Store', 'Delete', 'None', 'A', 'cloud', 18),
(983, 3, 'Cloud Engineer', 'medium', 'IaaS example?', 'EC2', 'S3', 'Lambda', 'None', 'A', 'cloud', 17),
(984, 3, 'DevOps Engineer', 'easy', 'Git used for?', 'Version control', 'UI', 'DB', 'None', 'A', 'devops', 11),
(985, 3, 'DevOps Engineer', 'easy', 'Docker is?', 'Container', 'DB', 'UI', 'None', 'A', 'devops', 19),
(986, 3, 'DevOps Engineer', 'medium', 'CI means?', 'Integration', 'Deployment', 'Design', 'None', 'A', 'devops', 20),
(987, 3, 'DevOps Engineer', 'medium', 'CD means?', 'Deployment', 'Design', 'DB', 'None', 'A', 'devops', 20),
(988, 3, 'DevOps Engineer', 'difficult', 'Kubernetes?', 'Orchestration', 'DB', 'UI', 'None', 'A', 'devops', 21),
(989, 3, 'DevOps Engineer', 'difficult', 'Pipeline is?', 'Automation', 'Manual', 'UI', 'None', 'A', 'devops', 3),
(990, 3, 'DevOps Engineer', 'easy', 'Repo means?', 'Repository', 'UI', 'DB', 'None', 'A', 'devops', 19),
(991, 3, 'DevOps Engineer', 'medium', 'Build means?', 'Compile', 'Run', 'Delete', 'None', 'A', 'devops', 20),
(992, 3, 'DevOps Engineer', 'difficult', 'YAML used for?', 'Config', 'UI', 'DB', 'None', 'A', 'devops', 10),
(993, 3, 'DevOps Engineer', 'medium', 'Monitoring tool?', 'Prometheus', 'HTML', 'CSS', 'None', 'A', 'devops', 20),
(994, 3, 'Mobile App Developer', 'easy', 'Android uses?', 'Java', 'HTML', 'CSS', 'SQL', 'A', 'mobile', 22),
(995, 3, 'Mobile App Developer', 'easy', 'APK is?', 'App file', 'Code', 'DB', 'None', 'A', 'mobile', 22),
(996, 3, 'Mobile App Developer', 'medium', 'iOS language?', 'Swift', 'Java', 'C', 'None', 'A', 'mobile', 23),
(997, 3, 'Mobile App Developer', 'medium', 'Flutter uses?', 'Dart', 'Python', 'Java', 'None', 'A', 'mobile', 23),
(998, 3, 'Mobile App Developer', 'difficult', 'Activity is?', 'Screen', 'DB', 'UI', 'None', 'A', 'mobile', 24),
(999, 3, 'Mobile App Developer', 'difficult', 'Fragment?', 'Component', 'DB', 'UI', 'None', 'A', 'mobile', 24),
(1000, 3, 'Mobile App Developer', 'easy', 'UI means?', 'Interface', 'Input', 'None', 'All', 'A', 'mobile', 22),
(1001, 3, 'Mobile App Developer', 'medium', 'Intent used for?', 'Navigation', 'UI', 'DB', 'None', 'A', 'mobile', 23),
(1002, 3, 'Mobile App Developer', 'difficult', 'Lifecycle?', 'States', 'DB', 'UI', 'None', 'A', 'mobile', 24),
(1003, 3, 'Mobile App Developer', 'medium', 'SDK means?', 'Kit', 'Code', 'DB', 'None', 'A', 'mobile', 23),
(1004, 3, 'UI/UX Designer', 'easy', 'UX means?', 'Experience', 'UI', 'DB', 'None', 'A', 'design', 25),
(1005, 3, 'UI/UX Designer', 'easy', 'Wireframe?', 'Layout', 'Code', 'DB', 'None', 'A', 'design', 25),
(1006, 3, 'UI/UX Designer', 'medium', 'Prototype?', 'Model', 'Code', 'DB', 'None', 'A', 'design', 26),
(1007, 3, 'UI/UX Designer', 'medium', 'User flow?', 'Steps', 'Code', 'DB', 'None', 'A', 'design', 26),
(1008, 3, 'UI/UX Designer', 'difficult', 'Heuristic?', 'Principle', 'Code', 'DB', 'None', 'A', 'design', 27),
(1009, 3, 'UI/UX Designer', 'difficult', 'Accessibility?', 'Usable', 'Code', 'DB', 'None', 'A', 'design', 27),
(1010, 3, 'UI/UX Designer', 'easy', 'Figma used for?', 'Design', 'Code', 'DB', 'None', 'A', 'design', 25),
(1011, 3, 'UI/UX Designer', 'medium', 'Persona?', 'User profile', 'Code', 'DB', 'None', 'A', 'design', 26),
(1012, 3, 'UI/UX Designer', 'difficult', 'A/B testing?', 'Compare', 'Code', 'DB', 'None', 'A', 'design', 27),
(1013, 3, 'UI/UX Designer', 'medium', 'Typography?', 'Fonts', 'Code', 'DB', 'None', 'A', 'design', 26),
(1014, 3, 'Network Engineer', 'easy', 'Router does?', 'Route', 'Store', 'Delete', 'None', 'A', 'network', 28),
(1015, 3, 'Network Engineer', 'easy', 'LAN means?', 'Local network', 'Wide', 'None', 'All', 'A', 'network', 28),
(1016, 3, 'Network Engineer', 'medium', 'IP address?', 'Identifier', 'UI', 'DB', 'None', 'A', 'network', 29),
(1017, 3, 'Network Engineer', 'medium', 'DNS resolves?', 'Domain', 'IP', 'UI', 'None', 'A', 'network', 29),
(1018, 3, 'Network Engineer', 'difficult', 'TCP is?', 'Protocol', 'UI', 'DB', 'None', 'A', 'network', 30),
(1019, 3, 'Network Engineer', 'difficult', 'UDP is?', 'Protocol', 'UI', 'DB', 'None', 'A', 'network', 30),
(1020, 3, 'Network Engineer', 'easy', 'Switch used for?', 'Connect', 'Store', 'Delete', 'None', 'A', 'network', 28),
(1021, 3, 'Network Engineer', 'medium', 'Subnet?', 'Network division', 'UI', 'DB', 'None', 'A', 'network', 29),
(1022, 3, 'Network Engineer', 'difficult', 'Firewall?', 'Security', 'UI', 'DB', 'None', 'A', 'network', 30),
(1023, 3, 'Network Engineer', 'medium', 'Bandwidth?', 'Capacity', 'UI', 'DB', 'None', 'A', 'network', 29),
(1024, 3, 'Software Developer', 'easy', 'What is variable?', 'Storage', 'Function', 'Loop', 'Class', 'A', 'basics', 1),
(1025, 3, 'Software Developer', 'easy', 'Loop used for?', 'Repeat', 'Store', 'Delete', 'Compile', 'A', 'basics', 1),
(1026, 3, 'Software Developer', 'medium', 'Which is loop?', 'for', 'if', 'switch', 'case', 'A', 'control', 2),
(1027, 3, 'Software Developer', 'medium', 'Function returns?', 'Value', 'Loop', 'Class', 'Object', 'A', 'control', 2),
(1028, 3, 'Software Developer', 'difficult', 'Time complexity of linear search?', 'O(n)', 'O(log n)', 'O(1)', 'O(n2)', 'A', 'algo', 3),
(1029, 3, 'Software Developer', 'difficult', 'DFS uses?', 'Stack', 'Queue', 'Array', 'Graph', 'A', 'algo', 3),
(1030, 3, 'Software Developer', 'easy', 'Boolean values?', 'True/False', '1/2', 'A/B', 'Yes/No', 'A', 'basics', 1),
(1031, 3, 'Software Developer', 'medium', 'Class is?', 'Blueprint', 'Object', 'Loop', 'Array', 'A', 'oop', 2),
(1032, 3, 'Software Developer', 'difficult', 'Encapsulation means?', 'Hide data', 'Show data', 'Delete data', 'Copy data', 'A', 'oop', 3),
(1033, 3, 'Software Developer', 'medium', 'Pointer stores?', 'Address', 'Value', 'Index', 'Loop', 'A', 'memory', 2),
(1034, 3, 'Software Developer', 'easy', 'Syntax error?', 'Code error', 'Logic', 'UI', 'None', 'A', 'basics', 16),
(1035, 3, 'Software Developer', 'medium', 'Switch used for?', 'Multiple cases', 'Loop', 'Array', 'None', 'A', 'control', 2);
INSERT INTO `assessment_questions` (`id`, `phase`, `career`, `difficulty`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `skill_id`) VALUES
(1036, 3, 'Software Developer', 'difficult', 'Graph cycle detection?', 'DFS', 'BFS', 'Stack', 'Queue', 'A', 'algo', 3),
(1037, 3, 'Software Developer', 'medium', 'String is?', 'Text', 'Number', 'Boolean', 'None', 'A', 'basics', 2),
(1038, 3, 'Software Developer', 'difficult', 'Hash table?', 'Key-value', 'Array', 'Stack', 'None', 'A', 'dsa', 3),
(1039, 3, 'Web Developer', 'easy', 'HTML heading tag?', '<h1>', '<p>', '<div>', '<span>', 'A', 'frontend', 10),
(1040, 3, 'Web Developer', 'easy', 'CSS margin used for?', 'Spacing', 'Color', 'Font', 'None', 'A', 'frontend', 5),
(1041, 3, 'Web Developer', 'medium', 'JS event?', 'Click', 'Style', 'DB', 'None', 'A', 'js', 1),
(1042, 3, 'Web Developer', 'medium', 'fetch() used for?', 'API call', 'Style', 'HTML', 'None', 'A', 'js', 5),
(1043, 3, 'Web Developer', 'difficult', 'Promise used for?', 'Async', 'Sync', 'Loop', 'None', 'A', 'js', 6),
(1044, 3, 'Web Developer', 'difficult', 'Closure means?', 'Function memory', 'UI', 'DB', 'None', 'A', 'js', 6),
(1045, 3, 'Web Developer', 'easy', 'Tag for image?', '<img>', '<p>', '<a>', '<h1>', 'A', 'frontend', 4),
(1046, 3, 'Web Developer', 'medium', 'CSS flex direction?', 'row', 'grid', 'block', 'none', 'A', 'frontend', 5),
(1047, 3, 'Web Developer', 'difficult', 'Webpack is?', 'Bundler', 'Server', 'DB', 'None', 'A', 'tools', 6),
(1048, 3, 'Web Developer', 'medium', 'Session used for?', 'User data', 'UI', 'Style', 'None', 'A', 'backend', 5),
(1049, 3, 'Data Scientist', 'easy', 'Median is?', 'Middle value', 'Average', 'Max', 'Min', 'A', 'stats', 7),
(1050, 3, 'Data Scientist', 'easy', 'Mode is?', 'Most frequent', 'Least', 'Avg', 'None', 'A', 'stats', 7),
(1051, 3, 'Data Scientist', 'medium', 'Standard deviation?', 'Spread', 'Mean', 'Sum', 'None', 'A', 'stats', 8),
(1052, 3, 'Data Scientist', 'medium', 'Normalization?', 'Scale', 'Sort', 'Filter', 'None', 'A', 'ml', 8),
(1053, 3, 'Data Scientist', 'difficult', 'Gradient?', 'Slope', 'Error', 'Value', 'None', 'A', 'ml', 9),
(1054, 3, 'Data Scientist', 'difficult', 'Cross-validation?', 'Evaluation', 'Training', 'Test', 'None', 'A', 'ml', 9),
(1055, 3, 'Data Scientist', 'easy', 'CSV stands for?', 'Comma separated', 'Code', 'Data', 'None', 'A', 'ds', 7),
(1056, 3, 'Data Scientist', 'medium', 'Sklearn is?', 'Library', 'Language', 'DB', 'None', 'A', 'ml', 8),
(1057, 3, 'Data Scientist', 'difficult', 'ROC curve?', 'Evaluation', 'Data', 'Code', 'None', 'A', 'ml', 9),
(1058, 3, 'AI Engineer', 'easy', 'AI system example?', 'Alexa', 'Table', 'Pen', 'Chair', 'A', 'ai', 10),
(1059, 3, 'AI Engineer', 'easy', 'Training data?', 'Input', 'Output', 'Error', 'None', 'A', 'ai', 10),
(1060, 3, 'AI Engineer', 'medium', 'Feature scaling?', 'Normalize', 'Delete', 'Sort', 'None', 'A', 'ai', 11),
(1061, 3, 'AI Engineer', 'medium', 'Classifier predicts?', 'Label', 'Value', 'Error', 'None', 'A', 'ai', 11),
(1062, 3, 'AI Engineer', 'difficult', 'Dropout used for?', 'Regularization', 'Speed', 'UI', 'None', 'A', 'ai', 12),
(1063, 3, 'AI Engineer', 'difficult', 'Batch size?', 'Data size', 'UI', 'DB', 'None', 'A', 'ai', 12),
(1064, 3, 'AI Engineer', 'easy', 'Prediction means?', 'Output', 'Input', 'Error', 'None', 'A', 'ai', 10),
(1065, 3, 'AI Engineer', 'medium', 'Accuracy means?', 'Correct rate', 'Error', 'Loss', 'None', 'A', 'ai', 11),
(1066, 3, 'AI Engineer', 'difficult', 'GAN used for?', 'Generate', 'Classify', 'Sort', 'None', 'A', 'ai', 12),
(1067, 3, 'Cybersecurity Analyst', 'easy', 'Secure password?', 'Complex', 'Simple', 'Short', 'None', 'A', 'security', 13),
(1068, 3, 'Cybersecurity Analyst', 'easy', 'Login attack?', 'Brute', 'UI', 'DB', 'None', 'A', 'security', 13),
(1069, 3, 'Cybersecurity Analyst', 'medium', 'Worm is?', 'Malware', 'Tool', 'App', 'None', 'A', 'security', 14),
(1070, 3, 'Cybersecurity Analyst', 'medium', 'DoS attack?', 'Overload', 'UI', 'DB', 'None', 'A', 'security', 14),
(1071, 3, 'Cybersecurity Analyst', 'difficult', 'Public key?', 'Encrypt', 'Decrypt', 'Both', 'None', 'C', 'security', 15),
(1072, 3, 'Cybersecurity Analyst', 'difficult', 'Private key?', 'Decrypt', 'Encrypt', 'Both', 'None', 'A', 'security', 15),
(1073, 3, 'Cloud Engineer', 'easy', 'Azure is?', 'Cloud', 'OS', 'UI', 'DB', 'A', 'cloud', 16),
(1074, 3, 'Cloud Engineer', 'easy', 'Cloud backup?', 'Data save', 'Delete', 'UI', 'None', 'A', 'cloud', 16),
(1075, 3, 'Cloud Engineer', 'medium', 'Lambda is?', 'Serverless', 'Storage', 'DB', 'None', 'A', 'cloud', 17),
(1076, 3, 'Cloud Engineer', 'medium', 'Container?', 'Isolated env', 'DB', 'UI', 'None', 'A', 'cloud', 17),
(1077, 3, 'Cloud Engineer', 'difficult', 'Microservices?', 'Small services', 'Large', 'DB', 'None', 'A', 'cloud', 18),
(1078, 3, 'Cloud Engineer', 'difficult', 'Cloud security?', 'Protect', 'Delete', 'Store', 'None', 'A', 'cloud', 18),
(1079, 3, 'DevOps Engineer', 'easy', 'CI tool?', 'Jenkins', 'HTML', 'CSS', 'None', 'A', 'devops', 19),
(1080, 3, 'DevOps Engineer', 'medium', 'Deploy means?', 'Release', 'Delete', 'Store', 'None', 'A', 'devops', 20),
(1081, 3, 'Mobile App Developer', 'easy', 'Android OS?', 'Mobile', 'Desktop', 'Server', 'None', 'A', 'mobile', 22),
(1082, 3, 'UI/UX Designer', 'medium', 'Usability means?', 'Ease', 'Hard', 'Complex', 'None', 'A', 'design', 26),
(1083, 3, 'Network Engineer', 'easy', 'IP means?', 'Address', 'Name', 'Code', 'None', 'A', 'network', 28),
(1084, 3, 'Network Engineer', 'difficult', 'OSI model layers?', '7', '5', '3', '4', 'A', 'network', 30);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_questions_backup`
--

CREATE TABLE `assessment_questions_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `phase` int(11) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_questions_backup`
--

INSERT INTO `assessment_questions_backup` (`id`, `phase`, `career`, `difficulty`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `skill_id`) VALUES
(279, 3, 'Software Developer', 'Easy', 'Which language do you enjoy coding in the most?', 'Python', 'Java', 'C++', 'JavaScript', NULL, 'Programming', NULL),
(280, 3, 'Software Developer', 'Medium', 'Do you enjoy solving algorithmic problems?', 'Yes', 'No', 'Sometimes', 'Not Sure', NULL, 'Programming', NULL),
(281, 3, 'Software Developer', 'Easy', 'Do you prefer front-end or back-end development?', 'Front-end', 'Back-end', 'Full-stack', 'No preference', NULL, 'Development', NULL),
(282, 3, 'Software Developer', 'Medium', 'Would you like to work on open-source projects?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(283, 3, 'Software Developer', 'Easy', 'Do you enjoy debugging code?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Programming', NULL),
(284, 3, 'Software Developer', 'Medium', 'Do you enjoy learning new programming languages?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Learning', NULL),
(285, 3, 'Software Developer', 'Medium', 'Do you prefer working alone or in a team?', 'Alone', 'Team', 'Depends on project', 'No preference', NULL, 'Work Environment', NULL),
(286, 3, 'Software Developer', 'Hard', 'Are you interested in developing scalable systems?', 'Yes', 'No', 'Somewhat', 'Not sure', NULL, 'System Design', NULL),
(287, 3, 'Software Developer', 'Medium', 'Do you enjoy optimizing code for performance?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Programming', NULL),
(288, 3, 'Software Developer', 'Easy', 'Would you like to contribute to large software projects?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(289, 3, 'Web Developer', 'Easy', 'Do you enjoy designing websites?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Design', NULL),
(290, 3, 'Web Developer', 'Medium', 'Do you prefer working on front-end or back-end?', 'Front-end', 'Back-end', 'Full-stack', 'No preference', NULL, 'Development', NULL),
(291, 3, 'Web Developer', 'Easy', 'Are you interested in responsive web design?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Design', NULL),
(292, 3, 'Web Developer', 'Medium', 'Do you like working with databases?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Development', NULL),
(293, 3, 'Web Developer', 'Easy', 'Would you like to work with JavaScript frameworks?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Programming', NULL),
(294, 3, 'Web Developer', 'Medium', 'Do you enjoy optimizing web performance?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Development', NULL),
(295, 3, 'Web Developer', 'Medium', 'Do you enjoy creating interactive web elements?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(296, 3, 'Web Developer', 'Hard', 'Do you like working with APIs and backend services?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Development', NULL),
(297, 3, 'Web Developer', 'Medium', 'Would you enjoy working on e-commerce websites?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(298, 3, 'Web Developer', 'Easy', 'Do you enjoy testing and debugging websites?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Testing', NULL),
(299, 3, 'Data Scientist', 'Easy', 'Do you enjoy analyzing large datasets?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Data Analysis', NULL),
(300, 3, 'Data Scientist', 'Medium', 'Do you enjoy statistical modeling?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Data Analysis', NULL),
(301, 3, 'Data Scientist', 'Medium', 'Are you interested in machine learning?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'ML', NULL),
(302, 3, 'Data Scientist', 'Hard', 'Do you enjoy data visualization?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Data Analysis', NULL),
(303, 3, 'Data Scientist', 'Medium', 'Would you like to work on predictive models?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'ML', NULL),
(304, 3, 'Data Scientist', 'Medium', 'Do you like cleaning and preparing data?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Data Analysis', NULL),
(305, 3, 'Data Scientist', 'Easy', 'Do you enjoy writing reports based on data insights?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Communication', NULL),
(306, 3, 'Data Scientist', 'Hard', 'Are you interested in deep learning techniques?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'ML', NULL),
(307, 3, 'Data Scientist', 'Medium', 'Do you enjoy exploratory data analysis?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Data Analysis', NULL),
(308, 3, 'Data Scientist', 'Easy', 'Do you like working with Python or R for analysis?', 'Python', 'R', 'Both', 'Neither', NULL, 'Programming', NULL),
(309, 3, 'AI Engineer', 'Medium', 'Do you enjoy building intelligent systems?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'AI', NULL),
(310, 3, 'AI Engineer', 'Hard', 'Are you interested in neural networks?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'AI', NULL),
(311, 3, 'AI Engineer', 'Medium', 'Do you enjoy natural language processing tasks?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'AI', NULL),
(312, 3, 'AI Engineer', 'Medium', 'Do you enjoy computer vision projects?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'AI', NULL),
(313, 3, 'AI Engineer', 'Hard', 'Are you interested in reinforcement learning?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'AI', NULL),
(314, 3, 'AI Engineer', 'Medium', 'Do you enjoy deploying AI models?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'AI', NULL),
(315, 3, 'AI Engineer', 'Medium', 'Do you like working with TensorFlow or PyTorch?', 'TensorFlow', 'PyTorch', 'Both', 'Neither', NULL, 'Programming', NULL),
(316, 3, 'AI Engineer', 'Medium', 'Do you enjoy improving AI model accuracy?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'AI', NULL),
(317, 3, 'AI Engineer', 'Hard', 'Do you enjoy research in AI?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Research', NULL),
(318, 3, 'AI Engineer', 'Medium', 'Do you like collaborating with data scientists and software engineers?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Work Environment', NULL),
(319, 3, 'Cybersecurity Analyst', 'Medium', 'Do you enjoy identifying security vulnerabilities?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Security', NULL),
(320, 3, 'Cybersecurity Analyst', 'Medium', 'Do you enjoy penetration testing?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Security', NULL),
(321, 3, 'Cybersecurity Analyst', 'Easy', 'Are you interested in network security?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Security', NULL),
(322, 3, 'Cybersecurity Analyst', 'Medium', 'Do you like monitoring security alerts?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Security', NULL),
(323, 3, 'Cybersecurity Analyst', 'Hard', 'Would you enjoy investigating security breaches?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Security', NULL),
(324, 3, 'Cybersecurity Analyst', 'Medium', 'Do you like learning new security tools?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Learning', NULL),
(325, 3, 'Cybersecurity Analyst', 'Medium', 'Do you enjoy ethical hacking challenges?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Security', NULL),
(326, 3, 'Cybersecurity Analyst', 'Hard', 'Do you enjoy creating security policies?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Policy', NULL),
(327, 3, 'Cybersecurity Analyst', 'Medium', 'Do you enjoy incident response tasks?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Security', NULL),
(328, 3, 'Cybersecurity Analyst', 'Easy', 'Would you like to work in cybersecurity for financial institutions?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(329, 3, 'Cloud Engineer', 'Medium', 'Do you enjoy working with cloud platforms like AWS or Azure?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Cloud', NULL),
(330, 3, 'Cloud Engineer', 'Medium', 'Do you like configuring servers and virtual machines?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Cloud', NULL),
(331, 3, 'Cloud Engineer', 'Hard', 'Do you enjoy designing scalable cloud architectures?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Cloud', NULL),
(332, 3, 'Cloud Engineer', 'Medium', 'Are you interested in cloud security practices?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Security', NULL),
(333, 3, 'Cloud Engineer', 'Medium', 'Do you like automating cloud infrastructure?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Automation', NULL),
(334, 3, 'Cloud Engineer', 'Medium', 'Would you enjoy working on hybrid cloud systems?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Cloud', NULL),
(335, 3, 'Cloud Engineer', 'Hard', 'Do you like monitoring cloud performance and uptime?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Monitoring', NULL),
(336, 3, 'Cloud Engineer', 'Medium', 'Do you enjoy troubleshooting cloud deployments?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Troubleshooting', NULL),
(337, 3, 'Cloud Engineer', 'Medium', 'Do you like learning new cloud technologies?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Learning', NULL),
(338, 3, 'Cloud Engineer', 'Easy', 'Would you enjoy working in cloud consulting?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(339, 3, 'DevOps Engineer', 'Medium', 'Do you enjoy automating deployment processes?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Automation', NULL),
(340, 3, 'DevOps Engineer', 'Medium', 'Do you like monitoring system performance?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Monitoring', NULL),
(341, 3, 'DevOps Engineer', 'Medium', 'Are you interested in CI/CD pipelines?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Automation', NULL),
(342, 3, 'DevOps Engineer', 'Hard', 'Do you enjoy troubleshooting server issues?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Troubleshooting', NULL),
(343, 3, 'DevOps Engineer', 'Medium', 'Would you like working with containerization tools like Docker?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Containers', NULL),
(344, 3, 'DevOps Engineer', 'Medium', 'Do you enjoy collaboration between development and operations teams?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Collaboration', NULL),
(345, 3, 'DevOps Engineer', 'Medium', 'Do you enjoy scripting to automate tasks?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Scripting', NULL),
(346, 3, 'DevOps Engineer', 'Medium', 'Are you interested in cloud-based DevOps practices?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Cloud', NULL),
(347, 3, 'DevOps Engineer', 'Hard', 'Do you enjoy analyzing system logs for issues?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Monitoring', NULL),
(348, 3, 'DevOps Engineer', 'Medium', 'Would you like working in a fast-paced DevOps environment?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(349, 3, 'Mobile App Developer', 'Easy', 'Do you enjoy building apps for Android or iOS?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Development', NULL),
(350, 3, 'Mobile App Developer', 'Medium', 'Do you like designing app interfaces?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'UI/UX', NULL),
(351, 3, 'Mobile App Developer', 'Medium', 'Are you interested in app performance optimization?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Development', NULL),
(352, 3, 'Mobile App Developer', 'Medium', 'Do you enjoy testing mobile applications?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Testing', NULL),
(353, 3, 'Mobile App Developer', 'Medium', 'Would you like to work with cross-platform frameworks like Flutter?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Development', NULL),
(354, 3, 'Mobile App Developer', 'Medium', 'Do you enjoy integrating APIs into apps?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Integration', NULL),
(355, 3, 'Mobile App Developer', 'Medium', 'Do you like debugging mobile apps?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Debugging', NULL),
(356, 3, 'Mobile App Developer', 'Medium', 'Are you interested in app security practices?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Security', NULL),
(357, 3, 'Mobile App Developer', 'Medium', 'Do you enjoy collaborating with designers and testers?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Collaboration', NULL),
(358, 3, 'Mobile App Developer', 'Easy', 'Would you like to work on gaming or utility apps?', 'Gaming', 'Utility', 'Both', 'Neither', NULL, 'App Type', NULL),
(359, 3, 'UI/UX Designer', 'Easy', 'Do you enjoy designing visually appealing interfaces?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(360, 3, 'UI/UX Designer', 'Medium', 'Do you like conducting user research?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Research', NULL),
(361, 3, 'UI/UX Designer', 'Medium', 'Are you interested in prototyping user interfaces?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(362, 3, 'UI/UX Designer', 'Medium', 'Do you enjoy creating wireframes and mockups?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(363, 3, 'UI/UX Designer', 'Medium', 'Would you like to work on improving usability?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Usability', NULL),
(364, 3, 'UI/UX Designer', 'Medium', 'Do you enjoy collaborating with developers?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Collaboration', NULL),
(365, 3, 'UI/UX Designer', 'Medium', 'Do you like working on responsive designs?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(366, 3, 'UI/UX Designer', 'Medium', 'Are you interested in accessibility and inclusive design?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Design', NULL),
(367, 3, 'UI/UX Designer', 'Medium', 'Do you enjoy testing designs with real users?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Testing', NULL),
(368, 3, 'UI/UX Designer', 'Easy', 'Would you like to work in a design agency or startup?', 'Agency', 'Startup', 'Both', 'Neither', NULL, 'Work Environment', NULL),
(369, 3, 'Network Engineer', 'Medium', 'Do you enjoy configuring routers and switches?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Networking', NULL),
(370, 3, 'Network Engineer', 'Medium', 'Do you like monitoring network traffic?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Monitoring', NULL),
(371, 3, 'Network Engineer', 'Medium', 'Are you interested in network security?', 'Yes', 'No', 'Sometimes', 'Not sure', NULL, 'Security', NULL),
(372, 3, 'Network Engineer', 'Medium', 'Do you enjoy troubleshooting connectivity issues?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Troubleshooting', NULL),
(373, 3, 'Network Engineer', 'Medium', 'Would you like working with wireless networks?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Networking', NULL),
(374, 3, 'Network Engineer', 'Medium', 'Do you enjoy designing network topologies?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Design', NULL),
(375, 3, 'Network Engineer', 'Medium', 'Do you like working with firewalls and VPNs?', 'Yes', 'No', 'Sometimes', 'Rarely', NULL, 'Security', NULL),
(376, 3, 'Network Engineer', 'Medium', 'Are you interested in cloud networking?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Cloud', NULL),
(377, 3, 'Network Engineer', 'Medium', 'Do you enjoy documenting network configurations?', 'Yes', 'No', 'Sometimes', 'Depends', NULL, 'Documentation', NULL),
(378, 3, 'Network Engineer', 'Easy', 'Would you like to work in an IT infrastructure team?', 'Yes', 'No', 'Maybe', 'Not sure', NULL, 'Work Environment', NULL),
(379, 3, 'Software Developer', 'Easy', 'What is the output of: print(2 + 3 * 4)?', '14', '20', '24', '10', '14', 'Programming', NULL),
(380, 3, 'Software Developer', 'Easy', 'Which of the following is immutable in Python?', 'List', 'Dictionary', 'Tuple', 'Set', 'Tuple', 'Programming', NULL),
(381, 3, 'Software Developer', 'Easy', 'Which data type is used to store true/false values?', 'String', 'Boolean', 'Integer', 'Float', 'Boolean', 'Programming', NULL),
(382, 3, 'Software Developer', 'Easy', 'What is the keyword to define a function in Python?', 'def', 'func', 'function', 'lambda', 'def', 'Programming', NULL),
(383, 3, 'Software Developer', 'Easy', 'Which of the following is a loop in Python?', 'for', 'if', 'switch', 'case', 'for', 'Programming', NULL),
(384, 3, 'Software Developer', 'Easy', 'Which operator is used for integer division in Python?', '/', '//', '%', '**', '//', 'Programming', NULL),
(385, 3, 'Software Developer', 'Easy', 'What symbol is used for single-line comments in Python?', '#', '//', '<!--', '--', '#', 'Programming', NULL),
(386, 3, 'Software Developer', 'Easy', 'Which method adds an element to a list?', 'append()', 'add()', 'insert()', 'extend()', 'append()', 'Data Structures', NULL),
(387, 3, 'Software Developer', 'Easy', 'Which keyword is used to handle exceptions?', 'try', 'except', 'catch', 'finally', 'try', 'Error Handling', NULL),
(388, 3, 'Software Developer', 'Easy', 'Which built-in function returns the length of a string?', 'len()', 'length()', 'size()', 'count()', 'len()', 'Programming', NULL),
(389, 3, 'Software Developer', 'Easy', 'Which operator is used for exponentiation in Python?', '*', '**', '^', '//', '**', 'Programming', NULL),
(390, 3, 'Software Developer', 'Easy', 'Which of these is used to create a set in Python?', '{}', '[]', '()', '<>', '{}', 'Data Structures', NULL),
(391, 3, 'Software Developer', 'Easy', 'Which statement is used to exit a loop prematurely?', 'stop', 'break', 'exit', 'continue', 'break', 'Programming', NULL),
(392, 3, 'Software Developer', 'Easy', 'What does IDE stand for?', 'Integrated Development Environment', 'Internal Debug Engine', 'Internet Data Environment', 'Immediate Development Execution', 'Integrated', 'Tools', NULL),
(393, 3, 'Software Developer', 'Easy', 'Which keyword is used to create a class?', 'class', 'def', 'object', 'struct', 'class', 'OOP', NULL),
(394, 3, 'Software Developer', 'Easy', 'Which Python keyword defines an anonymous function?', 'lambda', 'def', 'func', 'anon', 'lambda', 'Programming', NULL),
(395, 3, 'Software Developer', 'Easy', 'Which of the following is a Python tuple?', '(1,2,3)', '[1,2,3]', '{1,2,3}', '<1,2,3>', '(1,2,3)', 'Data Structures', NULL),
(396, 3, 'Software Developer', 'Easy', 'Which Python statement is used to import a module?', 'import', 'include', 'require', 'using', 'import', 'Programming', NULL),
(397, 3, 'Software Developer', 'Easy', 'Which of these is a valid Python variable name?', '_data', '2data', 'data-2', 'data 2', '_data', 'Programming', NULL),
(398, 3, 'Software Developer', 'Easy', 'Which method converts a string to lowercase?', 'lower()', 'tolower()', 'downcase()', 'small()', 'lower()', 'Programming', NULL),
(399, 3, 'Software Developer', 'Medium', 'Which data structure is best for implementing a LRU cache?', 'Stack', 'Queue', 'HashMap + Doubly Linked List', 'Linked List', 'HashMap + ', 'Data Structures', NULL),
(400, 3, 'Software Developer', 'Medium', 'What does MVC stand for in software design?', 'Model View Controller', 'Main Variable Control', 'Module Version Control', 'Memory Value Control', 'Model View', 'Software Design', NULL),
(401, 3, 'Software Developer', 'Medium', 'Which algorithm has the best average-case performance for sorting large datasets?', 'Bubble Sort', 'Quick Sort', 'Selection Sort', 'Insertion Sort', 'Quick Sort', 'Algorithms', NULL),
(402, 3, 'Software Developer', 'Medium', 'Which method removes duplicates from a list?', 'remove_duplicates()', 'set()', 'unique()', 'distinct()', 'set()', 'Data Structures', NULL),
(403, 3, 'Software Developer', 'Medium', 'Which statement about Python lists is true?', 'Lists are immutable', 'Lists can store heterogeneous elements', 'Lists are fixed-size', 'Lists cannot contain duplicates', 'Lists can ', 'Data Structures', NULL),
(404, 3, 'Software Developer', 'Medium', 'Which operator is used for floor division in Python?', '/', '//', '%', '**', '//', 'Programming', NULL),
(405, 3, 'Software Developer', 'Medium', 'What is polymorphism in OOP?', 'Encapsulation', 'Inheritance', 'Overloading & Overriding', 'Abstraction', 'Overloadin', 'OOP', NULL),
(406, 3, 'Software Developer', 'Medium', 'Which exception is raised when a file is not found?', 'FileNotFoundError', 'IOError', 'NameError', 'ValueError', 'FileNotFou', 'Error Handling', NULL),
(407, 3, 'Software Developer', 'Medium', 'Which method adds elements from an iterable to a list?', 'append()', 'extend()', 'insert()', 'add()', 'extend()', 'Data Structures', NULL),
(408, 3, 'Software Developer', 'Medium', 'Which keyword is used to define a generator?', 'yield', 'return', 'generate', 'function', 'yield', 'Programming', NULL),
(409, 3, 'Software Developer', 'Medium', 'What is the output of: print([i for i in range(3)])?', '[0,1,2]', '[1,2,3]', '(0,1,2)', '{0,1,2}', '[0,1,2]', 'Programming', NULL),
(410, 3, 'Software Developer', 'Medium', 'Which is a mutable sequence type in Python?', 'Tuple', 'List', 'String', 'Int', 'List', 'Data Structures', NULL),
(411, 3, 'Software Developer', 'Medium', 'What is the purpose of unit testing?', 'Debugging', 'Verify individual units of code', 'Optimize performance', 'Refactor code', 'Verify ind', 'Testing', NULL),
(412, 3, 'Software Developer', 'Medium', 'Which built-in function returns the maximum element of a list?', 'max()', 'maximum()', 'top()', 'largest()', 'max()', 'Programming', NULL),
(413, 3, 'Software Developer', 'Medium', 'Which Python module is used for regular expressions?', 'regex', 're', 'express', 'pattern', 're', 'Programming', NULL),
(414, 3, 'Software Developer', 'Medium', 'Which of these is a deep copy in Python?', 'copy()', 'deepcopy()', 'shallowcopy()', 'clone()', 'deepcopy()', 'Data Structures', NULL),
(415, 3, 'Software Developer', 'Medium', 'What is duck typing?', 'Checking types explicitly', 'Behavior-based type checking', 'Inheriting from duck class', 'Casting objects', 'Behavior-b', 'OOP', NULL),
(416, 3, 'Software Developer', 'Medium', 'Which Python function converts a string to an integer?', 'int()', 'str()', 'float()', 'convert()', 'int()', 'Programming', NULL),
(417, 3, 'Software Developer', 'Medium', 'Which Python collection type is unordered and mutable?', 'List', 'Set', 'Tuple', 'String', 'Set', 'Data Structures', NULL),
(418, 3, 'Software Developer', 'Medium', 'Which design principle promotes minimal coupling?', 'DRY', 'SOLID', 'KISS', 'Law of Demeter', 'Law of Dem', 'Software Design', NULL),
(419, 3, 'Software Developer', 'Hard', 'Which of these is a common issue with multithreading?', 'Deadlock', 'Syntax Error', 'Memory Leak', 'Null Pointer', 'Deadlock', 'Advanced Programming', NULL),
(420, 3, 'Software Developer', 'Hard', 'What is the main purpose of dependency injection?', 'Reduce coupling', 'Increase performance', 'Encrypt data', 'Debug code', 'Reduce cou', 'Software Design', NULL),
(421, 3, 'Software Developer', 'Hard', 'Which algorithm is used for finding shortest paths in a weighted graph?', 'DFS', 'BFS', 'Dijkstra', 'Prim', 'Dijkstra', 'Algorithms', NULL),
(422, 3, 'Software Developer', 'Hard', 'Which design pattern is used to ensure a class has only one instance?', 'Observer', 'Singleton', 'Factory', 'Decorator', 'Singleton', 'Software Design', NULL),
(423, 3, 'Software Developer', 'Hard', 'Which of these is a thread-safe data structure in Python?', 'List', 'Queue.Queue', 'Dictionary', 'Set', 'Queue.Queu', 'Advanced Programming', NULL),
(424, 3, 'Software Developer', 'Hard', 'Which operator has the highest precedence in Python?', '+', '**', '*', '%', '**', 'Programming', NULL),
(425, 3, 'Software Developer', 'Hard', 'Which Python feature allows dynamic method calls?', 'Polymorphism', 'Reflection', 'Introspection', 'Abstraction', 'Introspect', 'Advanced Programming', NULL),
(426, 3, 'Software Developer', 'Hard', 'Which sorting algorithm guarantees O(n log n) worst-case?', 'Quick Sort', 'Merge Sort', 'Heap Sort', 'Bubble Sort', 'Merge Sort', 'Algorithms', NULL),
(427, 3, 'Software Developer', 'Hard', 'Which Python standard library is used for asynchronous programming?', 'asyncio', 'threading', 'multiprocessing', 'queue', 'asyncio', 'Advanced Programming', NULL),
(428, 3, 'Software Developer', 'Hard', 'Which data structure is best for implementing a priority queue?', 'Stack', 'Queue', 'Heap', 'Linked List', 'Heap', 'Data Structures', NULL),
(429, 3, 'Web Developer', 'Easy', 'Which tag is used to create a hyperlink in HTML?', '<a>', '<link>', '<href>', '<hyper>', '<a>', 'HTML', NULL),
(430, 3, 'Web Developer', 'Easy', 'Which HTML tag defines the largest heading?', '<h1>', '<h6>', '<head>', '<title>', '<h1>', 'HTML', NULL),
(431, 3, 'Web Developer', 'Easy', 'Which attribute specifies an image source in HTML?', 'src', 'href', 'link', 'source', 'src', 'HTML', NULL),
(432, 3, 'Web Developer', 'Easy', 'Which CSS property changes text color?', 'font-color', 'color', 'text-color', 'foreground', 'color', 'CSS', NULL),
(433, 3, 'Web Developer', 'Easy', 'Which CSS property adds space inside an element?', 'margin', 'padding', 'border', 'spacing', 'padding', 'CSS', NULL),
(434, 3, 'Web Developer', 'Easy', 'Which HTML element is used for a paragraph?', '<p>', '<para>', '<paragraph>', '<text>', '<p>', 'HTML', NULL),
(435, 3, 'Web Developer', 'Easy', 'Which symbol is used for class selectors in CSS?', '.', '#', '*', '&', '.', 'CSS', NULL),
(436, 3, 'Web Developer', 'Easy', 'Which attribute in HTML defines alternative text for an image?', 'alt', 'title', 'text', 'src', 'alt', 'HTML', NULL),
(437, 3, 'Web Developer', 'Easy', 'Which tag is used to create a table row?', '<tr>', '<td>', '<table>', '<row>', '<tr>', 'HTML', NULL),
(438, 3, 'Web Developer', 'Easy', 'Which CSS property changes the font size?', 'text-size', 'font-size', 'font-style', 'size', 'font-size', 'CSS', NULL),
(439, 3, 'Web Developer', 'Easy', 'Which HTML tag is used to define an unordered list?', '<ul>', '<ol>', '<li>', '<list>', '<ul>', 'HTML', NULL),
(440, 3, 'Web Developer', 'Easy', 'Which HTML tag defines a clickable button?', '<button>', '<input>', '<click>', '<btn>', '<button>', 'HTML', NULL),
(441, 3, 'Web Developer', 'Easy', 'Which CSS property changes background color?', 'background', 'bgcolor', 'color', 'background-color', 'background', 'CSS', NULL),
(442, 3, 'Web Developer', 'Easy', 'Which HTML element contains metadata about the document?', '<meta>', '<head>', '<title>', '<body>', '<head>', 'HTML', NULL),
(443, 3, 'Web Developer', 'Easy', 'Which HTML tag is used for line breaks?', '<br>', '<hr>', '<break>', '<lb>', '<br>', 'HTML', NULL),
(444, 3, 'Web Developer', 'Easy', 'Which CSS property controls the element’s width?', 'width', 'size', 'height', 'length', 'width', 'CSS', NULL),
(445, 3, 'Web Developer', 'Easy', 'Which attribute specifies an input field placeholder?', 'placeholder', 'title', 'value', 'hint', 'placeholde', 'HTML', NULL),
(446, 3, 'Web Developer', 'Easy', 'Which CSS property sets the element’s margin?', 'padding', 'margin', 'spacing', 'border', 'margin', 'CSS', NULL),
(447, 3, 'Web Developer', 'Easy', 'Which HTML element is used to embed an image?', '<img>', '<image>', '<src>', '<picture>', '<img>', 'HTML', NULL),
(448, 3, 'Web Developer', 'Easy', 'Which CSS property changes element visibility?', 'show', 'visibility', 'display', 'hidden', 'visibility', 'CSS', NULL),
(449, 3, 'Web Developer', 'Medium', 'Which HTML attribute specifies the URL of a link?', 'href', 'src', 'link', 'url', 'href', 'HTML', NULL),
(450, 3, 'Web Developer', 'Medium', 'Which method adds an event listener in JavaScript?', 'addEvent()', 'listen()', 'addEventListener()', 'attachEvent()', 'addEventLi', 'JavaScript', NULL),
(451, 3, 'Web Developer', 'Medium', 'Which JavaScript function parses a string to an integer?', 'parseInt()', 'int()', 'parse()', 'Number()', 'parseInt()', 'JavaScript', NULL),
(452, 3, 'Web Developer', 'Medium', 'Which CSS property makes text bold?', 'font-weight', 'text-style', 'font-style', 'font-bold', 'font-weigh', 'CSS', NULL),
(453, 3, 'Web Developer', 'Medium', 'Which HTML tag is used to embed a video?', '<video>', '<media>', '<source>', '<iframe>', '<video>', 'HTML', NULL),
(454, 3, 'Web Developer', 'Medium', 'Which JavaScript operator is used for strict equality?', '==', '===', '=', '!=', '===', 'JavaScript', NULL),
(455, 3, 'Web Developer', 'Medium', 'Which method removes the last element of an array in JavaScript?', 'pop()', 'push()', 'shift()', 'unshift()', 'pop()', 'JavaScript', NULL),
(456, 3, 'Web Developer', 'Medium', 'Which CSS property specifies the stacking order of elements?', 'z-index', 'order', 'stack', 'layer', 'z-index', 'CSS', NULL),
(457, 3, 'Web Developer', 'Medium', 'Which HTML element represents the largest heading?', '<h1>', '<h6>', '<header>', '<title>', '<h1>', 'HTML', NULL),
(458, 3, 'Web Developer', 'Medium', 'Which JavaScript keyword declares a block-scoped variable?', 'var', 'let', 'const', 'define', 'let', 'JavaScript', NULL),
(459, 3, 'Web Developer', 'Medium', 'Which CSS property sets element opacity?', 'opacity', 'visibility', 'transparency', 'alpha', 'opacity', 'CSS', NULL),
(460, 3, 'Web Developer', 'Medium', 'Which HTML tag defines a table header cell?', '<th>', '<td>', '<tr>', '<table>', '<th>', 'HTML', NULL),
(461, 3, 'Web Developer', 'Medium', 'Which JavaScript method returns the length of an array?', 'size()', 'length', 'count()', 'len()', 'length', 'JavaScript', NULL),
(462, 3, 'Web Developer', 'Medium', 'Which HTML5 element represents navigation links?', '<nav>', '<navigation>', '<menu>', '<ul>', '<nav>', 'HTML', NULL),
(463, 3, 'Web Developer', 'Medium', 'Which CSS property controls flex container alignment?', 'justify-content', 'align-items', 'flex-direction', 'align-self', 'justify-co', 'CSS', NULL),
(464, 3, 'Web Developer', 'Medium', 'Which JavaScript function converts a string to a number?', 'toNumber()', 'Number()', 'parseInt()', 'parse()', 'Number()', 'JavaScript', NULL),
(465, 3, 'Web Developer', 'Medium', 'Which HTML tag is used for embedding an iframe?', '<iframe>', '<embed>', '<frame>', '<object>', '<iframe>', 'HTML', NULL),
(466, 3, 'Web Developer', 'Medium', 'Which CSS property controls how text wraps?', 'text-wrap', 'word-wrap', 'text-flow', 'wrap-text', 'word-wrap', 'CSS', NULL),
(467, 3, 'Web Developer', 'Medium', 'Which method adds a new element at the start of an array in JavaScript?', 'shift()', 'unshift()', 'push()', 'pop()', 'unshift()', 'JavaScript', NULL),
(468, 3, 'Web Developer', 'Medium', 'Which HTML attribute specifies an input type?', 'type', 'input-type', 'field', 'format', 'type', 'HTML', NULL),
(469, 3, 'Web Developer', 'Hard', 'Which HTTP status code indicates a successful GET request?', '200', '404', '500', '301', '200', 'Web Protocols', NULL),
(470, 3, 'Web Developer', 'Hard', 'Which CSS property allows elements to overlap?', 'z-index', 'position', 'layer', 'overlap', 'z-index', 'CSS', NULL),
(471, 3, 'Web Developer', 'Hard', 'Which JavaScript method clones an object deeply?', 'Object.assign()', 'structuredClone()', 'clone()', 'JSON.parse()', 'structured', 'JavaScript', NULL),
(472, 3, 'Web Developer', 'Hard', 'Which HTTP method is idempotent?', 'POST', 'PUT', 'PATCH', 'DELETE', 'PUT', 'Web Protocols', NULL),
(473, 3, 'Web Developer', 'Hard', 'Which JavaScript feature allows asynchronous execution?', 'Promises', 'Callbacks', 'Async/Await', 'All of the above', 'All of the', 'JavaScript', NULL),
(474, 3, 'Web Developer', 'Hard', 'Which HTML5 API is used for client-side storage?', 'localStorage', 'sessionStorage', 'IndexedDB', 'All of the above', 'All of the', 'HTML5 API', NULL),
(475, 3, 'Web Developer', 'Hard', 'Which CSS unit is relative to the root element font-size?', 'em', 'rem', 'px', 'pt', 'rem', 'CSS', NULL),
(476, 3, 'Web Developer', 'Hard', 'Which method removes duplicates from an array in JavaScript?', 'Set()', 'Array.from(new Set())', 'filter()', 'All of the above', 'Array.from', 'JavaScript', NULL),
(477, 3, 'Web Developer', 'Hard', 'Which protocol encrypts data over the web?', 'HTTP', 'HTTPS', 'FTP', 'SMTP', 'HTTPS', 'Security', NULL),
(478, 3, 'Web Developer', 'Hard', 'Which CSS property creates a grid layout?', 'display: grid', 'display: flex', 'position: grid', 'layout: grid', 'display: g', 'CSS', NULL),
(479, 3, 'Data Scientist', 'Easy', 'Which library in Python is commonly used for data analysis?', 'NumPy', 'Pandas', 'Matplotlib', 'SciPy', 'Pandas', 'Python Libraries', NULL),
(480, 3, 'Data Scientist', 'Easy', 'Which function calculates the mean of a list in Python?', 'mean()', 'average()', 'sum()/len()', 'median()', 'sum()/len(', 'Statistics', NULL),
(481, 3, 'Data Scientist', 'Easy', 'Which plot is used to show data distribution?', 'Histogram', 'Scatter plot', 'Line plot', 'Pie chart', 'Histogram', 'Data Visualization', NULL),
(482, 3, 'Data Scientist', 'Easy', 'What does CSV stand for?', 'Comma Separated Values', 'Character Separated Values', 'Column Separated Values', 'Comma String Values', 'Comma Sepa', 'Data Formats', NULL),
(483, 3, 'Data Scientist', 'Easy', 'Which Python library is used for scientific computing?', 'SciPy', 'Matplotlib', 'Seaborn', 'Pandas', 'SciPy', 'Python Libraries', NULL),
(484, 3, 'Data Scientist', 'Easy', 'Which function removes missing values in Pandas?', 'dropna()', 'fillna()', 'remove_na()', 'cleanna()', 'dropna()', 'Data Cleaning', NULL),
(485, 3, 'Data Scientist', 'Easy', 'Which chart is used for categorical data visualization?', 'Bar chart', 'Line chart', 'Histogram', 'Box plot', 'Bar chart', 'Data Visualization', NULL),
(486, 3, 'Data Scientist', 'Easy', 'Which Python library is used for plotting graphs?', 'Matplotlib', 'NumPy', 'Pandas', 'Scikit-learn', 'Matplotlib', 'Data Visualization', NULL),
(487, 3, 'Data Scientist', 'Easy', 'Which Pandas object represents a table-like structure?', 'DataFrame', 'Series', 'Array', 'Matrix', 'DataFrame', 'Python Libraries', NULL),
(488, 3, 'Data Scientist', 'Easy', 'Which statistic measures the spread of data?', 'Mean', 'Variance', 'Median', 'Mode', 'Variance', 'Statistics', NULL),
(489, 3, 'Data Scientist', 'Easy', 'Which method checks the first few rows of a DataFrame?', 'head()', 'tail()', 'first()', 'preview()', 'head()', 'Data Handling', NULL),
(490, 3, 'Data Scientist', 'Easy', 'Which function calculates the median of a dataset in Python?', 'median()', 'mean()', 'mode()', 'average()', 'median()', 'Statistics', NULL),
(491, 3, 'Data Scientist', 'Easy', 'Which plot shows relationship between two variables?', 'Histogram', 'Scatter plot', 'Box plot', 'Bar chart', 'Scatter pl', 'Data Visualization', NULL),
(492, 3, 'Data Scientist', 'Easy', 'Which function replaces missing values in Pandas?', 'fillna()', 'dropna()', 'replace()', 'remove_na()', 'fillna()', 'Data Cleaning', NULL),
(493, 3, 'Data Scientist', 'Easy', 'Which Python function returns the length of a dataset?', 'len()', 'size()', 'length()', 'count()', 'len()', 'Data Handling', NULL),
(494, 3, 'Data Scientist', 'Easy', 'Which chart shows proportions of categories?', 'Pie chart', 'Line chart', 'Scatter plot', 'Histogram', 'Pie chart', 'Data Visualization', NULL),
(495, 3, 'Data Scientist', 'Easy', 'Which method selects a column in Pandas?', 'df[column]', 'df.select(column)', 'df.get(column)', 'df.col(column)', 'df[column]', 'Data Handling', NULL),
(496, 3, 'Data Scientist', 'Easy', 'Which function calculates the standard deviation in Python?', 'stdev()', 'std()', 'variance()', 'mean()', 'stdev()', 'Statistics', NULL),
(497, 3, 'Data Scientist', 'Easy', 'Which Python library is used for machine learning?', 'Scikit-learn', 'Matplotlib', 'Seaborn', 'NumPy', 'Scikit-lea', 'Machine Learning', NULL),
(498, 3, 'Data Scientist', 'Easy', 'Which function converts a Pandas Series to a list?', 'to_list()', 'as_list()', 'listify()', 'convert()', 'to_list()', 'Data Handling', NULL),
(499, 3, 'Data Scientist', 'Medium', 'Which algorithm is used for classification tasks?', 'Linear Regression', 'Decision Tree', 'K-Means', 'PCA', 'Decision T', 'Machine Learning', NULL),
(500, 3, 'Data Scientist', 'Medium', 'Which metric is used for regression error?', 'Accuracy', 'RMSE', 'Precision', 'Recall', 'RMSE', 'Machine Learning', NULL),
(501, 3, 'Data Scientist', 'Medium', 'Which technique reduces dimensionality?', 'PCA', 'Decision Tree', 'Random Forest', 'KNN', 'PCA', 'Machine Learning', NULL),
(502, 3, 'Data Scientist', 'Medium', 'Which method splits data into train and test sets?', 'train_test_split()', 'split()', 'divide()', 'partition()', 'train_test', 'Data Handling', NULL),
(503, 3, 'Data Scientist', 'Medium', 'Which type of plot shows the median, quartiles, and outliers?', 'Box plot', 'Histogram', 'Scatter plot', 'Line chart', 'Box plot', 'Data Visualization', NULL),
(504, 3, 'Data Scientist', 'Medium', 'Which correlation coefficient measures linear relationship?', 'Spearman', 'Pearson', 'Kendall', 'Chi-square', 'Pearson', 'Statistics', NULL),
(505, 3, 'Data Scientist', 'Medium', 'Which algorithm is used for clustering?', 'Linear Regression', 'K-Means', 'Decision Tree', 'Logistic Regression', 'K-Means', 'Machine Learning', NULL),
(506, 3, 'Data Scientist', 'Medium', 'Which Python library supports statistical functions?', 'StatsModels', 'NumPy', 'Pandas', 'Matplotlib', 'StatsModel', 'Python Libraries', NULL),
(507, 3, 'Data Scientist', 'Medium', 'Which technique avoids overfitting in machine learning?', 'Regularization', 'Normalization', 'PCA', 'Standardization', 'Regulariza', 'Machine Learning', NULL),
(508, 3, 'Data Scientist', 'Medium', 'Which method encodes categorical variables?', 'Label Encoding', 'Normalization', 'Standardization', 'Scaling', 'Label Enco', 'Data Handling', NULL),
(509, 3, 'Data Scientist', 'Medium', 'Which machine learning task predicts categories?', 'Regression', 'Classification', 'Clustering', 'Dimensionality Reduction', 'Classifica', 'Machine Learning', NULL),
(510, 3, 'Data Scientist', 'Medium', 'Which measure evaluates model precision and recall?', 'F1 Score', 'RMSE', 'MAE', 'R²', 'F1 Score', 'Machine Learning', NULL),
(511, 3, 'Data Scientist', 'Medium', 'Which method normalizes features to a range?', 'Min-Max Scaling', 'Z-score', 'Log Transformation', 'Standardization', 'Min-Max Sc', 'Data Handling', NULL),
(512, 3, 'Data Scientist', 'Medium', 'Which technique combines multiple weak learners?', 'Random Forest', 'Boosting', 'PCA', 'K-Means', 'Boosting', 'Machine Learning', NULL),
(513, 3, 'Data Scientist', 'Medium', 'Which type of plot shows distribution shape?', 'Histogram', 'Scatter plot', 'Box plot', 'Pie chart', 'Histogram', 'Data Visualization', NULL),
(514, 3, 'Data Scientist', 'Medium', 'Which method fills missing numerical data in Pandas?', 'fillna(mean)', 'dropna()', 'replace()', 'fill()', 'fillna(mea', 'Data Cleaning', NULL),
(515, 3, 'Data Scientist', 'Medium', 'Which distance metric is commonly used in KNN?', 'Manhattan', 'Euclidean', 'Hamming', 'Chebyshev', 'Euclidean', 'Machine Learning', NULL),
(516, 3, 'Data Scientist', 'Medium', 'Which technique reduces overfitting by randomly dropping nodes in neural networks?', 'L1 Regularization', 'L2 Regularization', 'Dropout', 'Early Stopping', 'Dropout', 'Machine Learning', NULL),
(517, 3, 'Data Scientist', 'Medium', 'Which function reshapes arrays in NumPy?', 'reshape()', 'resize()', 'flatten()', 'stack()', 'reshape()', 'Python Libraries', NULL),
(518, 3, 'Data Scientist', 'Medium', 'Which algorithm predicts continuous values?', 'Logistic Regression', 'Linear Regression', 'Decision Tree Classifier', 'K-Means', 'Linear Reg', 'Machine Learning', NULL),
(519, 3, 'Data Scientist', 'Hard', 'Which method evaluates feature importance in tree-based models?', 'Permutation Importance', 'PCA', 'Standardization', 'Cross-validation', 'Permutatio', 'Machine Learning', NULL),
(520, 3, 'Data Scientist', 'Hard', 'Which technique transforms non-linear data for linear models?', 'Polynomial Features', 'Normalization', 'PCA', 'Scaling', 'Polynomial', 'Machine Learning', NULL),
(521, 3, 'Data Scientist', 'Hard', 'Which method reduces multicollinearity among features?', 'PCA', 'Standardization', 'Regularization', 'Normalization', 'PCA', 'Machine Learning', NULL),
(522, 3, 'Data Scientist', 'Hard', 'Which metric is preferred for imbalanced classification?', 'Accuracy', 'F1 Score', 'RMSE', 'MAE', 'F1 Score', 'Machine Learning', NULL),
(523, 3, 'Data Scientist', 'Hard', 'Which sampling method balances classes in datasets?', 'Oversampling', 'Undersampling', 'SMOTE', 'All of the above', 'All of the', 'Machine Learning', NULL),
(524, 3, 'Data Scientist', 'Hard', 'Which Python library is used for deep learning?', 'TensorFlow', 'Matplotlib', 'Seaborn', 'Scikit-learn', 'TensorFlow', 'Python Libraries', NULL),
(525, 3, 'Data Scientist', 'Hard', 'Which activation function outputs values between 0 and 1?', 'ReLU', 'Sigmoid', 'Tanh', 'Softmax', 'Sigmoid', 'Machine Learning', NULL),
(526, 3, 'Data Scientist', 'Hard', 'Which metric measures goodness of fit in regression?', 'R²', 'F1 Score', 'Accuracy', 'Precision', 'R²', 'Statistics', NULL),
(527, 3, 'Data Scientist', 'Hard', 'Which technique evaluates model stability using multiple datasets?', 'Cross-validation', 'Train-test split', 'Regularization', 'Dropout', 'Cross-vali', 'Machine Learning', NULL),
(528, 3, 'Data Scientist', 'Hard', 'Which optimizer adjusts learning rate during training in deep learning?', 'SGD', 'Adam', 'RMSprop', 'All of the above', 'All of the', 'Machine Learning', NULL),
(529, 3, 'AI Engineer', 'Easy', 'Which library is commonly used for building neural networks in Python?', 'TensorFlow', 'NumPy', 'Pandas', 'Matplotlib', 'TensorFlow', 'Python Libraries', NULL),
(530, 3, 'AI Engineer', 'Easy', 'What does AI stand for?', 'Artificial Intelligence', 'Automated Interaction', 'Applied Informatics', 'Algorithmic Integration', 'Artificial', 'Basics', NULL),
(531, 3, 'AI Engineer', 'Easy', 'Which type of AI mimics human reasoning?', 'Narrow AI', 'General AI', 'Supervised AI', 'Reinforced AI', 'General AI', 'Concepts', NULL),
(532, 3, 'AI Engineer', 'Easy', 'Which Python library is used for machine learning?', 'Scikit-learn', 'Matplotlib', 'Seaborn', 'Pandas', 'Scikit-lea', 'Python Libraries', NULL),
(533, 3, 'AI Engineer', 'Easy', 'Which activation function outputs values between 0 and 1?', 'ReLU', 'Sigmoid', 'Tanh', 'Softmax', 'Sigmoid', 'Machine Learning', NULL),
(534, 3, 'AI Engineer', 'Easy', 'Which dataset split is used to evaluate model performance?', 'Training set', 'Test set', 'Validation set', 'Full dataset', 'Test set', 'Data Handling', NULL),
(535, 3, 'AI Engineer', 'Easy', 'Which Python library is used for numerical operations?', 'NumPy', 'Pandas', 'Matplotlib', 'Seaborn', 'NumPy', 'Python Libraries', NULL),
(536, 3, 'AI Engineer', 'Easy', 'Which AI type is designed for specific tasks?', 'Narrow AI', 'General AI', 'Super AI', 'Artificial AI', 'Narrow AI', 'Concepts', NULL),
(537, 3, 'AI Engineer', 'Easy', 'Which loss function is used for binary classification?', 'Mean Squared Error', 'Cross-Entropy', 'Hinge Loss', 'KL Divergence', 'Cross-Entr', 'Machine Learning', NULL),
(538, 3, 'AI Engineer', 'Easy', 'Which Python library is used for plotting?', 'Matplotlib', 'NumPy', 'Pandas', 'Seaborn', 'Matplotlib', 'Python Libraries', NULL),
(539, 3, 'AI Engineer', 'Easy', 'Which process updates weights in neural networks?', 'Forward propagation', 'Backpropagation', 'Activation', 'Pooling', 'Backpropag', 'Machine Learning', NULL),
(540, 3, 'AI Engineer', 'Easy', 'Which layer type is common in convolutional neural networks?', 'Convolutional', 'Dense', 'Recurrent', 'Dropout', 'Convolutio', 'Neural Networks', NULL),
(541, 3, 'AI Engineer', 'Easy', 'Which Python function initializes random weights?', 'rand()', 'random()', 'np.random', 'initialize()', 'np.random', 'Python Libraries', NULL),
(542, 3, 'AI Engineer', 'Easy', 'Which AI technique is used to recommend products?', 'Clustering', 'Reinforcement Learning', 'Collaborative Filtering', 'Regression', 'Collaborat', 'AI Applications', NULL),
(543, 3, 'AI Engineer', 'Easy', 'Which metric evaluates classification model performance?', 'Accuracy', 'R²', 'RMSE', 'MAE', 'Accuracy', 'Machine Learning', NULL),
(544, 3, 'AI Engineer', 'Easy', 'Which layer prevents overfitting in neural networks?', 'Dropout', 'Dense', 'Activation', 'Pooling', 'Dropout', 'Neural Networks', NULL),
(545, 3, 'AI Engineer', 'Easy', 'Which type of problem is image recognition?', 'Regression', 'Classification', 'Clustering', 'Dimensionality Reduction', 'Classifica', 'AI Applications', NULL),
(546, 3, 'AI Engineer', 'Easy', 'Which Python library is used for data manipulation?', 'Pandas', 'NumPy', 'Matplotlib', 'Seaborn', 'Pandas', 'Python Libraries', NULL),
(547, 3, 'AI Engineer', 'Easy', 'Which AI model mimics human neurons?', 'Decision Tree', 'Neural Network', 'SVM', 'Random Forest', 'Neural Net', 'Neural Networks', NULL),
(548, 3, 'AI Engineer', 'Easy', 'Which activation function outputs range between -1 and 1?', 'Sigmoid', 'Tanh', 'ReLU', 'Softmax', 'Tanh', 'Machine Learning', NULL),
(549, 3, 'AI Engineer', 'Medium', 'Which optimizer adapts learning rate during training?', 'SGD', 'Adam', 'RMSprop', 'All of the above', 'All of the', 'Machine Learning', NULL),
(550, 3, 'AI Engineer', 'Medium', 'Which technique reduces overfitting by randomly dropping neurons?', 'Dropout', 'Batch Normalization', 'Early Stopping', 'L2 Regularization', 'Dropout', 'Neural Networks', NULL),
(551, 3, 'AI Engineer', 'Medium', 'Which loss function is used for multiclass classification?', 'Mean Squared Error', 'Categorical Cross-Entropy', 'Binary Cross-Entropy', 'Hinge Loss', 'Categorica', 'Machine Learning', NULL),
(552, 3, 'AI Engineer', 'Medium', 'Which neural network type handles sequential data?', 'CNN', 'RNN', 'MLP', 'Autoencoder', 'RNN', 'Neural Networks', NULL),
(553, 3, 'AI Engineer', 'Medium', 'Which method prevents vanishing gradients in deep networks?', 'ReLU Activation', 'Sigmoid Activation', 'Tanh Activation', 'Softmax', 'ReLU Activ', 'Neural Networks', NULL),
(554, 3, 'AI Engineer', 'Medium', 'Which technique normalizes batch input in deep learning?', 'Batch Normalization', 'Dropout', 'Regularization', 'Early Stopping', 'Batch Norm', 'Neural Networks', NULL),
(555, 3, 'AI Engineer', 'Medium', 'Which model is used for generating new data samples?', 'GAN', 'CNN', 'RNN', 'MLP', 'GAN', 'Machine Learning', NULL),
(556, 3, 'AI Engineer', 'Medium', 'Which activation function is commonly used in hidden layers?', 'Sigmoid', 'Tanh', 'ReLU', 'Softmax', 'ReLU', 'Neural Networks', NULL),
(557, 3, 'AI Engineer', 'Medium', 'Which metric is suitable for imbalanced classification?', 'Accuracy', 'F1 Score', 'RMSE', 'MAE', 'F1 Score', 'Machine Learning', NULL),
(558, 3, 'AI Engineer', 'Medium', 'Which layer type is used for downsampling in CNN?', 'Pooling', 'Dense', 'Convolutional', 'Dropout', 'Pooling', 'Neural Networks', NULL),
(559, 3, 'AI Engineer', 'Medium', 'Which function transforms input to probability distribution in classification?', 'ReLU', 'Sigmoid', 'Softmax', 'Tanh', 'Softmax', 'Machine Learning', NULL),
(560, 3, 'AI Engineer', 'Medium', 'Which method evaluates model generalization on unseen data?', 'Training Accuracy', 'Test Accuracy', 'Validation Accuracy', 'Cross-validation', 'Cross-vali', 'Machine Learning', NULL),
(561, 3, 'AI Engineer', 'Medium', 'Which algorithm reduces high-dimensional features?', 'PCA', 'Linear Regression', 'Logistic Regression', 'Decision Tree', 'PCA', 'Machine Learning', NULL),
(562, 3, 'AI Engineer', 'Medium', 'Which method prevents overfitting by stopping training early?', 'Dropout', 'Early Stopping', 'Batch Normalization', 'Gradient Clipping', 'Early Stop', 'Machine Learning', NULL),
(563, 3, 'AI Engineer', 'Medium', 'Which Python function converts labels to one-hot encoding?', 'LabelBinarizer()', 'OneHotEncode()', 'to_categorical()', 'encode()', 'to_categor', 'Data Handling', NULL),
(564, 3, 'AI Engineer', 'Medium', 'Which neural network type encodes input to compressed representation?', 'Autoencoder', 'CNN', 'RNN', 'MLP', 'Autoencode', 'Neural Networks', NULL),
(565, 3, 'AI Engineer', 'Medium', 'Which regularization penalizes large weights in neural networks?', 'L1', 'L2', 'Dropout', 'Batch Norm', 'L2', 'Neural Networks', NULL),
(566, 3, 'AI Engineer', 'Medium', 'Which technique scales features to zero mean and unit variance?', 'Normalization', 'Standardization', 'Min-Max Scaling', 'Binarization', 'Standardiz', 'Data Handling', NULL),
(567, 3, 'AI Engineer', 'Medium', 'Which gradient-based method updates network weights?', 'Forward Propagation', 'Backpropagation', 'Dropout', 'Pooling', 'Backpropag', 'Neural Networks', NULL),
(568, 3, 'AI Engineer', 'Medium', 'Which algorithm is commonly used for sequence prediction?', 'RNN', 'CNN', 'KNN', 'Random Forest', 'RNN', 'Machine Learning', NULL),
(569, 3, 'AI Engineer', 'Hard', 'Which optimizer combines momentum and adaptive learning rate?', 'SGD', 'Adam', 'RMSprop', 'Adagrad', 'Adam', 'Machine Learning', NULL),
(570, 3, 'AI Engineer', 'Hard', 'Which loss function handles ordinal regression problems?', 'Cross-Entropy', 'Mean Squared Error', 'Ordinal Loss', 'Hinge Loss', 'Ordinal Lo', 'Machine Learning', NULL),
(571, 3, 'AI Engineer', 'Hard', 'Which technique prevents exploding gradients?', 'Gradient Clipping', 'Dropout', 'Batch Norm', 'Early Stopping', 'Gradient C', 'Neural Networks', NULL),
(572, 3, 'AI Engineer', 'Hard', 'Which method trains GANs to generate realistic samples?', 'Supervised Learning', 'Adversarial Training', 'Reinforcement Learning', 'Clustering', 'Adversaria', 'Machine Learning', NULL),
(573, 3, 'AI Engineer', 'Hard', 'Which network is used for attention mechanisms in NLP?', 'CNN', 'RNN', 'Transformer', 'MLP', 'Transforme', 'Neural Networks', NULL),
(574, 3, 'AI Engineer', 'Hard', 'Which activation function allows negative values and avoids dying neurons?', 'Sigmoid', 'ReLU', 'Leaky ReLU', 'Softmax', 'Leaky ReLU', 'Neural Networks', NULL),
(575, 3, 'AI Engineer', 'Hard', 'Which technique regularizes deep networks by randomly dropping connections?', 'Dropout', 'L2', 'Batch Norm', 'Early Stopping', 'Dropout', 'Neural Networks', NULL),
(576, 3, 'AI Engineer', 'Hard', 'Which method reduces variance in ensemble models?', 'Bagging', 'Boosting', 'Stacking', 'Dropout', 'Bagging', 'Machine Learning', NULL),
(577, 3, 'AI Engineer', 'Hard', 'Which metric evaluates probability outputs of classification?', 'Accuracy', 'ROC AUC', 'RMSE', 'F1 Score', 'ROC AUC', 'Machine Learning', NULL),
(578, 3, 'AI Engineer', 'Hard', 'Which deep learning library supports GPU acceleration?', 'TensorFlow', 'NumPy', 'Matplotlib', 'Seaborn', 'TensorFlow', 'Python Libraries', NULL),
(579, 3, 'Cybersecurity Analyst', 'Easy', 'What does the acronym \"VPN\" stand for?', 'Virtual Private Network', 'Virtual Public Network', 'Variable Private Network', 'Verified Private Network', 'Virtual Pr', 'Networking', NULL);
INSERT INTO `assessment_questions_backup` (`id`, `phase`, `career`, `difficulty`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `skill_id`) VALUES
(580, 3, 'Cybersecurity Analyst', 'Easy', 'Which type of malware locks users out of their files?', 'Virus', 'Ransomware', 'Spyware', 'Trojan', 'Ransomware', 'Malware', NULL),
(581, 3, 'Cybersecurity Analyst', 'Easy', 'Which protocol is used to securely browse websites?', 'HTTP', 'HTTPS', 'FTP', 'SMTP', 'HTTPS', 'Networking', NULL),
(582, 3, 'Cybersecurity Analyst', 'Easy', 'What is phishing?', 'Malware installation', 'Social engineering to steal data', 'Brute-force attack', 'Password cracking', 'Social eng', 'Cyber Threats', NULL),
(583, 3, 'Cybersecurity Analyst', 'Easy', 'Which device monitors network traffic for suspicious activity?', 'Firewall', 'Router', 'Switch', 'IDS', 'IDS', 'Networking', NULL),
(584, 3, 'Cybersecurity Analyst', 'Easy', 'Which attack floods a network with traffic?', 'SQL Injection', 'DDoS', 'Phishing', 'MITM', 'DDoS', 'Cyber Threats', NULL),
(585, 3, 'Cybersecurity Analyst', 'Easy', 'Which file type commonly contains a virus?', '.exe', '.txt', '.pdf', '.jpg', '.exe', 'Malware', NULL),
(586, 3, 'Cybersecurity Analyst', 'Easy', 'What is the primary purpose of a firewall?', 'Encrypt data', 'Monitor and control traffic', 'Steal data', 'Scan for viruses', 'Monitor an', 'Networking', NULL),
(587, 3, 'Cybersecurity Analyst', 'Easy', 'Which password policy is most secure?', 'Short and simple', 'Long with complexity', 'Same for all accounts', 'Easily memorable', 'Long with ', 'Security Policy', NULL),
(588, 3, 'Cybersecurity Analyst', 'Easy', 'What is two-factor authentication?', 'Password only', 'Password + second verification', 'Biometric only', 'Encryption key only', 'Password +', 'Security Measures', NULL),
(589, 3, 'Cybersecurity Analyst', 'Easy', 'Which type of attack exploits software vulnerabilities?', 'Phishing', 'Exploit', 'DDoS', 'Man-in-the-middle', 'Exploit', 'Cyber Threats', NULL),
(590, 3, 'Cybersecurity Analyst', 'Easy', 'Which tool scans a network for vulnerabilities?', 'Wireshark', 'Nmap', 'Metasploit', 'Burp Suite', 'Nmap', 'Tools', NULL),
(591, 3, 'Cybersecurity Analyst', 'Easy', 'Which attack intercepts communication between two parties?', 'Phishing', 'SQL Injection', 'Man-in-the-middle', 'Brute-force', 'Man-in-the', 'Cyber Threats', NULL),
(592, 3, 'Cybersecurity Analyst', 'Easy', 'What does \"SOC\" stand for in cybersecurity?', 'Security Operations Center', 'System Operational Control', 'Secure Online Communication', 'Security Online Center', 'Security O', 'Security Management', NULL),
(593, 3, 'Cybersecurity Analyst', 'Easy', 'Which type of malware disguises itself as legitimate software?', 'Spyware', 'Ransomware', 'Trojan', 'Adware', 'Trojan', 'Malware', NULL),
(594, 3, 'Cybersecurity Analyst', 'Easy', 'Which method helps detect phishing emails?', 'Email filtering', 'Strong passwords', 'VPN', 'Firewall', 'Email filt', 'Cyber Threats', NULL),
(595, 3, 'Cybersecurity Analyst', 'Easy', 'Which protocol is used to send emails securely?', 'SMTP', 'IMAP', 'HTTPS', 'SMTPS', 'SMTPS', 'Networking', NULL),
(596, 3, 'Cybersecurity Analyst', 'Easy', 'Which tool captures packets on a network?', 'Wireshark', 'Nmap', 'Metasploit', 'Burp Suite', 'Wireshark', 'Tools', NULL),
(597, 3, 'Cybersecurity Analyst', 'Easy', 'Which type of malware records user activity?', 'Keylogger', 'Ransomware', 'Virus', 'Trojan', 'Keylogger', 'Malware', NULL),
(598, 3, 'Cybersecurity Analyst', 'Easy', 'Which practice reduces insider threats?', 'Strong authentication', 'Weak passwords', 'Open network', 'Default accounts', 'Strong aut', 'Security Measures', NULL),
(599, 3, 'Cybersecurity Analyst', 'Medium', 'Which encryption standard is widely used for secure web traffic?', 'AES', 'DES', 'MD5', 'SHA-1', 'AES', 'Cryptography', NULL),
(600, 3, 'Cybersecurity Analyst', 'Medium', 'Which attack exploits SQL queries in web applications?', 'SQL Injection', 'XSS', 'DDoS', 'Phishing', 'SQL Inject', 'Cyber Threats', NULL),
(601, 3, 'Cybersecurity Analyst', 'Medium', 'Which tool is used for penetration testing?', 'Metasploit', 'Wireshark', 'Nmap', 'Burp Suite', 'Metasploit', 'Tools', NULL),
(602, 3, 'Cybersecurity Analyst', 'Medium', 'Which type of attack targets DNS servers?', 'Phishing', 'DNS Spoofing', 'Ransomware', 'Trojan', 'DNS Spoofi', 'Cyber Threats', NULL),
(603, 3, 'Cybersecurity Analyst', 'Medium', 'Which technique strengthens password security?', 'Salting', 'Hashing', 'Peppering', 'All of the above', 'All of the', 'Cryptography', NULL),
(604, 3, 'Cybersecurity Analyst', 'Medium', 'Which tool is used to intercept and analyze HTTP requests?', 'Wireshark', 'Burp Suite', 'Nmap', 'Metasploit', 'Burp Suite', 'Tools', NULL),
(605, 3, 'Cybersecurity Analyst', 'Medium', 'Which attack forces users to reveal sensitive information?', 'Phishing', 'DDoS', 'Brute-force', 'Malware', 'Phishing', 'Cyber Threats', NULL),
(606, 3, 'Cybersecurity Analyst', 'Medium', 'Which protocol secures VPN connections?', 'IPSec', 'HTTP', 'FTP', 'SMTP', 'IPSec', 'Networking', NULL),
(607, 3, 'Cybersecurity Analyst', 'Medium', 'Which type of malware spreads via removable media?', 'Virus', 'Worm', 'Trojan', 'Spyware', 'Worm', 'Malware', NULL),
(608, 3, 'Cybersecurity Analyst', 'Medium', 'Which method prevents brute-force attacks?', 'Account lockout', 'Strong encryption', 'Antivirus', 'VPN', 'Account lo', 'Security Measures', NULL),
(609, 3, 'Cybersecurity Analyst', 'Medium', 'Which port is commonly used for HTTPS?', '80', '443', '21', '25', '443', 'Networking', NULL),
(610, 3, 'Cybersecurity Analyst', 'Medium', 'Which attack injects malicious scripts into webpages?', 'SQL Injection', 'XSS', 'DDoS', 'MITM', 'XSS', 'Cyber Threats', NULL),
(611, 3, 'Cybersecurity Analyst', 'Medium', 'Which firewall type examines packet content?', 'Packet-filtering', 'Stateful', 'Proxy', 'Next-generation', 'Next-gener', 'Networking', NULL),
(612, 3, 'Cybersecurity Analyst', 'Medium', 'Which hashing algorithm is considered secure for passwords?', 'MD5', 'SHA-256', 'SHA-1', 'DES', 'SHA-256', 'Cryptography', NULL),
(613, 3, 'Cybersecurity Analyst', 'Medium', 'Which method secures wireless networks?', 'WEP', 'WPA2', 'Open Wi-Fi', 'None', 'WPA2', 'Networking', NULL),
(614, 3, 'Cybersecurity Analyst', 'Medium', 'Which technique tests network security by simulating attacks?', 'Penetration Testing', 'Vulnerability Scanning', 'Monitoring', 'Encryption', 'Penetratio', 'Tools', NULL),
(615, 3, 'Cybersecurity Analyst', 'Medium', 'Which malware self-replicates without user interaction?', 'Worm', 'Trojan', 'Virus', 'Spyware', 'Worm', 'Malware', NULL),
(616, 3, 'Cybersecurity Analyst', 'Medium', 'Which tool identifies open ports on a network?', 'Wireshark', 'Nmap', 'Metasploit', 'Burp Suite', 'Nmap', 'Tools', NULL),
(617, 3, 'Cybersecurity Analyst', 'Medium', 'Which method encrypts data in transit?', 'AES', 'TLS/SSL', 'MD5', 'SHA-1', 'TLS/SSL', 'Cryptography', NULL),
(618, 3, 'Cybersecurity Analyst', 'Medium', 'Which attack tricks users into installing malicious software?', 'Phishing', 'Drive-by Download', 'DDoS', 'MITM', 'Drive-by D', 'Cyber Threats', NULL),
(619, 3, 'Cybersecurity Analyst', 'Hard', 'Which technique detects anomalies in network traffic?', 'Signature-based detection', 'Behavioral Analysis', 'Firewall', 'Encryption', 'Behavioral', 'Threat Detection', NULL),
(620, 3, 'Cybersecurity Analyst', 'Hard', 'Which standard provides guidelines for information security management?', 'ISO 9001', 'ISO 27001', 'NIST 800-53', 'PCI DSS', 'ISO 27001', 'Standards', NULL),
(621, 3, 'Cybersecurity Analyst', 'Hard', 'Which attack bypasses traditional firewalls using encrypted tunnels?', 'DDoS', 'SSL/TLS Tunneling', 'SQL Injection', 'Phishing', 'SSL/TLS Tu', 'Cyber Threats', NULL),
(622, 3, 'Cybersecurity Analyst', 'Hard', 'Which method detects malware using known signatures?', 'Behavioral Analysis', 'Signature-based Detection', 'Heuristic Analysis', 'Anomaly Detection', 'Signature-', 'Threat Detection', NULL),
(623, 3, 'Cybersecurity Analyst', 'Hard', 'Which framework is used for managing security incidents?', 'NIST CSF', 'SOC', 'Incident Response Plan', 'ISO 27001', 'Incident R', 'Standards', NULL),
(624, 3, 'Cybersecurity Analyst', 'Hard', 'Which attack targets software vulnerabilities before a patch is released?', 'Zero-day Exploit', 'SQL Injection', 'DDoS', 'Phishing', 'Zero-day E', 'Cyber Threats', NULL),
(625, 3, 'Cybersecurity Analyst', 'Hard', 'Which method secures email communication?', 'TLS', 'IPSec', 'PGP', 'SSH', 'PGP', 'Cryptography', NULL),
(626, 3, 'Cybersecurity Analyst', 'Hard', 'Which tool is used for advanced threat hunting?', 'Splunk', 'Wireshark', 'Nmap', 'Burp Suite', 'Splunk', 'Tools', NULL),
(627, 3, 'Cybersecurity Analyst', 'Hard', 'Which metric evaluates password strength against attacks?', 'Entropy', 'Length', 'Characters', 'Complexity', 'Entropy', 'Security Measures', NULL),
(628, 3, 'Cybersecurity Analyst', 'Hard', 'Which framework is used for cybersecurity risk management?', 'NIST RMF', 'ISO 9001', 'COBIT', 'ITIL', 'NIST RMF', 'Standards', NULL),
(629, 3, 'Cloud Engineer', 'Easy', 'Which service model provides hardware and networking resources?', 'IaaS', 'PaaS', 'SaaS', 'FaaS', 'IaaS', 'Cloud Concepts', NULL),
(630, 3, 'Cloud Engineer', 'Easy', 'Which cloud provider offers EC2?', 'AWS', 'Azure', 'Google Cloud', 'IBM Cloud', 'AWS', 'Cloud Providers', NULL),
(631, 3, 'Cloud Engineer', 'Easy', 'Which service model provides software applications over the internet?', 'SaaS', 'PaaS', 'IaaS', 'FaaS', 'SaaS', 'Cloud Concepts', NULL),
(632, 3, 'Cloud Engineer', 'Easy', 'Which deployment model uses a single organization’s infrastructure?', 'Public Cloud', 'Private Cloud', 'Hybrid Cloud', 'Community Cloud', 'Private Cl', 'Cloud Concepts', NULL),
(633, 3, 'Cloud Engineer', 'Easy', 'Which cloud provider offers Azure Virtual Machines?', 'AWS', 'Azure', 'Google Cloud', 'IBM Cloud', 'Azure', 'Cloud Providers', NULL),
(634, 3, 'Cloud Engineer', 'Easy', 'Which cloud model combines public and private clouds?', 'Hybrid Cloud', 'Public Cloud', 'Private Cloud', 'Community Cloud', 'Hybrid Clo', 'Cloud Concepts', NULL),
(635, 3, 'Cloud Engineer', 'Easy', 'Which AWS service provides object storage?', 'S3', 'EC2', 'Lambda', 'RDS', 'S3', 'Cloud Services', NULL),
(636, 3, 'Cloud Engineer', 'Easy', 'Which service allows automatic scaling of resources?', 'Auto Scaling', 'Load Balancer', 'Route 53', 'CloudFront', 'Auto Scali', 'Cloud Services', NULL),
(637, 3, 'Cloud Engineer', 'Easy', 'Which service model provides development platforms?', 'PaaS', 'SaaS', 'IaaS', 'FaaS', 'PaaS', 'Cloud Concepts', NULL),
(638, 3, 'Cloud Engineer', 'Easy', 'Which service manages DNS and routing?', 'Route 53', 'CloudFront', 'S3', 'EC2', 'Route 53', 'Cloud Services', NULL),
(639, 3, 'Cloud Engineer', 'Easy', 'Which service provides serverless computing on AWS?', 'Lambda', 'EC2', 'S3', 'RDS', 'Lambda', 'Cloud Services', NULL),
(640, 3, 'Cloud Engineer', 'Easy', 'Which type of cloud is shared among multiple organizations?', 'Public Cloud', 'Private Cloud', 'Hybrid Cloud', 'Community Cloud', 'Community ', 'Cloud Concepts', NULL),
(641, 3, 'Cloud Engineer', 'Easy', 'Which Google Cloud service is for virtual machines?', 'Compute Engine', 'App Engine', 'Cloud Functions', 'BigQuery', 'Compute En', 'Cloud Providers', NULL),
(642, 3, 'Cloud Engineer', 'Easy', 'Which service stores structured relational data in the cloud?', 'RDS', 'DynamoDB', 'S3', 'Redshift', 'RDS', 'Cloud Services', NULL),
(643, 3, 'Cloud Engineer', 'Easy', 'Which AWS service delivers content via CDN?', 'CloudFront', 'S3', 'EC2', 'Lambda', 'CloudFront', 'Cloud Services', NULL),
(644, 3, 'Cloud Engineer', 'Easy', 'Which cloud deployment shares resources publicly?', 'Public Cloud', 'Private Cloud', 'Hybrid Cloud', 'Community Cloud', 'Public Clo', 'Cloud Concepts', NULL),
(645, 3, 'Cloud Engineer', 'Easy', 'Which service provides managed NoSQL databases?', 'DynamoDB', 'RDS', 'S3', 'EC2', 'DynamoDB', 'Cloud Services', NULL),
(646, 3, 'Cloud Engineer', 'Easy', 'Which service ensures high availability of applications?', 'Load Balancer', 'Auto Scaling', 'CloudFront', 'Route 53', 'Load Balan', 'Cloud Services', NULL),
(647, 3, 'Cloud Engineer', 'Easy', 'Which cloud model is fully managed by a provider for multiple users?', 'Public Cloud', 'Private Cloud', 'Hybrid Cloud', 'Community Cloud', 'Public Clo', 'Cloud Concepts', NULL),
(648, 3, 'Cloud Engineer', 'Easy', 'Which service enables container orchestration?', 'ECS', 'Lambda', 'S3', 'RDS', 'ECS', 'Cloud Services', NULL),
(649, 3, 'Cloud Engineer', 'Medium', 'Which AWS service is used for monitoring cloud resources?', 'CloudWatch', 'CloudTrail', 'CloudFront', 'Route 53', 'CloudWatch', 'Cloud Services', NULL),
(650, 3, 'Cloud Engineer', 'Medium', 'Which Azure service provides serverless computing?', 'Azure Functions', 'Azure VM', 'Azure SQL', 'Azure Blob', 'Azure Func', 'Cloud Services', NULL),
(651, 3, 'Cloud Engineer', 'Medium', 'Which Google Cloud service allows orchestration of containers?', 'Kubernetes Engine', 'Compute Engine', 'Cloud Functions', 'App Engine', 'Kubernetes', 'Cloud Services', NULL),
(652, 3, 'Cloud Engineer', 'Medium', 'Which AWS service provides managed relational databases?', 'RDS', 'DynamoDB', 'Redshift', 'S3', 'RDS', 'Cloud Services', NULL),
(653, 3, 'Cloud Engineer', 'Medium', 'Which cloud architecture ensures redundancy across regions?', 'Multi-region Deployment', 'Single-region Deployment', 'Private Cloud', 'Hybrid Cloud', 'Multi-regi', 'Cloud Architecture', NULL),
(654, 3, 'Cloud Engineer', 'Medium', 'Which tool manages infrastructure as code?', 'Terraform', 'CloudWatch', 'CloudFront', 'Route 53', 'Terraform', 'Cloud Tools', NULL),
(655, 3, 'Cloud Engineer', 'Medium', 'Which service provides centralized logging of API calls?', 'CloudTrail', 'CloudWatch', 'CloudFront', 'Route 53', 'CloudTrail', 'Cloud Services', NULL),
(656, 3, 'Cloud Engineer', 'Medium', 'Which AWS service supports message queuing?', 'SQS', 'SNS', 'Lambda', 'EC2', 'SQS', 'Cloud Services', NULL),
(657, 3, 'Cloud Engineer', 'Medium', 'Which service enables continuous integration and deployment?', 'CodePipeline', 'S3', 'EC2', 'Lambda', 'CodePipeli', 'Cloud Services', NULL),
(658, 3, 'Cloud Engineer', 'Medium', 'Which technique secures cloud data at rest?', 'Encryption', 'Authentication', 'Authorization', 'Firewall', 'Encryption', 'Security', NULL),
(659, 3, 'Cloud Engineer', 'Medium', 'Which service balances incoming traffic across instances?', 'Load Balancer', 'Auto Scaling', 'CloudFront', 'S3', 'Load Balan', 'Cloud Services', NULL),
(660, 3, 'Cloud Engineer', 'Medium', 'Which cloud provider offers BigQuery?', 'Google Cloud', 'AWS', 'Azure', 'IBM Cloud', 'Google Clo', 'Cloud Providers', NULL),
(661, 3, 'Cloud Engineer', 'Medium', 'Which AWS service helps manage identity and access?', 'IAM', 'EC2', 'S3', 'Lambda', 'IAM', 'Cloud Services', NULL),
(662, 3, 'Cloud Engineer', 'Medium', 'Which technique ensures high availability?', 'Redundancy', 'Encryption', 'Monitoring', 'Serverless', 'Redundancy', 'Cloud Architecture', NULL),
(663, 3, 'Cloud Engineer', 'Medium', 'Which service automates container deployment on AWS?', 'ECS', 'EKS', 'Lambda', 'EC2', 'ECS', 'Cloud Services', NULL),
(664, 3, 'Cloud Engineer', 'Medium', 'Which method reduces latency for global users?', 'CDN', 'Load Balancer', 'Auto Scaling', 'VPC', 'CDN', 'Cloud Architecture', NULL),
(665, 3, 'Cloud Engineer', 'Medium', 'Which tool provisions resources across multiple cloud providers?', 'Terraform', 'CloudFormation', 'Ansible', 'Puppet', 'Terraform', 'Cloud Tools', NULL),
(666, 3, 'Cloud Engineer', 'Medium', 'Which cloud concept isolates resources within a private network?', 'VPC', 'Subnet', 'Public Cloud', 'Hybrid Cloud', 'VPC', 'Cloud Architecture', NULL),
(667, 3, 'Cloud Engineer', 'Medium', 'Which service enables event-driven architecture?', 'Lambda', 'EC2', 'S3', 'RDS', 'Lambda', 'Cloud Services', NULL),
(668, 3, 'Cloud Engineer', 'Medium', 'Which tool automates configuration management?', 'Ansible', 'Terraform', 'CloudFormation', 'Kubernetes', 'Ansible', 'Cloud Tools', NULL),
(669, 3, 'Cloud Engineer', 'Hard', 'Which service allows hybrid cloud connectivity?', 'Direct Connect', 'VPN', 'CloudFront', 'S3', 'Direct Con', 'Cloud Architecture', NULL),
(670, 3, 'Cloud Engineer', 'Hard', 'Which AWS service automates compliance auditing?', 'Config', 'CloudTrail', 'CloudWatch', 'Inspector', 'Config', 'Cloud Services', NULL),
(671, 3, 'Cloud Engineer', 'Hard', 'Which method isolates workloads for multi-tenant environments?', 'VPC', 'Subnet', 'Containerization', 'All of the above', 'All of the', 'Cloud Architecture', NULL),
(672, 3, 'Cloud Engineer', 'Hard', 'Which service orchestrates Kubernetes clusters?', 'EKS', 'ECS', 'Lambda', 'EC2', 'EKS', 'Cloud Services', NULL),
(673, 3, 'Cloud Engineer', 'Hard', 'Which technique reduces costs using on-demand resources?', 'Serverless Computing', 'Dedicated Instances', 'Reserved Instances', 'Hybrid Cloud', 'Serverless', 'Cloud Architecture', NULL),
(674, 3, 'Cloud Engineer', 'Hard', 'Which tool tracks infrastructure drift?', 'Terraform', 'CloudFormation', 'Ansible', 'Puppet', 'Terraform', 'Cloud Tools', NULL),
(675, 3, 'Cloud Engineer', 'Hard', 'Which AWS service automates security assessments?', 'Inspector', 'CloudTrail', 'Config', 'IAM', 'Inspector', 'Security', NULL),
(676, 3, 'Cloud Engineer', 'Hard', 'Which cloud design ensures fault tolerance?', 'Multi-region Deployment', 'Single-region Deployment', 'Private Cloud', 'Hybrid Cloud', 'Multi-regi', 'Cloud Architecture', NULL),
(677, 3, 'Cloud Engineer', 'Hard', 'Which technique prevents data loss across regions?', 'Replication', 'Backups', 'Snapshots', 'All of the above', 'All of the', 'Cloud Architecture', NULL),
(678, 3, 'Cloud Engineer', 'Hard', 'Which service helps enforce identity policies in cloud?', 'IAM', 'CloudTrail', 'Config', 'Inspector', 'IAM', 'Security', NULL),
(679, 3, 'DevOps Engineer', 'Easy', 'Which tool is commonly used for version control?', 'Git', 'Jenkins', 'Docker', 'Kubernetes', 'Git', 'Tools', NULL),
(680, 3, 'DevOps Engineer', 'Easy', 'Which CI/CD tool automates build and deployment?', 'Jenkins', 'Git', 'Docker', 'Terraform', 'Jenkins', 'Tools', NULL),
(681, 3, 'DevOps Engineer', 'Easy', 'Which containerization platform packages applications?', 'Docker', 'Kubernetes', 'Ansible', 'Terraform', 'Docker', 'Tools', NULL),
(682, 3, 'DevOps Engineer', 'Easy', 'What does CI stand for?', 'Continuous Integration', 'Continuous Improvement', 'Code Integration', 'Cloud Integration', 'Continuous', 'Concepts', NULL),
(683, 3, 'DevOps Engineer', 'Easy', 'What does CD stand for in DevOps?', 'Continuous Deployment', 'Continuous Development', 'Code Deployment', 'Cloud Deployment', 'Continuous', 'Concepts', NULL),
(684, 3, 'DevOps Engineer', 'Easy', 'Which tool manages infrastructure as code?', 'Terraform', 'Docker', 'Jenkins', 'Git', 'Terraform', 'Tools', NULL),
(685, 3, 'DevOps Engineer', 'Easy', 'Which orchestration tool manages container clusters?', 'Kubernetes', 'Docker', 'Jenkins', 'Terraform', 'Kubernetes', 'Tools', NULL),
(686, 3, 'DevOps Engineer', 'Easy', 'Which file stores Git version history?', '.git', 'Dockerfile', 'Jenkinsfile', 'config.yml', '.git', 'Tools', NULL),
(687, 3, 'DevOps Engineer', 'Easy', 'Which tool automates configuration management?', 'Ansible', 'Git', 'Jenkins', 'Docker', 'Ansible', 'Tools', NULL),
(688, 3, 'DevOps Engineer', 'Easy', 'Which DevOps practice ensures frequent code integration?', 'CI', 'CD', 'IaC', 'Monitoring', 'CI', 'Concepts', NULL),
(689, 3, 'DevOps Engineer', 'Easy', 'Which tool monitors server metrics?', 'Prometheus', 'Docker', 'Git', 'Terraform', 'Prometheus', 'Tools', NULL),
(690, 3, 'DevOps Engineer', 'Easy', 'Which file defines a pipeline in Jenkins?', 'Jenkinsfile', 'Dockerfile', 'config.yml', '.git', 'Jenkinsfil', 'Tools', NULL),
(691, 3, 'DevOps Engineer', 'Easy', 'Which container orchestrator supports scaling?', 'Kubernetes', 'Docker', 'Terraform', 'Ansible', 'Kubernetes', 'Tools', NULL),
(692, 3, 'DevOps Engineer', 'Easy', 'Which DevOps principle emphasizes collaboration?', 'Culture', 'Automation', 'Monitoring', 'CI/CD', 'Culture', 'Concepts', NULL),
(693, 3, 'DevOps Engineer', 'Easy', 'Which tool automates software provisioning?', 'Ansible', 'Git', 'Jenkins', 'Docker', 'Ansible', 'Tools', NULL),
(694, 3, 'DevOps Engineer', 'Easy', 'Which platform packages dependencies and apps together?', 'Docker', 'Kubernetes', 'Terraform', 'Git', 'Docker', 'Tools', NULL),
(695, 3, 'DevOps Engineer', 'Easy', 'Which practice involves deploying small changes frequently?', 'Continuous Deployment', 'Continuous Integration', 'Monitoring', 'Configuration', 'Continuous', 'Concepts', NULL),
(696, 3, 'DevOps Engineer', 'Easy', 'Which tool tracks code changes across versions?', 'Git', 'Docker', 'Kubernetes', 'Jenkins', 'Git', 'Tools', NULL),
(697, 3, 'DevOps Engineer', 'Easy', 'Which DevOps practice automates tests during code changes?', 'CI', 'CD', 'IaC', 'Monitoring', 'CI', 'Concepts', NULL),
(698, 3, 'DevOps Engineer', 'Easy', 'Which tool automates building Docker images?', 'Dockerfile', 'Jenkinsfile', 'config.yml', '.git', 'Dockerfile', 'Tools', NULL),
(699, 3, 'DevOps Engineer', 'Medium', 'Which CI/CD tool integrates with GitHub Actions?', 'Jenkins', 'GitLab CI', 'Travis CI', 'All of the above', 'All of the', 'Tools', NULL),
(700, 3, 'DevOps Engineer', 'Medium', 'Which practice automates deployment to multiple servers?', 'Continuous Deployment', 'Continuous Integration', 'Monitoring', 'Configuration', 'Continuous', 'Concepts', NULL),
(701, 3, 'DevOps Engineer', 'Medium', 'Which tool manages container networking and storage?', 'Kubernetes', 'Docker', 'Jenkins', 'Ansible', 'Kubernetes', 'Tools', NULL),
(702, 3, 'DevOps Engineer', 'Medium', 'Which approach stores environment configurations as code?', 'IaC', 'CI/CD', 'Monitoring', 'Containerization', 'IaC', 'Concepts', NULL),
(703, 3, 'DevOps Engineer', 'Medium', 'Which Jenkins plugin helps build pipelines?', 'Pipeline Plugin', 'Git Plugin', 'Docker Plugin', 'Kubernetes Plugin', 'Pipeline P', 'Tools', NULL),
(704, 3, 'DevOps Engineer', 'Medium', 'Which monitoring tool integrates alerting and dashboards?', 'Grafana', 'Git', 'Terraform', 'Docker', 'Grafana', 'Tools', NULL),
(705, 3, 'DevOps Engineer', 'Medium', 'Which tool automates testing and builds in CI/CD?', 'Jenkins', 'Git', 'Docker', 'Kubernetes', 'Jenkins', 'Tools', NULL),
(706, 3, 'DevOps Engineer', 'Medium', 'Which tool orchestrates containers for scaling applications?', 'Kubernetes', 'Docker', 'Terraform', 'Ansible', 'Kubernetes', 'Tools', NULL),
(707, 3, 'DevOps Engineer', 'Medium', 'Which file defines container build instructions?', 'Dockerfile', 'Jenkinsfile', 'config.yml', '.git', 'Dockerfile', 'Tools', NULL),
(708, 3, 'DevOps Engineer', 'Medium', 'Which practice monitors system health continuously?', 'Monitoring', 'CI/CD', 'IaC', 'Containerization', 'Monitoring', 'Concepts', NULL),
(709, 3, 'DevOps Engineer', 'Medium', 'Which configuration management tool uses YAML playbooks?', 'Ansible', 'Puppet', 'Chef', 'Terraform', 'Ansible', 'Tools', NULL),
(710, 3, 'DevOps Engineer', 'Medium', 'Which tool automates deployment on cloud infrastructure?', 'Terraform', 'Docker', 'Kubernetes', 'Jenkins', 'Terraform', 'Tools', NULL),
(711, 3, 'DevOps Engineer', 'Medium', 'Which CI/CD step ensures code quality before deployment?', 'Automated Testing', 'Monitoring', 'Containerization', 'IaC', 'Automated ', 'Concepts', NULL),
(712, 3, 'DevOps Engineer', 'Medium', 'Which tool helps track infrastructure changes over time?', 'Terraform', 'Docker', 'Jenkins', 'Git', 'Terraform', 'Tools', NULL),
(713, 3, 'DevOps Engineer', 'Medium', 'Which tool deploys applications using blue-green strategy?', 'Jenkins', 'Terraform', 'Docker', 'Kubernetes', 'Jenkins', 'Tools', NULL),
(714, 3, 'DevOps Engineer', 'Medium', 'Which process rolls back changes in case of failure?', 'Rollback', 'Forward Deployment', 'Continuous Testing', 'Monitoring', 'Rollback', 'Concepts', NULL),
(715, 3, 'DevOps Engineer', 'Medium', 'Which tool monitors container metrics and logs?', 'Prometheus', 'Docker', 'Terraform', 'Ansible', 'Prometheus', 'Tools', NULL),
(716, 3, 'DevOps Engineer', 'Medium', 'Which CI/CD concept reduces manual deployment errors?', 'Automation', 'Monitoring', 'IaC', 'Containerization', 'Automation', 'Concepts', NULL),
(717, 3, 'DevOps Engineer', 'Medium', 'Which container tool isolates application processes?', 'Docker', 'Kubernetes', 'Terraform', 'Ansible', 'Docker', 'Tools', NULL),
(718, 3, 'DevOps Engineer', 'Medium', 'Which pipeline stage ensures integration with main branch?', 'CI', 'CD', 'Monitoring', 'Containerization', 'CI', 'Concepts', NULL),
(719, 3, 'DevOps Engineer', 'Hard', 'Which strategy ensures zero downtime during deployment?', 'Blue-Green Deployment', 'Canary Deployment', 'Rolling Update', 'All of the above', 'All of the', 'Deployment Strategies', NULL),
(720, 3, 'DevOps Engineer', 'Hard', 'Which tool integrates container orchestration with CI/CD pipelines?', 'Jenkins + Kubernetes', 'Docker + Git', 'Ansible + Terraform', 'Prometheus + Grafana', 'Jenkins + ', 'Tools', NULL),
(721, 3, 'DevOps Engineer', 'Hard', 'Which technique manages secrets securely in DevOps pipelines?', 'Vault', 'GitHub Secrets', 'Environment Variables', 'All of the above', 'All of the', 'Security', NULL),
(722, 3, 'DevOps Engineer', 'Hard', 'Which approach rolls out changes to a subset of users first?', 'Canary Deployment', 'Blue-Green Deployment', 'Rolling Update', 'All of the above', 'Canary Dep', 'Deployment Strategies', NULL),
(723, 3, 'DevOps Engineer', 'Hard', 'Which CI/CD pipeline step automates infrastructure provisioning?', 'IaC', 'Monitoring', 'Testing', 'Deployment', 'IaC', 'Concepts', NULL),
(724, 3, 'DevOps Engineer', 'Hard', 'Which monitoring technique analyzes system logs for anomalies?', 'Log Analysis', 'Metrics', 'Tracing', 'Alerting', 'Log Analys', 'Monitoring', NULL),
(725, 3, 'DevOps Engineer', 'Hard', 'Which tool automates cluster deployment in Kubernetes?', 'Helm', 'Docker', 'Jenkins', 'Terraform', 'Helm', 'Tools', NULL),
(726, 3, 'DevOps Engineer', 'Hard', 'Which deployment model gradually releases changes to all users?', 'Rolling Update', 'Blue-Green Deployment', 'Canary Deployment', 'All of the above', 'Rolling Up', 'Deployment Strategies', NULL),
(727, 3, 'DevOps Engineer', 'Hard', 'Which practice integrates testing, building, and deployment?', 'CI/CD', 'IaC', 'Monitoring', 'Containerization', 'CI/CD', 'Concepts', NULL),
(728, 3, 'DevOps Engineer', 'Hard', 'Which tool automates end-to-end DevOps pipelines?', 'Jenkins', 'Docker', 'Kubernetes', 'Terraform', 'Jenkins', 'Tools', NULL),
(729, 3, 'Mobile App Developer', 'Easy', 'Which language is primarily used for Android app development?', 'Java', 'Swift', 'C#', 'Kotlin', 'Java', 'Android Development', NULL),
(730, 3, 'Mobile App Developer', 'Easy', 'Which language is primarily used for iOS app development?', 'Swift', 'Java', 'Kotlin', 'Python', 'Swift', 'iOS Development', NULL),
(731, 3, 'Mobile App Developer', 'Easy', 'Which tool is used for cross-platform app development?', 'Flutter', 'Xcode', 'Android Studio', 'Visual Studio', 'Flutter', 'Cross-platform', NULL),
(732, 3, 'Mobile App Developer', 'Easy', 'Which layout is used for Android UI design?', 'LinearLayout', 'StackLayout', 'GridLayout', 'FlexLayout', 'LinearLayo', 'Android Development', NULL),
(733, 3, 'Mobile App Developer', 'Easy', 'Which iOS component manages user interactions?', 'UIViewController', 'Activity', 'Fragment', 'Intent', 'UIViewCont', 'iOS Development', NULL),
(734, 3, 'Mobile App Developer', 'Easy', 'Which database is commonly used in mobile apps?', 'SQLite', 'MySQL', 'PostgreSQL', 'MongoDB', 'SQLite', 'Mobile Databases', NULL),
(735, 3, 'Mobile App Developer', 'Easy', 'Which IDE is used for Android development?', 'Android Studio', 'Xcode', 'Visual Studio', 'Eclipse', 'Android St', 'Tools', NULL),
(736, 3, 'Mobile App Developer', 'Easy', 'Which IDE is used for iOS development?', 'Xcode', 'Android Studio', 'Visual Studio', 'Eclipse', 'Xcode', 'Tools', NULL),
(737, 3, 'Mobile App Developer', 'Easy', 'Which framework uses Dart for app development?', 'Flutter', 'React Native', 'Xamarin', 'Cordova', 'Flutter', 'Cross-platform', NULL),
(738, 3, 'Mobile App Developer', 'Easy', 'Which component handles navigation in Android?', 'Intent', 'Fragment', 'Activity', 'Service', 'Intent', 'Android Development', NULL),
(739, 3, 'Mobile App Developer', 'Easy', 'Which lifecycle method starts an Android activity?', 'onCreate()', 'onStart()', 'onResume()', 'onPause()', 'onCreate()', 'Android Development', NULL),
(740, 3, 'Mobile App Developer', 'Easy', 'Which tool is used to test Android apps?', 'Espresso', 'XCTest', 'JUnit', 'Selenium', 'Espresso', 'Testing', NULL),
(741, 3, 'Mobile App Developer', 'Easy', 'Which tool is used to test iOS apps?', 'XCTest', 'Espresso', 'JUnit', 'Appium', 'XCTest', 'Testing', NULL),
(742, 3, 'Mobile App Developer', 'Easy', 'Which iOS file stores app UI design?', '.storyboard', '.xml', '.json', '.plist', '.storyboar', 'iOS Development', NULL),
(743, 3, 'Mobile App Developer', 'Easy', 'Which Android file stores UI layout?', '.xml', '.storyboard', '.json', '.plist', '.xml', 'Android Development', NULL),
(744, 3, 'Mobile App Developer', 'Easy', 'Which method launches a new screen in Android?', 'startActivity()', 'onCreate()', 'onResume()', 'onStart()', 'startActiv', 'Android Development', NULL),
(745, 3, 'Mobile App Developer', 'Easy', 'Which framework uses JavaScript for mobile apps?', 'React Native', 'Flutter', 'Xamarin', 'Cordova', 'React Nati', 'Cross-platform', NULL),
(746, 3, 'Mobile App Developer', 'Easy', 'Which component handles background tasks in Android?', 'Service', 'Activity', 'Fragment', 'BroadcastReceiver', 'Service', 'Android Development', NULL),
(747, 3, 'Mobile App Developer', 'Easy', 'Which database library is used in iOS?', 'Core Data', 'SQLite', 'Realm', 'Firebase', 'Core Data', 'Mobile Databases', NULL),
(748, 3, 'Mobile App Developer', 'Easy', 'Which method is called when iOS app finishes launching?', 'application(_:didFinishLaunchingWithOptions:)', 'onCreate()', 'viewDidLoad()', 'start()', 'applicatio', 'iOS Development', NULL),
(749, 3, 'Mobile App Developer', 'Medium', 'Which Android component communicates between activities?', 'Intent', 'Fragment', 'Service', 'BroadcastReceiver', 'Intent', 'Android Development', NULL),
(750, 3, 'Mobile App Developer', 'Medium', 'Which method saves data persistently in Android?', 'SharedPreferences', 'SQLite', 'Room', 'All of the above', 'All of the', 'Mobile Databases', NULL),
(751, 3, 'Mobile App Developer', 'Medium', 'Which architecture pattern is used in mobile apps?', 'MVC', 'MVVM', 'MVP', 'All of the above', 'All of the', 'Architecture', NULL),
(752, 3, 'Mobile App Developer', 'Medium', 'Which Flutter widget arranges children linearly?', 'Column/Row', 'Stack', 'GridView', 'Container', 'Column/Row', 'Cross-platform', NULL),
(753, 3, 'Mobile App Developer', 'Medium', 'Which iOS lifecycle method is called before the view appears?', 'viewWillAppear()', 'viewDidLoad()', 'viewDidAppear()', 'viewDidDisappear()', 'viewWillAp', 'iOS Development', NULL),
(754, 3, 'Mobile App Developer', 'Medium', 'Which tool debugs cross-platform apps?', 'Flutter DevTools', 'Xcode', 'Android Studio', 'Visual Studio', 'Flutter De', 'Tools', NULL),
(755, 3, 'Mobile App Developer', 'Medium', 'Which service provides real-time database for mobile apps?', 'Firebase', 'SQLite', 'Realm', 'Core Data', 'Firebase', 'Mobile Databases', NULL),
(756, 3, 'Mobile App Developer', 'Medium', 'Which Android component receives broadcast messages?', 'BroadcastReceiver', 'Service', 'Activity', 'Fragment', 'BroadcastR', 'Android Development', NULL),
(757, 3, 'Mobile App Developer', 'Medium', 'Which iOS component handles app-wide notifications?', 'NotificationCenter', 'AppDelegate', 'UIViewController', 'SceneDelegate', 'Notificati', 'iOS Development', NULL),
(758, 3, 'Mobile App Developer', 'Medium', 'Which Flutter widget handles user gestures?', 'GestureDetector', 'Container', 'Stack', 'Row', 'GestureDet', 'Cross-platform', NULL),
(759, 3, 'Mobile App Developer', 'Medium', 'Which technique manages app state globally in Flutter?', 'Provider', 'Bloc', 'Redux', 'All of the above', 'All of the', 'Cross-platform', NULL),
(760, 3, 'Mobile App Developer', 'Medium', 'Which iOS tool profiles memory usage?', 'Instruments', 'XCTest', 'Simulator', 'Storyboard', 'Instrument', 'Tools', NULL),
(761, 3, 'Mobile App Developer', 'Medium', 'Which Android tool profiles CPU and memory usage?', 'Android Profiler', 'ADB', 'Lint', 'Gradle', 'Android Pr', 'Tools', NULL),
(762, 3, 'Mobile App Developer', 'Medium', 'Which Flutter layout arranges items in a grid?', 'GridView', 'Row', 'Column', 'Stack', 'GridView', 'Cross-platform', NULL),
(763, 3, 'Mobile App Developer', 'Medium', 'Which method handles deep linking in Android?', 'Intent Filters', 'onCreate()', 'onResume()', 'BroadcastReceiver', 'Intent Fil', 'Android Development', NULL),
(764, 3, 'Mobile App Developer', 'Medium', 'Which iOS method handles universal links?', 'application(_:continue:restorationHandler:)', 'viewDidLoad()', 'applicationDidBecomeActive()', 'sceneDidEnterBackground()', 'applicatio', 'iOS Development', NULL),
(765, 3, 'Mobile App Developer', 'Medium', 'Which database is NoSQL for mobile apps?', 'Realm', 'SQLite', 'Core Data', 'Firebase', 'Realm', 'Mobile Databases', NULL),
(766, 3, 'Mobile App Developer', 'Medium', 'Which Flutter widget enables scrolling lists?', 'ListView', 'GridView', 'Stack', 'Container', 'ListView', 'Cross-platform', NULL),
(767, 3, 'Mobile App Developer', 'Medium', 'Which tool manages iOS provisioning profiles?', 'Xcode', 'Android Studio', 'Flutter DevTools', 'Visual Studio', 'Xcode', 'Tools', NULL),
(768, 3, 'Mobile App Developer', 'Medium', 'Which Android component represents a portion of UI?', 'Fragment', 'Activity', 'Service', 'BroadcastReceiver', 'Fragment', 'Android Development', NULL),
(769, 3, 'Mobile App Developer', 'Hard', 'Which pattern ensures separation of UI and business logic in iOS?', 'MVVM', 'MVC', 'MVP', 'VIPER', 'MVVM', 'Architecture', NULL),
(770, 3, 'Mobile App Developer', 'Hard', 'Which technique improves app performance by reusing widgets in Flutter?', 'Widget Reuse', 'Stateful Widget', 'Stateless Widget', 'All of the above', 'All of the', 'Cross-platform', NULL),
(771, 3, 'Mobile App Developer', 'Hard', 'Which Android component allows dynamic feature modules?', 'Dynamic Feature Module', 'Fragment', 'Activity', 'Service', 'Dynamic Fe', 'Android Development', NULL),
(772, 3, 'Mobile App Developer', 'Hard', 'Which iOS design pattern handles routing between screens?', 'Coordinator Pattern', 'MVVM', 'MVC', 'Singleton', 'Coordinato', 'Architecture', NULL),
(773, 3, 'Mobile App Developer', 'Hard', 'Which Flutter technique improves state management efficiency?', 'Bloc', 'Provider', 'Redux', 'All of the above', 'All of the', 'Cross-platform', NULL),
(774, 3, 'Mobile App Developer', 'Hard', 'Which Android tool analyzes APK security?', 'Lint', 'ProGuard', 'ADB', 'Profiler', 'ProGuard', 'Tools', NULL),
(775, 3, 'Mobile App Developer', 'Hard', 'Which iOS tool obfuscates app code?', 'Swift Obfuscator', 'Xcode', 'Instruments', 'Simulator', 'Swift Obfu', 'Tools', NULL),
(776, 3, 'Mobile App Developer', 'Hard', 'Which Flutter tool performs widget testing?', 'Flutter Test', 'XCTest', 'Espresso', 'JUnit', 'Flutter Te', 'Testing', NULL),
(777, 3, 'Mobile App Developer', 'Hard', 'Which method handles multi-threading in Android?', 'AsyncTask/Coroutine', 'Thread', 'Handler', 'Looper', 'AsyncTask/', 'Android Development', NULL),
(778, 3, 'Mobile App Developer', 'Hard', 'Which iOS method manages background tasks efficiently?', 'BackgroundTask', 'AppDelegate', 'SceneDelegate', 'UIViewController', 'Background', 'iOS Development', NULL),
(779, 3, 'UI/UX Designer', 'Easy', 'What does UX stand for?', 'User Experience', 'User Execution', 'User Exploration', 'User Example', 'User Exper', 'Basics', NULL),
(780, 3, 'UI/UX Designer', 'Easy', 'What does UI stand for?', 'User Interface', 'User Interaction', 'User Integration', 'User Input', 'User Inter', 'Basics', NULL),
(781, 3, 'UI/UX Designer', 'Easy', 'Which principle ensures elements are aligned consistently?', 'Alignment', 'Contrast', 'Proximity', 'Repetition', 'Alignment', 'Design Principles', NULL),
(782, 3, 'UI/UX Designer', 'Easy', 'Which color scheme uses colors opposite on the color wheel?', 'Complementary', 'Analogous', 'Monochromatic', 'Triadic', 'Complement', 'Color Theory', NULL),
(783, 3, 'UI/UX Designer', 'Easy', 'Which design focuses on ease of use for users?', 'Usability', 'Aesthetics', 'Branding', 'Animation', 'Usability', 'UX Principles', NULL),
(784, 3, 'UI/UX Designer', 'Easy', 'Which principle involves visual weight and emphasis?', 'Hierarchy', 'Balance', 'Contrast', 'Proximity', 'Hierarchy', 'Design Principles', NULL),
(785, 3, 'UI/UX Designer', 'Easy', 'Which layout principle groups related elements together?', 'Proximity', 'Contrast', 'Alignment', 'Repetition', 'Proximity', 'Design Principles', NULL),
(786, 3, 'UI/UX Designer', 'Easy', 'Which principle uses differences to highlight important elements?', 'Contrast', 'Balance', 'Hierarchy', 'Proximity', 'Contrast', 'Design Principles', NULL),
(787, 3, 'UI/UX Designer', 'Easy', 'Which tool is commonly used for UI design?', 'Figma', 'Sketch', 'Adobe XD', 'All of the above', 'All of the', 'Tools', NULL),
(788, 3, 'UI/UX Designer', 'Easy', 'Which principle ensures consistency across a design?', 'Repetition', 'Contrast', 'Alignment', 'Hierarchy', 'Repetition', 'Design Principles', NULL),
(789, 3, 'UI/UX Designer', 'Easy', 'Which principle creates a sense of stability in design?', 'Balance', 'Contrast', 'Proximity', 'Hierarchy', 'Balance', 'Design Principles', NULL),
(790, 3, 'UI/UX Designer', 'Easy', 'Which design element indicates functionality?', 'Affordance', 'Hierarchy', 'Balance', 'Contrast', 'Affordance', 'UX Principles', NULL),
(791, 3, 'UI/UX Designer', 'Easy', 'Which UX method involves observing users interact with a product?', 'Usability Testing', 'A/B Testing', 'Prototyping', 'Wireframing', 'Usability ', 'UX Methods', NULL),
(792, 3, 'UI/UX Designer', 'Easy', 'Which method quickly represents app layout?', 'Wireframing', 'Prototyping', 'Mockup', 'Storyboard', 'Wireframin', 'UX Methods', NULL),
(793, 3, 'UI/UX Designer', 'Easy', 'Which type of prototype is fully interactive?', 'High-Fidelity', 'Low-Fidelity', 'Wireframe', 'Sketch', 'High-Fidel', 'UX Methods', NULL),
(794, 3, 'UI/UX Designer', 'Easy', 'Which type of prototype shows basic layout without interactivity?', 'Low-Fidelity', 'High-Fidelity', 'Interactive', 'Clickable', 'Low-Fideli', 'UX Methods', NULL),
(795, 3, 'UI/UX Designer', 'Easy', 'Which tool allows collaborative UI/UX design online?', 'Figma', 'Sketch', 'Adobe XD', 'InVision', 'Figma', 'Tools', NULL),
(796, 3, 'UI/UX Designer', 'Easy', 'Which principle ensures a design guides users naturally?', 'Flow', 'Balance', 'Contrast', 'Hierarchy', 'Flow', 'UX Principles', NULL),
(797, 3, 'UI/UX Designer', 'Easy', 'Which principle improves readability by spacing elements?', 'White Space', 'Alignment', 'Contrast', 'Proximity', 'White Spac', 'Design Principles', NULL),
(798, 3, 'UI/UX Designer', 'Easy', 'Which design element creates visual rhythm?', 'Repetition', 'Hierarchy', 'Contrast', 'Balance', 'Repetition', 'Design Principles', NULL),
(799, 3, 'UI/UX Designer', 'Medium', 'Which usability method measures task success rate?', 'Usability Testing', 'A/B Testing', 'Card Sorting', 'Wireframing', 'Usability ', 'UX Methods', NULL),
(800, 3, 'UI/UX Designer', 'Medium', 'Which method compares two design versions to choose the better one?', 'A/B Testing', 'Usability Testing', 'Prototyping', 'Wireframing', 'A/B Testin', 'UX Methods', NULL),
(801, 3, 'UI/UX Designer', 'Medium', 'Which principle arranges elements by importance?', 'Hierarchy', 'Balance', 'Contrast', 'Proximity', 'Hierarchy', 'Design Principles', NULL),
(802, 3, 'UI/UX Designer', 'Medium', 'Which tool is used for interactive prototypes?', 'InVision', 'Figma', 'Sketch', 'Adobe XD', 'InVision', 'Tools', NULL),
(803, 3, 'UI/UX Designer', 'Medium', 'Which UX method organizes content based on user mental models?', 'Card Sorting', 'Wireframing', 'Prototyping', 'A/B Testing', 'Card Sorti', 'UX Methods', NULL),
(804, 3, 'UI/UX Designer', 'Medium', 'Which design principle creates symmetry?', 'Balance', 'Contrast', 'Hierarchy', 'Proximity', 'Balance', 'Design Principles', NULL),
(805, 3, 'UI/UX Designer', 'Medium', 'Which type of test collects qualitative feedback?', 'User Interviews', 'A/B Testing', 'Analytics', 'Heatmaps', 'User Inter', 'UX Methods', NULL),
(806, 3, 'UI/UX Designer', 'Medium', 'Which UX activity visualizes user journey step by step?', 'Storyboard', 'Wireframe', 'Prototype', 'Mockup', 'Storyboard', 'UX Methods', NULL),
(807, 3, 'UI/UX Designer', 'Medium', 'Which type of color scheme uses adjacent colors on the color wheel?', 'Analogous', 'Complementary', 'Triadic', 'Monochromatic', 'Analogous', 'Color Theory', NULL),
(808, 3, 'UI/UX Designer', 'Medium', 'Which design component provides feedback for user actions?', 'Microinteraction', 'Macrointeraction', 'Animation', 'Transition', 'Microinter', 'UX Principles', NULL),
(809, 3, 'UI/UX Designer', 'Medium', 'Which principle guides attention using size and color?', 'Visual Hierarchy', 'Balance', 'Contrast', 'Alignment', 'Visual Hie', 'Design Principles', NULL),
(810, 3, 'UI/UX Designer', 'Medium', 'Which UX activity tests functionality before launch?', 'Prototyping', 'Wireframing', 'A/B Testing', 'User Research', 'Prototypin', 'UX Methods', NULL),
(811, 3, 'UI/UX Designer', 'Medium', 'Which design principle aligns items along edges or center?', 'Alignment', 'Contrast', 'Hierarchy', 'Proximity', 'Alignment', 'Design Principles', NULL),
(812, 3, 'UI/UX Designer', 'Medium', 'Which tool is used to create design systems?', 'Figma', 'Sketch', 'Adobe XD', 'All of the above', 'All of the', 'Tools', NULL),
(813, 3, 'UI/UX Designer', 'Medium', 'Which UX method observes users in real context?', 'Field Study', 'Lab Test', 'A/B Testing', 'Wireframing', 'Field Stud', 'UX Methods', NULL),
(814, 3, 'UI/UX Designer', 'Medium', 'Which method identifies potential usability problems?', 'Heuristic Evaluation', 'A/B Testing', 'Prototyping', 'Wireframing', 'Heuristic ', 'UX Methods', NULL),
(815, 3, 'UI/UX Designer', 'Medium', 'Which UX method visualizes site structure?', 'Sitemap', 'Wireframe', 'Prototype', 'Storyboard', 'Sitemap', 'UX Methods', NULL),
(816, 3, 'UI/UX Designer', 'Medium', 'Which principle ensures elements have enough spacing?', 'Proximity', 'Contrast', 'Hierarchy', 'Balance', 'Proximity', 'Design Principles', NULL),
(817, 3, 'UI/UX Designer', 'Medium', 'Which principle ensures important elements stand out?', 'Contrast', 'Alignment', 'Repetition', 'Flow', 'Contrast', 'Design Principles', NULL),
(818, 3, 'UI/UX Designer', 'Medium', 'Which principle ensures consistent font usage?', 'Repetition', 'Contrast', 'Balance', 'Hierarchy', 'Repetition', 'Design Principles', NULL),
(819, 3, 'UI/UX Designer', 'Hard', 'Which UX principle reduces cognitive load for users?', 'Simplicity', 'Consistency', 'Feedback', 'Affordance', 'Simplicity', 'UX Principles', NULL),
(820, 3, 'UI/UX Designer', 'Hard', 'Which method maps user emotions during interaction?', 'Experience Mapping', 'Journey Mapping', 'Wireframing', 'Prototyping', 'Experience', 'UX Methods', NULL),
(821, 3, 'UI/UX Designer', 'Hard', 'Which principle balances visual weight asymmetrically?', 'Asymmetrical Balance', 'Symmetrical Balance', 'Contrast', 'Hierarchy', 'Asymmetric', 'Design Principles', NULL),
(822, 3, 'UI/UX Designer', 'Hard', 'Which design methodology iterates quickly with feedback?', 'Design Thinking', 'Waterfall', 'Agile', 'Scrum', 'Design Thi', 'UX Methods', NULL),
(823, 3, 'UI/UX Designer', 'Hard', 'Which UX activity uncovers pain points and frustrations?', 'User Research', 'Prototyping', 'Wireframing', 'A/B Testing', 'User Resea', 'UX Methods', NULL),
(824, 3, 'UI/UX Designer', 'Hard', 'Which method prioritizes features based on user needs?', 'MoSCoW', 'Kano Model', 'Affinity Diagram', 'Card Sorting', 'MoSCoW', 'UX Methods', NULL),
(825, 3, 'UI/UX Designer', 'Hard', 'Which principle ensures content is readable on all devices?', 'Responsive Design', 'Accessibility', 'Contrast', 'Alignment', 'Responsive', 'Design Principles', NULL),
(826, 3, 'UI/UX Designer', 'Hard', 'Which principle enhances accessibility for users with disabilities?', 'Accessibility', 'Hierarchy', 'Contrast', 'Proximity', 'Accessibil', 'Design Principles', NULL),
(827, 3, 'UI/UX Designer', 'Hard', 'Which UX activity identifies workflow inefficiencies?', 'Task Analysis', 'A/B Testing', 'Wireframing', 'Prototyping', 'Task Analy', 'UX Methods', NULL),
(828, 3, 'UI/UX Designer', 'Hard', 'Which tool helps in creating interactive design systems?', 'Figma', 'Sketch', 'Adobe XD', 'All of the above', 'Figma', 'Tools', NULL),
(829, 3, 'Network Engineer', 'Easy', 'Which device connects multiple devices in a LAN?', 'Switch', 'Router', 'Firewall', 'Hub', 'Switch', 'Networking Basics', NULL),
(830, 3, 'Network Engineer', 'Easy', 'Which device directs traffic between networks?', 'Router', 'Switch', 'Hub', 'Access Point', 'Router', 'Networking Basics', NULL),
(831, 3, 'Network Engineer', 'Easy', 'Which protocol is used to assign IP addresses automatically?', 'DHCP', 'DNS', 'HTTP', 'FTP', 'DHCP', 'Protocols', NULL),
(832, 3, 'Network Engineer', 'Easy', 'Which protocol translates domain names to IP addresses?', 'DNS', 'DHCP', 'HTTP', 'FTP', 'DNS', 'Protocols', NULL),
(833, 3, 'Network Engineer', 'Easy', 'Which cable type is used for high-speed Ethernet?', 'Cat6', 'Cat3', 'Coaxial', 'Fiber', 'Cat6', 'Networking Basics', NULL),
(834, 3, 'Network Engineer', 'Easy', 'Which network topology connects all devices in a ring?', 'Ring', 'Star', 'Bus', 'Mesh', 'Ring', 'Topologies', NULL),
(835, 3, 'Network Engineer', 'Easy', 'Which device filters network traffic for security?', 'Firewall', 'Switch', 'Router', 'Hub', 'Firewall', 'Networking Basics', NULL),
(836, 3, 'Network Engineer', 'Easy', 'Which protocol is used for secure web communication?', 'HTTPS', 'HTTP', 'FTP', 'SMTP', 'HTTPS', 'Protocols', NULL),
(837, 3, 'Network Engineer', 'Easy', 'Which protocol is used for sending emails?', 'SMTP', 'IMAP', 'POP3', 'FTP', 'SMTP', 'Protocols', NULL),
(838, 3, 'Network Engineer', 'Easy', 'Which IP version uses 128-bit addresses?', 'IPv6', 'IPv4', 'IPv5', 'IPv7', 'IPv6', 'Protocols', NULL),
(839, 3, 'Network Engineer', 'Easy', 'Which IP version uses 32-bit addresses?', 'IPv4', 'IPv6', 'IPv5', 'IPv7', 'IPv4', 'Protocols', NULL),
(840, 3, 'Network Engineer', 'Easy', 'Which protocol is used for file transfer?', 'FTP', 'HTTP', 'DNS', 'SMTP', 'FTP', 'Protocols', NULL),
(841, 3, 'Network Engineer', 'Easy', 'Which network topology has all devices connected to a central hub?', 'Star', 'Bus', 'Ring', 'Mesh', 'Star', 'Topologies', NULL),
(842, 3, 'Network Engineer', 'Easy', 'Which device amplifies signals over long distances?', 'Repeater', 'Router', 'Switch', 'Firewall', 'Repeater', 'Networking Basics', NULL),
(843, 3, 'Network Engineer', 'Easy', 'Which protocol provides secure remote access?', 'SSH', 'Telnet', 'HTTP', 'FTP', 'SSH', 'Protocols', NULL),
(844, 3, 'Network Engineer', 'Easy', 'Which protocol is used to retrieve emails from server?', 'IMAP', 'SMTP', 'FTP', 'DNS', 'IMAP', 'Protocols', NULL),
(845, 3, 'Network Engineer', 'Easy', 'Which wireless standard is widely used for home networks?', 'Wi-Fi', 'Bluetooth', 'Zigbee', 'NFC', 'Wi-Fi', 'Networking Basics', NULL),
(846, 3, 'Network Engineer', 'Easy', 'Which protocol ensures reliable data delivery?', 'TCP', 'UDP', 'ICMP', 'ARP', 'TCP', 'Protocols', NULL),
(847, 3, 'Network Engineer', 'Easy', 'Which protocol is faster but unreliable?', 'UDP', 'TCP', 'HTTP', 'FTP', 'UDP', 'Protocols', NULL),
(848, 3, 'Network Engineer', 'Easy', 'Which protocol maps IP addresses to MAC addresses?', 'ARP', 'DNS', 'DHCP', 'ICMP', 'ARP', 'Protocols', NULL),
(849, 3, 'Network Engineer', 'Medium', 'Which device separates collision domains in a network?', 'Switch', 'Hub', 'Router', 'Repeater', 'Switch', 'Networking Concepts', NULL),
(850, 3, 'Network Engineer', 'Medium', 'Which protocol resolves hostnames in local network?', 'NetBIOS', 'DNS', 'DHCP', 'ARP', 'NetBIOS', 'Protocols', NULL),
(851, 3, 'Network Engineer', 'Medium', 'Which IP address class is used for large networks?', 'Class A', 'Class B', 'Class C', 'Class D', 'Class A', 'IP Addressing', NULL),
(852, 3, 'Network Engineer', 'Medium', 'Which routing protocol is distance-vector based?', 'RIP', 'OSPF', 'EIGRP', 'BGP', 'RIP', 'Routing', NULL),
(853, 3, 'Network Engineer', 'Medium', 'Which routing protocol uses link-state algorithm?', 'OSPF', 'RIP', 'BGP', 'EIGRP', 'OSPF', 'Routing', NULL),
(854, 3, 'Network Engineer', 'Medium', 'Which protocol secures email transmission?', 'SMTPS', 'SMTP', 'IMAP', 'POP3', 'SMTPS', 'Protocols', NULL),
(855, 3, 'Network Engineer', 'Medium', 'Which network type covers a small geographic area?', 'LAN', 'WAN', 'MAN', 'PAN', 'LAN', 'Networking Basics', NULL),
(856, 3, 'Network Engineer', 'Medium', 'Which network type covers a large geographic area?', 'WAN', 'LAN', 'MAN', 'PAN', 'WAN', 'Networking Basics', NULL),
(857, 3, 'Network Engineer', 'Medium', 'Which protocol prevents routing loops?', 'Spanning Tree Protocol', 'RIP', 'OSPF', 'BGP', 'Spanning T', 'Protocols', NULL),
(858, 3, 'Network Engineer', 'Medium', 'Which protocol authenticates users on a network?', 'RADIUS', 'DHCP', 'DNS', 'ARP', 'RADIUS', 'Security', NULL),
(859, 3, 'Network Engineer', 'Medium', 'Which device connects different network types together?', 'Router', 'Switch', 'Hub', 'Repeater', 'Router', 'Networking Basics', NULL),
(860, 3, 'Network Engineer', 'Medium', 'Which IP address is reserved for loopback?', '127.0.0.1', '192.168.1.1', '0.0.0.0', '255.255.255.255', '127.0.0.1', 'IP Addressing', NULL),
(861, 3, 'Network Engineer', 'Medium', 'Which protocol detects network issues using echo messages?', 'ICMP', 'TCP', 'UDP', 'ARP', 'ICMP', 'Protocols', NULL);
INSERT INTO `assessment_questions_backup` (`id`, `phase`, `career`, `difficulty`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `category`, `skill_id`) VALUES
(862, 3, 'Network Engineer', 'Medium', 'Which protocol provides encrypted web access?', 'HTTPS', 'HTTP', 'FTP', 'Telnet', 'HTTPS', 'Protocols', NULL),
(863, 3, 'Network Engineer', 'Medium', 'Which protocol is used for network management?', 'SNMP', 'DNS', 'DHCP', 'FTP', 'SNMP', 'Protocols', NULL),
(864, 3, 'Network Engineer', 'Medium', 'Which type of NAT translates multiple private IPs to one public IP?', 'PAT', 'SNAT', 'DNAT', 'Static NAT', 'PAT', 'Networking Concepts', NULL),
(865, 3, 'Network Engineer', 'Medium', 'Which topology provides fault tolerance with multiple paths?', 'Mesh', 'Star', 'Bus', 'Ring', 'Mesh', 'Topologies', NULL),
(866, 3, 'Network Engineer', 'Medium', 'Which routing protocol is used between autonomous systems?', 'BGP', 'OSPF', 'RIP', 'EIGRP', 'BGP', 'Routing', NULL),
(867, 3, 'Network Engineer', 'Medium', 'Which protocol assigns IP addresses to clients automatically?', 'DHCP', 'DNS', 'NTP', 'ARP', 'DHCP', 'Protocols', NULL),
(868, 3, 'Network Engineer', 'Medium', 'Which device operates at Layer 2 of OSI model?', 'Switch', 'Router', 'Hub', 'Firewall', 'Switch', 'Networking Basics', NULL),
(869, 3, 'Network Engineer', 'Hard', 'Which protocol uses link-state advertisements for routing?', 'OSPF', 'RIP', 'EIGRP', 'BGP', 'OSPF', 'Routing', NULL),
(870, 3, 'Network Engineer', 'Hard', 'Which protocol detects MAC address conflicts in a LAN?', 'STP', 'ARP', 'RIP', 'ICMP', 'STP', 'Networking Concepts', NULL),
(871, 3, 'Network Engineer', 'Hard', 'Which method divides a network into multiple broadcast domains?', 'VLAN', 'Subnetting', 'NAT', 'Port Forwarding', 'VLAN', 'Networking Concepts', NULL),
(872, 3, 'Network Engineer', 'Hard', 'Which device provides secure VPN access?', 'VPN Gateway', 'Router', 'Firewall', 'Switch', 'VPN Gatewa', 'Security', NULL),
(873, 3, 'Network Engineer', 'Hard', 'Which protocol is used for dynamic routing between large networks?', 'BGP', 'RIP', 'OSPF', 'EIGRP', 'BGP', 'Routing', NULL),
(874, 3, 'Network Engineer', 'Hard', 'Which protocol prevents loops in Ethernet networks?', 'Spanning Tree Protocol', 'RIP', 'BGP', 'OSPF', 'Spanning T', 'Protocols', NULL),
(875, 3, 'Network Engineer', 'Hard', 'Which subnet mask corresponds to /24?', '255.255.255.0', '255.255.0.0', '255.0.0.0', '255.255.255.255', '255.255.25', 'IP Addressing', NULL),
(876, 3, 'Network Engineer', 'Hard', 'Which wireless security protocol is most secure?', 'WPA3', 'WPA2', 'WEP', 'None', 'WPA3', 'Security', NULL),
(877, 3, 'Network Engineer', 'Hard', 'Which protocol synchronizes time across devices?', 'NTP', 'SNTP', 'FTP', 'DHCP', 'NTP', 'Protocols', NULL),
(878, 3, 'Network Engineer', 'Hard', 'Which routing protocol supports route aggregation?', 'BGP', 'RIP', 'OSPF', 'EIGRP', 'BGP', 'Routing', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_results`
--

CREATE TABLE `assessment_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_results`
--

INSERT INTO `assessment_results` (`id`, `user_id`, `phase`, `score`, `level`, `created_at`) VALUES
(1, 1, 1, 0, NULL, '2026-03-07 12:50:08'),
(2, 1, 1, 5, NULL, '2026-03-08 12:28:33'),
(3, 1, 2, 7, NULL, '2026-03-08 12:29:17'),
(4, 1, 1, 0, NULL, '2026-03-08 17:37:47'),
(5, 1, 1, 0, NULL, '2026-03-11 17:39:00'),
(6, 1, 2, 0, NULL, '2026-03-11 17:39:07'),
(7, 1, 3, 0, NULL, '2026-03-11 17:39:17');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `career_id` int(10) UNSIGNED NOT NULL,
  `career_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`career_id`, `career_name`, `description`) VALUES
(1, 'Software Engineer', 'Develop and maintain software systems.'),
(2, 'Data Scientist', 'Analyze data and build machine learning models.'),
(3, 'Web Developer', 'Design and develop websites and web apps.'),
(4, 'UI/UX Designer', 'Design intuitive user interfaces and experiences.'),
(5, 'Project Manager', 'Plan and manage projects and teams.'),
(6, 'AI Engineer', 'Develop AI systems and solutions.'),
(7, 'Cybersecurity Analyst', 'Protect systems and data from cyber threats.'),
(8, 'Cloud Engineer', 'Design and manage cloud infrastructure and services.'),
(9, 'DevOps Engineer', 'Automate deployments and manage CI/CD pipelines.'),
(10, 'Mobile App Developer', 'Design and develop mobile applications for iOS and Android.'),
(11, 'Network Engineer', 'Design, implement, and maintain computer networks.');

-- --------------------------------------------------------

--
-- Table structure for table `career_roadmap`
--

CREATE TABLE `career_roadmap` (
  `id` int(11) NOT NULL,
  `career_id` int(10) UNSIGNED NOT NULL,
  `step_order` int(11) DEFAULT NULL,
  `step_title` varchar(255) DEFAULT NULL,
  `step_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `career_roadmap`
--

INSERT INTO `career_roadmap` (`id`, `career_id`, `step_order`, `step_title`, `step_description`) VALUES
(1, 1, 1, 'Programming Basics', 'Learn C, C++ or Python fundamentals'),
(2, 1, 2, 'Data Structures', 'Master arrays, linked list, stack, queue'),
(3, 1, 3, 'Development', 'Learn web or app development'),
(4, 1, 4, 'Projects', 'Build real-world projects'),
(5, 1, 5, 'Internship', 'Gain industry experience'),
(6, 1, 6, 'Job Ready', 'Prepare for interviews & apply'),
(7, 2, 1, 'Math & Stats', 'Learn statistics and probability'),
(8, 2, 2, 'Programming', 'Python, Pandas, NumPy'),
(9, 2, 3, 'Data Analysis', 'Data cleaning & visualization'),
(10, 2, 4, 'Machine Learning', 'ML algorithms'),
(11, 2, 5, 'Projects', 'Real-world datasets'),
(12, 2, 6, 'Job Ready', 'Portfolio + interviews'),
(13, 3, 1, 'HTML/CSS', 'Frontend basics'),
(14, 3, 2, 'JavaScript', 'Dynamic web apps'),
(15, 3, 3, 'Frontend Framework', 'React / Angular'),
(16, 3, 4, 'Backend', 'Node.js / PHP'),
(17, 3, 5, 'Projects', 'Build websites'),
(18, 3, 6, 'Deployment', 'Host apps online'),
(19, 4, 1, 'Design Basics', 'Color, typography'),
(20, 4, 2, 'Tools', 'Figma / Adobe XD'),
(21, 4, 3, 'Wireframing', 'Create layouts'),
(22, 4, 4, 'Prototyping', 'Interactive designs'),
(23, 4, 5, 'Portfolio', 'Showcase designs'),
(24, 4, 6, 'Job Ready', 'Apply for roles'),
(25, 6, 1, 'Programming', 'Python basics'),
(26, 6, 2, 'Math', 'Linear algebra & stats'),
(27, 6, 3, 'Machine Learning', 'ML concepts'),
(28, 6, 4, 'Deep Learning', 'Neural networks'),
(29, 6, 5, 'Projects', 'AI projects'),
(30, 6, 6, 'Deployment', 'Model deployment'),
(31, 7, 1, 'Networking Basics', 'TCP/IP, OSI'),
(32, 7, 2, 'Security Fundamentals', 'Encryption'),
(33, 7, 3, 'Ethical Hacking', 'Pen testing'),
(34, 7, 4, 'Tools', 'Kali Linux'),
(35, 7, 5, 'Certifications', 'CEH, Security+'),
(36, 7, 6, 'Job Ready', 'Apply roles'),
(37, 8, 1, 'Cloud Basics', 'AWS/Azure intro'),
(38, 8, 2, 'Networking', 'Cloud networking'),
(39, 8, 3, 'Services', 'Compute & storage'),
(40, 8, 4, 'DevOps', 'CI/CD basics'),
(41, 8, 5, 'Projects', 'Deploy apps'),
(42, 8, 6, 'Certification', 'AWS cert'),
(43, 9, 1, 'Linux', 'Basic commands'),
(44, 9, 2, 'Scripting', 'Shell/Python'),
(45, 9, 3, 'CI/CD', 'Jenkins'),
(46, 9, 4, 'Docker', 'Containerization'),
(47, 9, 5, 'Kubernetes', 'Orchestration'),
(48, 9, 6, 'Monitoring', 'DevOps tools'),
(49, 10, 1, 'Programming', 'Java/Kotlin/Flutter'),
(50, 10, 2, 'UI Design', 'Mobile UI'),
(51, 10, 3, 'App Development', 'Build apps'),
(52, 10, 4, 'API Integration', 'Backend connect'),
(53, 10, 5, 'Testing', 'Debugging'),
(54, 10, 6, 'Publish', 'Play Store'),
(55, 11, 1, 'Networking Basics', 'Protocols'),
(56, 11, 2, 'Routing', 'Cisco concepts'),
(57, 11, 3, 'Switching', 'LAN setup'),
(58, 11, 4, 'Security', 'Firewall'),
(59, 11, 5, 'Certifications', 'CCNA'),
(60, 11, 6, 'Job Ready', 'Apply roles');

-- --------------------------------------------------------

--
-- Table structure for table `career_skills`
--

CREATE TABLE `career_skills` (
  `id` int(11) NOT NULL,
  `career_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `importance_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(100) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `user_id`, `token`, `expires_at`) VALUES
(1, 1, 'e44d5acbafe163f6eb2eb6ab6496a1bb400e10df44eda34f7d1b60c14e90cb0f0902330e795e49f11fce5c39f05be5bc6b5b', '2026-03-11 18:57:39'),
(2, 1, '591411689e667de5b18029f41d765ad5ab54f846d7040cb09655644ccb634fb637797bb39450ae19a4aa6e64325fe0fff887', '2026-03-11 19:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `psychometric_results`
--

CREATE TABLE `psychometric_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `analytical_score` int(11) DEFAULT NULL,
  `creative_score` int(11) DEFAULT NULL,
  `leadership_score` int(11) DEFAULT NULL,
  `social_score` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_progress`
--

CREATE TABLE `roadmap_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `roadmap_id` int(11) DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmap_progress`
--

INSERT INTO `roadmap_progress` (`id`, `user_id`, `roadmap_id`, `completed_at`) VALUES
(13, 18, 25, '2026-04-13 12:19:19'),
(14, 18, 26, '2026-04-13 12:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `roadmap_tasks`
--

CREATE TABLE `roadmap_tasks` (
  `id` int(11) NOT NULL,
  `roadmap_id` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(10) UNSIGNED NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`, `category`) VALUES
(1, 'JavaScript', 'Frontend'),
(2, 'PHP', 'Backend'),
(3, 'Python', 'Backend'),
(4, 'HTML', 'Frontend'),
(5, 'CSS', 'Frontend'),
(6, 'MySQL', 'Database'),
(7, 'React', 'Frontend'),
(8, 'Node.js', 'Backend'),
(9, 'Data Analysis', 'Data Science'),
(10, 'Machine Learning', 'Data Science'),
(11, 'Git', 'Tools'),
(12, 'Problem Solving', 'Core'),
(13, 'Algorithms', 'Core'),
(14, 'Communication', 'Soft Skills'),
(15, 'Teamwork', 'Soft Skills'),
(16, 'Debugging', 'Core');

-- --------------------------------------------------------

--
-- Table structure for table `skill_gap`
--

CREATE TABLE `skill_gap` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `career_id` int(11) DEFAULT NULL,
  `missing_skill_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `education` varchar(50) NOT NULL,
  `experience` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `created_at`, `education`, `experience`) VALUES
(1, 'Preeti Verma', 'preeti@gmail.com', '$2y$10$TxzDkPM4FZycK3NeyAip3urHHj8YwGPbYSD0V5/bVuW0KYm4kLOi2', '2026-02-26 01:36:53', 'Diploma', '1-2 Years'),
(2, 'Ritesh', 'ritesh@gmail.com', '$2y$10$NrOJ2sxr9iH0kgKVnt32nOaqV18H82TDG7Pv2Z/sOolIWEIz4LzVS', '2026-03-15 09:54:09', 'Graduate', 'No Experience'),
(3, 'Amisha', 'amisha@gmail.com', '$2y$10$onSwF7GihEf9BvegwbUwFuwDM0HAOvEYbGQWSNM3H6.LDz2O4cWfi', '2026-03-17 07:01:46', 'Graduate', '1-2 Years'),
(4, 'priya', 'priya@gmail.com', '$2y$10$0.4DvSNOkA4T92tOsshit.7I/Nt7gdsI8fE70mdDFffGzFqhmVlNe', '2026-03-17 07:08:58', 'Graduate', 'No Experience'),
(5, 'Sharma', 'sharma@gmail.com', '$2y$10$b6V/nFGlQesvNItpEKVbbey8Qb0UYCGE1fPzY9WFIeALdcUnRUhlG', '2026-03-22 15:43:34', 'Diploma', 'No Experience'),
(6, 'jhonny', 'jhonny@gmail.com', '$2y$10$qH4etPBTm9hoAQg8FNG4quGGOeUYDqVN2L8wFQRd4ARyqYhSDW7z.', '2026-03-29 06:43:12', 'Diploma', 'No Experience'),
(7, 'verma', 'verma@gmail.com', '$2y$10$SZUTeUNNgAIaBVNs0h.Fpuob7Daj1lF5o6H3MbECdaPGQKUFx3XDm', '2026-03-29 07:09:32', 'Postgraduate', 'No Experience'),
(8, 'Sham', 'sham@gmail.com', '$2y$10$OP6rSGP7rQsLVY.cSoZO1emSk7fSK.B.L81JFRecqSiRNZHhuBZXi', '2026-03-29 07:31:55', 'Diploma', 'No Experience'),
(9, 'Mahima', 'mahima@gmail.com', '$2y$10$6sGNQ8WT0u1zICmXlb6U2.1e4qSfP/9AW5idKvbkMEI9sntRn9ciu', '2026-03-30 04:06:04', 'Graduate', '1-2 Years'),
(10, 'Ritika', 'ritika@gmail.com', '$2y$10$OsBjfO0O7TMqV3io2KJQl.x.z7kxqOx0bsCMZXpbyQotcxDsVjXsu', '2026-03-30 05:40:16', 'Graduate', 'No Experience'),
(11, 'example', 'example@gmail.com', '$2y$10$P7RLNM.W8BM/uujJSAEY6e0HxUxvOR6nmU8Tflz5N40irAP9bDhES', '2026-03-30 06:18:18', 'Diploma', 'No Experience'),
(12, 'sample', 'sample@gmail.com', '$2y$10$VTLcFzxYyOsbkoYmWIh9f.eJAh5sPlY658vcrbVfqBxRvPfDX1X.2', '2026-03-30 07:00:34', 'Graduate', 'No Experience'),
(13, 'sample1', 'sample1@gmail.com', '$2y$10$PBlOtAVVSgNQpKAvGoPaheAyP4AwEcNec5EfVhDO893zZM7ibXw5i', '2026-03-30 07:16:23', 'Diploma', 'No Experience'),
(14, 'sample2', 'sample2@gmail.com', '$2y$10$Rfo00yFGmGVGHXnnpReOD.0P.q.5lTzWHEJoGyXH5hBSFPkpZDHie', '2026-03-31 11:02:27', 'Diploma', 'No Experience'),
(15, 'sample3', 'sample3@gmail.com', '$2y$10$XDnWMv5pUMsu1BzzaQ3aA.V7Bq95C615ICTJWGnz/U/267G1gtVbG', '2026-03-31 12:15:54', 'Diploma', 'No Experience'),
(16, 'sample4', 'sample4@gmail.com', '$2y$10$Q0vj46kwCDu7gR9EZP/dkOITFQNJBwocDH8KvQORTI/uecghndaPq', '2026-03-31 13:04:18', 'Diploma', 'No Experience'),
(17, 'sample5', 'sample5@gmail.com', '$2y$10$9mglubTP2BqWJYgqJyGfq.YUQUtMYzHVQ90RlgQgjtdfne2tzc5Ha', '2026-03-31 14:34:43', 'Diploma', 'No Experience'),
(18, 'Rohit', 'rohit@gmail.com', '$2y$10$A/4y1SznsHt1f7YBOiGLS.1ASz0Vc8fvLRWyijJ6Mc1XPopmVC1HS', '2026-04-09 08:36:40', 'Diploma', 'No Experience');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `attempt_id` varchar(50) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `selected_option` varchar(10) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `difficulty` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `response_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_id`, `attempt_id`, `question_id`, `phase`, `selected_option`, `correct`, `created_at`, `difficulty`, `category`, `response_time`) VALUES
(1, 9999, NULL, 1, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(2, 9999, NULL, 2, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(3, 9999, NULL, 3, 1, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(4, 9999, NULL, 4, 1, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(5, 9999, NULL, 5, 1, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(6, 9999, NULL, 6, 1, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(7, 9999, NULL, 7, 1, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(8, 9999, NULL, 8, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(9, 9999, NULL, 9, 1, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(10, 9999, NULL, 10, 1, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(11, 9999, NULL, 11, 1, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(12, 9999, NULL, 12, 1, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(13, 9999, NULL, 13, 1, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(14, 9999, NULL, 14, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(15, 9999, NULL, 15, 1, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(16, 9999, NULL, 16, 1, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(17, 9999, NULL, 17, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(18, 9999, NULL, 18, 1, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(19, 9999, NULL, 19, 1, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(20, 9999, NULL, 20, 1, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(21, 9999, NULL, 21, 2, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(22, 9999, NULL, 22, 2, 'B', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(23, 9999, NULL, 23, 2, 'A', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(24, 9999, NULL, 24, 2, 'D', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(25, 9999, NULL, 25, 2, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(26, 9999, NULL, 26, 2, 'B', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(27, 9999, NULL, 27, 2, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(28, 9999, NULL, 28, 2, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(29, 9999, NULL, 29, 2, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(30, 9999, NULL, 30, 2, 'B', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(31, 9999, NULL, 31, 2, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(32, 9999, NULL, 32, 2, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(33, 9999, NULL, 33, 2, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(34, 9999, NULL, 34, 2, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(35, 9999, NULL, 35, 2, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(36, 9999, NULL, 36, 2, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(37, 9999, NULL, 37, 2, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(38, 9999, NULL, 38, 2, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(39, 9999, NULL, 39, 2, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(40, 9999, NULL, 40, 2, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(41, 9999, NULL, 41, 3, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(42, 9999, NULL, 42, 3, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(43, 9999, NULL, 43, 3, 'D', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(44, 9999, NULL, 44, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(45, 9999, NULL, 45, 3, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(46, 9999, NULL, 46, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(47, 9999, NULL, 47, 3, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(48, 9999, NULL, 48, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(49, 9999, NULL, 49, 3, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(50, 9999, NULL, 50, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(51, 9999, NULL, 51, 3, 'B', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(52, 9999, NULL, 52, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(53, 9999, NULL, 53, 3, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(54, 9999, NULL, 54, 3, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(55, 9999, NULL, 55, 3, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(56, 9999, NULL, 56, 3, 'B', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(57, 9999, NULL, 57, 3, 'C', 1, '2026-03-12 14:40:07', NULL, NULL, NULL),
(58, 9999, NULL, 58, 3, 'D', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(59, 9999, NULL, 59, 3, 'C', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(60, 9999, NULL, 60, 3, 'A', 0, '2026-03-12 14:40:07', NULL, NULL, NULL),
(61, 9998, NULL, 1, 1, 'C', 0, '2026-03-12 14:44:54', NULL, NULL, NULL),
(62, 9998, NULL, 2, 1, 'A', 0, '2026-03-12 14:44:54', NULL, NULL, NULL),
(63, 9998, NULL, 3, 1, 'B', 0, '2026-03-12 14:44:54', NULL, NULL, NULL),
(64, 9998, NULL, 4, 2, 'C', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(65, 9998, NULL, 5, 2, 'B', 0, '2026-03-12 14:44:54', NULL, NULL, NULL),
(66, 9998, NULL, 6, 3, 'A', 0, '2026-03-12 14:44:54', NULL, NULL, NULL),
(67, 9997, NULL, 1, 1, 'C', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(68, 9997, NULL, 2, 1, 'C', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(69, 9997, NULL, 3, 2, 'D', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(70, 9997, NULL, 4, 2, 'C', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(71, 9997, NULL, 5, 3, 'C', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(72, 9997, NULL, 6, 3, 'D', 1, '2026-03-12 14:44:54', NULL, NULL, NULL),
(73, 1, NULL, 24, 1, 'D', 1, '2026-03-12 14:57:18', 'medium', 'logical', NULL),
(74, 1, NULL, 90, 1, 'B', 1, '2026-03-12 14:57:50', 'medium', 'numerical', NULL),
(75, 1, NULL, 149, 1, 'C', 1, '2026-03-12 14:57:56', 'medium', 'numerical', NULL),
(76, 1, NULL, 90, 1, 'B', 1, '2026-03-12 15:09:18', NULL, NULL, NULL),
(77, 1, NULL, 19, 1, 'C', 1, '2026-03-12 15:09:24', NULL, NULL, NULL),
(78, 1, NULL, 8, 1, 'C', 1, '2026-03-12 15:09:33', NULL, NULL, NULL),
(79, 1, NULL, 84, 1, 'C', 1, '2026-03-12 15:09:39', NULL, NULL, NULL),
(80, 1, NULL, 13, 1, 'B', 1, '2026-03-12 15:09:45', NULL, NULL, NULL),
(81, 1, NULL, 107, 1, 'C', 1, '2026-03-12 15:09:52', NULL, NULL, NULL),
(82, 1, NULL, 45, 1, 'C', 1, '2026-03-12 15:10:01', NULL, NULL, NULL),
(83, 1, NULL, 91, 1, 'A', 1, '2026-03-12 15:10:31', NULL, NULL, NULL),
(84, 1, NULL, 139, 1, 'A', 0, '2026-03-12 15:10:39', NULL, NULL, NULL),
(85, 1, NULL, 149, 1, 'C', 1, '2026-03-12 15:10:46', NULL, NULL, NULL),
(86, 1, NULL, 167, 1, 'B', 1, '2026-03-12 15:11:36', NULL, NULL, NULL),
(87, 1, NULL, 120, 1, 'C', 1, '2026-03-12 15:11:47', NULL, NULL, NULL),
(88, 1, NULL, 150, 1, 'B', 1, '2026-03-12 15:11:56', NULL, NULL, NULL),
(89, 1, NULL, 125, 1, 'B', 1, '2026-03-12 15:12:04', NULL, NULL, NULL),
(90, 1, NULL, 131, 1, 'C', 1, '2026-03-12 15:12:09', NULL, NULL, NULL),
(91, 1, NULL, 7, 1, 'C', 1, '2026-03-12 15:12:15', NULL, NULL, NULL),
(92, 1, NULL, 35, 1, 'C', 1, '2026-03-12 15:12:21', NULL, NULL, NULL),
(93, 1, NULL, 61, 1, 'A', 0, '2026-03-12 15:12:28', NULL, NULL, NULL),
(94, 1, NULL, 70, 1, 'A', 1, '2026-03-12 15:12:35', NULL, NULL, NULL),
(95, 1, NULL, 40, 1, 'B', 1, '2026-03-12 15:12:41', NULL, NULL, NULL),
(96, 1, NULL, 135, 1, 'C', 1, '2026-03-12 15:12:47', NULL, NULL, NULL),
(97, 1, NULL, 76, 1, 'C', 1, '2026-03-12 15:12:52', NULL, NULL, NULL),
(98, 1, NULL, 63, 1, 'C', 1, '2026-03-12 15:13:11', NULL, NULL, NULL),
(99, 1, NULL, 168, 1, 'A', 0, '2026-03-12 15:13:48', NULL, NULL, NULL),
(100, 1, NULL, 47, 1, 'A', 1, '2026-03-12 15:14:00', NULL, NULL, NULL),
(101, 1, NULL, 109, 1, 'C', 1, '2026-03-12 15:14:09', NULL, NULL, NULL),
(102, 1, NULL, 87, 1, 'D', 1, '2026-03-12 15:14:15', NULL, NULL, NULL),
(103, 1, NULL, 5, 1, 'C', 1, '2026-03-12 15:14:30', NULL, NULL, NULL),
(104, 1, NULL, 124, 1, 'B', 1, '2026-03-12 15:14:38', NULL, NULL, NULL),
(105, 1, NULL, 79, 1, 'C', 1, '2026-03-12 15:14:43', NULL, NULL, NULL),
(106, 1, NULL, 50, 1, 'B', 1, '2026-03-15 08:45:07', NULL, NULL, NULL),
(107, 1, NULL, 137, 1, 'B', 0, '2026-03-15 08:45:13', NULL, NULL, NULL),
(108, 1, NULL, 72, 1, 'A', 0, '2026-03-15 08:45:17', NULL, NULL, NULL),
(109, 1, NULL, 89, 1, 'B', 0, '2026-03-15 08:45:21', NULL, NULL, NULL),
(110, 1, NULL, 32, 1, 'C', 1, '2026-03-15 08:45:24', NULL, NULL, NULL),
(111, 1, NULL, 97, 1, 'B', 1, '2026-03-15 09:00:12', NULL, NULL, NULL),
(112, 1, NULL, 11, 1, 'B', 1, '2026-03-15 09:00:19', NULL, NULL, NULL),
(113, 1, NULL, 111, 1, 'B', 1, '2026-03-15 09:15:59', NULL, NULL, NULL),
(114, 1, NULL, 73, 0, 'C', 1, '2026-03-15 09:46:56', 'difficult', NULL, NULL),
(115, 1, NULL, 165, 0, 'B', 0, '2026-03-15 09:47:57', 'difficult', NULL, NULL),
(116, 1, NULL, 165, 0, 'B', 0, '2026-03-15 09:48:08', 'medium', NULL, NULL),
(117, 1, NULL, 145, 1, 'A', 1, '2026-03-15 09:51:20', 'easy', NULL, NULL),
(118, 2, NULL, 152, 0, 'B', 0, '2026-03-15 09:59:19', 'difficult', NULL, NULL),
(119, 2, NULL, 414, 3, 'B', 0, '2026-03-15 10:13:30', 'medium', NULL, NULL),
(120, 2, NULL, 387, 3, 'B', 0, '2026-03-15 10:13:44', 'easy', NULL, NULL),
(121, 2, NULL, 386, 3, 'A', 0, '2026-03-15 10:13:58', 'easy', NULL, NULL),
(122, 2, NULL, 288, 3, 'A', 0, '2026-03-15 10:14:07', 'easy', NULL, NULL),
(123, 2, NULL, 379, 3, 'A', 0, '2026-03-15 10:14:18', 'easy', NULL, NULL),
(124, 2, NULL, 173, 1, 'C', 1, '2026-03-15 10:19:32', 'difficult', NULL, NULL),
(125, 2, NULL, 154, 1, 'B', 0, '2026-03-15 10:19:40', 'difficult', NULL, NULL),
(126, 2, NULL, 160, 1, 'C', 1, '2026-03-15 10:19:57', 'difficult', NULL, NULL),
(127, 2, NULL, 166, 1, 'B', 0, '2026-03-15 10:20:09', 'difficult', NULL, NULL),
(128, 2, NULL, 166, 1, 'C', 0, '2026-03-15 11:37:54', 'difficult', NULL, NULL),
(129, 2, NULL, 161, 1, 'B', 0, '2026-03-15 11:39:37', 'difficult', NULL, NULL),
(130, 2, NULL, 155, 1, 'D', 0, '2026-03-15 11:44:36', 'difficult', NULL, NULL),
(131, 2, NULL, 154, 1, 'B', 0, '2026-03-15 12:21:31', 'difficult', NULL, NULL),
(132, 2, NULL, 154, 1, 'B', 0, '2026-03-15 12:21:40', 'medium', NULL, NULL),
(133, 2, NULL, 154, 1, 'B', 0, '2026-03-15 12:21:51', 'easy', NULL, NULL),
(134, 2, NULL, 154, 1, 'B', 0, '2026-03-15 12:22:03', 'easy', NULL, NULL),
(135, 2, NULL, 154, 1, 'B', 0, '2026-03-15 12:22:12', 'easy', NULL, NULL),
(136, 2, NULL, 173, 1, 'C', 1, '2026-03-15 12:24:37', 'difficult', NULL, NULL),
(137, 2, NULL, 159, 1, 'C', 1, '2026-03-15 12:28:14', 'difficult', NULL, NULL),
(138, 2, NULL, 170, 1, 'C', 0, '2026-03-15 12:28:36', 'difficult', NULL, NULL),
(139, 2, NULL, 161, 1, 'B', 0, '2026-03-15 12:40:31', 'difficult', NULL, NULL),
(140, 2, NULL, 103, 1, 'B', 1, '2026-03-15 12:40:58', 'easy', NULL, NULL),
(141, 2, NULL, 70, 1, 'A', 1, '2026-03-15 12:41:15', 'easy', NULL, NULL),
(142, 2, NULL, 131, 1, 'C', 1, '2026-03-15 12:41:35', 'easy', NULL, NULL),
(143, 2, NULL, 179, 2, 'B', 0, '2026-03-15 12:41:48', 'difficult', NULL, NULL),
(144, 2, NULL, 176, 2, 'A', 1, '2026-03-15 12:49:25', 'difficult', NULL, NULL),
(145, 2, NULL, 280, 3, 'A', 0, '2026-03-15 12:49:35', 'medium', NULL, NULL),
(146, 2, NULL, 279, 3, 'A', 0, '2026-03-15 12:49:58', 'easy', NULL, NULL),
(147, 2, NULL, 281, 3, 'C', 0, '2026-03-15 12:50:14', 'easy', NULL, NULL),
(148, 2, NULL, 283, 3, 'A', 0, '2026-03-15 12:50:28', 'easy', NULL, NULL),
(149, 2, NULL, 288, 3, 'C', 0, '2026-03-15 12:50:45', 'easy', NULL, NULL),
(150, 4, NULL, 151, 1, 'C', 0, '2026-03-17 07:10:49', 'difficult', NULL, NULL),
(151, 3, '1773768351', 151, 1, 'A', 0, '2026-03-17 17:34:21', 'difficult', NULL, NULL),
(152, 3, '1773768351', 176, 2, 'A', 1, '2026-03-17 17:36:09', 'difficult', NULL, NULL),
(153, 3, '1773768351', 202, 2, 'B', 0, '2026-03-17 17:36:28', 'easy', NULL, NULL),
(154, 3, '1773768351', 203, 2, 'B', 0, '2026-03-17 17:36:42', 'easy', NULL, NULL),
(155, 3, '1773768351', 329, 3, '0', 0, '2026-03-17 17:45:08', '0', NULL, 7),
(156, 3, '1773768351', 329, 3, 'C', 0, '2026-03-17 17:46:20', 'medium', NULL, NULL),
(157, 3, NULL, 329, 3, 'A', 0, '2026-03-17 17:54:31', 'difficult', NULL, 8),
(158, 3, NULL, 330, 3, 'C', 0, '2026-03-17 17:54:43', 'easy', NULL, 12),
(159, 5, NULL, 1, 1, 'C', 1, '2026-03-22 17:03:29', 'difficult', NULL, 10),
(160, 5, NULL, 1, 1, 'C', 1, '2026-03-22 17:05:02', 'easy', NULL, 93),
(161, 5, NULL, 1, 1, 'C', 1, '2026-03-22 17:26:24', 'difficult', NULL, 8),
(162, 5, NULL, 2, 1, 'C', 1, '2026-03-22 17:26:48', 'easy', NULL, 13),
(163, 5, NULL, 3, 1, 'C', 1, '2026-03-22 17:27:08', 'easy', NULL, 11),
(164, 5, NULL, 151, 1, 'B', 1, '2026-03-27 13:18:37', 'difficult', NULL, 10),
(165, 5, NULL, 1, 1, 'C', 1, '2026-03-27 13:19:33', 'easy', NULL, 12),
(166, 5, NULL, 151, 1, 'B', 1, '2026-03-27 13:39:52', 'difficult', NULL, 11),
(167, 5, NULL, 152, 1, 'C', 1, '2026-03-27 13:40:28', 'difficult', NULL, 36),
(168, 5, NULL, 153, 1, 'A', 0, '2026-03-27 13:40:36', 'difficult', NULL, 8),
(169, 5, NULL, 11, 1, 'B', 1, '2026-03-27 13:40:42', 'medium', NULL, 6),
(170, 5, NULL, 154, 1, 'C', 1, '2026-03-27 13:40:49', 'difficult', NULL, 7),
(171, 5, NULL, 155, 1, 'B', 1, '2026-03-27 13:40:59', 'difficult', NULL, 10),
(172, 5, NULL, 156, 1, 'A', 0, '2026-03-27 13:41:05', 'difficult', NULL, 6),
(173, 5, NULL, 12, 1, 'C', 0, '2026-03-27 13:41:10', 'medium', NULL, 5),
(174, 5, NULL, 1, 1, 'C', 1, '2026-03-27 13:41:15', 'easy', NULL, 5),
(175, 5, NULL, 13, 1, 'B', 1, '2026-03-27 13:41:20', 'medium', NULL, 5),
(176, 5, NULL, 176, 2, 'B', 0, '2026-03-27 13:50:46', 'difficult', NULL, 10),
(177, 5, NULL, 207, 2, 'A', 1, '2026-03-27 13:50:51', 'medium', NULL, 5),
(178, 5, NULL, 151, 1, 'B', 1, '2026-03-27 13:51:26', 'difficult', NULL, 5),
(179, 5, NULL, 151, 1, 'B', 1, '2026-03-27 14:05:45', 'difficult', NULL, 10),
(180, 5, NULL, 152, 1, 'C', 1, '2026-03-27 14:05:50', 'difficult', NULL, 15),
(181, 5, NULL, 153, 1, 'A', 0, '2026-03-27 14:05:55', 'difficult', NULL, 20),
(182, 5, NULL, 11, 1, 'B', 1, '2026-03-27 14:06:01', 'medium', NULL, 26),
(183, 5, NULL, 154, 1, 'B', 0, '2026-03-27 14:06:06', 'difficult', NULL, 31),
(184, 5, NULL, 12, 1, 'D', 1, '2026-03-27 14:06:11', 'medium', NULL, 36),
(185, 5, NULL, 155, 1, 'C', 0, '2026-03-27 14:06:16', 'difficult', NULL, 41),
(186, 5, NULL, 13, 1, 'B', 1, '2026-03-27 14:07:20', 'medium', NULL, 105),
(187, 5, NULL, 156, 1, 'A', 0, '2026-03-27 14:07:27', 'difficult', NULL, 112),
(188, 5, NULL, 14, 1, 'B', 0, '2026-03-27 14:07:38', 'medium', NULL, 123),
(189, 5, NULL, 14, 1, 'B', 0, '2026-03-27 14:07:49', 'difficult', NULL, 1774620469),
(190, 5, NULL, 14, 1, 'B', 0, '2026-03-27 14:07:57', 'difficult', NULL, 1774620477),
(191, 5, NULL, 176, 2, 'A', 1, '2026-03-27 14:08:33', 'difficult', NULL, 27),
(192, 5, NULL, 177, 2, 'B', 0, '2026-03-27 14:08:39', 'difficult', NULL, 33),
(193, 5, NULL, 207, 2, 'A', 1, '2026-03-27 14:08:43', 'medium', NULL, 37),
(194, 5, NULL, 178, 2, 'B', 0, '2026-03-27 14:08:46', 'difficult', NULL, 40),
(195, 5, NULL, 208, 2, 'B', 0, '2026-03-27 14:08:49', 'medium', NULL, 43),
(196, 5, NULL, 350, 3, 'B', 0, '2026-03-27 15:11:54', 'difficult', NULL, 412),
(197, 5, NULL, 350, 3, 'B', 0, '2026-03-27 15:21:17', 'difficult', NULL, 4),
(198, 5, NULL, 351, 3, 'B', 0, '2026-03-27 15:21:25', 'medium', NULL, 12),
(199, 5, NULL, 349, 3, 'A', 0, '2026-03-27 15:21:28', 'easy', NULL, 15),
(200, 5, NULL, 358, 3, 'A', 0, '2026-03-27 15:21:31', 'easy', NULL, 18),
(201, 5, NULL, 729, 3, 'C', 0, '2026-03-27 15:21:34', 'easy', NULL, 21),
(202, 5, NULL, 730, 3, 'B', 0, '2026-03-27 15:21:38', 'easy', NULL, 25),
(203, 5, NULL, 731, 3, 'A', 0, '2026-03-27 15:21:45', 'easy', NULL, 32),
(204, 5, NULL, 732, 3, 'B', 0, '2026-03-27 15:21:49', 'easy', NULL, 36),
(205, 5, NULL, 733, 3, 'A', 0, '2026-03-27 15:21:52', 'easy', NULL, 39),
(206, 5, NULL, 734, 3, 'C', 0, '2026-03-27 15:21:58', 'easy', NULL, 45),
(207, 5, NULL, 735, 3, 'A', 0, '2026-03-27 15:22:04', 'easy', NULL, 51),
(208, 5, NULL, 736, 3, 'A', 0, '2026-03-27 15:22:11', 'easy', NULL, 58),
(209, 5, NULL, 737, 3, 'C', 0, '2026-03-27 15:22:15', 'easy', NULL, 62),
(210, 5, NULL, 738, 3, 'A', 0, '2026-03-27 15:22:32', 'easy', NULL, 79),
(211, 5, NULL, 738, 3, 'A', 0, '2026-03-27 15:24:22', 'difficult', NULL, 189),
(212, 5, NULL, 738, 3, 'A', 0, '2026-03-27 15:26:36', 'difficult', NULL, 323),
(213, 5, NULL, 738, 3, 'A', 0, '2026-03-27 15:34:16', 'difficult', NULL, 783),
(214, 5, NULL, 151, 1, 'A', 0, '2026-03-27 15:36:31', 'difficult', NULL, 6),
(215, 5, NULL, 11, 1, 'B', 1, '2026-03-27 15:36:35', 'medium', NULL, 10),
(216, 5, NULL, 152, 1, 'C', 1, '2026-03-27 15:36:39', 'difficult', NULL, 14),
(217, 5, NULL, 153, 1, 'A', 0, '2026-03-27 15:36:42', 'difficult', NULL, 17),
(218, 5, NULL, 12, 1, 'D', 1, '2026-03-27 15:36:46', 'medium', NULL, 21),
(219, 5, NULL, 154, 1, 'A', 0, '2026-03-27 15:36:50', 'difficult', NULL, 25),
(220, 5, NULL, 13, 1, 'B', 1, '2026-03-27 15:36:54', 'medium', NULL, 29),
(221, 5, NULL, 155, 1, 'C', 0, '2026-03-27 15:36:59', 'difficult', NULL, 34),
(222, 5, NULL, 14, 1, 'B', 0, '2026-03-27 15:37:02', 'medium', NULL, 37),
(223, 5, NULL, 1, 1, 'C', 1, '2026-03-27 15:37:06', 'easy', NULL, 41),
(224, 5, NULL, 176, 2, 'A', 1, '2026-03-27 15:37:17', 'difficult', NULL, 4),
(225, 5, NULL, 177, 2, 'A', 1, '2026-03-27 15:37:20', 'difficult', NULL, 7),
(226, 5, NULL, 178, 2, 'C', 0, '2026-03-27 15:37:23', 'difficult', NULL, 10),
(227, 5, NULL, 207, 2, 'B', 0, '2026-03-27 15:37:26', 'medium', NULL, 13),
(228, 5, NULL, 202, 2, 'A', 1, '2026-03-27 15:37:31', 'easy', NULL, 18),
(229, 5, NULL, 208, 2, 'A', 1, '2026-03-27 15:37:34', 'medium', NULL, 21),
(230, 5, NULL, 179, 2, 'A', 1, '2026-03-27 15:37:37', 'difficult', NULL, 24),
(231, 5, NULL, 180, 2, 'A', 1, '2026-03-27 15:37:40', 'difficult', NULL, 27),
(232, 5, NULL, 181, 2, 'A', 1, '2026-03-27 15:37:45', 'difficult', NULL, 32),
(233, 5, NULL, 182, 2, 'A', 1, '2026-03-27 15:37:50', 'difficult', NULL, 37),
(234, 6, NULL, 151, 1, 'A', 0, '2026-03-29 06:44:18', 'difficult', NULL, 4),
(235, 6, NULL, 11, 1, 'B', 1, '2026-03-29 06:44:22', 'medium', NULL, 8),
(236, 6, NULL, 152, 1, 'C', 1, '2026-03-29 06:44:27', 'difficult', NULL, 13),
(237, 6, NULL, 153, 1, 'A', 0, '2026-03-29 06:44:32', 'difficult', NULL, 18),
(238, 6, NULL, 12, 1, 'B', 0, '2026-03-29 06:44:35', 'medium', NULL, 21),
(239, 6, NULL, 1, 1, 'C', 1, '2026-03-29 06:44:39', 'easy', NULL, 25),
(240, 6, NULL, 13, 1, 'B', 1, '2026-03-29 06:44:47', 'medium', NULL, 33),
(241, 6, NULL, 154, 1, 'A', 0, '2026-03-29 06:44:50', 'difficult', NULL, 36),
(242, 6, NULL, 14, 1, 'C', 1, '2026-03-29 06:44:57', 'medium', NULL, 43),
(243, 6, NULL, 155, 1, 'D', 0, '2026-03-29 06:45:11', 'difficult', NULL, 57),
(244, 6, NULL, 176, 2, 'A', 1, '2026-03-29 06:45:50', 'difficult', NULL, 7),
(245, 6, NULL, 177, 2, 'B', 0, '2026-03-29 06:45:53', 'difficult', NULL, 10),
(246, 6, NULL, 207, 2, 'D', 0, '2026-03-29 06:45:56', 'medium', NULL, 13),
(247, 6, NULL, 202, 2, 'A', 1, '2026-03-29 06:46:01', 'easy', NULL, 18),
(248, 6, NULL, 208, 2, 'B', 0, '2026-03-29 06:46:07', 'medium', NULL, 24),
(249, 6, NULL, 203, 2, 'B', 0, '2026-03-29 06:46:10', 'easy', NULL, 27),
(250, 6, NULL, 204, 2, 'D', 0, '2026-03-29 06:46:13', 'easy', NULL, 30),
(251, 6, NULL, 205, 2, 'A', 1, '2026-03-29 06:46:17', 'easy', NULL, 34),
(252, 6, NULL, 209, 2, 'C', 0, '2026-03-29 06:46:20', 'medium', NULL, 37),
(253, 6, NULL, 206, 2, 'B', 0, '2026-03-29 06:46:24', 'easy', NULL, 41),
(254, 6, NULL, 280, 3, 'A', 0, '2026-03-29 06:46:36', 'difficult', NULL, 7),
(255, 6, NULL, 282, 3, 'B', 0, '2026-03-29 06:46:41', 'medium', NULL, 12),
(256, 6, NULL, 279, 3, 'A', 0, '2026-03-29 06:46:48', 'easy', NULL, 19),
(257, 6, NULL, 281, 3, 'B', 0, '2026-03-29 06:46:53', 'easy', NULL, 24),
(258, 6, NULL, 283, 3, 'A', 0, '2026-03-29 06:46:57', 'easy', NULL, 28),
(259, 6, NULL, 288, 3, 'C', 0, '2026-03-29 06:47:03', 'easy', NULL, 34),
(260, 6, NULL, 379, 3, 'B', 0, '2026-03-29 06:47:09', 'easy', NULL, 40),
(261, 6, NULL, 380, 3, 'C', 0, '2026-03-29 06:47:15', 'easy', NULL, 46),
(262, 6, NULL, 151, 1, 'A', 0, '2026-03-29 06:58:31', 'difficult', NULL, 7),
(263, 6, NULL, 11, 1, 'C', 0, '2026-03-29 06:58:33', 'medium', NULL, 9),
(264, 6, NULL, 1, 1, 'C', 1, '2026-03-29 06:58:38', 'easy', NULL, 14),
(265, 6, NULL, 12, 1, 'D', 1, '2026-03-29 06:58:42', 'medium', NULL, 18),
(266, 6, NULL, 152, 1, 'C', 1, '2026-03-29 06:58:48', 'difficult', NULL, 24),
(267, 6, NULL, 153, 1, 'B', 0, '2026-03-29 06:58:51', 'difficult', NULL, 27),
(268, 6, NULL, 13, 1, 'B', 1, '2026-03-29 06:58:55', 'medium', NULL, 31),
(269, 6, NULL, 154, 1, 'B', 0, '2026-03-29 06:58:58', 'difficult', NULL, 34),
(270, 6, NULL, 14, 1, 'C', 1, '2026-03-29 06:59:03', 'medium', NULL, 39),
(271, 6, NULL, 155, 1, 'D', 0, '2026-03-29 06:59:09', 'difficult', NULL, 45),
(272, 6, NULL, 176, 2, 'B', 0, '2026-03-29 06:59:12', 'difficult', NULL, 3),
(273, 6, NULL, 207, 2, 'D', 0, '2026-03-29 06:59:16', 'medium', NULL, 7),
(274, 6, NULL, 202, 2, 'C', 0, '2026-03-29 06:59:18', 'easy', NULL, 9),
(275, 6, NULL, 203, 2, 'A', 1, '2026-03-29 06:59:21', 'easy', NULL, 12),
(276, 6, NULL, 208, 2, 'C', 0, '2026-03-29 06:59:25', 'medium', NULL, 16),
(277, 6, NULL, 204, 2, 'A', 0, '2026-03-29 06:59:27', 'easy', NULL, 18),
(278, 6, NULL, 205, 2, 'B', 0, '2026-03-29 06:59:31', 'easy', NULL, 22),
(279, 6, NULL, 206, 2, 'C', 0, '2026-03-29 06:59:34', 'easy', NULL, 25),
(280, 6, NULL, 212, 2, 'D', 0, '2026-03-29 06:59:36', 'easy', NULL, 27),
(281, 6, NULL, 213, 2, 'C', 0, '2026-03-29 06:59:40', 'easy', NULL, 31),
(282, 6, NULL, 213, 2, 'A', 0, '2026-03-29 06:59:47', 'easy', NULL, 0),
(283, 6, NULL, 279, 3, 'C', 0, '2026-03-29 07:01:01', 'easy', NULL, 67),
(284, 6, NULL, 281, 3, 'B', 0, '2026-03-29 07:01:10', 'easy', NULL, 76),
(285, 6, NULL, 283, 3, 'A', 0, '2026-03-29 07:01:16', 'easy', NULL, 82),
(286, 6, NULL, 288, 3, 'A', 0, '2026-03-29 07:01:22', 'easy', NULL, 88),
(287, 6, NULL, 379, 3, 'C', 0, '2026-03-29 07:01:26', 'easy', NULL, 92),
(288, 6, NULL, 380, 3, 'C', 0, '2026-03-29 07:01:30', 'easy', NULL, 96),
(289, 7, NULL, 151, 1, 'B', 1, '2026-03-29 07:10:18', 'difficult', NULL, 6),
(290, 7, NULL, 152, 1, 'C', 1, '2026-03-29 07:10:22', 'difficult', NULL, 10),
(291, 7, NULL, 153, 1, 'B', 0, '2026-03-29 07:10:25', 'difficult', NULL, 13),
(292, 7, NULL, 11, 1, 'B', 1, '2026-03-29 07:10:30', 'medium', NULL, 18),
(293, 7, NULL, 154, 1, 'B', 0, '2026-03-29 07:10:32', 'difficult', NULL, 20),
(294, 7, NULL, 12, 1, 'B', 0, '2026-03-29 07:10:36', 'medium', NULL, 24),
(295, 7, NULL, 1, 1, 'C', 1, '2026-03-29 07:10:39', 'easy', NULL, 27),
(296, 7, NULL, 13, 1, 'B', 1, '2026-03-29 07:10:44', 'medium', NULL, 32),
(297, 7, NULL, 155, 1, 'D', 0, '2026-03-29 07:10:47', 'difficult', NULL, 35),
(298, 7, NULL, 14, 1, 'C', 1, '2026-03-29 07:10:53', 'medium', NULL, 41),
(299, 7, NULL, 176, 2, 'A', 1, '2026-03-29 07:11:01', 'difficult', NULL, 8),
(300, 7, NULL, 177, 2, 'D', 0, '2026-03-29 07:11:05', 'difficult', NULL, 12),
(301, 7, NULL, 207, 2, 'B', 0, '2026-03-29 07:11:09', 'medium', NULL, 16),
(302, 7, NULL, 202, 2, 'A', 1, '2026-03-29 07:11:11', 'easy', NULL, 18),
(303, 7, NULL, 208, 2, 'C', 0, '2026-03-29 07:11:14', 'medium', NULL, 21),
(304, 7, NULL, 203, 2, 'B', 0, '2026-03-29 07:11:16', 'easy', NULL, 23),
(305, 7, NULL, 204, 2, 'A', 0, '2026-03-29 07:11:19', 'easy', NULL, 26),
(306, 7, NULL, 205, 2, 'B', 0, '2026-03-29 07:11:23', 'easy', NULL, 30),
(307, 7, NULL, 206, 2, 'D', 0, '2026-03-29 07:11:26', 'easy', NULL, 33),
(308, 7, NULL, 212, 2, 'B', 0, '2026-03-29 07:11:30', 'easy', NULL, 37),
(309, 7, NULL, 212, 2, 'B', 0, '2026-03-29 07:11:37', 'easy', NULL, 0),
(310, 7, NULL, 378, 3, 'C', 0, '2026-03-29 07:11:49', 'easy', NULL, 5),
(311, 7, NULL, 829, 3, 'A', 0, '2026-03-29 07:11:59', 'easy', NULL, 15),
(312, 7, NULL, 830, 3, 'A', 0, '2026-03-29 07:12:06', 'easy', NULL, 22),
(313, 7, NULL, 831, 3, 'C', 0, '2026-03-29 07:12:13', 'easy', NULL, 29),
(314, 7, NULL, 832, 3, 'C', 0, '2026-03-29 07:12:18', 'easy', NULL, 34),
(315, 7, NULL, 833, 3, 'C', 0, '2026-03-29 07:12:24', 'easy', NULL, 40),
(316, 7, NULL, 834, 3, 'A', 0, '2026-03-29 07:12:28', 'easy', NULL, 44),
(317, 7, NULL, 835, 3, 'C', 0, '2026-03-29 07:12:31', 'easy', NULL, 47),
(318, 7, NULL, 836, 3, 'A', 0, '2026-03-29 07:12:35', 'easy', NULL, 51),
(319, 7, NULL, 837, 3, 'A', 0, '2026-03-29 07:12:40', 'easy', NULL, 56),
(320, 7, NULL, 838, 3, 'A', 0, '2026-03-29 07:12:44', 'easy', NULL, 60),
(321, 7, NULL, 839, 3, 'A', 0, '2026-03-29 07:12:53', 'easy', NULL, 69),
(322, 7, NULL, 840, 3, 'C', 0, '2026-03-29 07:12:56', 'easy', NULL, 72),
(323, 7, NULL, 841, 3, 'D', 0, '2026-03-29 07:13:02', 'easy', NULL, 78),
(324, 7, NULL, 842, 3, 'A', 0, '2026-03-29 07:13:09', 'easy', NULL, 85),
(325, 8, NULL, 151, 1, 'B', 1, '2026-03-29 07:32:34', 'difficult', NULL, 3),
(326, 8, NULL, 152, 1, 'C', 1, '2026-03-29 07:32:37', 'difficult', NULL, 6),
(327, 8, NULL, 153, 1, 'C', 0, '2026-03-29 07:32:42', 'difficult', NULL, 11),
(328, 8, NULL, 11, 1, 'A', 0, '2026-03-29 07:32:44', 'medium', NULL, 13),
(329, 8, NULL, 1, 1, 'C', 1, '2026-03-29 07:32:47', 'easy', NULL, 16),
(330, 8, NULL, 12, 1, 'D', 1, '2026-03-29 07:32:51', 'medium', NULL, 20),
(331, 8, NULL, 154, 1, 'B', 0, '2026-03-29 07:32:54', 'difficult', NULL, 23),
(332, 8, NULL, 13, 1, 'B', 1, '2026-03-29 07:32:56', 'medium', NULL, 25),
(333, 8, NULL, 155, 1, 'B', 1, '2026-03-29 07:32:59', 'difficult', NULL, 28),
(334, 8, NULL, 156, 1, 'C', 0, '2026-03-29 07:33:02', 'difficult', NULL, 31),
(335, 8, NULL, 176, 2, 'A', 1, '2026-03-29 07:33:09', 'difficult', NULL, 7),
(336, 8, NULL, 177, 2, 'B', 0, '2026-03-29 07:33:11', 'difficult', NULL, 9),
(337, 8, NULL, 207, 2, 'B', 0, '2026-03-29 07:33:13', 'medium', NULL, 11),
(338, 8, NULL, 202, 2, 'B', 0, '2026-03-29 07:33:15', 'easy', NULL, 13),
(339, 8, NULL, 203, 2, 'B', 0, '2026-03-29 07:33:17', 'easy', NULL, 15),
(340, 8, NULL, 204, 2, 'C', 0, '2026-03-29 07:33:23', 'easy', NULL, 21),
(341, 8, NULL, 205, 2, 'A', 1, '2026-03-29 07:33:25', 'easy', NULL, 23),
(342, 8, NULL, 208, 2, 'C', 0, '2026-03-29 07:33:28', 'medium', NULL, 26),
(343, 8, NULL, 206, 2, 'C', 0, '2026-03-29 07:33:30', 'easy', NULL, 28),
(344, 8, NULL, 212, 2, 'B', 0, '2026-03-29 07:33:32', 'easy', NULL, 30),
(345, 8, NULL, 212, 2, 'C', 0, '2026-03-29 07:33:41', 'easy', NULL, 0),
(346, 8, NULL, 212, 2, 'A', 1, '2026-03-29 07:33:47', 'easy', NULL, 0),
(347, 8, NULL, 679, 3, 'C', 0, '2026-03-29 07:34:04', 'easy', NULL, 11),
(348, 8, NULL, 680, 3, 'B', 0, '2026-03-29 07:34:10', 'easy', NULL, 17),
(349, 8, NULL, 681, 3, 'B', 0, '2026-03-29 07:34:15', 'easy', NULL, 22),
(350, 8, NULL, 682, 3, 'A', 0, '2026-03-29 07:34:22', 'easy', NULL, 29),
(351, 8, NULL, 683, 3, 'D', 0, '2026-03-29 07:34:28', 'easy', NULL, 35),
(352, 8, NULL, 684, 3, 'A', 0, '2026-03-29 07:34:31', 'easy', NULL, 38),
(353, 8, NULL, 685, 3, 'B', 0, '2026-03-29 07:34:34', 'easy', NULL, 41),
(354, 8, NULL, 686, 3, 'B', 0, '2026-03-29 07:34:38', 'easy', NULL, 45),
(355, 8, NULL, 687, 3, 'B', 0, '2026-03-29 07:34:41', 'easy', NULL, 48),
(356, 8, NULL, 688, 3, 'C', 0, '2026-03-29 07:34:43', 'easy', NULL, 50),
(357, 8, NULL, 689, 3, 'A', 0, '2026-03-29 07:34:46', 'easy', NULL, 53),
(358, 8, NULL, 690, 3, 'C', 0, '2026-03-29 07:34:49', 'easy', NULL, 56),
(359, 8, NULL, 691, 3, 'A', 0, '2026-03-29 07:34:56', 'easy', NULL, 63),
(360, 8, NULL, 692, 3, 'C', 0, '2026-03-29 07:34:59', 'easy', NULL, 66),
(361, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:35:11', 'easy', NULL, 78),
(362, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:41:23', 'easy', NULL, 372),
(363, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:41:27', 'easy', NULL, 4),
(364, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:44:21', 'easy', NULL, 174),
(365, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:48:33', 'easy', NULL, 252),
(366, 8, NULL, 693, 3, 'A', 0, '2026-03-29 07:53:32', 'easy', NULL, 299),
(367, 9, NULL, 151, 1, 'B', 1, '2026-03-30 04:06:57', 'difficult', NULL, 5),
(368, 9, NULL, 152, 1, 'D', 0, '2026-03-30 04:07:02', 'difficult', NULL, 10),
(369, 9, NULL, 11, 1, 'B', 1, '2026-03-30 04:07:07', 'medium', NULL, 15),
(370, 9, NULL, 153, 1, 'C', 0, '2026-03-30 04:07:10', 'difficult', NULL, 18),
(371, 9, NULL, 12, 1, 'D', 1, '2026-03-30 04:07:14', 'medium', NULL, 22),
(372, 9, NULL, 154, 1, 'A', 0, '2026-03-30 04:07:17', 'difficult', NULL, 25),
(373, 9, NULL, 13, 1, 'B', 1, '2026-03-30 04:07:22', 'medium', NULL, 30),
(374, 9, NULL, 155, 1, 'D', 0, '2026-03-30 04:07:26', 'difficult', NULL, 34),
(375, 9, NULL, 14, 1, 'C', 1, '2026-03-30 04:07:30', 'medium', NULL, 38),
(376, 9, NULL, 156, 1, 'A', 0, '2026-03-30 04:07:33', 'difficult', NULL, 41),
(377, 9, NULL, 207, 2, 'C', 0, '2026-03-30 04:07:37', 'medium', NULL, 4),
(378, 9, NULL, 202, 2, 'A', 1, '2026-03-30 04:07:40', 'easy', NULL, 7),
(379, 9, NULL, 208, 2, 'B', 0, '2026-03-30 04:07:43', 'medium', NULL, 10),
(380, 9, NULL, 203, 2, 'A', 1, '2026-03-30 04:07:47', 'easy', NULL, 14),
(381, 9, NULL, 209, 2, 'B', 1, '2026-03-30 04:07:51', 'medium', NULL, 18),
(382, 9, NULL, 176, 2, 'B', 0, '2026-03-30 04:07:55', 'difficult', NULL, 22),
(383, 9, NULL, 210, 2, 'A', 1, '2026-03-30 04:07:58', 'medium', NULL, 25),
(384, 9, NULL, 177, 2, 'B', 0, '2026-03-30 04:08:02', 'difficult', NULL, 29),
(385, 9, NULL, 211, 2, 'A', 1, '2026-03-30 04:08:05', 'medium', NULL, 32),
(386, 9, NULL, 178, 2, 'B', 0, '2026-03-30 04:08:09', 'difficult', NULL, 36),
(387, 9, NULL, 329, 3, 'A', 0, '2026-03-30 04:08:49', 'difficult', NULL, 40),
(388, 9, NULL, 330, 3, 'A', 0, '2026-03-30 04:08:57', 'medium', NULL, 48),
(389, 9, NULL, 338, 3, 'C', 0, '2026-03-30 04:09:02', 'easy', NULL, 53),
(390, 9, NULL, 629, 3, 'B', 0, '2026-03-30 04:09:10', 'easy', NULL, 61),
(391, 9, NULL, 630, 3, 'A', 0, '2026-03-30 04:09:20', 'easy', NULL, 71),
(392, 9, NULL, 631, 3, 'B', 0, '2026-03-30 04:09:24', 'easy', NULL, 75),
(393, 9, NULL, 632, 3, 'D', 0, '2026-03-30 04:09:29', 'easy', NULL, 80),
(394, 9, NULL, 633, 3, 'B', 0, '2026-03-30 04:09:35', 'easy', NULL, 86),
(395, 9, NULL, 634, 3, 'A', 0, '2026-03-30 04:09:45', 'easy', NULL, 96),
(396, 9, NULL, 635, 3, 'A', 0, '2026-03-30 04:09:51', 'easy', NULL, 102),
(397, 9, NULL, 636, 3, 'A', 0, '2026-03-30 04:10:03', 'easy', NULL, 114),
(398, 9, NULL, 637, 3, 'A', 0, '2026-03-30 04:10:11', 'easy', NULL, 122),
(399, 9, NULL, 638, 3, 'B', 0, '2026-03-30 04:10:22', 'easy', NULL, 133),
(400, 9, NULL, 639, 3, 'A', 0, '2026-03-30 04:10:30', 'easy', NULL, 141),
(401, 9, NULL, 640, 3, 'D', 0, '2026-03-30 04:10:39', 'easy', NULL, 150),
(402, 9, NULL, 640, 3, 'D', 0, '2026-03-30 04:16:06', 'easy', NULL, 327),
(403, 10, NULL, 151, 1, 'B', 1, '2026-03-30 05:41:07', 'difficult', NULL, 7),
(404, 10, NULL, 152, 1, 'C', 1, '2026-03-30 05:41:13', 'difficult', NULL, 13),
(405, 10, NULL, 153, 1, 'B', 0, '2026-03-30 05:41:16', 'difficult', NULL, 16),
(406, 10, NULL, 11, 1, 'B', 1, '2026-03-30 05:41:21', 'medium', NULL, 21),
(407, 10, NULL, 154, 1, 'B', 0, '2026-03-30 05:41:24', 'difficult', NULL, 24),
(408, 10, NULL, 12, 1, 'D', 1, '2026-03-30 05:41:28', 'medium', NULL, 28),
(409, 10, NULL, 155, 1, 'C', 0, '2026-03-30 05:41:32', 'difficult', NULL, 32),
(410, 10, NULL, 13, 1, 'B', 1, '2026-03-30 05:41:38', 'medium', NULL, 38),
(411, 10, NULL, 156, 1, 'B', 1, '2026-03-30 05:41:41', 'difficult', NULL, 41),
(412, 10, NULL, 157, 1, 'A', 0, '2026-03-30 05:41:46', 'difficult', NULL, 46),
(413, 10, NULL, 207, 2, 'B', 0, '2026-03-30 05:41:50', 'medium', NULL, 4),
(414, 10, NULL, 202, 2, 'B', 0, '2026-03-30 05:41:53', 'easy', NULL, 7),
(415, 10, NULL, 203, 2, 'A', 1, '2026-03-30 05:41:57', 'easy', NULL, 11),
(416, 10, NULL, 208, 2, 'A', 1, '2026-03-30 05:42:02', 'medium', NULL, 16),
(417, 10, NULL, 176, 2, 'B', 0, '2026-03-30 05:42:05', 'difficult', NULL, 19),
(418, 10, NULL, 209, 2, 'A', 0, '2026-03-30 05:42:12', 'medium', NULL, 26),
(419, 10, NULL, 204, 2, 'A', 0, '2026-03-30 05:42:17', 'easy', NULL, 31),
(420, 10, NULL, 205, 2, 'A', 1, '2026-03-30 05:42:23', 'easy', NULL, 37),
(421, 10, NULL, 210, 2, 'B', 0, '2026-03-30 05:42:26', 'medium', NULL, 40),
(422, 10, NULL, 206, 2, 'A', 1, '2026-03-30 05:42:32', 'easy', NULL, 46),
(423, 10, NULL, 529, 3, 'A', 0, '2026-03-30 05:42:44', 'easy', NULL, 12),
(424, 10, NULL, 530, 3, 'A', 0, '2026-03-30 05:42:49', 'easy', NULL, 17),
(425, 10, NULL, 151, 1, 'A', 0, '2026-03-30 06:09:53', 'difficult', NULL, 0),
(426, 10, NULL, 11, 1, 'B', 1, '2026-03-30 06:09:56', 'medium', NULL, 3),
(427, 10, NULL, 152, 1, 'C', 1, '2026-03-30 06:10:00', 'difficult', NULL, 4),
(428, 10, NULL, 153, 1, 'B', 0, '2026-03-30 06:10:03', 'difficult', NULL, 3),
(429, 10, NULL, 12, 1, 'D', 1, '2026-03-30 06:10:08', 'medium', NULL, 5),
(430, 10, NULL, 154, 1, 'B', 0, '2026-03-30 06:10:11', 'difficult', NULL, 3),
(431, 10, NULL, 13, 1, 'B', 1, '2026-03-30 06:10:16', 'medium', NULL, 5),
(432, 10, NULL, 155, 1, 'C', 0, '2026-03-30 06:10:21', 'difficult', NULL, 5),
(433, 10, NULL, 14, 1, 'A', 0, '2026-03-30 06:10:24', 'medium', NULL, 3),
(434, 10, NULL, 1, 1, 'C', 1, '2026-03-30 06:10:28', 'easy', NULL, 4),
(435, 10, NULL, 207, 2, 'C', 0, '2026-03-30 06:10:32', 'medium', NULL, 4),
(436, 10, NULL, 202, 2, 'A', 1, '2026-03-30 06:10:36', 'easy', NULL, 4),
(437, 10, NULL, 208, 2, 'A', 1, '2026-03-30 06:10:39', 'medium', NULL, 3),
(438, 10, NULL, 176, 2, 'C', 0, '2026-03-30 06:10:42', 'difficult', NULL, 3),
(439, 10, NULL, 209, 2, 'B', 1, '2026-03-30 06:10:44', 'medium', NULL, 2),
(440, 10, NULL, 177, 2, 'D', 0, '2026-03-30 06:10:47', 'difficult', NULL, 3),
(441, 10, NULL, 210, 2, 'A', 1, '2026-03-30 06:10:50', 'medium', NULL, 3),
(442, 10, NULL, 178, 2, 'C', 0, '2026-03-30 06:10:52', 'difficult', NULL, 2),
(443, 10, NULL, 211, 2, 'B', 0, '2026-03-30 06:10:56', 'medium', NULL, 4),
(444, 10, NULL, 203, 2, 'B', 0, '2026-03-30 06:10:59', 'easy', NULL, 3),
(445, 10, NULL, 529, 3, 'A', 0, '2026-03-30 06:11:02', 'easy', NULL, 3),
(446, 10, NULL, 530, 3, 'A', 0, '2026-03-30 06:11:07', 'easy', NULL, 5),
(447, 11, NULL, 151, 1, 'B', 1, '2026-03-30 06:18:56', 'difficult', NULL, 5),
(448, 11, NULL, 152, 1, 'B', 0, '2026-03-30 06:19:02', 'difficult', NULL, 11),
(449, 11, NULL, 11, 1, 'B', 1, '2026-03-30 06:19:06', 'medium', NULL, 15),
(450, 11, NULL, 153, 1, 'A', 0, '2026-03-30 06:19:09', 'difficult', NULL, 18),
(451, 11, NULL, 12, 1, 'C', 0, '2026-03-30 06:19:11', 'medium', NULL, 20),
(452, 11, NULL, 1, 1, 'B', 0, '2026-03-30 06:19:15', 'easy', NULL, 24),
(453, 11, NULL, 2, 1, 'C', 1, '2026-03-30 06:19:19', 'easy', NULL, 28),
(454, 11, NULL, 13, 1, 'B', 1, '2026-03-30 06:19:23', 'medium', NULL, 32),
(455, 11, NULL, 154, 1, 'B', 0, '2026-03-30 06:19:50', 'difficult', NULL, 59),
(456, 11, NULL, 14, 1, 'C', 1, '2026-03-30 06:19:58', 'medium', NULL, 67),
(457, 11, NULL, 176, 2, 'A', 1, '2026-03-30 06:20:04', 'difficult', NULL, 6),
(458, 11, NULL, 177, 2, 'A', 1, '2026-03-30 06:20:17', 'difficult', NULL, 19),
(459, 11, NULL, 178, 2, 'B', 0, '2026-03-30 06:20:19', 'difficult', NULL, 21),
(460, 11, NULL, 207, 2, 'B', 0, '2026-03-30 06:20:28', 'medium', NULL, 30),
(461, 11, NULL, 202, 2, 'B', 0, '2026-03-30 06:20:31', 'easy', NULL, 32),
(462, 11, NULL, 203, 2, 'A', 1, '2026-03-30 06:20:33', 'easy', NULL, 35),
(463, 11, NULL, 208, 2, 'B', 0, '2026-03-30 06:20:46', 'medium', NULL, 48),
(464, 11, NULL, 204, 2, 'A', 0, '2026-03-30 06:20:48', 'easy', NULL, 50),
(465, 11, NULL, 205, 2, 'B', 0, '2026-03-30 06:20:53', 'easy', NULL, 55),
(466, 11, NULL, 206, 2, 'A', 1, '2026-03-30 06:20:57', 'easy', NULL, 59),
(467, 11, NULL, 290, 3, 'A', 0, '2026-03-30 06:21:04', 'easy', NULL, 7),
(468, 11, NULL, 289, 3, 'A', 0, '2026-03-30 06:21:07', 'easy', NULL, 10),
(469, 11, NULL, 291, 3, 'A', 0, '2026-03-30 06:21:11', 'easy', NULL, 14),
(470, 11, NULL, 293, 3, 'A', 0, '2026-03-30 06:21:15', 'easy', NULL, 18),
(471, 11, NULL, 298, 3, 'A', 0, '2026-03-30 06:21:18', 'easy', NULL, 21),
(472, 11, NULL, 429, 3, 'B', 0, '2026-03-30 06:21:25', 'easy', NULL, 28),
(473, 11, NULL, 151, 1, 'A', 0, '2026-03-30 06:48:20', 'difficult', NULL, 5),
(474, 11, NULL, 11, 1, 'C', 0, '2026-03-30 06:48:26', 'medium', NULL, 11),
(475, 11, NULL, 1, 1, 'A', 0, '2026-03-30 06:48:30', 'easy', NULL, 15),
(476, 11, NULL, 2, 1, 'C', 1, '2026-03-30 06:48:55', 'easy', NULL, 40),
(477, 11, NULL, 12, 1, 'D', 1, '2026-03-30 06:49:01', 'medium', NULL, 46),
(478, 11, NULL, 152, 1, 'C', 1, '2026-03-30 06:49:07', 'difficult', NULL, 52),
(479, 11, NULL, 153, 1, 'A', 0, '2026-03-30 06:49:13', 'difficult', NULL, 58),
(480, 11, NULL, 13, 1, 'B', 1, '2026-03-30 06:49:17', 'medium', NULL, 62),
(481, 11, NULL, 154, 1, 'B', 0, '2026-03-30 06:49:21', 'difficult', NULL, 66),
(482, 11, NULL, 14, 1, 'B', 0, '2026-03-30 06:49:24', 'medium', NULL, 69),
(483, 11, NULL, 202, 2, 'A', 1, '2026-03-30 06:49:27', 'easy', NULL, 3),
(484, 11, NULL, 207, 2, 'C', 0, '2026-03-30 06:49:29', 'medium', NULL, 5),
(485, 11, NULL, 203, 2, 'A', 1, '2026-03-30 06:49:32', 'easy', NULL, 8),
(486, 11, NULL, 208, 2, 'A', 1, '2026-03-30 06:49:36', 'medium', NULL, 12),
(487, 11, NULL, 176, 2, 'B', 0, '2026-03-30 06:49:39', 'difficult', NULL, 15),
(488, 11, NULL, 209, 2, 'A', 0, '2026-03-30 06:49:41', 'medium', NULL, 17),
(489, 11, NULL, 204, 2, 'C', 0, '2026-03-30 06:49:45', 'easy', NULL, 21),
(490, 11, NULL, 205, 2, 'A', 1, '2026-03-30 06:49:48', 'easy', NULL, 24),
(491, 11, NULL, 210, 2, 'B', 0, '2026-03-30 06:49:51', 'medium', NULL, 27),
(492, 11, NULL, 206, 2, 'B', 0, '2026-03-30 06:49:53', 'easy', NULL, 29),
(493, 11, NULL, 289, 3, 'A', 0, '2026-03-30 06:49:58', 'easy', NULL, 5),
(494, 11, NULL, 291, 3, 'A', 0, '2026-03-30 06:50:05', 'easy', NULL, 12),
(495, 11, NULL, 293, 3, 'A', 0, '2026-03-30 06:50:09', 'easy', NULL, 16),
(496, 11, NULL, 298, 3, 'A', 0, '2026-03-30 06:50:13', 'easy', NULL, 20),
(497, 11, NULL, 429, 3, 'B', 0, '2026-03-30 06:50:17', 'easy', NULL, 24),
(498, 12, NULL, 151, 1, 'A', 0, '2026-03-30 07:01:23', 'difficult', NULL, 9),
(499, 12, NULL, 11, 1, 'B', 1, '2026-03-30 07:01:31', 'medium', NULL, 17),
(500, 12, NULL, 152, 1, 'C', 1, '2026-03-30 07:01:37', 'difficult', NULL, 23),
(501, 12, NULL, 153, 1, 'B', 0, '2026-03-30 07:01:45', 'difficult', NULL, 31),
(502, 12, NULL, 12, 1, 'D', 1, '2026-03-30 07:01:55', 'medium', NULL, 41),
(503, 12, NULL, 154, 1, 'B', 0, '2026-03-30 07:02:00', 'difficult', NULL, 46),
(504, 12, NULL, 13, 1, 'B', 1, '2026-03-30 07:02:06', 'medium', NULL, 52),
(505, 12, NULL, 155, 1, 'A', 0, '2026-03-30 07:02:11', 'difficult', NULL, 57),
(506, 12, NULL, 14, 1, 'C', 1, '2026-03-30 07:02:17', 'medium', NULL, 63),
(507, 12, NULL, 156, 1, 'B', 1, '2026-03-30 07:02:27', 'difficult', NULL, 73),
(508, 12, NULL, 176, 2, 'A', 1, '2026-03-30 07:02:33', 'difficult', NULL, 6),
(509, 12, NULL, 177, 2, 'A', 1, '2026-03-30 07:02:37', 'difficult', NULL, 10),
(510, 12, NULL, 178, 2, 'A', 1, '2026-03-30 07:02:40', 'difficult', NULL, 13),
(511, 12, NULL, 179, 2, 'A', 1, '2026-03-30 07:02:44', 'difficult', NULL, 17),
(512, 12, NULL, 180, 2, 'A', 1, '2026-03-30 07:02:49', 'difficult', NULL, 22),
(513, 12, NULL, 181, 2, 'A', 1, '2026-03-30 07:02:53', 'difficult', NULL, 26),
(514, 12, NULL, 182, 2, 'A', 1, '2026-03-30 07:02:57', 'difficult', NULL, 30),
(515, 12, NULL, 183, 2, 'A', 1, '2026-03-30 07:03:01', 'difficult', NULL, 34),
(516, 12, NULL, 184, 2, 'A', 1, '2026-03-30 07:03:05', 'difficult', NULL, 38),
(517, 12, NULL, 185, 2, 'A', 1, '2026-03-30 07:03:09', 'difficult', NULL, 42),
(518, 12, NULL, 349, 3, 'A', 0, '2026-03-30 07:03:14', 'difficult', NULL, 5),
(519, 12, NULL, 350, 3, 'C', 0, '2026-03-30 07:03:20', 'medium', NULL, 11),
(520, 12, NULL, 358, 3, 'B', 0, '2026-03-30 07:03:26', 'easy', NULL, 17),
(521, 12, NULL, 729, 3, 'D', 0, '2026-03-30 07:03:33', 'easy', NULL, 24),
(522, 12, NULL, 730, 3, 'C', 0, '2026-03-30 07:03:50', 'easy', NULL, 41),
(523, 12, NULL, 731, 3, 'A', 0, '2026-03-30 07:03:58', 'easy', NULL, 49),
(524, 12, NULL, 732, 3, 'A', 0, '2026-03-30 07:04:04', 'easy', NULL, 55),
(525, 12, NULL, 733, 3, 'A', 0, '2026-03-30 07:04:10', 'easy', NULL, 61),
(526, 12, NULL, 734, 3, 'B', 0, '2026-03-30 07:04:18', 'easy', NULL, 69),
(527, 12, NULL, 735, 3, 'A', 0, '2026-03-30 07:04:24', 'easy', NULL, 75),
(528, 12, NULL, 736, 3, 'A', 0, '2026-03-30 07:04:33', 'easy', NULL, 84),
(529, 13, NULL, 151, 1, 'B', 0, '2026-03-30 07:17:11', 'difficult', NULL, 4),
(530, 13, NULL, 11, 1, 'B', 0, '2026-03-30 07:17:16', 'medium', NULL, 9),
(531, 13, NULL, 1, 1, 'C', 0, '2026-03-30 07:17:20', 'easy', NULL, 13),
(532, 13, NULL, 2, 1, 'C', 0, '2026-03-30 07:17:24', 'easy', NULL, 17),
(533, 13, NULL, 3, 1, 'C', 0, '2026-03-30 07:17:35', 'easy', NULL, 28),
(534, 13, NULL, 151, 1, 'B', 1, '2026-03-30 07:36:49', 'difficult', NULL, 3),
(535, 13, NULL, 152, 1, 'B', 0, '2026-03-30 07:36:52', 'difficult', NULL, 6),
(536, 13, NULL, 11, 1, 'B', 1, '2026-03-30 07:36:56', 'medium', NULL, 10),
(537, 13, NULL, 153, 1, 'B', 0, '2026-03-30 07:36:59', 'difficult', NULL, 13),
(538, 13, NULL, 12, 1, 'D', 1, '2026-03-30 07:37:03', 'medium', NULL, 17),
(539, 13, NULL, 154, 1, 'B', 0, '2026-03-30 07:37:06', 'difficult', NULL, 20),
(540, 13, NULL, 13, 1, 'B', 1, '2026-03-30 07:37:10', 'medium', NULL, 24),
(541, 13, NULL, 155, 1, 'B', 1, '2026-03-30 07:37:16', 'difficult', NULL, 30),
(542, 13, NULL, 156, 1, 'B', 1, '2026-03-30 07:37:21', 'difficult', NULL, 35),
(543, 13, NULL, 157, 1, 'C', 0, '2026-03-30 07:37:26', 'difficult', NULL, 40),
(544, 13, NULL, 207, 2, 'A', 1, '2026-03-30 07:37:30', 'medium', NULL, 4),
(545, 13, NULL, 176, 2, 'C', 0, '2026-03-30 07:37:33', 'difficult', NULL, 7),
(546, 13, NULL, 208, 2, 'A', 1, '2026-03-30 07:37:36', 'medium', NULL, 10),
(547, 13, NULL, 177, 2, 'A', 1, '2026-03-30 07:37:40', 'difficult', NULL, 14),
(548, 13, NULL, 178, 2, 'B', 0, '2026-03-30 07:37:43', 'difficult', NULL, 17),
(549, 13, NULL, 209, 2, 'A', 0, '2026-03-30 07:37:46', 'medium', NULL, 20),
(550, 13, NULL, 202, 2, 'B', 0, '2026-03-30 07:37:48', 'easy', NULL, 22),
(551, 13, NULL, 203, 2, 'A', 1, '2026-03-30 07:37:51', 'easy', NULL, 25),
(552, 13, NULL, 210, 2, 'A', 1, '2026-03-30 07:37:54', 'medium', NULL, 28),
(553, 13, NULL, 179, 2, 'A', 1, '2026-03-30 07:37:57', 'difficult', NULL, 31),
(554, 13, NULL, 912, 3, 'A', 1, '2026-03-30 07:38:03', 'difficult', NULL, 6),
(555, 13, NULL, 913, 3, 'B', 0, '2026-03-30 07:38:10', 'difficult', NULL, 13),
(556, 13, NULL, 909, 3, 'A', 1, '2026-03-30 07:38:15', 'medium', NULL, 18),
(557, 13, NULL, 914, 3, 'A', 1, '2026-03-30 07:38:21', 'difficult', NULL, 24),
(558, 13, NULL, 958, 3, 'A', 1, '2026-03-30 07:38:27', 'difficult', NULL, 30),
(559, 13, NULL, 959, 3, 'B', 0, '2026-03-30 07:38:31', 'difficult', NULL, 34),
(560, 13, NULL, 910, 3, 'B', 0, '2026-03-30 07:38:43', 'medium', NULL, 46),
(561, 13, NULL, 906, 3, 'A', 1, '2026-03-30 07:38:46', 'easy', NULL, 49),
(562, 13, NULL, 911, 3, 'B', 0, '2026-03-30 07:38:49', 'medium', NULL, 52),
(563, 13, NULL, 907, 3, 'A', 1, '2026-03-30 07:38:54', 'easy', NULL, 57),
(564, 13, NULL, 956, 3, 'B', 0, '2026-03-30 07:38:59', 'medium', NULL, 62),
(565, 13, NULL, 908, 3, 'A', 1, '2026-03-30 07:39:03', 'easy', NULL, 66),
(566, 13, NULL, 957, 3, 'A', 1, '2026-03-30 07:39:10', 'medium', NULL, 73),
(567, 13, NULL, 962, 3, 'B', 0, '2026-03-30 07:39:17', 'difficult', NULL, 80),
(568, 13, NULL, 961, 3, 'B', 0, '2026-03-30 07:39:25', 'medium', NULL, 88),
(569, 14, NULL, 151, 1, 'B', 1, '2026-03-31 11:31:23', 'difficult', NULL, 4),
(570, 14, NULL, 152, 1, 'C', 1, '2026-03-31 11:31:28', 'difficult', NULL, 5),
(571, 14, NULL, 153, 1, 'A', 0, '2026-03-31 11:31:32', 'difficult', NULL, 3),
(572, 14, NULL, 11, 1, 'B', 1, '2026-03-31 11:31:35', 'medium', NULL, 3),
(573, 14, NULL, 154, 1, 'B', 0, '2026-03-31 11:31:38', 'difficult', NULL, 2),
(574, 14, NULL, 12, 1, 'B', 0, '2026-03-31 11:31:41', 'medium', NULL, 3),
(575, 14, NULL, 1, 1, 'C', 1, '2026-03-31 11:31:48', 'easy', NULL, 7),
(576, 14, NULL, 13, 1, 'B', 1, '2026-03-31 11:31:52', 'medium', NULL, 4),
(577, 14, NULL, 155, 1, 'C', 0, '2026-03-31 11:31:57', 'difficult', NULL, 5),
(578, 14, NULL, 14, 1, 'C', 1, '2026-03-31 11:32:02', 'medium', NULL, 5),
(579, 14, NULL, 176, 2, 'A', 1, '2026-03-31 11:32:06', 'difficult', NULL, 4),
(580, 14, NULL, 177, 2, 'B', 0, '2026-03-31 11:32:10', 'difficult', NULL, 4),
(581, 14, NULL, 207, 2, 'C', 0, '2026-03-31 11:32:15', 'medium', NULL, 5),
(582, 14, NULL, 202, 2, 'A', 1, '2026-03-31 11:32:18', 'easy', NULL, 3),
(583, 14, NULL, 208, 2, 'B', 0, '2026-03-31 11:32:21', 'medium', NULL, 3),
(584, 14, NULL, 203, 2, 'A', 1, '2026-03-31 11:32:25', 'easy', NULL, 4),
(585, 14, NULL, 209, 2, 'A', 0, '2026-03-31 11:32:29', 'medium', NULL, 4),
(586, 14, NULL, 204, 2, 'A', 0, '2026-03-31 11:32:34', 'easy', NULL, 5),
(587, 14, NULL, 205, 2, 'A', 1, '2026-03-31 11:32:37', 'easy', NULL, 3),
(588, 14, NULL, 210, 2, 'A', 1, '2026-03-31 11:32:40', 'medium', NULL, 3),
(589, 14, NULL, 903, 3, 'A', 1, '2026-03-31 11:32:46', 'difficult', NULL, 6),
(590, 14, NULL, 903, 3, 'A', 1, '2026-03-31 11:33:21', 'difficult', NULL, 41),
(591, 14, NULL, 903, 3, 'A', 1, '2026-03-31 11:33:21', 'difficult', NULL, 41),
(592, 14, NULL, 903, 3, 'A', 1, '2026-03-31 11:33:21', 'difficult', NULL, 41),
(593, 14, NULL, 904, 3, 'B', 0, '2026-03-31 11:33:34', 'difficult', NULL, 13),
(594, 14, NULL, 900, 3, 'D', 0, '2026-03-31 11:33:52', 'medium', NULL, 18),
(595, 14, NULL, 897, 3, 'A', 1, '2026-03-31 11:34:01', 'easy', NULL, 9),
(596, 14, NULL, 901, 3, 'A', 1, '2026-03-31 11:34:09', 'medium', NULL, 8),
(597, 14, NULL, 905, 3, 'A', 1, '2026-03-31 11:34:14', 'difficult', NULL, 5),
(598, 14, NULL, 948, 3, 'A', 1, '2026-03-31 11:34:22', 'difficult', NULL, 8),
(599, 14, NULL, 949, 3, 'C', 0, '2026-03-31 11:34:34', 'difficult', NULL, 12),
(600, 14, NULL, 902, 3, 'A', 1, '2026-03-31 11:34:41', 'medium', NULL, 7),
(601, 14, NULL, 952, 3, 'A', 1, '2026-03-31 11:34:45', 'difficult', NULL, 4),
(602, 14, NULL, 1053, 3, 'A', 1, '2026-03-31 11:34:53', 'difficult', NULL, 8),
(603, 14, NULL, 1054, 3, 'A', 1, '2026-03-31 11:35:01', 'difficult', NULL, 8),
(604, 15, NULL, 151, 1, 'B', 1, '2026-03-31 12:16:48', 'difficult', NULL, 3),
(605, 15, NULL, 152, 1, 'B', 0, '2026-03-31 12:16:51', 'difficult', NULL, 2),
(606, 15, NULL, 11, 1, 'B', 1, '2026-03-31 12:16:55', 'medium', NULL, 4),
(607, 15, NULL, 153, 1, 'B', 0, '2026-03-31 12:16:58', 'difficult', NULL, 3),
(608, 15, NULL, 12, 1, 'A', 0, '2026-03-31 12:17:01', 'medium', NULL, 3),
(609, 15, NULL, 1, 1, 'C', 1, '2026-03-31 12:17:06', 'easy', NULL, 5),
(610, 15, NULL, 13, 1, 'B', 1, '2026-03-31 12:17:11', 'medium', NULL, 4),
(611, 15, NULL, 154, 1, 'B', 0, '2026-03-31 12:17:13', 'difficult', NULL, 2),
(612, 15, NULL, 14, 1, 'C', 1, '2026-03-31 12:17:19', 'medium', NULL, 6),
(613, 15, NULL, 155, 1, 'B', 1, '2026-03-31 12:17:23', 'difficult', NULL, 4),
(614, 15, NULL, 176, 2, 'A', 1, '2026-03-31 12:17:26', 'difficult', NULL, 3),
(615, 15, NULL, 177, 2, 'D', 0, '2026-03-31 12:17:29', 'difficult', NULL, 3),
(616, 15, NULL, 207, 2, 'D', 0, '2026-03-31 12:17:31', 'medium', NULL, 2),
(617, 15, NULL, 202, 2, 'C', 0, '2026-03-31 12:17:34', 'easy', NULL, 3),
(618, 15, NULL, 203, 2, 'A', 1, '2026-03-31 12:17:37', 'easy', NULL, 3),
(619, 15, NULL, 208, 2, 'D', 0, '2026-03-31 12:17:39', 'medium', NULL, 2),
(620, 15, NULL, 204, 2, 'B', 1, '2026-03-31 12:17:42', 'easy', NULL, 2),
(621, 15, NULL, 209, 2, 'C', 0, '2026-03-31 12:17:44', 'medium', NULL, 2),
(622, 15, NULL, 205, 2, 'D', 0, '2026-03-31 12:17:47', 'easy', NULL, 3),
(623, 15, NULL, 206, 2, 'B', 0, '2026-03-31 12:17:50', 'easy', NULL, 3),
(624, 15, NULL, 888, 3, 'A', 1, '2026-03-31 12:17:54', 'easy', NULL, 4),
(625, 15, NULL, 891, 3, 'A', 0, '2026-03-31 12:18:14', 'medium', NULL, 10),
(626, 15, NULL, 889, 3, 'B', 1, '2026-03-31 12:18:19', 'easy', NULL, 5),
(627, 15, NULL, 892, 3, 'B', 1, '2026-03-31 12:18:28', 'medium', NULL, 9),
(628, 15, NULL, 894, 3, 'D', 0, '2026-03-31 12:18:32', 'difficult', NULL, 4),
(629, 15, NULL, 893, 3, 'D', 0, '2026-03-31 12:18:38', 'medium', NULL, 6),
(630, 15, NULL, 890, 3, 'B', 0, '2026-03-31 12:18:44', 'easy', NULL, 6),
(631, 15, NULL, 934, 3, 'C', 0, '2026-03-31 12:18:52', 'easy', NULL, 8),
(632, 15, NULL, 935, 3, 'A', 1, '2026-03-31 12:19:05', 'easy', NULL, 13),
(633, 15, NULL, 936, 3, 'A', 1, '2026-03-31 12:19:11', 'medium', NULL, 6),
(634, 15, NULL, 895, 3, 'C', 0, '2026-03-31 12:19:16', 'difficult', NULL, 5),
(635, 15, NULL, 937, 3, 'C', 0, '2026-03-31 12:19:22', 'medium', NULL, 6),
(636, 15, NULL, 940, 3, 'C', 0, '2026-03-31 12:19:27', 'easy', NULL, 5),
(637, 15, NULL, 1039, 3, 'C', 0, '2026-03-31 12:19:33', 'easy', NULL, 6),
(638, 15, NULL, 1040, 3, 'D', 0, '2026-03-31 12:19:46', 'easy', NULL, 13),
(639, 15, NULL, 1040, 3, 'D', 0, '2026-03-31 12:26:26', 'easy', NULL, 413),
(640, 16, NULL, 151, 1, 'A', 0, '2026-03-31 13:05:18', 'difficult', NULL, 13),
(641, 16, NULL, 11, 1, 'B', 1, '2026-03-31 13:05:28', 'medium', NULL, 10),
(642, 16, NULL, 152, 1, 'C', 1, '2026-03-31 13:05:33', 'difficult', NULL, 5),
(643, 16, NULL, 153, 1, 'C', 0, '2026-03-31 13:05:39', 'difficult', NULL, 6),
(644, 16, NULL, 12, 1, 'D', 1, '2026-03-31 13:05:44', 'medium', NULL, 5),
(645, 16, NULL, 154, 1, 'B', 0, '2026-03-31 13:05:52', 'difficult', NULL, 8),
(646, 16, NULL, 13, 1, 'B', 1, '2026-03-31 13:05:56', 'medium', NULL, 4),
(647, 16, NULL, 155, 1, 'B', 1, '2026-03-31 13:06:01', 'difficult', NULL, 5),
(648, 16, NULL, 156, 1, 'C', 0, '2026-03-31 13:06:05', 'difficult', NULL, 4),
(649, 16, NULL, 14, 1, 'C', 1, '2026-03-31 13:06:10', 'medium', NULL, 5),
(650, 16, NULL, 176, 2, 'A', 1, '2026-03-31 13:06:24', 'difficult', NULL, 13),
(651, 16, NULL, 177, 2, 'B', 0, '2026-03-31 13:06:28', 'difficult', NULL, 4),
(652, 16, NULL, 207, 2, 'D', 0, '2026-03-31 13:06:31', 'medium', NULL, 3),
(653, 16, NULL, 202, 2, 'C', 0, '2026-03-31 13:06:34', 'easy', NULL, 3),
(654, 16, NULL, 203, 2, 'C', 0, '2026-03-31 13:06:36', 'easy', NULL, 2),
(655, 16, NULL, 204, 2, 'D', 0, '2026-03-31 13:06:39', 'easy', NULL, 3),
(656, 16, NULL, 205, 2, 'C', 0, '2026-03-31 13:06:42', 'easy', NULL, 3),
(657, 16, NULL, 206, 2, 'C', 0, '2026-03-31 13:06:48', 'easy', NULL, 6),
(658, 16, NULL, 212, 2, 'D', 0, '2026-03-31 13:06:51', 'easy', NULL, 3),
(659, 16, NULL, 213, 2, 'A', 0, '2026-03-31 13:06:59', 'easy', NULL, 8),
(660, 16, NULL, 879, 3, 'A', 1, '2026-03-31 13:07:04', 'easy', NULL, 5),
(661, 16, NULL, 879, 3, 'A', 1, '2026-03-31 13:07:11', 'easy', NULL, 12),
(662, 16, NULL, 880, 3, 'C', 1, '2026-03-31 13:07:17', 'easy', NULL, 6),
(663, 16, NULL, 881, 3, 'B', 1, '2026-03-31 13:07:21', 'easy', NULL, 4),
(664, 16, NULL, 924, 3, 'A', 1, '2026-03-31 13:07:27', 'easy', NULL, 6),
(665, 16, NULL, 925, 3, 'A', 1, '2026-03-31 13:07:38', 'easy', NULL, 11),
(666, 16, NULL, 930, 3, 'A', 1, '2026-03-31 13:07:45', 'easy', NULL, 7),
(667, 16, NULL, 1024, 3, 'C', 0, '2026-03-31 13:07:48', 'easy', NULL, 2),
(668, 16, NULL, 1025, 3, 'B', 0, '2026-03-31 13:07:52', 'easy', NULL, 4),
(669, 16, NULL, 1030, 3, 'A', 1, '2026-03-31 13:07:55', 'easy', NULL, 3),
(670, 16, NULL, 1034, 3, 'A', 1, '2026-03-31 13:08:01', 'easy', NULL, 6),
(671, 16, NULL, 933, 3, 'A', 1, '2026-03-31 13:08:04', 'easy', NULL, 3),
(672, 16, NULL, 884, 3, 'A', 1, '2026-03-31 13:08:09', 'easy', NULL, 5),
(673, 16, NULL, 1037, 3, 'A', 1, '2026-03-31 13:08:12', 'easy', NULL, 3),
(674, 16, NULL, 931, 3, 'A', 1, '2026-03-31 13:08:19', 'easy', NULL, 7),
(675, 16, NULL, 931, 3, 'A', 1, '2026-03-31 13:11:07', 'easy', NULL, 175),
(676, 16, NULL, 931, 3, 'A', 1, '2026-03-31 13:11:23', 'medium', NULL, 191),
(677, 16, NULL, 931, 3, 'A', 1, '2026-03-31 13:11:52', 'difficult', NULL, 220),
(678, 17, NULL, 151, 1, 'D', 0, '2026-03-31 14:35:43', 'difficult', NULL, 4),
(679, 17, NULL, 11, 1, 'A', 0, '2026-03-31 14:35:48', 'medium', NULL, 5),
(680, 17, NULL, 1, 1, 'C', 1, '2026-03-31 14:35:51', 'easy', NULL, 3),
(681, 17, NULL, 12, 1, 'D', 1, '2026-03-31 14:35:57', 'medium', NULL, 6);
INSERT INTO `user_answers` (`id`, `user_id`, `attempt_id`, `question_id`, `phase`, `selected_option`, `correct`, `created_at`, `difficulty`, `category`, `response_time`) VALUES
(682, 17, NULL, 152, 1, 'B', 0, '2026-03-31 14:36:02', 'difficult', NULL, 5),
(683, 17, NULL, 13, 1, 'B', 1, '2026-03-31 14:36:04', 'medium', NULL, 2),
(684, 17, NULL, 153, 1, 'D', 1, '2026-03-31 14:36:07', 'difficult', NULL, 3),
(685, 17, NULL, 154, 1, 'A', 0, '2026-03-31 14:36:09', 'difficult', NULL, 2),
(686, 17, NULL, 14, 1, 'C', 1, '2026-03-31 14:36:12', 'medium', NULL, 2),
(687, 17, NULL, 155, 1, 'B', 1, '2026-03-31 14:36:15', 'difficult', NULL, 3),
(688, 17, NULL, 176, 2, 'B', 0, '2026-03-31 14:36:19', 'difficult', NULL, 4),
(689, 17, NULL, 207, 2, 'A', 1, '2026-03-31 14:36:22', 'medium', NULL, 3),
(690, 17, NULL, 177, 2, 'B', 0, '2026-03-31 14:36:26', 'difficult', NULL, 4),
(691, 17, NULL, 208, 2, 'B', 0, '2026-03-31 14:36:30', 'medium', NULL, 4),
(692, 17, NULL, 202, 2, 'A', 1, '2026-03-31 14:36:34', 'easy', NULL, 4),
(693, 17, NULL, 209, 2, 'A', 0, '2026-03-31 14:36:37', 'medium', NULL, 3),
(694, 17, NULL, 203, 2, 'B', 0, '2026-03-31 14:36:41', 'easy', NULL, 4),
(695, 17, NULL, 204, 2, 'A', 0, '2026-03-31 14:36:43', 'easy', NULL, 2),
(696, 17, NULL, 205, 2, 'A', 1, '2026-03-31 14:36:49', 'easy', NULL, 6),
(697, 17, NULL, 210, 2, 'C', 0, '2026-03-31 14:36:52', 'medium', NULL, 3),
(698, 17, NULL, 906, 3, 'A', 1, '2026-03-31 14:36:58', 'easy', NULL, 6),
(699, 17, NULL, 909, 3, 'A', 1, '2026-03-31 14:37:03', 'medium', NULL, 5),
(700, 17, NULL, 912, 3, 'A', 1, '2026-03-31 14:37:08', 'difficult', NULL, 4),
(701, 17, NULL, 913, 3, 'B', 0, '2026-03-31 14:37:13', 'difficult', NULL, 4),
(702, 17, NULL, 910, 3, 'A', 1, '2026-03-31 14:37:18', 'medium', NULL, 5),
(703, 17, NULL, 914, 3, 'A', 1, '2026-03-31 14:37:22', 'difficult', NULL, 4),
(704, 17, NULL, 958, 3, 'A', 1, '2026-03-31 14:37:26', 'difficult', NULL, 4),
(705, 17, NULL, 959, 3, 'A', 1, '2026-03-31 14:37:31', 'difficult', NULL, 5),
(706, 17, NULL, 962, 3, 'C', 0, '2026-03-31 14:37:35', 'difficult', NULL, 4),
(707, 17, NULL, 911, 3, 'A', 1, '2026-03-31 14:37:40', 'medium', NULL, 5),
(708, 17, NULL, 1062, 3, 'B', 0, '2026-03-31 14:37:45', 'difficult', NULL, 5),
(709, 17, NULL, 956, 3, 'A', 1, '2026-03-31 14:37:51', 'medium', NULL, 6),
(710, 17, NULL, 1063, 3, 'A', 1, '2026-03-31 14:37:58', 'difficult', NULL, 7),
(711, 17, NULL, 1066, 3, 'A', 1, '2026-03-31 14:38:07', 'difficult', NULL, 9),
(712, 17, NULL, 907, 3, 'A', 1, '2026-03-31 14:38:16', 'difficult', NULL, 9),
(713, 18, NULL, 151, 1, 'B', 1, '2026-04-12 05:52:05', 'difficult', NULL, 7),
(714, 18, NULL, 152, 1, 'A', 0, '2026-04-12 05:52:11', 'difficult', NULL, 6),
(715, 18, NULL, 11, 1, 'B', 1, '2026-04-12 05:52:16', 'medium', NULL, 5),
(716, 18, NULL, 153, 1, 'C', 0, '2026-04-12 05:52:22', 'difficult', NULL, 6),
(717, 18, NULL, 12, 1, 'D', 1, '2026-04-12 05:52:27', 'medium', NULL, 5),
(718, 18, NULL, 154, 1, 'A', 0, '2026-04-12 05:52:30', 'difficult', NULL, 3),
(719, 18, NULL, 13, 1, 'B', 1, '2026-04-12 05:52:34', 'medium', NULL, 4),
(720, 18, NULL, 155, 1, 'B', 1, '2026-04-12 05:52:39', 'difficult', NULL, 5),
(721, 18, NULL, 156, 1, 'B', 1, '2026-04-12 05:52:44', 'difficult', NULL, 5),
(722, 18, NULL, 157, 1, 'C', 0, '2026-04-12 05:52:49', 'difficult', NULL, 5),
(723, 18, NULL, 207, 2, 'A', 1, '2026-04-12 05:52:54', 'medium', NULL, 5),
(724, 18, NULL, 176, 2, 'C', 0, '2026-04-12 05:52:57', 'difficult', NULL, 3),
(725, 18, NULL, 208, 2, 'B', 0, '2026-04-12 05:53:01', 'medium', NULL, 4),
(726, 18, NULL, 202, 2, 'A', 1, '2026-04-12 05:53:04', 'easy', NULL, 3),
(727, 18, NULL, 209, 2, 'C', 0, '2026-04-12 05:53:08', 'medium', NULL, 4),
(728, 18, NULL, 203, 2, 'B', 0, '2026-04-12 05:53:11', 'easy', NULL, 3),
(729, 18, NULL, 204, 2, 'A', 0, '2026-04-12 05:53:15', 'easy', NULL, 4),
(730, 18, NULL, 205, 2, 'B', 0, '2026-04-12 05:53:19', 'easy', NULL, 4),
(731, 18, NULL, 206, 2, 'A', 1, '2026-04-12 05:53:24', 'easy', NULL, 5),
(732, 18, NULL, 210, 2, 'A', 1, '2026-04-12 05:53:32', 'medium', NULL, 7),
(733, 18, NULL, 912, 3, 'A', 1, '2026-04-12 05:53:40', 'difficult', NULL, 8),
(734, 18, NULL, 909, 3, 'C', 0, '2026-04-12 05:54:21', 'medium', NULL, 7),
(735, 18, NULL, 906, 3, 'A', 1, '2026-04-12 05:54:27', 'easy', NULL, 6),
(736, 18, NULL, 910, 3, 'A', 1, '2026-04-12 05:54:32', 'medium', NULL, 5),
(737, 18, NULL, 913, 3, 'A', 1, '2026-04-12 05:54:38', 'difficult', NULL, 6),
(738, 18, NULL, 914, 3, 'C', 0, '2026-04-12 05:54:43', 'difficult', NULL, 5),
(739, 18, NULL, 911, 3, 'A', 1, '2026-04-12 05:54:48', 'medium', NULL, 4),
(740, 18, NULL, 958, 3, 'A', 1, '2026-04-12 05:54:55', 'difficult', NULL, 7),
(741, 18, NULL, 959, 3, 'C', 0, '2026-04-12 05:54:59', 'difficult', NULL, 4),
(742, 18, NULL, 956, 3, 'A', 1, '2026-04-12 05:55:04', 'medium', NULL, 5),
(743, 18, NULL, 962, 3, 'B', 0, '2026-04-12 05:55:08', 'difficult', NULL, 4),
(744, 18, NULL, 957, 3, 'A', 1, '2026-04-12 05:55:13', 'medium', NULL, 5),
(745, 18, NULL, 1062, 3, 'B', 0, '2026-04-12 05:55:18', 'difficult', NULL, 5),
(746, 18, NULL, 961, 3, 'A', 1, '2026-04-12 05:55:24', 'medium', NULL, 6),
(747, 18, NULL, 1063, 3, 'A', 1, '2026-04-12 05:55:33', 'difficult', NULL, 9),
(748, 1, NULL, 11, 1, 'B', 1, '2026-04-20 10:29:07', 'medium', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_name` varchar(150) DEFAULT NULL,
  `status` enum('in_progress','completed') DEFAULT 'in_progress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `experience_level` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `preferred_industries` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `target_career` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_completed` tinyint(1) DEFAULT 0,
  `profile_picture` varchar(255) DEFAULT NULL,
  `career_goal` int(10) UNSIGNED DEFAULT NULL,
  `stream` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `linkedin_profile` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `assessment_completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `full_name`, `education_level`, `experience_level`, `age`, `gender`, `preferred_industries`, `skills`, `target_career`, `bio`, `profile_completed`, `profile_picture`, `career_goal`, `stream`, `dob`, `location`, `contact_number`, `linkedin_profile`, `resume`, `created_at`, `updated_at`, `assessment_completed`) VALUES
(1, 1, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'No Professional Experience', 21, 'Female', NULL, '', 'Web Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-07 12:50:03', '2026-03-15 09:51:13', 0),
(3, 2, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'No Professional Experience', 19, 'Male', NULL, '', 'Software Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-15 09:54:48', '2026-03-15 10:13:12', 0),
(4, 3, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', '', 24, 'Female', NULL, '', 'Cloud Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17 07:02:24', '2026-03-17 07:02:24', 0),
(5, 4, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'No Professional Experience', 22, 'Female', NULL, '', 'AI Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-17 07:10:36', '2026-03-17 07:10:36', 0),
(6, 5, '', 'Diploma', 'No Professional Experience', 18, 'Male', NULL, '', 'Software Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-22 15:44:26', '2026-03-27 15:31:18', 1),
(7, 6, '', '12th / Higher Secondary', 'No Professional Experience', 20, 'Male', NULL, '', 'Software Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 06:44:13', '2026-03-29 06:44:13', 0),
(8, 7, '', 'Master\'s Degree (MCA, MTech, MSc, MBA)', 'Internship / Training Experience', 21, 'Male', NULL, '', 'Network Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 07:10:11', '2026-03-29 07:10:11', 0),
(9, 8, '', '12th / Higher Secondary', 'Internship / Training Experience', 20, 'Male', NULL, '', 'DevOps Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-29 07:32:31', '2026-03-29 07:53:33', 1),
(10, 9, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'Entry-Level Professional (0–2 Years)', 20, 'Female', NULL, '', 'Cloud Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30 04:06:51', '2026-03-30 04:16:06', 1),
(11, 10, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'No Professional Experience', 20, 'Female', NULL, '', 'AI Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30 05:41:00', '2026-03-30 05:41:00', 0),
(12, 11, '', 'Diploma', 'No Professional Experience', 21, 'Female', NULL, '', 'Web Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30 06:18:51', '2026-03-30 06:18:51', 0),
(13, 12, '', 'Diploma', 'No Professional Experience', 19, 'Male', NULL, '', 'Mobile App Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30 07:01:14', '2026-03-30 07:01:14', 0),
(14, 13, '', 'Diploma', 'Internship / Training Experience', 21, 'Male', NULL, '', 'AI Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-30 07:17:06', '2026-03-30 07:39:25', 1),
(15, 14, '', 'Diploma', 'No Professional Experience', 21, 'Male', NULL, '', 'Data Scientist', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 11:31:19', '2026-03-31 11:35:02', 1),
(16, 15, '', 'Diploma', 'No Professional Experience', 21, 'Male', NULL, '', 'Web Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 12:16:45', '2026-03-31 12:26:26', 1),
(17, 16, '', 'Diploma', 'No Professional Experience', 20, 'Male', NULL, '', 'Software Developer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 13:05:05', '2026-03-31 13:05:05', 0),
(18, 17, '', 'Diploma', 'Internship / Training Experience', 20, 'Male', NULL, '', 'AI Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-31 14:35:39', '2026-03-31 14:38:16', 1),
(19, 18, '', 'Bachelor\'s Degree (BCA, BTech, BSc, BCom, BA)', 'Internship / Training Experience', 22, 'Female', NULL, '', 'AI Engineer', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-12 05:51:58', '2026-04-12 05:55:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `progress_percent` int(11) DEFAULT 0,
  `profile_completed` tinyint(1) DEFAULT 0,
  `skills_added` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_results`
--

CREATE TABLE `user_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `career_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_results`
--

INSERT INTO `user_results` (`id`, `user_id`, `career_id`, `score`, `created_at`) VALUES
(1, 18, 6, 5, '2026-04-12 09:15:04'),
(2, 1, 3, 0, '2026-04-20 10:31:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_skill_mapping`
--

CREATE TABLE `user_skill_mapping` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `proficiency_level` enum('Beginner','Intermediate','Advanced') NOT NULL DEFAULT 'Beginner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_skill_mapping`
--

INSERT INTO `user_skill_mapping` (`id`, `user_id`, `skill_id`, `proficiency_level`) VALUES
(1, 17, 10, 'Advanced'),
(2, 17, 11, 'Advanced'),
(3, 17, 12, 'Intermediate'),
(35, 16, 2, 'Advanced'),
(36, 16, 13, 'Advanced'),
(37, 16, 16, 'Advanced'),
(46, 18, 10, 'Advanced'),
(47, 18, 11, 'Advanced'),
(48, 18, 12, 'Intermediate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessment_results`
--
ALTER TABLE `assessment_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `career_roadmap`
--
ALTER TABLE `career_roadmap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `career_id` (`career_id`);

--
-- Indexes for table `career_skills`
--
ALTER TABLE `career_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `psychometric_results`
--
ALTER TABLE `psychometric_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roadmap_progress`
--
ALTER TABLE `roadmap_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_progress` (`user_id`,`roadmap_id`),
  ADD KEY `roadmap_id` (`roadmap_id`);

--
-- Indexes for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roadmap_id` (`roadmap_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `skill_gap`
--
ALTER TABLE `skill_gap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_skill` (`user_id`,`career_id`,`missing_skill_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `uq_user_id` (`user_id`),
  ADD KEY `fk_career_goal` (`career_goal`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_results`
--
ALTER TABLE `user_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user` (`user_id`);

--
-- Indexes for table `user_skill_mapping`
--
ALTER TABLE `user_skill_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_skill` (`user_id`,`skill_id`),
  ADD KEY `fk_user_skill_skill` (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment_questions`
--
ALTER TABLE `assessment_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1085;

--
-- AUTO_INCREMENT for table `assessment_results`
--
ALTER TABLE `assessment_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `career_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `career_roadmap`
--
ALTER TABLE `career_roadmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `career_skills`
--
ALTER TABLE `career_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `psychometric_results`
--
ALTER TABLE `psychometric_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roadmap_progress`
--
ALTER TABLE `roadmap_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `skill_gap`
--
ALTER TABLE `skill_gap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=749;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_results`
--
ALTER TABLE `user_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_skill_mapping`
--
ALTER TABLE `user_skill_mapping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `career_roadmap`
--
ALTER TABLE `career_roadmap`
  ADD CONSTRAINT `fk_career` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `roadmap_progress`
--
ALTER TABLE `roadmap_progress`
  ADD CONSTRAINT `roadmap_progress_ibfk_1` FOREIGN KEY (`roadmap_id`) REFERENCES `career_roadmap` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD CONSTRAINT `roadmap_tasks_ibfk_1` FOREIGN KEY (`roadmap_id`) REFERENCES `career_roadmap` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_career_goal` FOREIGN KEY (`career_goal`) REFERENCES `careers` (`career_id`),
  ADD CONSTRAINT `fk_user_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_skill_mapping`
--
ALTER TABLE `user_skill_mapping`
  ADD CONSTRAINT `fk_user_skill_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  ADD CONSTRAINT `fk_user_skill_user` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_skill_user_new` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_skill_mapping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_skill_mapping_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

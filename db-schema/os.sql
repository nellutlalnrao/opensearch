-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 29, 2024 at 03:26 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `os`
--

-- --------------------------------------------------------

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
CREATE TABLE IF NOT EXISTS `hierarchy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hierarchy`
--

INSERT INTO `hierarchy` (`id`, `path`) VALUES
(1, '1.4'),
(2, '1.5'),
(3, '1.6'),
(4, '1.2.3.7'),
(5, '1.2.3.7.8'),
(6, '1.2.3.7.8.9');

-- --------------------------------------------------------

--
-- Table structure for table `mantras`
--

DROP TABLE IF EXISTS `mantras`;
CREATE TABLE IF NOT EXISTS `mantras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `hierarchy_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mantras`
--

INSERT INTO `mantras` (`id`, `name`, `text`, `hierarchy_id`) VALUES
(1, 'Gayatri Mantra', 'Om Bhur Bhuvah Swaha, Tat Savitur Varenyam, Bhargo Devasya Dhimahi, Dhiyo Yo Nah Prachodayat.', 6),
(2, 'Maha Mrityunjaya Mantra', 'Om Tryambakam Yajamahe Sugandhim Pushtivardhanam Urvarukamiva Bandhanan Mrityor Mukshiya Maamritat.', 6),
(3, 'Purusha Suktam', 'Sahasra Shirsha Purusha: Sahasraksha Sahasra Paath Sabhoomim Vishwatho Vruthva Athyathishtadhashaangulam.', 5),
(4, 'Durga Mantra', 'Om Dum Durgayei Namaha.', 5),
(5, 'Shanti Mantra', 'Om Sahana Vavatu Sahanau Bhunaktu Sahaveeryam Karavavahai. Tejasvinavadhitamastu Ma Vidvishavahai. Om Shanti Shanti Shanti.', 4),
(6, 'Navagraha Mantra', 'Om Adityaya Somaya Mangalaya Budhaya Cha, Guru Shukra Shani Rahuve Ketave Namah.', 6),
(7, 'Shree Sukta', 'Hiranyavarnaam Harinim Suvarnarajatasrajaam, Chandraam Hiranmayim Lakshmim Jatavedo Ma Avaha.', 5),
(8, 'Bhoomi Suktam', 'Bhoomi Devi Samudra Vasane Devi Parvata Sthithalaye Vishnu Pathni Namastubhyam Pada Sparsham Kshamasva Me.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
CREATE TABLE IF NOT EXISTS `nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`id`, `name`) VALUES
(1, 'Veda'),
(2, 'RigVeda'),
(3, 'Sakala Sakha'),
(4, 'Samaveda'),
(5, 'Yajurveda'),
(6, 'Atharvaveda'),
(7, 'Mandalas'),
(8, 'Suktas'),
(9, 'Mantras');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mantras`
--
ALTER TABLE `mantras`
  ADD CONSTRAINT `mantras_ibfk_1` FOREIGN KEY (`hierarchy_id`) REFERENCES `hierarchy` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

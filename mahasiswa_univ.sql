-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.44-MariaDB-1:10.2.44+maria~bionic - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kuliah
CREATE DATABASE IF NOT EXISTS `kuliah` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `kuliah`;

-- Dumping structure for table kuliah.fakultas
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuliah.fakultas: ~0 rows (approximately)

-- Dumping structure for table kuliah.kampus
CREATE TABLE IF NOT EXISTS `kampus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table kuliah.kampus: ~0 rows (approximately)

-- Dumping structure for table kuliah.lulus
CREATE TABLE IF NOT EXISTS `lulus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_sks` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuliah.lulus: ~0 rows (approximately)

-- Dumping structure for table kuliah.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '0',
  `nim` varchar(60) NOT NULL DEFAULT '0',
  `fakultas` int(11) NOT NULL,
  `kampus` int(11) NOT NULL,
  `lulus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mahasiswa_fakultas` (`fakultas`),
  KEY `FK_mahasiswa_kampus` (`kampus`),
  KEY `FK_mahasiswa_lulus` (`lulus`),
  CONSTRAINT `FK_mahasiswa_fakultas` FOREIGN KEY (`fakultas`) REFERENCES `fakultas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mahasiswa_kampus` FOREIGN KEY (`kampus`) REFERENCES `kampus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mahasiswa_lulus` FOREIGN KEY (`lulus`) REFERENCES `lulus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuliah.mahasiswa: ~0 rows (approximately)

-- Dumping structure for table kuliah.mata_kuliah
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '0',
  `fakultas` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__fakultas` (`fakultas`),
  CONSTRAINT `FK__fakultas` FOREIGN KEY (`fakultas`) REFERENCES `fakultas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuliah.mata_kuliah: ~0 rows (approximately)

-- Dumping structure for table kuliah.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bobot` float NOT NULL DEFAULT 0,
  `mata_kuliah` int(11) NOT NULL DEFAULT 0,
  `mahasiswa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nilai_mata_kuliah` (`mata_kuliah`),
  KEY `FK_nilai_mahasiswa` (`mahasiswa`),
  CONSTRAINT `FK_nilai_mahasiswa` FOREIGN KEY (`mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nilai_mata_kuliah` FOREIGN KEY (`mata_kuliah`) REFERENCES `mata_kuliah` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kuliah.nilai: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

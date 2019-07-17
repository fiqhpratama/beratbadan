/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 10.1.30-MariaDB : Database - db_beratbadan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_beratbadan` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_beratbadan`;

/*Table structure for table `makanan` */

DROP TABLE IF EXISTS `makanan`;

CREATE TABLE `makanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_makanan` varchar(100) DEFAULT NULL,
  `kategori` enum('GEMUK','KURUS','IDEAL','OBESITAS') DEFAULT NULL,
  `jam_ideal` enum('PAGI','SIANG','MALAM') DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

/*Data for the table `makanan` */

insert  into `makanan`(`id`,`nama_makanan`,`kategori`,`jam_ideal`) values (37,'Nasi putih','KURUS','PAGI'),(38,'Telur ceplok','KURUS','PAGI'),(39,'Pepes Tempe','KURUS','PAGI'),(40,'Sate Pisang','KURUS','PAGI'),(41,'Bubur Kacang Hijau','KURUS','PAGI'),(42,'Jus Sirsak','KURUS','PAGI'),(43,'Nasi putih','KURUS','PAGI'),(44,'Sop Sayur','KURUS','SIANG'),(45,'Susu Kental Manis','KURUS','SIANG'),(46,'Jus Mangga','KURUS','SIANG'),(47,'Pisang Bakar lapis keju','KURUS','SIANG'),(48,'Nasi Putih','KURUS','MALAM'),(49,'Ayam Gulai','KURUS','MALAM'),(50,'Tempe Mendol','KURUS','MALAM'),(51,'Tumis Sawi\r\n','KURUS','MALAM'),(52,'Jus Semangka\r\n','KURUS','MALAM'),(53,'1 Gelas Susu','IDEAL','PAGI'),(54,'1 Tangkap Roti Gandum dan Keju\r\n','IDEAL','PAGI'),(55,'1 Buah Pisang\r\n','IDEAL','PAGI'),(56,'Nasi putih','IDEAL','SIANG'),(57,'Sate Ayam\r\n','IDEAL','SIANG'),(58,'1 Gelas Teh atau 1 Gelas Coffee Latte tanpa gula\r\n','IDEAL','SIANG'),(59,'1 Gelas Teh atau 1 Gelas Coffee Latte tanpa gula','IDEAL','MALAM'),(60,'1 cup Yoghurt rendah lemak\r\n','IDEAL','MALAM'),(61,'Nasi putih seukuran 1/2 gelas (50 gram)','OBESITAS','PAGI'),(62,'Nasi putih seukuran 1/2 gelas (50 gram)','OBESITAS','PAGI'),(63,'1 mangkuk sayur bening','OBESITAS','PAGI'),(64,'1 potong buah pepaya\r\n','OBESITAS','PAGI'),(65,'Nasi Putih (100 gram)','OBESITAS','SIANG'),(66,'Tumis tempe kecap\r\n','OBESITAS','SIANG'),(67,'1 mangkuk sop ayam\r\n','OBESITAS','SIANG'),(68,'Nasi Putih (100 gram)','OBESITAS','MALAM'),(69,'1 Potong sedang semur daging\r\n','OBESITAS','MALAM'),(70,'1 porsi capcay\r\n','OBESITAS','MALAM'),(71,'1 buah jeruk segar\r\n','OBESITAS','MALAM');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

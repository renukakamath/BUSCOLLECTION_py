/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - bus_collection
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus_collection` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bus_collection`;

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `bus_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bus_id`,`owner_id`,`bus_number`) values 
(1,1,'KL 07 BW 7339'),
(2,1,'kl 08 ay 2001');

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `collection_amount` decimal(18,0) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`collection_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `collection` */

insert  into `collection`(`collection_id`,`employee_id`,`bus_id`,`collection_amount`,`date`) values 
(1,1,1,500,'2022-08-12'),
(2,1,2,1000,'2022-08-12');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `complaint_des` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`sender_id`,`complaint_des`,`reply`,`date`) values 
(1,2,'good','ok','2022-08-12'),
(2,3,'bad','ok','2022-08-12'),
(3,2,'bad','pending','2022-08-12');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `id_proof` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`owner_id`,`login_id`,`employee_name`,`place`,`email`,`phone`,`id_proof`) values 
(1,1,3,'employee','ernakulam','employee@gmail.com','1234567890','image/image_62f5db60dfa36.jfif'),
(2,1,4,'employee1','karanakodam','employee@gmail.com','5432545111','image/image_62f5ddc4b71cf.jpg');

/*Table structure for table `expenses` */

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `expence_name` varchar(100) DEFAULT NULL,
  `expence_amount` decimal(18,0) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `expenses` */

insert  into `expenses`(`expenses_id`,`employee_id`,`bus_id`,`expence_name`,`expence_amount`,`date`) values 
(1,1,1,'expence name',500,'2022-08-12'),
(2,1,2,'expence name',200,'2022-08-12');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'owner','owner','owner'),
(3,'employee','employee','employee'),
(4,'employee1','employee1','employee');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_proof` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`owner_id`,`login_id`,`owner_name`,`place`,`phone`,`email`,`id_proof`) values 
(1,2,'owner','ernakulam','1234567890','owner@gmail.com','image/image_62f5dafea0fb5.jfif');

/*Table structure for table `permit_details` */

DROP TABLE IF EXISTS `permit_details`;

CREATE TABLE `permit_details` (
  `permit_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `permint_details` varchar(100) DEFAULT NULL,
  `permit_proof` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `permit_details` */

insert  into `permit_details`(`permit_id`,`bus_id`,`permint_details`,`permit_proof`) values 
(1,1,'details','image/image_62f5db849c17a.jpg'),
(2,1,'details','image/image_62f5dbaf28f73.jpg'),
(3,2,'details','image/image_62f5dbc4814a7.jpg'),
(4,1,'details','image/image_62f5dc4b32bb2.jpg'),
(5,1,'details','image/image_62f5dcfc73eac.jpg');

/*Table structure for table `service_details` */

DROP TABLE IF EXISTS `service_details`;

CREATE TABLE `service_details` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `service_amount` decimal(18,0) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `service_details` */

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_proof` varchar(1000) DEFAULT NULL,
  `staff_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`employee_id`,`bus_id`,`staff_name`,`place`,`phone`,`email`,`id_proof`,`staff_type`) values 
(1,1,1,'staff','karanakodam','8137924202','staff@gamilcom','image/image_62f5df14c5f4e.jfif','Driver');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

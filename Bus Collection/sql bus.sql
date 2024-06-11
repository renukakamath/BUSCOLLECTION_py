/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - bus_collection_py
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bus_collection_py` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bus_collection_py`;

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `bus_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`bus_id`,`owner_id`,`bus_number`) values 
(4,1,'KL 07 BW 7339'),
(3,2,'kl O1 BM 2010'),
(5,5,'kl 08 AY 2323');

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `collection_amount` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`collection_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `collection` */

insert  into `collection`(`collection_id`,`employee_id`,`bus_id`,`collection_amount`,`date`) values 
(1,1,1,500,'2022-08-12'),
(2,1,2,1000,'2022-08-12'),
(3,3,1,1000,'2022-09-17'),
(4,3,3,2,'2022-09-17'),
(5,2,4,500,'2022-10-07'),
(6,3,3,7000,'2022-11-22'),
(7,3,4,1000,'2023-02-06'),
(8,3,3,5,'2023-02-06');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `complaint_des` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`sender_id`,`complaint_des`,`reply`,`date`) values 
(1,2,'good','ok','2022-08-12'),
(2,3,'bad','ok','2022-08-12'),
(3,2,'bad','hai','2022-08-12'),
(4,5,'hai','ok','2022-09-17'),
(5,6,'good','ok','2022-09-17'),
(6,4,'good','pending','2022-10-07'),
(7,6,'good','pending','2022-10-07'),
(8,5,'good','pending','2022-10-07'),
(9,5,'good','pending','2022-10-07'),
(10,4,'good','pending','2022-10-07'),
(11,4,'good','ohh','2022-10-07'),
(12,4,'good','pending','2022-10-07'),
(13,4,'good','pending','2022-10-07'),
(14,4,'hai','pending','2022-10-07'),
(15,4,'hai','pending','2022-10-07'),
(16,4,'hai','pending','2022-10-07'),
(17,2,'bad','pending','2022-10-07'),
(18,2,'good','pending','2022-10-07'),
(19,5,'good','pending','2022-11-22'),
(20,6,'hai','yes','2022-11-22'),
(21,5,'good','pending','2023-02-05'),
(22,3,'good','pending','2023-02-06'),
(23,3,'go','yes','2023-02-06');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`owner_id`,`login_id`,`employee_name`,`place`,`email`,`phone`,`id_proof`) values 
(2,1,4,'employee2','karanakodam2','employee2@gmail.com','5432545111','image/image_62f5ddc4b71cf.jpg'),
(3,2,6,'hello','hello','hai@gmail.com','1233445541','image/image_63255301116e8.jfif'),
(4,5,12,'em1','ekm','student1@gmail.com','1234567891','static/image/1ebfdad7-b1ad-40d6-9c58-963e9b650012bike.jpg');

/*Table structure for table `expenses` */

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `expence_name` varchar(100) DEFAULT NULL,
  `expence_amount` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `expenses` */

insert  into `expenses`(`expenses_id`,`employee_id`,`bus_id`,`expence_name`,`expence_amount`,`date`) values 
(1,1,1,'expence name',500,'2022-08-12'),
(2,1,2,'expence name',200,'2022-08-12'),
(3,3,1,'expence name',500,'2022-09-17'),
(4,3,3,'expence name',1,'2022-09-17'),
(5,2,4,'expence name',500,'2022-10-07'),
(6,3,3,'expence name',2000,'2022-10-07'),
(7,3,3,'exp',2000,'2022-11-22'),
(8,3,4,'expence',10000,'2023-02-06'),
(9,3,3,'hai exp',5151,'2023-02-06'),
(10,3,3,'good',4000,'2023-02-06'),
(11,3,5,'good',400,'2023-02-06'),
(12,3,4,'rse',1,'2023-02-06'),
(13,4,3,'exp',1,'2023-02-06'),
(14,3,4,'g',5,'2023-02-06');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'owner','owner','owner'),
(3,'employee','employee','employee'),
(4,'employee1','employee1','employee'),
(5,'hai','hai','owner'),
(6,'hello','hello','employee'),
(7,'admin','admin','admin'),
(8,'user234','1234','owner'),
(9,'ownre','12s3','owner'),
(10,'on','on','owner'),
(13,'hai@gmail.com','hjk','employee'),
(12,'en','en','employee');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`owner_id`,`login_id`,`owner_name`,`place`,`phone`,`email`,`id_proof`) values 
(1,2,'owner','ernakulam','1234567890','owner@gmail.com','static/imagec33e7f78-827f-4a32-8382-8aa148949e41bike.jpg'),
(2,5,'hai','hai','1234551112','hai@gmail','static/imagec33e7f78-827f-4a32-8382-8aa148949e41bike.jpg'),
(3,8,'user234','dhgej','9876543211','user1@gmail.com','static/imagec33e7f78-827f-4a32-8382-8aa148949e41bike.jpg'),
(4,9,'owner','nbj','1234567890','user1@gmail.com','static/imagec33e7f78-827f-4a32-8382-8aa148949e41bike.jpg'),
(5,10,'owner1','ernakaulam','9876543210','student@gmail.com','static/imagec33e7f78-827f-4a32-8382-8aa148949e41bike.jpg');

/*Table structure for table `permit_details` */

DROP TABLE IF EXISTS `permit_details`;

CREATE TABLE `permit_details` (
  `permit_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `permint_details` varchar(100) DEFAULT NULL,
  `permit_proof` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `permit_details` */

insert  into `permit_details`(`permit_id`,`bus_id`,`permint_details`,`permit_proof`) values 
(1,1,'details','image/image_62f5db849c17a.jpg'),
(2,1,'details','image/image_62f5dbaf28f73.jpg'),
(3,2,'details','image/image_62f5dbc4814a7.jpg'),
(4,1,'details','image/image_62f5dc4b32bb2.jpg'),
(5,1,'details','image/image_62f5dcfc73eac.jpg'),
(6,3,'p details','image/image_632553b981ab4.jfif'),
(7,4,'details','image/image_633fa28665f85.jfif'),
(8,3,'details','image/image_633fa3628425e.jfif'),
(9,5,'details','static/image/068a8c53-0db2-4746-92bf-b8e8348ad87amotorbike-front-side-bike-logo-fast-ride-symbol-2J54CKY.jpg'),
(10,5,'details','static/image/6a7be4e9-1f99-4a08-94d3-790eba870ae7motorbike-front-side-bike-logo-fast-ride-symbol-2J54CKY.jpg');

/*Table structure for table `service_details` */

DROP TABLE IF EXISTS `service_details`;

CREATE TABLE `service_details` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `service_amount` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `service_details` */

insert  into `service_details`(`service_id`,`bus_id`,`employee_id`,`service_type`,`service_amount`,`date`) values 
(1,4,2,'servicess',2000,'2022-10-05'),
(2,3,3,'servicess',2000,'2022-11-26'),
(3,3,5,'good',555,'2023-02-06'),
(4,3,4,'hai',5,'2023-02-06'),
(5,4,3,'goo',1,'2023-02-06');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staff_id`,`employee_id`,`bus_id`,`staff_name`,`place`,`phone`,`email`,`id_proof`,`staff_type`) values 
(1,1,1,'staff','karanakodam','8137924202','staff@gamilcom','image/image_62f5df14c5f4e.jfif','Driver'),
(2,3,1,'staff','ernakaulam','1234567891','staff@gamilcom','image/image_6325542ef2fce.jpg','Driver'),
(3,3,3,'staff','ernakulam','1234567890','staff@gamilcom','image/image_632555ac1a76e.jfif','conductors'),
(4,2,4,'staff','karanakodam','1234567891','staff@gamilcom','image/image_633fa46eb097a.jfif','Driver'),
(5,2,4,'staff','karanakodam','9495736748','renukakamath@gmail.com','image/image_633fa824ec78a.jfif','conductors'),
(6,4,3,'hai','place','123456789','ren@gmail.com','static/image/0ff05b1b-5211-4af6-98a7-4b6c0a20cec4abc.jpg','conductor');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

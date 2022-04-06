-- MySQL dump 10.10
--
-- Host: localhost    Database: srp
-- ------------------------------------------------------
-- Server version	5.0.21-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `examination_details`
--

DROP TABLE IF EXISTS `examination_details`;
CREATE TABLE `examination_details` (
  `examid` varchar(45) NOT NULL default '',
  `time` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examination_details`
--


/*!40000 ALTER TABLE `examination_details` DISABLE KEYS */;
LOCK TABLES `examination_details` WRITE;
INSERT INTO `examination_details` VALUES ('exam1','12:30'),('exam2','10:30'),('Exam3','11:30'),('unit test1','10:30 AM');
UNLOCK TABLES;
/*!40000 ALTER TABLE `examination_details` ENABLE KEYS */;

--
-- Table structure for table `faculty_details`
--

DROP TABLE IF EXISTS `faculty_details`;
CREATE TABLE `faculty_details` (
  `faculty_id` varchar(45) NOT NULL default '',
  `faculty_name` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `subject_dealing` varchar(45) NOT NULL default '',
  `joining_date` varchar(45) NOT NULL default '',
  `mailid` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_details`
--


/*!40000 ALTER TABLE `faculty_details` DISABLE KEYS */;
LOCK TABLES `faculty_details` WRITE;
INSERT INTO `faculty_details` VALUES ('Teacher1','Ramana','','computers','22-06-2008','ramana@gmail.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `faculty_details` ENABLE KEYS */;

--
-- Table structure for table `login_table`
--

DROP TABLE IF EXISTS `login_table`;
CREATE TABLE `login_table` (
  `login_id` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `role` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_table`
--


/*!40000 ALTER TABLE `login_table` DISABLE KEYS */;
LOCK TABLES `login_table` WRITE;
INSERT INTO `login_table` VALUES ('Stud2','swathi','student'),('Teacher1','ramana','teacher');
UNLOCK TABLES;
/*!40000 ALTER TABLE `login_table` ENABLE KEYS */;

--
-- Table structure for table `notification_details`
--

DROP TABLE IF EXISTS `notification_details`;
CREATE TABLE `notification_details` (
  `notification_id` int(10) unsigned NOT NULL auto_increment,
  `n_name` varchar(45) NOT NULL default '',
  `n_date` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_details`
--


/*!40000 ALTER TABLE `notification_details` DISABLE KEYS */;
LOCK TABLES `notification_details` WRITE;
INSERT INTO `notification_details` VALUES (1,'School remains open from july 10th 2009','28-4-2009 ');
UNLOCK TABLES;
/*!40000 ALTER TABLE `notification_details` ENABLE KEYS */;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
CREATE TABLE `student_details` (
  `student_id` varchar(45) NOT NULL default '',
  `student_name` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `currentstandard` varchar(45) NOT NULL default '',
  `currentdivision` varchar(45) NOT NULL default '',
  `parentemailid` varchar(45) NOT NULL default '',
  `joiningdate` varchar(45) NOT NULL default '',
  `reportcardno` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_details`
--


/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
LOCK TABLES `student_details` WRITE;
INSERT INTO `student_details` VALUES ('Stud1','swathi','','10','B','laxmi@gmail.com','22-06-2008','Rep1'),('Stud2','pranitha','','10','A','pranitha@gmail.com','10-04-2009','Rep2');
UNLOCK TABLES;
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;

--
-- Table structure for table `student_remarks`
--

DROP TABLE IF EXISTS `student_remarks`;
CREATE TABLE `student_remarks` (
  `student_id` varchar(45) NOT NULL default '',
  `remarks` varchar(100) NOT NULL default '',
  `date` varchar(45) NOT NULL default '',
  `teacher_id` varchar(45) NOT NULL default '',
  `remark_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`remark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_remarks`
--


/*!40000 ALTER TABLE `student_remarks` DISABLE KEYS */;
LOCK TABLES `student_remarks` WRITE;
INSERT INTO `student_remarks` VALUES ('Stud1','Poor At Science','30-4-2009 ','Teacher1',1),('Stud1','Poor At Maths','24-4-2009 ','Teacher1',2),('Stud2','poor At science','24-4-2009 ','Teacher1',3),('Stud2','poor at social Studies','23-4-2009 ','Teacher1',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `student_remarks` ENABLE KEYS */;

--
-- Table structure for table `studentreport1`
--

DROP TABLE IF EXISTS `studentreport1`;
CREATE TABLE `studentreport1` (
  `student_id` varchar(10) NOT NULL default '',
  `test_id` varchar(45) NOT NULL default '',
  `Telugu` varchar(45) NOT NULL default 'NotEntered',
  `Hindi` varchar(45) NOT NULL default 'NotEntered',
  `English` varchar(45) NOT NULL default 'NotEntered',
  `maths` varchar(45) NOT NULL default 'NotEntered',
  `Science` varchar(45) NOT NULL default 'NotEntered',
  `Social` varchar(45) NOT NULL default 'NotEntered',
  `actualmarks` varchar(45) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentreport1`
--


/*!40000 ALTER TABLE `studentreport1` DISABLE KEYS */;
LOCK TABLES `studentreport1` WRITE;
INSERT INTO `studentreport1` VALUES ('Stud2','UnitTest','23','23','NotEntered','NotEntered','NotEntered','NotEntered','25'),('Stud1','UnitTest','24','23','NotEntered','NotEntered','NotEntered','NotEntered','25');
UNLOCK TABLES;
/*!40000 ALTER TABLE `studentreport1` ENABLE KEYS */;

--
-- Table structure for table `time_details`
--

DROP TABLE IF EXISTS `time_details`;
CREATE TABLE `time_details` (
  `examid` varchar(45) NOT NULL default '',
  `subject` varchar(45) NOT NULL default '',
  `date` varchar(45) NOT NULL default '',
  `incr` int(10) unsigned NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_details`
--


/*!40000 ALTER TABLE `time_details` DISABLE KEYS */;
LOCK TABLES `time_details` WRITE;
INSERT INTO `time_details` VALUES ('exam1','Social','26-4-2009 ',0),('exam1','Social','26-4-2009 ',0),('exam1','Social','26-4-2009 ',0),('exam1','Social','26-4-2009 ',0),('exam1','Social','26-4-2009 ',0),('exam1','Social','26-4-2009 ',0),('exam2','as','23-4-2009 ',0),('exam2','as','24-4-2009 ',0),('exam2','as','25-4-2009 ',0),('exam2','as','26-4-2009 ',0),('exam2','as','27-4-2009 ',0),('exam2','as','28-4-2009 ',0),('Exam3','Telugu','24-4-2009',1),('Exam3','Hindi','25-4-2009',2),('Exam3','English','26-4-2009',3),('Exam3','Maths','27-4-2009',4),('Exam3','Science','28-4-2009',5),('Exam3','Social','30-4-2009 ',6),('unit test1','Telugu','2-6-2009 ',1),('unit test1','Hindi','3-6-2009 ',2),('unit test1','english','4-6-2009 ',3),('unit test1','maths','5-6-2009 ',4),('unit test1','science','6-6-2009 ',5),('unit test1','social','7-6-2009 ',6);
UNLOCK TABLES;
/*!40000 ALTER TABLE `time_details` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


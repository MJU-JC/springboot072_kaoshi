/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - springbootsu39z
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springbootsu39z` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `springbootsu39z`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/springbootsu39z/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/springbootsu39z/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/springbootsu39z/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

/*Table structure for table `kaoshiguize` */

DROP TABLE IF EXISTS `kaoshiguize`;

CREATE TABLE `kaoshiguize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `guize` longtext COMMENT '规则',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='考试规则';

/*Data for the table `kaoshiguize` */

insert  into `kaoshiguize`(`id`,`addtime`,`guize`,`tupian`) values (51,'2021-04-24 21:59:09','规则1','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian1.jpg'),(52,'2021-04-24 21:59:09','规则2','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian2.jpg'),(53,'2021-04-24 21:59:09','规则3','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian3.jpg'),(54,'2021-04-24 21:59:09','规则4','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian4.jpg'),(55,'2021-04-24 21:59:09','规则5','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian5.jpg'),(56,'2021-04-24 21:59:09','规则6','http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian6.jpg');

/*Table structure for table `kaoshipingfen` */

DROP TABLE IF EXISTS `kaoshipingfen`;

CREATE TABLE `kaoshipingfen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `shijuan` varchar(200) DEFAULT NULL COMMENT '试卷',
  `pingfen` int(11) DEFAULT NULL COMMENT '评分',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='考试评分';

/*Data for the table `kaoshipingfen` */

insert  into `kaoshipingfen`(`id`,`addtime`,`kemu`,`shijuan`,`pingfen`,`xuehao`,`xingming`,`banji`) values (71,'2021-04-24 21:59:09','科目1','试卷1',1,'学号1','姓名1','班级1'),(72,'2021-04-24 21:59:09','科目2','试卷2',2,'学号2','姓名2','班级2'),(73,'2021-04-24 21:59:09','科目3','试卷3',3,'学号3','姓名3','班级3'),(74,'2021-04-24 21:59:09','科目4','试卷4',4,'学号4','姓名4','班级4'),(75,'2021-04-24 21:59:09','科目5','试卷5',5,'学号5','姓名5','班级5'),(76,'2021-04-24 21:59:09','科目6','试卷6',6,'学号6','姓名6','班级6');

/*Table structure for table `kaoshitongji` */

DROP TABLE IF EXISTS `kaoshitongji`;

CREATE TABLE `kaoshitongji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `shijuan` varchar(200) DEFAULT NULL COMMENT '试卷',
  `timu` varchar(200) DEFAULT NULL COMMENT '题目',
  `kaoshitongguolv` varchar(200) DEFAULT NULL COMMENT '考试通过率',
  `kaoshikemucishu` varchar(200) DEFAULT NULL COMMENT '考试科目次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='考试统计';

/*Data for the table `kaoshitongji` */

insert  into `kaoshitongji`(`id`,`addtime`,`kemu`,`shijuan`,`timu`,`kaoshitongguolv`,`kaoshikemucishu`) values (21,'2021-04-24 21:59:09','科目1','试卷1','题目1','考试通过率1','考试科目次数1'),(22,'2021-04-24 21:59:09','科目2','试卷2','题目2','考试通过率2','考试科目次数2'),(23,'2021-04-24 21:59:09','科目3','试卷3','题目3','考试通过率3','考试科目次数3'),(24,'2021-04-24 21:59:09','科目4','试卷4','题目4','考试通过率4','考试科目次数4'),(25,'2021-04-24 21:59:09','科目5','试卷5','题目5','考试通过率5','考试科目次数5'),(26,'2021-04-24 21:59:09','科目6','试卷6','题目6','考试通过率6','考试科目次数6');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='考试资讯';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`introduction`,`picture`,`content`) values (111,'2021-04-24 21:59:09','标题1','简介1','http://localhost:8080/springbootsu39z/upload/news_picture1.jpg','内容1'),(112,'2021-04-24 21:59:09','标题2','简介2','http://localhost:8080/springbootsu39z/upload/news_picture2.jpg','内容2'),(113,'2021-04-24 21:59:09','标题3','简介3','http://localhost:8080/springbootsu39z/upload/news_picture3.jpg','内容3'),(114,'2021-04-24 21:59:09','标题4','简介4','http://localhost:8080/springbootsu39z/upload/news_picture4.jpg','内容4'),(115,'2021-04-24 21:59:09','标题5','简介5','http://localhost:8080/springbootsu39z/upload/news_picture5.jpg','内容5'),(116,'2021-04-24 21:59:09','标题6','简介6','http://localhost:8080/springbootsu39z/upload/news_picture6.jpg','内容6');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-04-24 21:59:09');

/*Table structure for table `wangjimimarenyuandengji` */

DROP TABLE IF EXISTS `wangjimimarenyuandengji`;

CREATE TABLE `wangjimimarenyuandengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xueyuan` varchar(200) DEFAULT NULL COMMENT '学院',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `xinmima` varchar(200) DEFAULT NULL COMMENT '新密码',
  `xiugaishijian` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='忘记密码人员登记';

/*Data for the table `wangjimimarenyuandengji` */

insert  into `wangjimimarenyuandengji`(`id`,`addtime`,`xuehao`,`xingming`,`banji`,`xueyuan`,`zhuanye`,`shouji`,`xinmima`,`xiugaishijian`) values (61,'2021-04-24 21:59:09','学号1','姓名1','班级1','学院1','专业1','手机1','新密码1','2021-04-24 21:59:09'),(62,'2021-04-24 21:59:09','学号2','姓名2','班级2','学院2','专业2','手机2','新密码2','2021-04-24 21:59:09'),(63,'2021-04-24 21:59:09','学号3','姓名3','班级3','学院3','专业3','手机3','新密码3','2021-04-24 21:59:09'),(64,'2021-04-24 21:59:09','学号4','姓名4','班级4','学院4','专业4','手机4','新密码4','2021-04-24 21:59:09'),(65,'2021-04-24 21:59:09','学号5','姓名5','班级5','学院5','专业5','手机5','新密码5','2021-04-24 21:59:09'),(66,'2021-04-24 21:59:09','学号6','姓名6','班级6','学院6','专业6','手机6','新密码6','2021-04-24 21:59:09');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `xueyuan` varchar(200) DEFAULT NULL COMMENT '学院',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`xuehao`,`mima`,`xingming`,`xingbie`,`xueyuan`,`zhuanye`,`banji`,`shouji`,`shenfenzheng`,`zhaopian`) values (11,'2021-04-24 21:59:09','用户1','123456','姓名1','男','学院1','专业1','班级1','13823888881','440300199101010001','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian1.jpg'),(12,'2021-04-24 21:59:09','用户2','123456','姓名2','男','学院2','专业2','班级2','13823888882','440300199202020002','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian2.jpg'),(13,'2021-04-24 21:59:09','用户3','123456','姓名3','男','学院3','专业3','班级3','13823888883','440300199303030003','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian3.jpg'),(14,'2021-04-24 21:59:09','用户4','123456','姓名4','男','学院4','专业4','班级4','13823888884','440300199404040004','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian4.jpg'),(15,'2021-04-24 21:59:09','用户5','123456','姓名5','男','学院5','专业5','班级5','13823888885','440300199505050005','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian5.jpg'),(16,'2021-04-24 21:59:09','用户6','123456','姓名6','男','学院6','专业6','班级6','13823888886','440300199606060006','http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian6.jpg');

/*Table structure for table `zhuanyeleixing` */

DROP TABLE IF EXISTS `zhuanyeleixing`;

CREATE TABLE `zhuanyeleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='专业类型';

/*Data for the table `zhuanyeleixing` */

insert  into `zhuanyeleixing`(`id`,`addtime`,`leixing`) values (41,'2021-04-24 21:59:09','类型1'),(42,'2021-04-24 21:59:09','类型2'),(43,'2021-04-24 21:59:09','类型3'),(44,'2021-04-24 21:59:09','类型4'),(45,'2021-04-24 21:59:09','类型5'),(46,'2021-04-24 21:59:09','类型6');

/*Table structure for table `zhuanyeliebiao` */

DROP TABLE IF EXISTS `zhuanyeliebiao`;

CREATE TABLE `zhuanyeliebiao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhuanyemingcheng` varchar(200) DEFAULT NULL COMMENT '专业名称',
  `zhuanyexiangqing` longtext COMMENT '专业详情',
  `zhuanyeleixing` varchar(200) DEFAULT NULL COMMENT '专业类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='专业列表';

/*Data for the table `zhuanyeliebiao` */

insert  into `zhuanyeliebiao`(`id`,`addtime`,`zhuanyemingcheng`,`zhuanyexiangqing`,`zhuanyeleixing`) values (31,'2021-04-24 21:59:09','专业名称1','专业详情1','专业类型1'),(32,'2021-04-24 21:59:09','专业名称2','专业详情2','专业类型2'),(33,'2021-04-24 21:59:09','专业名称3','专业详情3','专业类型3'),(34,'2021-04-24 21:59:09','专业名称4','专业详情4','专业类型4'),(35,'2021-04-24 21:59:09','专业名称5','专业详情5','专业类型5'),(36,'2021-04-24 21:59:09','专业名称6','专业详情6','专业类型6');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

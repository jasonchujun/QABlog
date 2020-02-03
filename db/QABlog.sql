-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: QABlog
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `comment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (6,'我虽然很少关注国内篮球，今年才关注金强，对马超很陌生,但是支持他，支持每一个四川球员.',5,2,'2020-02-01 21:45:24'),(7,'为超哥雄起、他为四川篮球牺牲了太多.',5,2,'2020-02-01 21:45:24'),(8,'个人觉得超哥比现在的队长 王晶在防守还是进攻都要好的多!咋还老是王晶主力 超哥替补？咋回事啊？！',5,2,'2020-02-01 21:45:24'),(9,'三国名将',5,2,'2020-02-01 21:45:24'),(10,'超哥是绝对的的重感情有责任心的球员，球迷也会为了你负责到底！谢谢你当年舍去好的机会，回到家乡，谢谢你还坚持到现在，谢谢你的出色让大家知道我们四川有个球星叫马超！',5,2,'2020-02-01 21:45:24'),(11,'忽必烈怎么不推行？大哉乾元就是取易经。只不过人家没北魏孝文帝那样么傻，连祖宗姓啥都改了',7,2,'2020-02-01 21:45:24'),(12,'剃发是归顺大清帝国意思，不剃发就是反清政府，这是一个标志、剃发了的人会到明朝就是死路一条、被砍.',7,2,'2020-02-01 21:45:24'),(13,' 现在让男生都剃光头、你敢不剃光头？你多大胆子，解放军不行留长发、你留一个试试',7,2,'2020-02-01 21:45:24'),(14,'满清都开科举了.',7,2,'2020-02-01 21:45:24'),(15,'经济长期不增长（没有技术进步），财政负担（宗室开支）越来越大，矛盾是必然的。',8,2,'2020-02-01 21:45:24'),(16,'廷杖制度 特务机构吧 从身心摧残士大夫的理想抱负.',8,2,'2020-02-01 21:45:24'),(17,'简单的说就是，明以前是共议制，君是君 臣是臣，大事是由君臣共议（宰相制）宰相见君 可以坐着，而文盲乞丐出身的朱重八 立国后，改变了（历史上三个开国皇帝，刘 朱 髦同出一辙“高筑墙 缓称王 广积粮策略”），宰相见君也得站着，，为了树立君主威望，可以庭杖宰相和大臣，到了清 干脆就取消宰相，，家国天下 一切都得听君主的，大臣都是奴才见到上级都得跪拜，，所以有人说 到目前为止，，跪着的思想永不灭，而世世代代 教科书教育你，，跪着是正确的，主子是正确的，，主子为你好， 天下好 ，你家就好，天下乱 你家就亡，还是“家国天下”逻辑，没有主子 哪来的国？ 没有国哪来的家？没有家哪来的你？这种逻辑时代延续了.',8,2,'2020-02-01 21:45:24'),(18,'空前强大的皇权和低下的皇帝素质、腐朽虚伪的制度之间的矛盾.',8,2,'2020-02-01 21:45:24'),(21,'哈哈哈，好了。',8,2,'2020-02-01 22:34:38'),(34,'对的，',11,9,'2020-02-02 23:09:58');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (5,'让我们来了解下我们金强唯一的本土球星！','马超，生于成都长于成都，在2000年被选入省体工队时，四川篮球正值多事之秋，这使他一直没有机会进入到CBA。幸运的是，他在这里遇到了自己的“伯乐”王绪林。当时身为四川男篮主教练的王绪林对头脑清晰、打球灵活的小马超青睐有加，亲自将其从青年队调到一队，并且重点培养。马超每逢比赛几乎场场打满，而那一两年的时间也正是他技术特点和心理素质成型的关键时期。他后来能够入选中国男篮奥运希望队，也正因为那时打下的良好基础。所以，如今尽管王绪林已远赴他乡执教，可在马超的心目中，王导永远是他最为感激的对象。\r\n在2005年全运会之后，马超迎来了自己职业生涯第一个重要的拐点——他被租借到了组建不久的浙江广厦。当时广厦的主教练是美国人纽曼，马超灵活快速的技术特点很合这位主帅的胃口，第二年便以绝对主力的身份帮助球队拿到了进军CBA赛场的入场券。\r\n后来，四川金强俱乐部成立并且打入了2010赛季NBL的A组赛，家乡球队自然向这位“本土球星”抛出了橄榄枝。乡情浓厚，自称典型“成都制造”的马超终于又迎来了为家乡打球的机会。但是，尽管NBL已被改版成与CBA平行的联赛，但二者相比，NBL无论在竞争力还是受关注度上明显无法与CBA比肩，正值当打之年的马超是否会有“人往低处走”的心理落差呢？“我从来没有这么想过，决定回四川金强打球，首先因为我是四川培养出来的，为家乡球队效力是我的义务，也是我的快乐。另外，只要是金子在哪里都能够发光，都能够引起别人的重视，在NBL打球绝对不会埋没我。”\r\n（曾被获得的NBL本土球王、MVP和最有价值球员的马超，他当年毅然决然回四川，为了家乡的荣誉，回来一直坚持到现在，其实他可以像其它球星样去其它队挣钱，他可以给自己更多更好的机会，但是，他没有！他为四川队牺牲付出了太多，不管他今年比赛好久上场，上场能打多久，四川球迷依然毅然决然挺你到底，球迷会一直为你撕心裂肺吼到底！）四川不能没有你！','2020-02-01 19:02:22',2),(7,'为什么满清蒙元没有像鲜卑人那样推行汉化政策？','为什么满清蒙元没有像鲜卑人那样推行汉化政策？\r\n\r\n清朝入关后以剃发易服来评判汉人是否归顺，强硬推行这条政令，并且不顺应就用镇压和大杀戮的方式来征服，这是不是一种文明的倒退？\r\n\r\n对比北魏孝文帝改革，在改革之前，北魏统治者对于民族压迫也很残酷，民族之间的矛盾激化也引起了人民的反抗斗争，为了巩固统治，孝文帝大力推行汉化政策，改官制，禁胡服，断北语，改姓氏，定族姓。这一系列的措施虽然遭到拓拔贵族的反对，但是缓和了民族矛盾，加速民族大融合，是顺应历史发展趋势，有利于文明进步的。\r\n\r\n假如清朝当初没有强制推行剃发易服这项政策，而是向北魏孝文帝学习，会不会使得清朝的统治更稳定而得民心呢？','2020-02-01 19:06:28',2),(8,'明朝的君臣关系为什么会如此糟糕的？','常言道“文死谏，武死战”，臣下说的话皇帝不爱听被打板子乃至掉脑袋是历朝历代的常态，像李卝世卝民那样给谏臣蹬鼻子上脸才是稀罕。可为什么明朝的群臣就能因此反感皇室到因为什么原因，只要挨了廷杖就认为是风骨高洁的义士的地步？这不摆明了骂皇帝是混卝蛋，要和其划清界限么。\r\n\r\n\r\n纵观上下五千年（姑且认为有），似乎只有大萌一朝能弄到如此奇葩，哪怕是满人、蒙古人这样的异族统卝治者都没有如此被汉臣所痛恨……\r\n\r\n\r\n某些明粉因此认为明朝的士大夫们都是毁国自肥的奸佞小人，但是这也明显说不通——明朝的皇帝老卝子真正放飞自我不想管事的时候，光靠官僚自卝治反而能把国卝家管得平安无事波澜不惊，也没有出现什么野心勃勃要把皇室拉下马得窃卝国者……换句话说明朝的臣子们其实都还是挺本分尽责的……\r\n\r\n\r\n那么究竟是什么造成了明朝这样空前绝后两极对立的君臣关系的？','2020-02-01 19:08:20',2),(11,'什么时候结束疫情','现在是上升起，拐点就要到了','2020-02-02 23:09:22',9),(12,'哈哈哈','我来测试了哦','2020-02-02 23:16:19',2),(13,'再来测试一下','哈哈哈，我又来了。','2020-02-02 23:17:53',2);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'15555552000','zj','pbkdf2:sha256:150000$UsWisVvu$29345e080b68f60b81e3396a2fb087440b5784e73e44286972e9432cca83bd06',1),(5,'13311112222','jason','pbkdf2:sha256:150000$UsWisVvu$29345e080b68f60b81e3396a2fb087440b5784e73e44286972e9432cca83bd06',1),(7,'18988889999','wq','pbkdf2:sha256:150000$yiDjfbfD$b6b948418a3162218aea4ea901bb094000c570acdb26b2203529cca620e91ec9',1),(8,'666666','admin','pbkdf2:sha256:150000$xnvRMz7u$81e0ee39893766589600610b19b7a6d0a1b0e87395d6ed8e63e5498b76432cf8',0),(9,'13888888889','zhu','pbkdf2:sha256:150000$5gnoMe1o$9281e1686fd1f9006608e306673f8cbf28595c55521842a96d615d3594c4e1d5',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-02 23:48:34

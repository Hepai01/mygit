/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : new_event

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 03/06/2025 01:17:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `cover_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章封面',
  `state` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '草稿' COMMENT '文章状态: 只能是[已发布] 或者 [草稿]',
  `category_id` int unsigned COMMENT '文章分类ID',
  `create_user` int unsigned NOT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_category`(`category_id`) USING BTREE,
  INDEX `fk_article_user`(`create_user`) USING BTREE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '长沙旅游攻略', '<p>已发布</p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 1, 1, '2024-03-10 14:46:10', '2024-10-29 16:55:41');
INSERT INTO `article` VALUES (2, '减少熬夜', '<p>	<span style=\"color: rgb(51, 51, 51);\">为了让学生不要熬夜，不少高校采取了宿舍深夜断电或断网的措施。深圳大学从2024年9月18日起，对粤海校区本科生宿舍进行夜间断电管理，上课日零点至早晨六点，室内照明、插座电源关闭。山东大学、安徽农业大学实行夜间12点宿舍断网，防止学生熬夜上网冲浪。但是断电断网，会带来很多不便。比如夜晚断电无法开空调，缺少紧急照明，存在安全隐患；夜晚彻底断网对于着急查询信息、获取资料、沟通交流的学生也是一道阻碍。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 6, 1, '2024-03-10 14:56:20', '2024-10-22 01:39:47');
INSERT INTO `article` VALUES (3, '武汉学院校园网降速', '<p><span style=\"color: rgb(26, 32, 41);\">武汉学院的校园网降速，真是让人头疼。原本流畅的网络环境，现在变得像蜗牛爬行。每次打开网页，都得耐心等待，仿佛回到了拨号上网的年代。在线课堂、资料下载，样样都受影响，严重影响了我们的学习和工作效率。学校是不是该考虑一下学生的实际需求，别让校园网成为我们追求知识的“绊脚石”啊！这降速的网速，真是让人忍不住吐槽：提速吧，校园网！</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 4, 1, '2024-03-10 16:40:32', '2024-10-22 01:29:15');
INSERT INTO `article` VALUES (19, '限网速防止熬夜？', '<p><span style=\"color: rgb(26, 32, 41);\">限网速防止熬夜？这操作真是让人哭笑不得。学校为了我们的健康，竟然想出这样的损招。晚上网速一慢，想查个资料都困难，更别提愉快的网上冲浪了。但这样一来，熬夜的人真的会减少吗？不过是让我们在慢如蜗牛的网速中，更加焦虑地等待，熬夜的斗志反而更旺盛。与其限网速，不如改善作息环境和提高教学质量，让我们自觉早睡早起。这样的“防熬夜”措施，真是让人吐槽无力。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 4, 1, '2024-10-22 01:19:56', '2024-10-22 09:23:31');
INSERT INTO `article` VALUES (20, '体测测后感', '<p><span style=\"color: rgb(26, 32, 41);\">体测，这个让大学生闻风丧胆的名词，简直就是要了我们半条命。一年一度的体测如期而至，跑步、跳远、引体向上，样样让人痛苦不堪。平时久坐教室的我们，突然要面对如此高强度的运动，不仅身体吃不消，心灵也备受摧残。体测成绩成了衡量我们身体素质的唯一标准，却忽视了个体差异。都说身体是革命的本钱，可这体测，简直让我们觉得革命的道路异常艰辛。能不能让我们在追求知识的同时，也能保住这条“半条命”啊！</span></p>', 'b01789cb-34da-4ef2-852a-e819bcaa37b2.png', '已发布', 4, 1, '2024-10-22 01:20:33', '2025-06-03 01:13:19');
INSERT INTO `article` VALUES (21, '不是，鸽们脆脆鲨', '<p>	<span style=\"color: rgb(51, 51, 51);\">10月9日凌晨4点多，救护车的闪光划破了校园夜晚的宁静，从深夜熬到凌晨的小菲（化名）因为胸闷心慌、呼吸不畅，被紧急送往江夏区第一人民医院救治。小菲平时经常与室友熬夜打游戏到凌晨一两点，有时甚至玩个通宵。出事当日她经过治疗身体好转，医生判断她的症状与长期熬夜有密切关系。10月以来，已经有多位同学凌晨被紧急送医救治，其中一半以上是因熬夜引起的各种身体问题，万幸并未出现危及生命者。但过去没有，将来一定没有吗？近期接连发生网红深夜直播猝死的事故，熬夜的警钟一直在长鸣。但对于学生来说，只靠警示和自律，似乎远远不够。</span></p>', 'D:\\60文件\\zy\\ps\\8d494227-11e5-4502-a4ee-9cc498802159.png', '已发布', 1, 1, '2024-10-22 01:21:48', '2025-06-02 22:45:32');
INSERT INTO `article` VALUES (22, '在线教育黄金发展期', '<p><span style=\"color: rgb(26, 32, 41);\">随着互联网技术的发展，在线教育行业迎来了黄金发展期。优质的教育资源、灵活的学习方式，使得在线教育成为越来越多人的选择。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '草稿', 4, 1, '2024-10-22 01:23:06', '2024-10-22 09:22:33');
INSERT INTO `article` VALUES (23, '垃圾分类成为新时尚', '<p><span style=\"color: rgb(26, 32, 41);\">垃圾分类在各地逐渐推行，成为了一种新的生活方式。市民积极参与，环保意识不断提高，为建设美丽家园贡献力量。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 4, 1, '2024-10-22 01:23:44', '2024-10-22 01:23:44');
INSERT INTO `article` VALUES (24, '数字货币引发热议', '<p><span style=\"color: rgb(26, 32, 41);\">数字货币的崛起引发了社会各界的关注和讨论。其去中心化、匿名性等特点，使得数字货币成为了金融科技领域的一大热点。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 4, 1, '2024-10-22 01:24:15', '2024-10-22 01:24:15');
INSERT INTO `article` VALUES (25, '科技创新推动经济发展', '<p><span style=\"color: rgb(26, 32, 41);\">我国不断加大科技创新力度，推动经济高质量发展。一批具有自主知识产权的高科技企业崛起，成为经济发展的新引擎。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 6, 1, '2024-10-22 01:24:45', '2024-10-22 01:24:45');
INSERT INTO `article` VALUES (26, '医疗改革惠及民生', '<p><span style=\"color: rgb(26, 32, 41);\">新一轮医疗改革启动，旨在解决看病难、看病贵的问题。改革举措包括完善医保制度、提升医疗服务水平等，让更多市民受益。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 6, 1, '2024-10-22 01:25:08', '2024-10-22 01:25:08');
INSERT INTO `article` VALUES (27, '武汉学院公园椅事件', '<p><span style=\"color: rgb(26, 32, 41);\">咩啊，道听途说</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 6, 1, '2024-10-22 09:23:18', '2024-10-22 10:00:51');
INSERT INTO `article` VALUES (28, '国产游戏斩获国际大奖', '<p><span style=\"color: rgb(26, 32, 41);\">一款国产独立游戏在国际游戏展上荣获多项大奖，其精美的画面和独特的玩法赢得了海外评委和玩家的一致好评，为国争光。</span></p>', 'https://big-event-gwd.oss-cn-beijing.aliyuncs.com/9bf1cf5b-1420-4c1b-91ad-e0f4631cbed4.png', '已发布', 2, 1, '2024-10-22 09:24:14', '2024-10-22 09:24:14');
INSERT INTO `article` VALUES (30, '21313', '<p>213123123</p>', '82cb8fb0-e7bb-4d39-9cfd-6def5557d995.png', '已发布', 1, 1, '2025-06-03 00:46:50', '2025-06-03 00:46:50');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类别名',
  `create_user` int unsigned NOT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_user`(`create_user`) USING BTREE,
  CONSTRAINT `fk_category_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '美食', 'ms', 1, '2024-03-09 20:38:06', '2024-10-15 11:50:40');
INSERT INTO `category` VALUES (2, '游戏', 'game', 1, '2024-03-09 23:03:53', '2024-10-21 00:09:50');
INSERT INTO `category` VALUES (4, '热点', 'rd', 1, '2024-03-09 23:56:49', '2024-03-09 23:56:49');
INSERT INTO `category` VALUES (6, '实事', 'ss', 1, '2024-03-15 14:44:01', '2024-03-15 14:44:01');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '昵称',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '邮箱',
  `user_pic` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'w', '508df4cb2f4d8f80519256258cfb975f', 'wba', 'wac@163.com', 'https://www.itheima.com/ly.png', '2024-03-07 19:49:49', '2025-05-31 17:55:12');
INSERT INTO `user` VALUES (2, 'abcdef', '8a1bb284d84b7e7df32cba6d8e89eac9', '', '', '', '2024-03-09 16:03:03', '2024-03-09 16:03:03');
INSERT INTO `user` VALUES (6, 'xiaohaha', '21218cca77804d2ba1922c33e0151105', '', '', '', '2024-10-21 22:43:32', '2024-10-21 22:43:32');
INSERT INTO `user` VALUES (7, 'wahaha', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2024-10-22 09:57:36', '2024-10-22 09:57:36');
INSERT INTO `user` VALUES (8, 'abcde', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2024-10-29 16:45:24', '2024-10-29 16:45:24');
INSERT INTO `user` VALUES (9, 'kkkkk', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2024-10-29 16:49:00', '2024-10-29 16:49:00');
INSERT INTO `user` VALUES (10, 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2024-10-29 16:53:05', '2024-10-29 16:53:05');

SET FOREIGN_KEY_CHECKS = 1;

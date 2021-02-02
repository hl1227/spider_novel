/*
 Navicat Premium Data Transfer

 Source Server         : chenxiaoxi
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 192.168.31.87:3306
 Source Schema         : new_book

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/05/2020 15:56:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_adm
-- ----------------------------
DROP TABLE IF EXISTS `b_adm`;
CREATE TABLE `b_adm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '数据状态',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `types` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT ' 1图片 2视频',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '广告位 1底部广告 2大广告',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `is_download` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否下载 1否 2下载',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_admin
-- ----------------------------
DROP TABLE IF EXISTS `b_admin`;
CREATE TABLE `b_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否超级管理员',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auth_id` int(10) UNSIGNED NOT NULL COMMENT '权限ID',
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_admin
-- ----------------------------
INSERT INTO `b_admin` VALUES (1, 'admin', 'd5252eb8de1e2e71701e1c5fe0faad2d', 90, 1972107093, 1590484138, 1, 1, '多少度', '/admin/images/avatar.png', 0, 1, NULL);

-- ----------------------------
-- Table structure for b_admlog
-- ----------------------------
DROP TABLE IF EXISTS `b_admlog`;
CREATE TABLE `b_admlog`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adm_id` int(10) UNSIGNED NOT NULL COMMENT '广告ID',
  `times` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '时间',
  `num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '浏览数',
  `dnun` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击数',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `channel_id` int(10) NOT NULL COMMENT 'channel_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告访问记录统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_auth
-- ----------------------------
DROP TABLE IF EXISTS `b_auth`;
CREATE TABLE `b_auth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则ID',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_auth
-- ----------------------------
INSERT INTO `b_auth` VALUES (1, 0, '超级管理员', '*', 1490883540, 149088354, 1);
INSERT INTO `b_auth` VALUES (2, 1, '测试', '1,100,569,101,102,103,104,570,571,105,106,107,108,109,121,111,112,113,122,572,124,125,127,545,110,546,547,548,2,208,126,209,218,219,220,221,222,261,262,263,264,265,3,233,234,236,558,559,560,235,238', 1584958766, 1590053403, 1);

-- ----------------------------
-- Table structure for b_category
-- ----------------------------
DROP TABLE IF EXISTS `b_category`;
CREATE TABLE `b_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '外链地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '数据状态',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类模型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_category
-- ----------------------------
INSERT INTO `b_category` VALUES (1, '男频', 0, 1, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1440469030, 1585648047, 1, 0);
INSERT INTO `b_category` VALUES (2, '女频', 0, 2, '', '', '', '', '', 1450770206, 1585648058, 1, 0);
INSERT INTO `b_category` VALUES (20, '异世大陆', 51, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1536657923, 1585563659, 1, 0);
INSERT INTO `b_category` VALUES (21, '修真文明', 52, 0, '', '', '', '/upload/category/20200330/883a4a739cfaa8145d2200e25d67c21e.jpg', '', 1536657995, 1585563792, 1, 0);
INSERT INTO `b_category` VALUES (22, '现代言情', 55, 0, '', '', '', '/upload/category/20200330/7590ec9842ea018e36f84c2a4d88e09c.jpg', '', 1536658034, 1585563811, 1, 0);
INSERT INTO `b_category` VALUES (23, '时空穿梭', 57, 0, '', '', '', '/upload/category/20200330/598fccbee3fa82e932e3ce68b0130d26.jpg', '', 1536658137, 1585563429, 1, 0);
INSERT INTO `b_category` VALUES (24, '高武世界', 51, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1536658146, 1585563667, 1, 0);
INSERT INTO `b_category` VALUES (25, '东方玄幻', 51, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1536658154, 1585563691, 1, 0);
INSERT INTO `b_category` VALUES (26, '武侠幻想', 52, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1548416346, 1585563652, 1, 0);
INSERT INTO `b_category` VALUES (27, '神话修真', 52, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1539845119, 1585563641, 1, 0);
INSERT INTO `b_category` VALUES (28, '电子竞技', 53, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1583893438, 1585563673, 1, 0);
INSERT INTO `b_category` VALUES (29, '虚拟网游', 53, 3, '', '', '', '/upload/category/20200330/5249e6247652ffedaf953e0630cb62b7.jpg', 'home/lists/lists', 1546912527, 1585563780, 1, 0);
INSERT INTO `b_category` VALUES (30, '游戏异界', 53, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1548402695, 1585563749, 1, 0);
INSERT INTO `b_category` VALUES (51, '玄幻小说', 1, 0, '', '', '', '', '', 1584696807, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (52, '修真小说', 1, 0, '', '', '', '/upload/category/20200320/a6adc944ec18aaaf2eac2fc0720f4524.jpg', '', 1584701206, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (53, '网游小说', 1, 0, '', '', '', '/upload/category/20200320/65055d7379087a703fba1fcc10fb1e2d.jpg', '', 1584701224, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (54, '科幻小说', 1, 0, '', '', '', '/upload/category/20200323/c843ccfea665549bae1c70f9bb366719.jpg', '', 1584930474, 1585712447, 1, 0);
INSERT INTO `b_category` VALUES (55, '言情小说', 2, 0, '', '', '', '/upload/category/20200323/45fba5a289f71696575e0fb62d5b112d.jpg', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (56, '都市小说', 2, 0, '', '', '', '/upload/category/20200323/45fba5a289f71696575e0fb62d5b112d.jpg', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (57, '穿越小说', 2, 0, '', '', '', '/upload/category/20200323/45fba5a289f71696575e0fb62d5b112d.jpg', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (58, '悬疑小说', 2, 0, '', '', '', '/upload/category/20200323/45fba5a289f71696575e0fb62d5b112d.jpg', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (60, '未来世界', 54, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563708, 1, 0);
INSERT INTO `b_category` VALUES (61, '超级科技', 54, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563715, 1, 0);
INSERT INTO `b_category` VALUES (62, '末世危机', 54, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1586421238, 1, 0);
INSERT INTO `b_category` VALUES (63, '古代言情', 55, 0, '', '', '', '/upload/category/20200330/e383bab2b52bd3b999fe3e05b7314e9d.jpg', '', 1584930526, 1585563828, 1, 0);
INSERT INTO `b_category` VALUES (65, '浪漫青春', 55, 0, '', '', '', '/upload/category/20200330/e383bab2b52bd3b999fe3e05b7314e9d.jpg', '', 1584930526, 1585563836, 1, 0);
INSERT INTO `b_category` VALUES (66, '爱情婚宴', 56, 0, '', '', '', '/upload/category/20200330/f10ff8caaabed58f646074499c921200.jpg', '', 1584930526, 1585563397, 1, 0);
INSERT INTO `b_category` VALUES (67, '都市异能', 56, 0, '', '', '', '/upload/category/20200330/907a3962fbb3b1c4d2ade4fb905fd614.jpg', '', 1584930526, 1585563386, 1, 0);
INSERT INTO `b_category` VALUES (68, '城市生活', 56, 0, '', '', '', '/upload/category/20200330/88f17a76408aef1ff9ff0e68291395d7.jpg', '', 1584930526, 1585563375, 1, 0);
INSERT INTO `b_category` VALUES (69, '异世重生', 57, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563418, 1, 0);
INSERT INTO `b_category` VALUES (70, '古代历史', 57, 0, '', '', '', '/upload/category/20200330/db6e3e028b28ec46adf0cc3542898435.jpg', '', 1584930526, 1585563407, 1, 0);
INSERT INTO `b_category` VALUES (71, '推理侦探', 58, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563626, 1, 0);
INSERT INTO `b_category` VALUES (72, '诡秘惊险', 58, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563622, 1, 0);
INSERT INTO `b_category` VALUES (73, '奇妙世界', 58, 0, '', '', '', '/upload/category/20200330/85819a1bcfd9796abc3972f2b9ca2866.jpg', '', 1584930526, 1585563618, 1, 0);
INSERT INTO `b_category` VALUES (74, '军事战争', 59, 0, '', '', '', '', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (75, '抗战烽火', 59, 0, '', '', '', '', '', 1584930526, 1584935672, 1, 0);
INSERT INTO `b_category` VALUES (76, '谍战特工', 59, 0, '', '', '', '', '', 1584930526, 1584935672, 1, 0);

-- ----------------------------
-- Table structure for b_channel
-- ----------------------------
DROP TABLE IF EXISTS `b_channel`;
CREATE TABLE `b_channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道名',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道编号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1正常 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '渠道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_1
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_1`;
CREATE TABLE `b_chapter_1`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_10
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_10`;
CREATE TABLE `b_chapter_10`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_11
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_11`;
CREATE TABLE `b_chapter_11`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_12
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_12`;
CREATE TABLE `b_chapter_12`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_13
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_13`;
CREATE TABLE `b_chapter_13`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_14
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_14`;
CREATE TABLE `b_chapter_14`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_15
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_15`;
CREATE TABLE `b_chapter_15`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_16
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_16`;
CREATE TABLE `b_chapter_16`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_17
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_17`;
CREATE TABLE `b_chapter_17`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_18
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_18`;
CREATE TABLE `b_chapter_18`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_19
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_19`;
CREATE TABLE `b_chapter_19`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_2
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_2`;
CREATE TABLE `b_chapter_2`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_20
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_20`;
CREATE TABLE `b_chapter_20`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_21
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_21`;
CREATE TABLE `b_chapter_21`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_22
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_22`;
CREATE TABLE `b_chapter_22`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_23
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_23`;
CREATE TABLE `b_chapter_23`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_24
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_24`;
CREATE TABLE `b_chapter_24`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_25
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_25`;
CREATE TABLE `b_chapter_25`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_26
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_26`;
CREATE TABLE `b_chapter_26`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_27
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_27`;
CREATE TABLE `b_chapter_27`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_28
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_28`;
CREATE TABLE `b_chapter_28`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_29
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_29`;
CREATE TABLE `b_chapter_29`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_3
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_3`;
CREATE TABLE `b_chapter_3`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_30
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_30`;
CREATE TABLE `b_chapter_30`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_31
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_31`;
CREATE TABLE `b_chapter_31`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_32
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_32`;
CREATE TABLE `b_chapter_32`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_33
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_33`;
CREATE TABLE `b_chapter_33`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_34
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_34`;
CREATE TABLE `b_chapter_34`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_35
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_35`;
CREATE TABLE `b_chapter_35`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_36
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_36`;
CREATE TABLE `b_chapter_36`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_37
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_37`;
CREATE TABLE `b_chapter_37`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_38
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_38`;
CREATE TABLE `b_chapter_38`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_39
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_39`;
CREATE TABLE `b_chapter_39`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_4
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_4`;
CREATE TABLE `b_chapter_4`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_40
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_40`;
CREATE TABLE `b_chapter_40`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_41
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_41`;
CREATE TABLE `b_chapter_41`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_42
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_42`;
CREATE TABLE `b_chapter_42`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_43
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_43`;
CREATE TABLE `b_chapter_43`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_44
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_44`;
CREATE TABLE `b_chapter_44`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_45
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_45`;
CREATE TABLE `b_chapter_45`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_46
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_46`;
CREATE TABLE `b_chapter_46`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_47
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_47`;
CREATE TABLE `b_chapter_47`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_48
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_48`;
CREATE TABLE `b_chapter_48`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_49
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_49`;
CREATE TABLE `b_chapter_49`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_5
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_5`;
CREATE TABLE `b_chapter_5`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_50
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_50`;
CREATE TABLE `b_chapter_50`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_51
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_51`;
CREATE TABLE `b_chapter_51`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_52
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_52`;
CREATE TABLE `b_chapter_52`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_53
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_53`;
CREATE TABLE `b_chapter_53`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_54
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_54`;
CREATE TABLE `b_chapter_54`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_55
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_55`;
CREATE TABLE `b_chapter_55`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_6
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_6`;
CREATE TABLE `b_chapter_6`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_7
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_7`;
CREATE TABLE `b_chapter_7`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_8
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_8`;
CREATE TABLE `b_chapter_8`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_chapter_9
-- ----------------------------
DROP TABLE IF EXISTS `b_chapter_9`;
CREATE TABLE `b_chapter_9`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节内容txt',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用 2待发布',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '作者的话',
  `word` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_config
-- ----------------------------
DROP TABLE IF EXISTS `b_config`;
CREATE TABLE `b_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置说明',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_config
-- ----------------------------
INSERT INTO `b_config` VALUES (1, 'meta_description', 2, 'SEO描述', 1, '', '网站搜索引擎描述', '小说榜', 6, 1);
INSERT INTO `b_config` VALUES (2, 'meta_keywords', 2, 'SEO关键字', 1, '', '网站搜索引擎关键字', '小说榜', 5, 1);
INSERT INTO `b_config` VALUES (3, 'icp', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '', 7, 1);
INSERT INTO `b_config` VALUES (4, 'url', 1, '网站地址', 1, '', '网站域名地址', '', 2, 1);
INSERT INTO `b_config` VALUES (5, 'meta_title', 1, '网站名称', 1, '', '网站名称', '小说榜', 1, 1);
INSERT INTO `b_config` VALUES (6, 'logo', 7, '网站logo', 1, '', '', '/static/logo.png', 3, 1);

-- ----------------------------
-- Table structure for b_domain
-- ----------------------------
DROP TABLE IF EXISTS `b_domain`;
CREATE TABLE `b_domain`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT '新请求地址',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认域名 1是 0否 ',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请求域名表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_feedback
-- ----------------------------
DROP TABLE IF EXISTS `b_feedback`;
CREATE TABLE `b_feedback`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `coment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT '反馈内容',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT '联系方式',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反馈时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否查看 1已查看 0未查看',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_link
-- ----------------------------
DROP TABLE IF EXISTS `b_link`;
CREATE TABLE `b_link`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '协议内容',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '协议类型 1免责 2隐私 3用户协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_menu
-- ----------------------------
DROP TABLE IF EXISTS `b_menu`;
CREATE TABLE `b_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏 1是 0否',
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '分组',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级 默认一级',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_menu
-- ----------------------------
INSERT INTO `b_menu` VALUES (1, '管理首页', 0, 1, 'admin/index/welcome', 0, '首页', 'layui-icon layui-icon-auz', 1, 0);
INSERT INTO `b_menu` VALUES (2, '数据管理', 0, 1, 'admin/data/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (3, '用户信息', 0, 3, 'admin/data/review', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (4, '统计管理', 0, 3, 'admin/count/userlist', 0, '', '', 1, 1586745813);
INSERT INTO `b_menu` VALUES (100, '设置', 1, 1, 'admin/config/index', 0, '设置', 'layui-icon layui-icon-set', 1, 0);
INSERT INTO `b_menu` VALUES (101, '管理员', 1, 2, 'admin/admin/index', 0, '管理员', 'layui-icon layui-icon-username', 1, 0);
INSERT INTO `b_menu` VALUES (102, '列表', 101, 0, 'admin/admin/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (103, '添加', 101, 2, 'admin/admin/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (104, '修改', 101, 3, 'admin/admin/password', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (105, '权限管理', 1, 3, 'admin/auth/index', 0, '权限', 'layui-icon layui-icon-auz', 1, 0);
INSERT INTO `b_menu` VALUES (106, '用户组列表', 105, 1, 'admin/auth/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (107, '新增用户组', 105, 2, 'admin/auth/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (108, '修改用户组', 105, 3, 'admin/auth/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (109, '状态', 105, 4, 'admin/auth/status', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (110, '状态', 545, 5, 'admin/words/status', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (111, '菜单管理', 1, 4, 'admin/menu/index', 0, '菜单', 'layui-icon layui-icon-senior', 1, 0);
INSERT INTO `b_menu` VALUES (112, '列表', 111, 0, 'admin/menu/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (113, '修改', 111, 2, 'admin/menu/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (121, '用户组删除', 105, 6, 'admin/auth/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (122, '删除', 111, 4, 'admin/menu/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (123, '状态', 208, 5, 'admin/novel/status', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (124, '协议管理', 1, 7, 'admin/link/index', 0, '协议', 'layui-icon layui-icon-link', 1, 0);
INSERT INTO `b_menu` VALUES (125, '列表', 124, 1, 'admin/link/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (126, '章节列表', 208, 5, 'admin/chapter/index', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (127, '修改', 124, 3, 'admin/link/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (128, '章节新增', 208, 6, 'admin/chapter/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (201, '分类管理', 2, 1, 'admin/category/index', 0, '分类', 'layui-icon layui-icon-more', 1, 0);
INSERT INTO `b_menu` VALUES (202, '列表', 201, 1, 'admin/category/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (203, '添加', 201, 2, 'admin/category/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (204, '修改', 201, 3, 'admin/category/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (205, '删除', 201, 4, 'admin/category/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (206, '状态', 201, 5, 'admin/category/status', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (207, '章节删除', 208, 7, 'admin/chapter/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (208, '小说管理', 2, 2, 'admin/novel/index', 0, '小说', 'layui-icon layui-icon-read', 1, 0);
INSERT INTO `b_menu` VALUES (209, '列表', 208, 1, 'admin/novel/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (210, '添加', 208, 2, 'admin/novel/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (211, '修改', 208, 3, 'admin/novel/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (212, '删除', 208, 4, 'admin/novel/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (218, '幻灯', 2, 3, 'admin/slider/index', 0, '幻灯', 'layui-icon layui-icon-carousel', 1, 0);
INSERT INTO `b_menu` VALUES (219, '列表', 218, 1, 'admin/slider/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (220, '添加', 218, 2, 'admin/slider/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (221, '修改', 218, 3, 'admin/slider/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (222, '删除', 218, 4, 'admin/slider/del', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (233, '用户管理', 3, 1, 'admin/user/index', 0, '用户', 'layui-icon layui-icon-user', 1, 0);
INSERT INTO `b_menu` VALUES (234, '列表', 233, 1, 'admin/user/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (235, '渠道新增', 568, 2, 'admin/channel/add', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (236, '查看', 233, 2, 'admin/user/edit', 1, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (238, '渠道列表', 568, 1, 'admin/channel/index', 0, '', '', 1, 0);
INSERT INTO `b_menu` VALUES (261, '广告管理', 2, 4, 'admin/adm/index', 0, '广告', 'layui-icon layui-icon-template', 1, 0);
INSERT INTO `b_menu` VALUES (262, '列表', 261, 1, 'admin/adm/index', 0, '', NULL, 1, 0);
INSERT INTO `b_menu` VALUES (263, '添加', 261, 2, 'admin/adm/add', 1, '', NULL, 1, 0);
INSERT INTO `b_menu` VALUES (264, '修改', 261, 3, 'admin/adm/edit', 1, '', NULL, 1, 0);
INSERT INTO `b_menu` VALUES (265, '删除', 261, 4, 'admin/adm/del', 1, '', NULL, 1, 0);
INSERT INTO `b_menu` VALUES (545, '字体管理', 1, 1, 'admin/words/index', 0, '字体', 'layui-icon layui-icon-template', 1, 1584611017);
INSERT INTO `b_menu` VALUES (546, '列表', 545, 0, 'admin/words/index', 0, '', NULL, 1, 1584694729);
INSERT INTO `b_menu` VALUES (547, '修改', 545, 0, 'admin/words/edit', 1, '', NULL, 1, 1584694756);
INSERT INTO `b_menu` VALUES (548, '删除', 545, 0, 'admin/words/add', 1, '', NULL, 1, 1584694778);
INSERT INTO `b_menu` VALUES (556, '域名列表', 557, 1, 'admin/domain/index', 0, '域名', 'layui-icon layui-icon-more', 1, 1585900279);
INSERT INTO `b_menu` VALUES (557, '请求域名', 2, 5, 'admin/domain/index', 0, '', NULL, 1, 1585902485);
INSERT INTO `b_menu` VALUES (558, '反馈管理', 3, 2, 'admin/feedback/index', 0, '反馈', 'layui-icon layui-icon-more', 1, 1586315656);
INSERT INTO `b_menu` VALUES (559, '反馈列表', 558, 1, 'admin/feedback/index', 0, '', NULL, 1, 1586315688);
INSERT INTO `b_menu` VALUES (560, '反馈详情', 558, 2, 'admin/feedback/edit', 1, '', NULL, 1, 1586328970);
INSERT INTO `b_menu` VALUES (562, '会员新增统计', 4, 0, 'admin/count/userlist', 0, '会员新增统计', 'layui-icon layui-icon-senior', 1, 1586765578);
INSERT INTO `b_menu` VALUES (563, 'APP启动统计', 4, 0, 'admin/count/count_num', 0, 'APP启动统计', 'layui-icon layui-icon-template', 1, 1586766219);
INSERT INTO `b_menu` VALUES (564, '广告统计', 4, 0, 'admin/count/admlist', 0, ' 广告统计', 'layui-icon layui-icon-carousel', 1, 1586831513);
INSERT INTO `b_menu` VALUES (565, '会员活跃统计', 4, 0, 'admin/count/user_lou', 0, '会员活跃统计', 'layui-icon layui-icon-read', 1, 1586832877);
INSERT INTO `b_menu` VALUES (566, '用户留存率统计', 4, 0, 'admin/count/user_count', 0, '会员留存率', 'layui-icon layui-icon-senior', 1, 1586833672);
INSERT INTO `b_menu` VALUES (567, '启动广告', 2, 6, 'admin/qadm/index', 0, '启动广告', 'layui-icon layui-icon-carousel', 1, 1586933940);
INSERT INTO `b_menu` VALUES (568, '渠道管理', 4, 0, 'admin/channel/index', 0, '渠道管理', 'layui-icon layui-icon-user', 1, 1587020775);
INSERT INTO `b_menu` VALUES (569, '修改', 100, 0, 'admin/config/save', 1, '', NULL, 1, 1589970158);
INSERT INTO `b_menu` VALUES (570, '删除', 101, 1, 'admin/admin/del', 1, '', NULL, 1, 1589970207);
INSERT INTO `b_menu` VALUES (571, '状态', 101, 1, 'admin/admin/status', 1, '', NULL, 1, 1589970233);
INSERT INTO `b_menu` VALUES (572, '新增', 111, 0, 'admin/menu/add', 1, '', NULL, 1, 1589970387);
INSERT INTO `b_menu` VALUES (573, '章节状态', 208, 8, 'admin/chapter/status', 1, '', NULL, 1, 1590028807);
INSERT INTO `b_menu` VALUES (574, '状态', 218, 5, 'admin/slider/status', 1, '', NULL, 1, 1590029145);
INSERT INTO `b_menu` VALUES (575, '状态', 261, 5, 'admin/adm/status', 1, '', NULL, 1, 1590029219);
INSERT INTO `b_menu` VALUES (576, '新增', 557, 2, 'admin/domain/add', 1, '', NULL, 1, 1590029838);
INSERT INTO `b_menu` VALUES (577, '修改', 557, 3, 'admin/domain/edit', 1, '', NULL, 1, 1590029857);
INSERT INTO `b_menu` VALUES (578, '状态', 557, 5, 'admin/domain/status', 1, '', NULL, 1, 1590029893);
INSERT INTO `b_menu` VALUES (579, '广告列表', 567, 1, 'admin/qadm/index', 0, '', NULL, 1, 1590030178);
INSERT INTO `b_menu` VALUES (580, '新增', 567, 2, 'admin/qadm/add', 1, '', NULL, 1, 1590030194);
INSERT INTO `b_menu` VALUES (581, '修改', 567, 2, 'admin/qadm/edit', 1, '', NULL, 1, 1590030213);
INSERT INTO `b_menu` VALUES (582, '删除', 567, 4, 'admin/qadm/del', 1, '', NULL, 1, 1590030237);
INSERT INTO `b_menu` VALUES (583, '状态', 567, 5, 'admin/qadm/status', 1, '', NULL, 1, 1590030255);
INSERT INTO `b_menu` VALUES (584, '渠道修改', 568, 3, 'admin/channel/edit', 1, '', NULL, 1, 1590030993);
INSERT INTO `b_menu` VALUES (585, '渠道删除', 568, 4, 'admin/channel/del', 1, '', NULL, 1, 1590031018);
INSERT INTO `b_menu` VALUES (586, '状态', 568, 5, 'admin/channel/status', 1, '', NULL, 1, 1590031040);

-- ----------------------------
-- Table structure for b_novel
-- ----------------------------
DROP TABLE IF EXISTS `b_novel`;
CREATE TABLE `b_novel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属分类',
  `title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `author` char(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `up` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '顶',
  `down` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '踩',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `rating` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '9.8' COMMENT '评分',
  `serialize` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '连载',
  `favorites` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `hits_day` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '日浏览',
  `hits_week` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '周浏览',
  `hits_month` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '月浏览',
  `hits_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览时间',
  `word` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  `position` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐票',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否新书 0否 1是',
  `reurl` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节信息文件地址',
  `new_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最新章节数',
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新章节名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说书籍表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_qadm
-- ----------------------------
DROP TABLE IF EXISTS `b_qadm`;
CREATE TABLE `b_qadm`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1正常 0禁用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间',
  `sort` int(10) NOT NULL COMMENT '排序',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 3 COMMENT '广告时间（秒）',
  `types` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 图片 2视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_slider
-- ----------------------------
DROP TABLE IF EXISTS `b_slider`;
CREATE TABLE `b_slider`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告标题',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '类型 1精选 2男 3女 4完本',
  `picpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '广告地址',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `novel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '小说ID',
  `types` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1图片 2视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幻灯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_sms
-- ----------------------------
DROP TABLE IF EXISTS `b_sms`;
CREATE TABLE `b_sms`  (
  `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source
-- ----------------------------
DROP TABLE IF EXISTS `b_source`;
CREATE TABLE `b_source`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `reurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT '网站名',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT '网站链接',
  `chapter_sum` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最新章节数',
  `element` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '元素',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '最新章节名',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1 正常 0禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `novel_id`(`novel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_1
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_1`;
CREATE TABLE `b_source_list_1`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_10
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_10`;
CREATE TABLE `b_source_list_10`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_11
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_11`;
CREATE TABLE `b_source_list_11`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_12
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_12`;
CREATE TABLE `b_source_list_12`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_13
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_13`;
CREATE TABLE `b_source_list_13`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_14
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_14`;
CREATE TABLE `b_source_list_14`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_15
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_15`;
CREATE TABLE `b_source_list_15`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_16
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_16`;
CREATE TABLE `b_source_list_16`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_17
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_17`;
CREATE TABLE `b_source_list_17`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_18
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_18`;
CREATE TABLE `b_source_list_18`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_19
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_19`;
CREATE TABLE `b_source_list_19`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_2
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_2`;
CREATE TABLE `b_source_list_2`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_20
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_20`;
CREATE TABLE `b_source_list_20`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_21
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_21`;
CREATE TABLE `b_source_list_21`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_22
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_22`;
CREATE TABLE `b_source_list_22`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_23
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_23`;
CREATE TABLE `b_source_list_23`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_24
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_24`;
CREATE TABLE `b_source_list_24`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_25
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_25`;
CREATE TABLE `b_source_list_25`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_26
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_26`;
CREATE TABLE `b_source_list_26`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_27
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_27`;
CREATE TABLE `b_source_list_27`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_28
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_28`;
CREATE TABLE `b_source_list_28`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_29
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_29`;
CREATE TABLE `b_source_list_29`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_3
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_3`;
CREATE TABLE `b_source_list_3`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_30
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_30`;
CREATE TABLE `b_source_list_30`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_31
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_31`;
CREATE TABLE `b_source_list_31`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_32
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_32`;
CREATE TABLE `b_source_list_32`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_33
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_33`;
CREATE TABLE `b_source_list_33`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_34
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_34`;
CREATE TABLE `b_source_list_34`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_35
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_35`;
CREATE TABLE `b_source_list_35`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_36
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_36`;
CREATE TABLE `b_source_list_36`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_37
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_37`;
CREATE TABLE `b_source_list_37`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_38
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_38`;
CREATE TABLE `b_source_list_38`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_39
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_39`;
CREATE TABLE `b_source_list_39`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_4
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_4`;
CREATE TABLE `b_source_list_4`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_40
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_40`;
CREATE TABLE `b_source_list_40`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_41
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_41`;
CREATE TABLE `b_source_list_41`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_42
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_42`;
CREATE TABLE `b_source_list_42`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_43
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_43`;
CREATE TABLE `b_source_list_43`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_44
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_44`;
CREATE TABLE `b_source_list_44`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_45
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_45`;
CREATE TABLE `b_source_list_45`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_46
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_46`;
CREATE TABLE `b_source_list_46`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_47
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_47`;
CREATE TABLE `b_source_list_47`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_48
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_48`;
CREATE TABLE `b_source_list_48`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_49
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_49`;
CREATE TABLE `b_source_list_49`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_5
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_5`;
CREATE TABLE `b_source_list_5`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_50
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_50`;
CREATE TABLE `b_source_list_50`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_51
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_51`;
CREATE TABLE `b_source_list_51`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_52
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_52`;
CREATE TABLE `b_source_list_52`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_53
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_53`;
CREATE TABLE `b_source_list_53`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_54
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_54`;
CREATE TABLE `b_source_list_54`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_55
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_55`;
CREATE TABLE `b_source_list_55`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_56
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_56`;
CREATE TABLE `b_source_list_56`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_57
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_57`;
CREATE TABLE `b_source_list_57`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_58
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_58`;
CREATE TABLE `b_source_list_58`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_59
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_59`;
CREATE TABLE `b_source_list_59`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_6
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_6`;
CREATE TABLE `b_source_list_6`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_60
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_60`;
CREATE TABLE `b_source_list_60`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_61
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_61`;
CREATE TABLE `b_source_list_61`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_62
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_62`;
CREATE TABLE `b_source_list_62`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_63
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_63`;
CREATE TABLE `b_source_list_63`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_64
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_64`;
CREATE TABLE `b_source_list_64`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_65
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_65`;
CREATE TABLE `b_source_list_65`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_66
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_66`;
CREATE TABLE `b_source_list_66`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_67
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_67`;
CREATE TABLE `b_source_list_67`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_68
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_68`;
CREATE TABLE `b_source_list_68`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_69
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_69`;
CREATE TABLE `b_source_list_69`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_7
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_7`;
CREATE TABLE `b_source_list_7`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_70
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_70`;
CREATE TABLE `b_source_list_70`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_71
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_71`;
CREATE TABLE `b_source_list_71`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_72
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_72`;
CREATE TABLE `b_source_list_72`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_73
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_73`;
CREATE TABLE `b_source_list_73`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_74
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_74`;
CREATE TABLE `b_source_list_74`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_75
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_75`;
CREATE TABLE `b_source_list_75`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_76
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_76`;
CREATE TABLE `b_source_list_76`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_77
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_77`;
CREATE TABLE `b_source_list_77`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_78
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_78`;
CREATE TABLE `b_source_list_78`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_79
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_79`;
CREATE TABLE `b_source_list_79`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_8
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_8`;
CREATE TABLE `b_source_list_8`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_80
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_80`;
CREATE TABLE `b_source_list_80`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_81
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_81`;
CREATE TABLE `b_source_list_81`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_82
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_82`;
CREATE TABLE `b_source_list_82`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_83
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_83`;
CREATE TABLE `b_source_list_83`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_84
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_84`;
CREATE TABLE `b_source_list_84`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_85
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_85`;
CREATE TABLE `b_source_list_85`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_86
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_86`;
CREATE TABLE `b_source_list_86`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_87
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_87`;
CREATE TABLE `b_source_list_87`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_88
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_88`;
CREATE TABLE `b_source_list_88`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_89
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_89`;
CREATE TABLE `b_source_list_89`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_9
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_9`;
CREATE TABLE `b_source_list_9`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_90
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_90`;
CREATE TABLE `b_source_list_90`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_91
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_91`;
CREATE TABLE `b_source_list_91`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_92
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_92`;
CREATE TABLE `b_source_list_92`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_93
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_93`;
CREATE TABLE `b_source_list_93`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_94
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_94`;
CREATE TABLE `b_source_list_94`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_95
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_95`;
CREATE TABLE `b_source_list_95`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_96
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_96`;
CREATE TABLE `b_source_list_96`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_97
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_97`;
CREATE TABLE `b_source_list_97`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_98
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_98`;
CREATE TABLE `b_source_list_98`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_source_list_99
-- ----------------------------
DROP TABLE IF EXISTS `b_source_list_99`;
CREATE TABLE `b_source_list_99`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数',
  `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名',
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节链接',
  `source_id` int(10) UNSIGNED NOT NULL COMMENT '换源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `chapter_num`(`chapter_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换源章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_startup
-- ----------------------------
DROP TABLE IF EXISTS `b_startup`;
CREATE TABLE `b_startup`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '时间日期',
  `num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '启动次数',
  `tims` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '启动次数统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道ID',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别 1男 2女 0保密',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '格言',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1正常 0禁用',
  `num` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已修改 1已改',
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_book
-- ----------------------------
DROP TABLE IF EXISTS `b_user_book`;
CREATE TABLE `b_user_book`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `novel_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '小说ID',
  `chapter_id` int(10) NOT NULL DEFAULT 0 COMMENT '已读章节数',
  `chapter_key` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户书架' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for b_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `b_user_collect`;
CREATE TABLE `b_user_collect`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `novel_id` int(10) UNSIGNED NOT NULL COMMENT '小说ID',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户小说收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_count
-- ----------------------------
DROP TABLE IF EXISTS `b_user_count`;
CREATE TABLE `b_user_count`  (
  `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活跃时间',
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '渠道ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户活跃表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_look_book
-- ----------------------------
DROP TABLE IF EXISTS `b_user_look_book`;
CREATE TABLE `b_user_look_book`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `novel_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '小说ID',
  `chapter_id` int(10) NOT NULL DEFAULT 0 COMMENT '已读章节数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_token
-- ----------------------------
DROP TABLE IF EXISTS `b_user_token`;
CREATE TABLE `b_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expire_time` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_words
-- ----------------------------
DROP TABLE IF EXISTS `b_words`;
CREATE TABLE `b_words`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件链接',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字体表\r\n' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

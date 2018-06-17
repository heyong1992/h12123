/*
 Navicat MySQL Data Transfer

 Source Server         : hey
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : hey

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 06/18/2018 02:55:46 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `api_token`
-- ----------------------------
DROP TABLE IF EXISTS `api_token`;
CREATE TABLE `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '属于哪个用户',
  `valid_time` int(11) DEFAULT NULL COMMENT '有效时间(分钟)',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '登录时ip',
  `device_num` varchar(128) DEFAULT NULL COMMENT '设备号',
  `token` varchar(64) DEFAULT NULL COMMENT 'token',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='token表';

-- ----------------------------
--  Table structure for `hey_content`
-- ----------------------------
DROP TABLE IF EXISTS `hey_content`;
CREATE TABLE `hey_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `dict_id` int(11) NOT NULL COMMENT '类型id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) DEFAULT NULL COMMENT '发布人',
  `content` text,
  `tag` varchar(256) DEFAULT NULL COMMENT '文章标签',
  PRIMARY KEY (`id`),
  KEY `fk_hey_content` (`dict_id`),
  CONSTRAINT `fk_hey_content` FOREIGN KEY (`dict_id`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `hey_content`
-- ----------------------------
BEGIN;
INSERT INTO `hey_content` VALUES ('2', '娃娃地劫攻略', '1', '2017-11-22 00:00:00', '12', '<h1 class=\"cor00 tac pb10 pb_5 xuxian fz18 ffh\" style=\"white-space: normal; margin: 0px; font-size: 18px; padding: 0px 0px 10px; text-align: center; font-family: 微软雅黑, 黑体; color: rgb(157, 25, 25); border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(158, 155, 132);\"><span style=\"color: rgb(229, 224, 236);\"><span style=\"color: rgb(178, 162, 199);\"><strong>问道娃娃地劫任务全解</strong></span></span></h1><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">第一劫：大闹天宫 (需要打3次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴≥82 以元婴(血婴)状态找到门派师祖，通过交谈领取该任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：进入龙宫大殿触发与龙宫守卫战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物为10只龙宫守卫相对来说攻击力还是相当的弱的。龙宫守卫必须一回合全部解决，因为如果龙宫守卫有任何剩余那么下回合自动补充1只满血守卫，注意螃蟹怪会反震。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：必须带火眼金睛，队伍人员配合起来把所有的龙宫守卫都秒剩少量的血，最后全部用5法砸龙宫守卫。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战:与龙王对话发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：龙王带领9位龙女侍女参战。龙王抗异常非常高而且速度很慢，5300道金F不上 4600道的火偶尔睡上但下回合自动解。龙王会拉死亡小怪，注意金头陀怪会反震。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：睡手把小怪睡上，先打死龙王，省的他来回拉小怪。打死龙王剩下的小怪很轻松搞定了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战:找本门师尊后对话，挑战自己。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　娃娃自己去点就行，怪不会攻击，几个回合后自动出对话框，选择第二项结束战斗。如选第一项则继续战斗继续等几回合后又会出现同样的对话，然后回复龙王，得经验262.6W，钱137.2W。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第二劫：妖王封印 (需要打3次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴≥87 以元婴/血婴状态找到天墉城的清风道人，通过交谈领取该任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：与幽冥涧的地狱牛头对话发生战斗</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物法伤还算不错其他没什么特点。5300道金封怪都容易漏1--2个。注意年轻道人占一个位置。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防7减少伤害。不建议睡杀，年轻道人会秒4打醒怪物。而且建议进入战斗的时候看看幽魂多还是小鬼多，如果幽魂多就杀，如果幽魂少就让娃娃跑重杀。因为幽魂血少很好杀，幽魂血比小鬼少1半。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：任务给一个蓬莱岛坐标，找到坐标消灭妖王(注意时间限制1小时)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪不易被F。小怪会给主怪拉血。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：打手全部5法秒，最后睡手睡就行。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：去幽冥涧找地狱牛头引诱妖王现身发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务注意：此战斗和第二场一样。但引诱妖王需要收集20个怨鬼舌、20个龟壳和20个粉花瓣交给地狱牛头。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第三劫：祸出东海 (需要打7次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴≥92 以元婴(血婴)状态与东海渔村老板对话接到第三劫任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1--5战：分别要去五龙山寻找金之芒、终南山寻找木之缘、乾元山寻找火之灵、骷髅山寻找土之根、凤凰山寻找水之晶。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　当到达各个山头的时候在山上来回走动就会触发任务，吃香不触发任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物伤害逐渐增加，但他开始的时候秒的非常非常少导致很多回合后才会有高伤害出现。怪物血一般在40W+，3500以上道忽视50+的火睡5很稳。建议：打手们使劲5法秒，最后由睡手睡。要快点杀完别太磨蹭虽然怪物的伤害底数少，但是抗性也逐渐增加。第一回合怪打人1-10血，3个回合后怪打人就1000+血了，所以要快点杀。第6战:去东海渔村东南方向(228，188)找到镇海明珠。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪火属性带9只小怪。主和小都是物理和法术都会的。伤害一般打一下1W血。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第7战:去找东海渔村的药店老板询问情况(途中由大号带队否则元婴/血婴带队会遇到小鱼精，杀多浪费</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　时间还得逃跑)在药店老板那得知东海渔村有鱼怪。出了药店元婴/血婴带队在东海渔村乱跑就行。遇到</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　小鱼精就跑 遇到大的才杀。注意：跑的时候元婴/血婴跑就行 他跑了就全跑了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：没啥特点就是加强版CY似的。。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第四劫：师徒情深(需打9次最少)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥97级时 以元婴/血婴的状态去找揽仙镇药店王老板处接到任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1--3战：去揽仙镇(243，188)、(351，121)、(25，130)杀死灵妖。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物数量为队伍数量*2 怪物法伤很强经常使用5F。秒1下1W多血。他们死了后能被拉起来。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防7 ，其他人秒 ，最好把小怪全部障碍上 否则会拉死的怪。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第4战：去绝人阵(52,28)除掉灵妖王。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪高速(2000+的速度)且不易F，F了也是1--2回合解。而且主怪未死的话在某一回合一下子把倒地的所有小怪全部拉起来而且血几乎拉满。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：一定要先把主怪杀了，他一下子就能把倒地的所有小怪拉起来而且血拉的几乎就是满的很变态的，杀了主怪后小怪就很容易搞定。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第5战:收复20个灵妖(最少需要5场战斗)：去揽仙镇药店王老板对话(途中要大号带队，元婴/血婴带队会遇到不必要杀的小怪)。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　收复灵妖的方法：去无名小镇杂货店购买20个妖劫咒。在揽仙镇走动会遇到灵妖(怪物数量=队伍人数)。以5个人的队伍为例遇到5个灵妖，</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　进入战斗建议先冰上1个灵妖完了把剩余的灵妖用5法秒死。那么会剩下1个活着的灵妖和4个倒在地上的死亡的灵妖(千万不要全弄死，要不没时间收了)。这时元婴/血婴点击妖劫咒使用妖劫咒点击死亡灵妖的尸体进行收妖。收完了还剩下一只灵妖了就这只灵妖不可以收(因为打死他就结束战斗了没时间收)所以最好让元婴 /血婴逃跑其他大号不动就行(你要是有时间可以杀了那只剩下的灵妖)，元婴/血婴逃跑出去大号自然出去了，那么会收了4个灵妖。反复做5次即可。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第五劫：道义无私(需要打3次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥102级时 以元婴/血婴的状态去东海渔村客栈老板接任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：打败东海渔村(134,53)的青牛精。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪抗异常较高4800道的火很难睡上，且带有反震50%(你物理攻击他2W你也掉1W血)主怪还会混乱带有小怪爱使用5F打人，且主怪能自己给自己拉血。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：先5F杀小怪，最后才杀主怪，剩主怪自己的时候一定要抓紧秒他，他老自己给自己拉血的(像驯鹿的狗头军师)。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：去绝人阵(11,125)打石牛妖王。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　元婴/血婴自己去送死就完成，不用带BB,元婴/血婴死了不掉东西，原地让人救了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：向绝人阵的恶灵鬼王讨回东海渔村的孩童。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪会使用遗忘且带有50%反震，小怪带有天书。小怪死了尸体不消失，其他小怪可以拉死了的小怪。但是不拉主怪，主怪死了尸体消失。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：先把小怪F了，其他人先杀主怪，主怪死了不复活，后杀小怪用，障碍不稳的话，容易小怪来回的拉，带高秒打手去。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第六劫：上仁无为 (需要打3次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴≥107 以元婴/血婴状态 找到炎神领到任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：去东昆仑(118,122)降伏袒护桃灵仙子的妖魔。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：一共3只怪且血量非常少，唯一特点就是不容易封，要强杀，如果先杀最左面的怪物，其他剩余的2只会发狂变厉害且血量也增加到80W。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：先杀中间的和右面的怪，最后才杀左面的，省得怪物发狂和血量增加(变为暴怒的状态)。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：去东昆仑(60,215)附近寻找桃灵仙子发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物只有5只，打人1下1W血左右，不能F，强杀的。怪物死了尸体不消失会被其他的同伴拉起来。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：一直用5法强杀吧。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：与炎神发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪物会给自己拉圈和罩而且很难F，主怪会使用游说之舌，会把你的BB吹下去。而且当天兵被杀的少了的时候主怪会召唤一名新的天兵出战。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　队伍配置要求：要有名水拉防 带几个如意BB和多点血BB 以免被主怪游说跑了都。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：多带几只BB去，以免被主怪游说BB不出来。可以选择一直5F一直秒的方法或者先杀主怪的方法。如果是一般队伍建议一直5F秒因为天兵的血少一会就被秒死了主怪少天兵就会召唤但他每回合只招1名天兵这样他就少出手一次以免他用游说BB而且天兵也少了呀打我们的怪就少了。如果是厉害的队伍可以选择集中先杀主的，顶着小怪的。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第七劫：轻偌寡信 (需要打3次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥112级时 以元婴/血婴的状态去念心道人。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：去东昆仑山顶(205，33)寻找万年雪草时触发战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：左面的抗物理是物理怪，右面抗法是法怪。且左面的会使神龙罩 右面的会使如意圈。 死亡死尸不消失，能被同伴拉起来。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：把2只怪都秒没血再一起杀掉省的他们拉。有带神圣之光或漫天血舞BB就更好了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：与风月谷的云游大仙发生战斗</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：辨别真假。杀死真身就完事。不容易障碍需要强杀，带上火眼吧。杀完了真身后会立即进去第2场战斗，第2场战斗中怪物先出手把队伍中成员障碍住接着一下怪秒死队长，就算完成了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：再次与云游大仙对话发生战斗，此次战斗为杀自己的影子，对面的队伍和自己的队伍一样的配置。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：杀法1：全队成员把垃圾宝宝点参战，好宝宝点掠阵。最先参战BB野生的最好哈。让对面的影子也带垃圾BB，让我们BB死了后可以掠阵，杀他们就小菜了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　杀法2：元婴/血婴自己出马，也是垃圾BB打头阵 好BB掠阵的方法。你元婴/血婴啥装备都没有就别去送死了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第八劫：慈以至勇(需要打5次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥117级时 以元婴/血婴的状态去找本门师祖接到任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：与本门童子讨教。怪物特点：不能F童子而且童子会使用本门障碍技能。童子攻击不算太高不拉防打1下1W血，拉了防打的更少。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防，有如意BB就上圈，就轻松杀。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：在幽冥涧打枭魉魔尊的手下。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：极难障碍，主怪高速至少4000以上或者更高。主怪善使用5F，小怪善使用秒5和大秒。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：如果穿着改5套的话，拉完防7后一般小怪就没什么伤害了。秒5打人一下才几滴血也就是大秒能打的动我们。如果觉得扛得住就直接5F。如果扛不住的话先杀主，主速度高攻击力高。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：打枭魉魔尊(坚持几回合就完成)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：就1只枭魉魔尊，会混乱，血超级多1500W，不需要打，坚持几回合后出现对话框(出对话框后选择第二项直接结束)。如果选第一项,则继续,直至把玩家全部打死,这里死亡不会掉东东,原地复活。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防御，就顶着他的攻击几回合就可以了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第4战：去找本门师尊指点</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：10个怪，开火眼金睛辨别真假就是了，怪不可F。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第5战：杀枭魉魔尊</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：主怪高物理攻击，会召唤小怪最多召唤2名(1回合召1名小怪)。右面的小怪喜欢给主怪拉死亡缠绵，左面的喜欢拉心。拉上死亡缠绵的主非常狠，很容易1下打死1个BB。话就要多带几只哦。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：有水的话拉个防御，有土的话拉躲避，一直大秒主怪就行，主怪死任务就完成。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第九劫：以哀泣亡(需要打4次和杀100个雪狐)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥122级时 以元婴/血婴的状态去找雪域冰原的无底洞一探。无底洞在雪地的右上角(268，22)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：点无底洞触发战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：大小怪都不能封，主怪会使用神龙罩而且主怪死了尸体不消失，有可能被小怪拉起来。怪物都爱使用秒5和大秒。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防御，用5法秒。最好。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　接下来需要杀100个雪狐。建议算个雪狐南荒巫术 去杀这样速度快。(千万千万不要吃铃铛呀 吃了1小时不遇任务了 )</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：杀雪域灵狐(在雪地杀雪狐引雪域灵狐出现并杀了它，得有耐心啊 遇到雪域灵狐真慢)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：还是辨别真假 有一个是真的杀了即可完成任务，怪物不可封。唯一不同的是秒这些雪域灵</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　狐的时候都掉血而真的雪域狐狸不会回血，其他的会回血。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：用5法乱秒一会看看哪个血少的最多就应该是假的了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：打天兵 在点无底洞时触发任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：天兵不能封，死亡尸体不消失，能被同伙拉起来。伤害一般大秒一下1.5W左右</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉防，其他人直接5法秒，一起秒死他们就不被拉了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第4战：点无底洞再次发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：大小怪都不能F，小怪死了下回合就自动替补上新的小怪而且会连击会使用乾坤反转。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　强杀就行。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第十劫：静筑虚极 (需要打4次)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　任务领取：当元婴/血婴等级≥127级时 以元婴/血婴的状态去无了尘接任务。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第1战：与无了尘对话并发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：刷5只剑 不可F 中间主怪是金系旁边的2个是火系 最外面的2个是水系</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉个防7 ，都用5F秒怪。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　杀完第1战后替人辞别好友，在辞别好友的过程用需要帮王老板找40个百灵丹和40个九圣散，接着要帮张老板杀100个剑魂(推荐使用剑魂南荒巫术)还得给钱老板500W金钱。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第2战：找到卧龙坡的玄武发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：封不了，要强杀的。和第1战类似，不同的是小怪死了，尸体不消失会被拉起来 主怪死了尸体会消失的。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：不用F，拉个防御 直接5F秒就好了。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第3战：与东昆仑的无了尘对话发生战斗。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：怪速度1800左右，不能封，死了不消失会被拉起来，起来就有20W血 法伤高打的真狠。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：拉防立圈强杀。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　第4战：保护玄武(点玄武发生战斗)</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　怪物特点：5只木属性的怪不易封，主怪会使用毒。怪速度1800左右，高秒善使用5F打一下很疼。</p><p style=\"white-space: normal; margin-top: 10px; margin-bottom: 10px; padding: 0px; caret-color: rgb(106, 102, 77); color: rgb(106, 102, 77); font-family: 宋体; font-size: 14px;\">　　建议：水拉防，多带如意BB。一个一个杀吧，如果用5F还得拉兰，怪伤害很高，速度快的几乎没回合必倒。</p><p><br/></p>', ''), ('3', '12', '1', '2017-11-30 00:00:00', '21', null, null), ('4', '12', '1', '2017-11-30 00:00:00', '12', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `hey_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `hey_ticket`;
CREATE TABLE `hey_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_infos` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `end_address` varchar(255) DEFAULT NULL COMMENT '目的地',
  `go_date` varchar(255) DEFAULT NULL COMMENT '出发时间',
  `qq_number` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `start_address` varchar(255) DEFAULT NULL COMMENT '出发地',
  `tel_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `hey_ticket`
-- ----------------------------
BEGIN;
INSERT INTO `hey_ticket` VALUES ('1', '21', '21', '21', '121', '21', '212', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type_num` varchar(128) DEFAULT NULL COMMENT '类型编号',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', '新闻', 'actType', '2017-11-16 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `available` bit(1) DEFAULT NULL COMMENT '是否激活',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `parent_id` int(20) DEFAULT NULL COMMENT '父id',
  `parent_ids` varchar(255) DEFAULT NULL COMMENT '父id路径',
  `permission` varchar(255) DEFAULT NULL,
  `resource_type` enum('menu','button') DEFAULT NULL COMMENT '权限类型',
  `url` varchar(255) DEFAULT NULL COMMENT '访问路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('1', null, b'1', '系统管理', '0', '0/', '', 'menu', ''), ('2', null, b'1', '菜单管理', '1', '0/1', '', 'menu', 'sysPermission/list'), ('6', null, b'1', '角色管理', '1', null, null, 'menu', 'sysRole/list'), ('15', null, b'1', '用户管理', '1', '', 'userInfo:view', 'menu', 'userInfo/list'), ('21', null, b'0', '日志管理', '1', null, '', 'menu', 'sysLog/list'), ('26', null, b'0', '订单管理', '1', null, '', 'menu', 'orderBaseInfo/list'), ('30', null, b'0', '文章管理', '1', null, '', 'menu', 'heyContent/list'), ('31', null, b'0', '字典管理', '1', null, '', 'menu', 'sysDict/list'), ('32', null, b'0', 'hey管理', '0', null, '', 'menu', ''), ('33', null, b'0', '火车票管理', '1', null, '', 'menu', 'heyTicket/list'), ('34', null, b'0', '剧情攻略', '0', null, '', 'menu', ''), ('35', null, b'0', '仙魔录', '34', null, '', 'menu', '/heyContent/show?id=2'), ('36', null, b'0', '娃娃地劫攻略', '34', null, '', 'menu', 'heyContent/show?id=2'), ('37', null, b'0', '妖魔道', '34', null, '', 'menu', 'heyContent/show?id=2'), ('38', null, b'0', '伏魔计', '34', null, '', 'menu', 'heyContent/show?id=2'), ('39', null, b'0', '幻仙劫', '34', null, '', 'menu', 'heyContent/show?id=2'), ('40', null, b'0', '鲲鹏变', '34', null, '', 'menu', 'heyContent/show?id=2'), ('41', null, b'0', '搬砖基础', '0', null, '', 'menu', ''), ('42', null, b'0', '修山七天成型', '41', null, '', 'menu', ''), ('43', null, b'0', '十绝五法队伍', '41', null, '', 'menu', ''), ('44', null, b'0', '十绝两法三木队', '41', null, '', 'menu', ''), ('45', null, b'0', '五木队十绝', '41', null, '', 'menu', ''), ('46', null, b'0', '宝宝飞升技巧', '34', null, '', 'menu', ''), ('47', null, b'0', '搬砖进阶', '0', null, '', 'menu', ''), ('48', null, b'0', '十五天刷六倍道', '47', null, '', 'menu', ''), ('49', null, b'0', '开区日入两百', '47', null, '', 'menu', ''), ('50', null, b'0', '银元宝套现大全', '47', null, '', 'menu', ''), ('51', null, b'0', '交易平台', '0', null, '', 'menu', ''), ('52', null, b'0', '新区宝宝预订', '51', null, '', 'menu', ''), ('53', null, b'0', '新区装备预订', '52', null, '', 'menu', ''), ('54', null, b'0', '剧情主线代练', '51', null, '', 'menu', ''), ('55', null, b'0', '新区首饰预订', '51', null, '', 'menu', ''), ('56', null, b'0', '体队账号租售', '51', null, '', 'menu', ''), ('57', null, b'0', '法队账号租售', '51', null, '', 'menu', ''), ('58', null, b'0', '新版修山攻略', '41', null, '', 'menu', ''), ('59', null, b'0', '准根本宠物封印大全', '41', null, '', 'menu', ''), ('60', null, b'0', '宠物刷亲密', '41', null, '', 'menu', ''), ('61', null, b'0', '仙宠大逃亡攻略', '41', null, '', 'menu', ''), ('62', null, b'0', '技能精研效果', '47', null, '', 'menu', ''), ('63', null, b'0', '引路人积分', '41', null, '', 'menu', ''), ('64', null, b'0', '副本攻略', null, null, '', 'menu', ''), ('65', null, b'0', '如何摇出战神神秘', '41', null, '', 'menu', ''), ('66', null, b'0', '帮派女娲几率提高', '47', null, '', 'menu', ''), ('67', null, b'0', '通天塔技巧', '41', null, '', 'menu', ''), ('68', null, b'0', '鬼宠获取', '47', null, '', 'menu', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `available` bit(1) DEFAULT NULL COMMENT '是否有效',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '2017-11-12 08:59:20', b'1', '管理员', 'admin'), ('3', null, b'1', '普通会员', 'vip1'), ('4', null, b'1', '白金会员', 'vip2'), ('5', null, b'1', '钻石会员', 'vip3');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  KEY `FKomxrs8a388bknvhjokh440waq` (`permission_id`),
  KEY `FK9q28ewrhntqeipl1t04kh1be7` (`role_id`),
  CONSTRAINT `FK9q28ewrhntqeipl1t04kh1be7` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKomxrs8a388bknvhjokh440waq` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('1', '1'), ('1', '2'), ('1', '6'), ('1', '15'), ('1', '21'), ('1', '26'), ('1', '30'), ('1', '31'), ('1', '33'), ('1', '34'), ('1', '35'), ('1', '36'), ('1', '37'), ('1', '38'), ('1', '39'), ('1', '40'), ('1', '41'), ('1', '42'), ('1', '43'), ('1', '44'), ('1', '45'), ('1', '46'), ('1', '47'), ('1', '48'), ('1', '49'), ('1', '50'), ('1', '51'), ('1', '52'), ('1', '53'), ('1', '54'), ('1', '55'), ('1', '56'), ('1', '57'), ('1', '58'), ('1', '59'), ('1', '60'), ('1', '61'), ('1', '62'), ('1', '63'), ('3', '34'), ('3', '35'), ('3', '36'), ('3', '37'), ('3', '38'), ('3', '39'), ('3', '40'), ('4', '41'), ('4', '42'), ('4', '43'), ('4', '44'), ('4', '45'), ('4', '46');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `role_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  KEY `FKain422lxuquy497yt11gaja5n` (`id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `FKain422lxuquy497yt11gaja5n` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('3', '5'), ('1', '5'), ('3', '6'), ('4', '8'), ('3', '7');
COMMIT;

-- ----------------------------
--  Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `state` int(4) NOT NULL COMMENT '状态',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f2ksd6h8hsjtd57ipfq9myr64` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `user_info`
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('1', '2017-11-15 00:20:03', 'admin', 'd0943744a38289f7718f2bfd240c23a5', '21232F297A57A5A743894A0E4A801FC3', '1', 'admin'), ('5', '2017-11-15 13:40:40', 'hey', '4501fd22c3fcc761b87120bac23ad96c', '6057F13C496ECF7FD777CEB9E79AE285', '1', 'hey'), ('6', '2017-12-07 22:34:46', 'hey1', '9bf7b2ffc5ff8955073d2763b826921f', 'B7D8DB9BB8D1CA4FAFD915A10B197845', '1', 'hey1'), ('7', '2018-06-15 08:21:52', 'hey01', '3958ca7c4b9829a2357f46e85cca6916', 'B4CD426C85473A839BEAC388E722156F', '1', 'hey01l'), ('8', '2018-06-16 02:06:02', 'hey02', '1852321d995f0fb7c2b2a58964e7a715', '0D047732AB33918CD7110E1338876702', '1', 'hey02');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- 删除数据库
DROP DATABASE IF EXISTS fresh ;
-- 创建数据库
CREATE DATABASE fresh CHARACTER SET UTF8 ;
-- 使用数据库
USE fresh ;
-- 创建用户表
CREATE TABLE member (
   mid                  varchar(50) not null,
   password             varchar(32),
   adminflag            int,
   email                varchar(50),
   phone                varchar(50),
   reg                  datetime,
   delflag              int DEFAULT 0,
   CONSTRAINT pk_mid PRIMARY KEY (mid)
);
-- 创建一级栏目表
CREATE TABLE item (
   iid                  int AUTO_INCREMENT ,
   title                varchar(50),
  CONSTRAINT pk_iid    PRIMARY KEY (IID)
);
-- 创建二级栏目表
CREATE TABLE subitem (
   sid                  int AUTO_INCREMENT ,
   iid                  int,
   title                varchar(50),
 CONSTRAINT pk_sid PRIMARY KEY (sid) ,
 CONSTRAINT fk_iid FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE CASCADE
);
-- 创建商品表
CREATE TABLE goods (
   gid                  int AUTO_INCREMENT ,
   iid                  int,
   sid                  int,
   mid                  varchar(50),
   title                varchar(50)  not null,
   price                double  not null,
   pubdate              datetime,
   note                 text,
   delflag              int default 0,
   photo                varchar(200),
   CONSTRAINT pk_gid PRIMARY KEY (gid) ,
   CONSTRAINT fk_iid2 FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE CASCADE ,
   CONSTRAINT fk_sid2 FOREIGN KEY(sid) REFERENCES subitem(sid) ON DELETE CASCADE ,
   CONSTRAINT fk_mid FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE
);
-- 创建省份表
CREATE TABLE province (
   pid                  int AUTO_INCREMENT ,
   title                varchar(50) not null,
   CONSTRAINT pk_pid PRIMARY KEY (pid)
);
-- 创建城市表
CREATE TABLE city (
   cid                  int AUTO_INCREMENT ,
   pid                  int,
   title                varchar(50) not null,
   CONSTRAINT pk_cid primary key (cid) ,
   CONSTRAINT fk_pid FOREIGN KEY(pid) REFERENCES province(pid) ON DELETE CASCADE
);
-- 创建联系地址
CREATE TABLE address (
   adid                 int AUTO_INCREMENT ,
   mid                  varchar(50),
   cid                  int,
   pid                  int,
   addr                 varchar(200),
   receiver             varchar(50),
   phone                varchar(50),
   deflag               int,
   CONSTRAINT pk_adid PRIMARY KEY (adid) ,
   CONSTRAINT fk_mid3 FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE ,
   CONSTRAINT fk_pid3 FOREIGN KEY(pid) REFERENCES province(pid) ON DELETE CASCADE  ,
   CONSTRAINT fk_cid3 FOREIGN KEY(cid) REFERENCES city(cid) ON DELETE CASCADE  
);
-- 创建购物车信息表
CREATE TABLE shopcar (
   scid                 int AUTO_INCREMENT ,
   mid                  varchar(50),
   gid                  int,
   amount               int,
   CONSTRAINT pk_scid PRIMARY KEY (scid) ,
   CONSTRAINT fk_mid4 FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE ,
   CONSTRAINT fk_gid4 FOREIGN KEY(gid) REFERENCES goods(gid) ON DELETE CASCADE
);
-- 创建订单表
CREATE TABLE orders (
   oid                  int AUTO_INCREMENT ,
   mid                  varchar(50),
   adid                 int,
   subdate              datetime,
   price                double,
   note                 text,
   CONSTRAINT pk_oid PRIMARY KEY (oid) ,
   CONSTRAINT fk_mid5 FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE ,
   CONSTRAINT fk_adid5 FOREIGN KEY(adid) REFERENCES address(adid) ON DELETE CASCADE 
);
-- 创建订单详情
CREATE TABLE details (
   dtid                 int AUTO_INCREMENT ,
   oid                  int,
   gid                  int,
   amount            int,
   CONSTRAINT pk_dtid PRIMARY KEY (dtid) ,
   CONSTRAINT fk_oid5 FOREIGN KEY(oid) REFERENCES orders(oid) ON DELETE CASCADE ,
   CONSTRAINT fk_gid5 FOREIGN KEY(gid) REFERENCES goods(gid) ON DELETE CASCADE
);

-- 增加测试数据
INSERT INTO member(mid,password,adminflag,delflag) VALUES ('vadmin','5D41402ABC4B2A76B9719D911017C592',1,0) ;
INSERT INTO member(mid,password,adminflag,delflag) VALUES ('guest','084E0343A0486FF05530DF6C705C8BB4',0,0) ;
INSERT INTO province (title) VALUES 
 ('其他'), ('北京'), ('重庆'), ('福建'), ('甘肃'), ('广东'),
 ('广西'), ('贵州'), ('海南'), ('河北'), ('黑龙江'), ('河南'),
 ('香港'), ('湖北'), ('湖南'), ('江苏'), ('江西'), ('吉林'),
 ('辽宁'), ('澳门'), ('内蒙古'), ('宁夏'), ('青海'), ('山东'),
 ('上海'), ('山西'), ('陕西'), ('四川'), ('台湾'), ('天津'),
 ('新疆'), ('西藏'), ('云南'), ('浙江'), ('安徽');

INSERT INTO city (pid,title) VALUES 
 (1,'其他'),(35,'合肥'), (35,'安庆'), (35,'蚌埠'), (35,'亳州'), (35,'巢湖'), (35,'滁州'),
 (35,'阜阳'), (35,'贵池'), (35,'淮北'), (35,'淮化'), (35,'淮南'), (35,'黄山'),
 (35,'九华山'), (35,'六安'), (35,'马鞍山'), (35,'宿州'), (35,'铜陵'), (35,'屯溪'),
 (35,'芜湖'), (35,'宣城'), (2,'北京'), (3,'重庆'), (4,'福州'), (4,'福安'),
 (4,'龙岩'), (4,'南平'), (4,'宁德'), (4,'莆田'), (4,'泉州'), (4,'三明'),
 (4,'邵武'), (4,'石狮'), (4,'永安'), (4,'武夷山'), (4,'厦门'), (4,'漳州'),
 (5,'兰州'), (5,'白银'), (5,'定西'), (5,'敦煌'), (5,'甘南'), (5,'金昌');

INSERT INTO city (pid,title) VALUES 
 (5,'酒泉'), (5,'临夏'), (5,'平凉'), (5,'天水'), (5,'武都'), (5,'武威'),
 (5,'西峰'), (5,'张掖'), (6,'广州'), (6,'韶关'), (6,'深圳'), (6,'珠海'),
 (6,'汕头'), (6,'佛山'), (6,'江门'), (6,'湛江'), (6,'茂名'), (6,'肇庆'),
 (6,'惠州'), (6,'梅州'), (6,'汕尾'), (6,'河源'), (6,'阳江'), (6,'清远'),
 (6,'东莞'), (6,'中山'), (6,'潮州'), (6,'揭阳'), (6,'云浮'), (7,'南宁');

INSERT INTO city (pid,title) VALUES 
 (7,'百色'), (7,'北海'), (7,'桂林'), (7,'防城港'), (7,'河池'), (7,'贺州'),
 (7,'柳州'), (7,'钦州'), (7,'梧州'), (7,'玉林'), (8,'贵阳'), (8,'安顺'),
 (8,'毕节'), (8,'都匀'), (8,'凯里'), (8,'六盘水'), (8,'铜仁'), (8,'兴义'),
 (8,'玉屏'), (8,'遵义'), (9,'海口'), (9,'儋县'), (9,'陵水'), (9,'琼海'),
 (9,'三亚'), (9,'五指山'), (9,'万宁'), (10,'石家庄'), (10,'保定'), (10,'北戴河'),
 (10,'沧州'), (10,'承德'), (10,'丰润'), (10,'邯郸'), (10,'衡水'), (10,'廊坊');

INSERT INTO city (pid,title) VALUES 
 (10,'南戴河'), (10,'秦皇岛'), (10,'唐山'), (10,'新城'), (10,'邢台'), (10,'张家口'),
 (11,'哈尔滨'), (11,'北安'), (11,'大庆'), (11,'大兴安岭'), (11,'鹤岗'), (11,'黑河'),
 (11,'佳木斯'), (11,'鸡西'), (11,'牡丹江'), (11,'齐齐哈尔'), (11,'七台河'), (11,'双鸭山'),
 (11,'绥化'), (11,'伊春'), (12,'郑州'), (12,'安阳'), (12,'鹤壁'), (12,'潢川'),
 (12,'焦作'), (12,'济源'), (12,'开封'), (12,'漯河'), (12,'洛阳'), (12,'南阳'), (12,'平顶山'),
 (12,'濮阳'), (12,'三门峡'), (12,'商丘'), (12,'新乡');

INSERT INTO city (pid,title) VALUES 
 (12,'信阳'), (12,'许昌'), (12,'周口'), (12,'驻马店'), (13,'香港'), (13,'九龙'),
 (13,'新界'), (14,'武汉'), (14,'恩施'), (14,'鄂州'), (14,'黄冈'), (14,'黄石'),
 (14,'荆门'), (14,'荆州'), (14,'潜江'), (14,'十堰'), (14,'随州'), (14,'武穴'), (14,'仙桃'),
 (14,'咸宁'), (14,'襄阳'), (14,'襄樊'), (14,'孝感'), (14,'宜昌'), (15,'长沙'), (15,'常德'),
 (15,'郴州'), (15,'衡阳'), (15,'怀化'), (15,'吉首'), (15,'娄底'), (15,'邵阳'), (15,'湘潭'),
 (15,'益阳'), (15,'岳阳'), (15,'永州');

INSERT INTO city (pid,title) VALUES 
 (15,'张家界'), (15,'株洲'), (16,'南京'), (16,'常熟'), (16,'常州'), (16,'海门'),
 (16,'淮安'), (16,'江都'), (16,'江阴'), (16,'昆山'), (16,'连云港'), (16,'南通'),
 (16,'启东'), (16,'沭阳'), (16,'宿迁'), (16,'苏州'), (16,'太仓'), (16,'泰州'),
 (16,'同里'), (16,'无锡'), (16,'徐州'), (16,'盐城'), (16,'扬州'), (16,'宜兴'),
 (16,'仪征'), (16,'张家港'), (16,'镇江'), (16,'周庄'), (17,'南昌'), (17,'抚州'),
 (17,'赣州'), (17,'吉安'), (17,'景德镇'), (17,'井冈山'), (17,'九江'), (17,'庐山');

INSERT INTO city (pid,title) VALUES 
 (17,'萍乡'), (17,'上饶'), (17,'新余'), (17,'宜春'), (17,'鹰潭'), (18,'长春'),
 (18,'白城'), (18,'白山'), (18,'珲春'), (18,'辽源'), (18,'梅河'), (18,'吉林'),
 (18,'四平'), (18,'松原'), (18,'通化'), (18,'延吉'), (19,'沈阳'), (19,'鞍山'),
 (19,'本溪'), (19,'朝阳'), (19,'大连'), (19,'丹东'), (19,'抚顺'), (19,'阜新'),
 (19,'葫芦岛'), (19,'锦州'), (19,'辽阳'), (19,'盘锦'), (19,'铁岭'), (19,'营口'),
 (20,'澳门'), (21,'呼和浩特'), (21,'阿拉善盟'), (21,'包头'), (21,'赤峰'), (21,'东胜');

INSERT INTO city (pid,title) VALUES 
 (21,'海拉尔'), (21,'集宁'), (21,'临河'), (21,'通辽'), (21,'乌海'), (21,'乌兰浩特'),
 (21,'锡林浩特'), (22,'银川'), (22,'固原'), (22,'石嘴山'), (22,'吴忠'), (23,'西宁'),
 (23,'德令哈'), (23,'格尔木'), (23,'共和'), (23,'海东'), (23,'海晏'), (23,'玛沁'),
 (23,'同仁'), (23,'玉树'), (24,'济南'), (24,'滨州'), (24,'兖州'), (24,'德州'),
 (24,'东营'), (24,'菏泽'), (24,'济宁'), (24,'莱芜'), (24,'聊城'), (24,'临沂'),
 (24,'蓬莱'), (24,'青岛'), (24,'曲阜'), (24,'日照'), (24,'泰安');

INSERT INTO city (pid,title) VALUES 
 (24,'潍坊'), (24,'威海'), (24,'烟台'), (24,'枣庄'), (24,'淄博'), (25,'上海'),
 (25,'崇明'), (25,'朱家角'), (26,'太原'), (26,'长治'), (26,'大同'), (26,'候马'),
 (26,'晋城'), (26,'离石'), (26,'临汾'), (26,'宁武'), (26,'朔州'), (26,'忻州'),
 (26,'阳泉'), (26,'榆次'), (26,'运城'), (27,'西安'), (27,'安康'), (27,'宝鸡'),
 (27,'汉中'), (27,'渭南'), (27,'商州'), (27,'绥德'), (27,'铜川'), (27,'咸阳'),
 (27,'延安'), (27,'榆林'), (28,'成都'), (28,'巴中'), (28,'达州'), (28,'德阳');

INSERT INTO city (pid,title) VALUES 
 (28,'都江堰'), (28,'峨眉山'), (28,'涪陵'), (28,'广安'), (28,'广元'), (28,'九寨沟'),
 (28,'康定'), (28,'乐山'), (28,'泸州'), (28,'马尔康'), (28,'绵阳'), (28,'眉山'),
 (28,'南充'), (28,'内江'), (28,'攀枝花'), (28,'遂宁'), (28,'汶川'), (28,'西昌'),
 (28,'雅安'), (28,'宜宾'), (28,'自贡'), (28,'资阳'), (29,'台北'), (29,'基隆'),
 (29,'台南'), (29,'台中'), (30,'天津'), (31,'乌鲁木齐'), (31,'阿克苏'), (31,'阿勒泰'),
 (31,'阿图什'), (31,'博乐'), (31,'昌吉'), (31,'东山'), (31,'哈密');

INSERT INTO city (pid,title) VALUES 
 (31,'和田'), (31,'喀什'), (31,'克拉玛依'), (31,'库车'), (31,'库尔勒'), (31,'奎屯'),
 (31,'石河子'), (31,'塔城'), (31,'吐鲁番'), (31,'伊宁'), (32,'拉萨'), (32,'阿里'),
 (32,'昌都'), (32,'林芝'), (32,'那曲'), (32,'日喀则'), (32,'山南'), (33,'昆明'),
 (33,'大理'), (33,'保山'), (33,'楚雄'), (33,'东川'), (33,'个旧'),
 (33,'景洪'), (33,'开远'), (33,'临沧'), (33,'丽江'), (33,'六库'), (33,'潞西'),
 (33,'曲靖'), (33,'思茅'), (33,'文山'), (33,'西双版纳'), (33,'玉溪');

INSERT INTO city (pid,title) VALUES 
 (33,'中甸'), (33,'昭通'), (34,'杭州'), (34,'安吉'), (34,'慈溪'), (34,'定海'),
 (34,'奉化'), (34,'海盐'), (34,'黄岩'), (34,'湖州'), (34,'嘉兴'), (34,'金华'),
 (34,'临安'), (34,'临海'), (34,'丽水'), (34,'宁波'), (34,'瓯海'), (34,'平湖'),
 (34,'千岛湖'), (34,'衢州'), (34,'江山'), (34,'瑞安'), (34,'绍兴'), (34,'嵊州'),
 (34,'台州'), (34,'温岭'), (34,'温州'), (34,'舟山') ;

INSERT INTO item(title) VALUES ('粮油') ;
INSERT INTO item(title) VALUES ('蔬菜') ;
INSERT INTO item(title) VALUES ('生鲜') ;
INSERT INTO item(title) VALUES ('水果') ;
INSERT INTO item(title) VALUES ('饮料') ;
INSERT INTO item(title) VALUES ('副食') ;

INSERT INTO subitem(title,iid) VALUES ('大米',1) ;
INSERT INTO subitem(title,iid) VALUES ('粉',1) ;
INSERT INTO subitem(title,iid) VALUES ('面',1) ;
INSERT INTO subitem(title,iid) VALUES ('橄榄油',1) ;
INSERT INTO subitem(title,iid) VALUES ('花生油',1) ;
INSERT INTO subitem(title,iid) VALUES ('调和油',1) ;
INSERT INTO subitem(title,iid) VALUES ('茶籽油',1) ;
INSERT INTO subitem(title,iid) VALUES ('调料',1) ;

INSERT INTO subitem(title,iid) VALUES ('南瓜',2) ;
INSERT INTO subitem(title,iid) VALUES ('芋头',2) ;
INSERT INTO subitem(title,iid) VALUES ('淮山',2) ;

INSERT INTO subitem(title,iid) VALUES ('牛',3) ;
INSERT INTO subitem(title,iid) VALUES ('羊',3) ;
INSERT INTO subitem(title,iid) VALUES ('鸡',3) ;
INSERT INTO subitem(title,iid) VALUES ('虾',3) ;
INSERT INTO subitem(title,iid) VALUES ('蟹',3) ;
INSERT INTO subitem(title,iid) VALUES ('鱼',3) ;
INSERT INTO subitem(title,iid) VALUES ('墨鱼',3) ;

INSERT INTO subitem(title,iid) VALUES ('奇异果',4) ;
INSERT INTO subitem(title,iid) VALUES ('橙',4) ;
INSERT INTO subitem(title,iid) VALUES ('苹果',4) ;
INSERT INTO subitem(title,iid) VALUES ('桃',4) ;
INSERT INTO subitem(title,iid) VALUES ('火龙果',4) ;
INSERT INTO subitem(title,iid) VALUES ('石榴',4) ;

INSERT INTO subitem(title,iid) VALUES ('牛奶',5) ;
INSERT INTO subitem(title,iid) VALUES ('果汁',5) ;
INSERT INTO subitem(title,iid) VALUES ('冲调饮品',5) ;
INSERT INTO subitem(title,iid) VALUES ('酸奶',5) ;
INSERT INTO subitem(title,iid) VALUES ('茶',5) ;

INSERT INTO subitem(title,iid) VALUES ('姜',6) ;
INSERT INTO subitem(title,iid) VALUES ('蛋',6) ;
INSERT INTO subitem(title,iid) VALUES ('坚果',6) ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,1,'vadmin','自然农法五常米',59.90,NOW(),'自然农法 东北香米黑龙江五常有机大米鲜胚芽米 宝宝粥米5斤包邮',0,'1.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,1,'vadmin','绿良',130.89,NOW(),'广州绿良牌增城丝苗米农家年货特产15kg特产2017新米大米广东包邮',0,'2.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,1,'vadmin','北大荒珍珠米',39.90,NOW(),'北大荒 百年寒地 优质东北大米 粳米 珍珠米 5kg',0,'3.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,1,'vadmin','皇族金辉',95.00,NOW(),'皇族金辉泰国茉莉香米 原装进口 Thai Hom Mali Rice',0,'4.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,2,'vadmin','连州沙坊粉',15.00,NOW(),'连州特产 老字号儒林坊葛薯沙坊粉 传统手工切粉 散装 绿色食品',0,'5.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,3,'vadmin','华星',26.50,NOW(),'500g华星宫川 河南家常面 挂面银丝面细面幼面手工面 共5代包邮',0,'6.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,3,'vadmin','萧莉',32.00,NOW(),'萧莉鱼面麻城鱼面麻城夫子河鱼面锤鱼500g精品红薯粉鱼面',0,'7.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,3,'vadmin','精力沛',39.80,NOW(),'精力沛五谷纯麦面条早餐面胚芽面非油炸面营养910g',0,'8.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,3,'vadmin','挂面',36.90,NOW(),'【天天特价】高洋挂面拌面细面拉面炸酱面手工特产优质面条4斤装',0,'9.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,4,'vadmin','欧丽薇兰',138.00,NOW(),'欧丽薇兰纯正橄榄油简装礼盒750ml*2瓶 炒菜食用油橄榄油送礼团购',0,'10.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,4,'vadmin','贝蒂斯',39.99,NOW(),'西班牙原装进口BETIS贝蒂斯特级初榨橄榄油750ML 临期特价 结晶',0,'11.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,4,'vadmin','鲁花',75.90,NOW(),'鲁花特级初榨橄榄油食用油700ml橄榄油孕妇护肤礼盒装送礼包邮',0,'12.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,4,'vadmin','犀牛特级初榨橄榄油',175.00,NOW(),'西班牙原油进口犀牛500ml*2特级初榨橄榄油红礼盒包邮接受团购',0,'13.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,5,'vadmin','金龙鱼',129.80,NOW(),'【全店满减 24号后发货】花生油金龙鱼纯正花生油5L物理压榨一级',0,'14.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,5,'vadmin','鲁花',69.90,NOW(),'包邮鲁花5S压榨一级花生油4L 非转基因食用植物油 物理 年货批发',0,'15.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,6,'vadmin','鲁花',59.90,NOW(),'鲁花食用调和油5l升年终促销包邮烘焙家用营养浓香大豆调和油整箱',0,'16.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,7,'vadmin','山润',79.00,NOW(),'山润茶籽香调和油5L家用食用油菜油湖南茶油非转基因健康植物茶油',0,'17.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (1,8,'vadmin','李锦记',39.60,NOW(),'包邮鲁花自然鲜酱油1L生抽鲁花自然鲜酱香酱油拍一份发两桶送两瓶',0,'18.jpg') ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (2,9,'vadmin','贝贝南瓜',37.80,NOW(),'山东贝贝南瓜新鲜迷你南瓜板栗味小南瓜宝宝辅食老面南瓜5斤包邮',0,'19.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (2,10,'vadmin','槟榔香芋',33.80,NOW(),'年货广西桂林特产正宗新鲜荔浦农家芋头蔬菜槟榔芋紫藤芋香芋5斤',0,'20.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (2,11,'vadmin','铁棍淮山',37.99,NOW(),'新鲜 5斤 河南正宗铁棍山约药 铁杆山药约 焦作温县铁棍怀淮山药',0,'21.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (2,11,'vadmin','紫淮山',35.00,NOW(),'现挖新鲜紫山药紫淮山脚板薯紫玉淮山紫大薯农家种植老品种5斤装',0,'22.jpg') ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,12,'vadmin','牛仔骨',21.90,NOW(),'黑椒牛仔骨牛排牛小排酒店饭店特色优质半成品食材包邮350克一包',0,'23.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,12,'vadmin','牛丸',55.00,NOW(),'安井正品撒尿牛丸包邮肉丸5斤装关东煮麻辣烫火锅丸子火锅食材',0,'24.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,13,'vadmin','呼伦贝尔羊',720.00,NOW(),'绿川然西旗分割全羊10kg礼盒内蒙古特产呼伦贝尔羊肉新鲜羔羊',0,'25.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,13,'vadmin','宁夏滩羊',358.00,NOW(),'宁夏盐池土滩羊羔羊内蒙小尾羊手抓羊肉新鲜羊排羊前腿肉+脖子8斤',0,'26.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,14,'vadmin','泰和鸡',43.00,NOW(),'乌鸡泰和特产乌鸡 汪陂途煲汤老母鸡 滋补佳品',0,'27.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,14,'vadmin','清远休眠鸡',95.00,NOW(),'清远休眠鸡128天放养 炖汤烤鸡中华料理上乘之选奶奶的味道',0,'28.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,15,'vadmin','虾丸',19.80,NOW(),'豆捞食材虾滑批发200g火锅配菜品海鲜虾丸火锅食材配菜品5包包邮',0,'29.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,16,'vadmin','太湖大闸蟹',158.00,NOW(),'太湖大闸蟹新鲜活河蟹10只礼盒装送礼佳品顺丰专递速达',0,'30.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,17,'vadmin','马鲛鱼片',378.00,NOW(),'【海南味】三亚野生大马鲛鱼片 8斤礼盒装新鲜海鱼特价促销',0,'31.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (3,18,'vadmin','墨鱼片',20.00,NOW(),'墨鱼饼500克火锅烧烤料花枝丸阳江平海冷冻海鲜鱼丸鱼饼鱼糕',0,'32.jpg') ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,19,'vadmin','佳沛金奇异果',223.00,NOW(),'【易果生鲜】Zespri佳沛意大利阳光金奇异果3.3kg原箱(22-30个)',0,'33.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,19,'vadmin','红心奇异果',319.00,NOW(),'蒲江红心猕猴桃奇异果22粒大果5斤新鲜孕妇水果现摘现发纯甜包邮',0,'34.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,20,'vadmin','新奇士橙',65.00,NOW(),'美国进口甜橙3斤新奇士阳光橙子大果新鲜多汁黄橙脐橙水果发顺丰',0,'35.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,20,'vadmin','脐橙',89.90,NOW(),'江西橙子正宗赣州赣南脐橙新鲜水果批发当季整箱20斤装小果',0,'36.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,20,'vadmin','红江橙',58.00,NOW(),'正宗红江橙当季廉江红橙红江农场橙子新鲜特产手剥水果5斤包邮',0,'37.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,20,'vadmin','褚橙',40.00,NOW(),'正宗怀化黔阳冰糖橙新鲜水果现摘现发非赣南脐橙褚橙10斤橙子带箱',0,'38.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,21,'vadmin','红玫瑰',128.00,NOW(),'美国红玫瑰苹果水果进口苹果新鲜脆甜rose12颗约6斤250g/颗',0,'39.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,21,'vadmin','冰糖心苹果',31.80,NOW(),'村状元冰糖心苹果水果新鲜10斤包邮陕西红富士摘整箱丑苹果批 发',0,'40.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,22,'vadmin','雪桃',42.80,NOW(),'山东特产青州蜜桃冬雪蜜桃冬桃小毛桃桃子新鲜水果5斤装非水蜜桃',0,'41.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,23,'vadmin','越南红肉火龙果',45.88,NOW(),'正宗越南红心火龙果6个装2400克约5斤新鲜红肉火龙果孕妇水果包邮',0,'42.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,23,'vadmin','越南白肉火龙果',68.00,NOW(),'火龙果水果越南火龙果白心热带孕妇新鲜水果燕窝果白肉火龙果红心',0,'43.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,24,'vadmin','番石榴',24.80,NOW(),'慢客农庄果园现摘现发台湾红心芭乐番石榴果孕妇新鲜水果5斤包邮',0,'44.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,24,'vadmin','甜石榴',58.00,NOW(),'8月见蒙自石榴新鲜水果当季云南特产蒙自甜石榴红汁多籽软6斤包邮',0,'45.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (4,24,'vadmin','突尼斯软籽石榴',55.00,NOW(),'河阴软籽石榴突尼斯软籽石榴孕妇水果 6-7两6个装',0,'46.jpg') ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,25,'vadmin','德亚',97.80,NOW(),'德国进口纯牛奶 德亚全脂牛奶 1L*12盒整箱装 区域包邮',0,'47.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,25,'vadmin','风行',115.00,NOW(),'风行纯牛奶礼盒装(整箱装200ml*12盒）*4箱 包邮 只发广东',0,'48.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,25,'vadmin','安佳',89.00,NOW(),'[礼盒装]新西兰原装进口全脂纯牛奶安佳Anchor超高温灭菌250ml*10',0,'49.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,25,'vadmin','澳牧',128.00,NOW(),'【 原装进口】澳牧儿童成长牛奶200ml*15装 高钙全脂纯牛奶',0,'50.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,25,'vadmin','花园',68.00,NOW(),'新疆西部牧业花园生态军垦牛清真牛奶纯牛奶饮品200ml*20袋包邮',0,'51.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,26,'vadmin','宾果',23.00,NOW(),'欧洲葡萄牙进口浓缩果汁饮料um bongo宾果芒果苹果混合果汁1000ml',0,'52.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','蜂巢蜜',35.00,NOW(),'蜂巢蜜纯正天然嚼着吃盒装蜂蜜巢老蜂巢农家自产蜂巢蜂窝蜜半斤装',0,'53.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','月见草蜂蜜',148.00,NOW(),'东北黑蜂月见草蜂蜜350g/瓶×1 原蜜 纯正蜂蜜 月见草蜂蜜',0,'54.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','红糖姜枣膏',38.60,NOW(),'怀姜糖膏黑糖姜茶红糖姜茶红枣姜枣膏姜糖怀庆博爱姜汁生姜怀姜膏',0,'55.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','蜂蜜柚子',25.65,NOW(),'盾皇花茶原浆花果茶柚子原浆水果茶蜂蜜柚子茶酱充饮1.5KG包邮',0,'56.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','椴树蜜',49.50,NOW(),'500gX2瓶东北长白山椴树蜜纯黑蜂雪蜜天然农家自产土蜂蜜孕妇蜂蜜',0,'57.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','亚发特浓白咖啡',139.00,NOW(),'3袋组售 马来西亚进口 亚发（发记）特浓白咖啡720g*3袋 速溶饮料',0,'58.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','桑椹膏',39.80,NOW(),'桑葚子茶桑椹子干黑桑椹特产无沙新鲜新疆桑甚果桑葚膏桑葚酒桑果',0,'59.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,27,'vadmin','酸枣仁膏',119.00,NOW(),'赞皇县特产野生酸枣仁国产炒酸枣仁膏汤酸枣仁茶酸枣仁粉500g包邮',0,'60.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,28,'vadmin','青藏祁莲',108.00,NOW(),'【新品上市】青藏祁莲青海常温原味牦牛学生酸奶10瓶*200毫升',0,'61.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','红茶',98.00,NOW(),'金骏眉红茶 新茶武夷山金俊眉散装罐装特级秋茶礼盒茶叶送礼 500g',0,'62.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','黑米茶',80.00,NOW(),'拍2发3袋黑米茶 洋县周大黑黑米养生茶 特产富含花青素茶300g',0,'63.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','白茶',99.00,NOW(),'正宗安吉白茶2017新茶叶雨前一级A 珍稀高山绿茶250g散装特级春茶',0,'64.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','苦荞茶',9.60,NOW(),'邛池苦荞茶 大凉山荞麦茶厂家直销 黑苦荞茶散装全胚芽茶500g包邮',0,'65.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','花茶',38.00,NOW(),'新鲜纯手工水果茶果干花果茶果粒茶养生组合花茶果茶包袋罐装包邮',0,'66.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','小青柑',99.00,NOW(),'买2送壶-新会小青柑陈皮普洱茶宫廷熟茶叶柑普橘桔普茶500g礼盒装',0,'67.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (5,29,'vadmin','铁观音',99.00,NOW(),'送茶具 铁观音茶叶 特级安溪铁观音礼盒装500g 铁观音浓香型',0,'68.jpg') ;

INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,30,'vadmin','小黄姜',23.80,NOW(),'云南小黄姜生姜辣姜现挖新鲜5斤包邮土姜嫩姜农家自种黄姜',0,'69.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,31,'vadmin','土鸡蛋',24.90,NOW(),'破损包赔！农家散养土鸡蛋新鲜草鸡蛋正宗农村土鸡蛋30枚柴鸡蛋',0,'70.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,31,'vadmin','乌鸡蛋',36.80,NOW(),'农家散养绿壳土鸡蛋乌鸡蛋30枚绿壳鸡蛋新鲜天然绿壳蛋包邮',0,'71.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,31,'vadmin','烤海鸭咸蛋',38.80,NOW(),'北海特产咸蛋北部湾原产地咸鸭蛋包邮正宗流油野生烤海鸭蛋30枚熟',0,'72.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','巴旦木',23.80,NOW(),'天天特价薄壳奶油巴旦木连罐重500g大杏仁NP扁桃仁坚果零食干果',0,'73.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','口口福坚果礼盒',98.00,NOW(),'口口福-坚果零食礼盒1715g 9款9包 炒货坚果干果送礼年货大礼包',0,'74.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','夏威夷果',32.80,NOW(),'天天特价零食夏威夷果连罐500g奶油味坚果炒货包邮秒杀送开果器',0,'75.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','松子',37.80,NOW(),'天天特价新货东北红松子原味连罐500g分2罐装零食坚果炒货特产',0,'76.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','果果先森每日果仁',26.80,NOW(),'果果先森每日果仁雪花酥原料坚果25g一包混合坚果曲奇牛轧糖原料',0,'77.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','核桃',43.80,NOW(),'17年新货临安薄壳大籽2罐装手剥山核桃小核桃胡桃零食坚果炒货仁',0,'78.jpg') ;
INSERT INTO goods(iid,sid,mid,title,price,pubdate,note,delflag,photo) VALUES (6,32,'vadmin','栗子',26.90,NOW(),'【粒上皇】板栗仁80g*3 甘栗仁零食迁西特产栗子仁熟栗油子栗坚果',0,'79.jpg') ;

INSERT INTO address(mid,cid,pid,addr,receiver,phone,deflag) VALUES ('guest',52,6,'广东 广州 大学城外环东路132号中山大学数据科学与计算机学院','张三同学','13301234567',0) ;

INSERT INTO shopcar(mid,gid,amount) VALUES ('guest',79,5) ;
INSERT INTO shopcar(mid,gid,amount) VALUES ('guest',69,4) ;
INSERT INTO shopcar(mid,gid,amount) VALUES ('guest',59,3) ;

INSERT INTO orders(mid,adid,subdate,price) VALUES ('guest',1,'2018-03-05 09:26:37',434) ;

INSERT INTO details(oid,gid,amount) VALUES (1,64,1) ;
INSERT INTO details(oid,gid,amount) VALUES (1,58,1) ;
INSERT INTO details(oid,gid,amount) VALUES (1,62,2) ;
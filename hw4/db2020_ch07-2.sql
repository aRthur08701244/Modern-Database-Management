# Database Management
# advanced applications and examples
# by Prof. Willie LI-WEI Yang
# National Taiwan University
# email: wyang@ntu.edu.tw

# note:因為member為保留字，故前後請加上`字元，表示為表格名稱

# 建立表格
CREATE TABLE `member` (
  Mno decimal(2),
  Name varchar(10),
  Gender varchar(10),
  Age decimal(2),
  Education varchar(10),
  Marriage varchar(10),
  Area varchar(10),
  CONSTRAINT pk1 PRIMARY KEY(Mno)); 
    
CREATE TABLE member_friendship (
  Mno decimal(2),
  F_Mno decimal(2),
  Type varchar(10),
  Date varchar(10),
  CONSTRAINT pk1 PRIMARY KEY(Mno, F_Mno, Type),
  CONSTRAINT fk1 FOREIGN KEY(Mno) REFERENCES `member`(Mno),
  CONSTRAINT fk2 FOREIGN KEY(F_Mno) REFERENCES `member`(Mno));

#新增資料    
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('1', 'John', 'M', '20', '大學', '未婚', '台北');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('2', 'Mary', 'F', '30', '碩士', '已婚', '高雄');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('3', 'Susan', 'F', '35', '碩士', '已婚', '台北');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('4', 'Judy', 'F', '22', '大學', '未婚', '台北');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('5', 'Kevin', 'M', '28', '大學', '已婚', '新竹');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('6', 'Michael', 'M', '21', '大學', '未婚', '高雄');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('7', 'Jim', 'M', '26', '高職', '已婚', '台北');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('8', 'Rita', 'F', '33', '高職', '未婚', '新竹');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('9', 'Vic', 'M', '31', '大學', '已婚', '高雄');
INSERT INTO `member` (`Mno`, `Name`, `Gender`, `Age`, `Education`, `Marriage`, `Area`) VALUES ('10', 'Jerry', 'M', '22', '大學', '未婚', '新竹');

INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('1', '4', '校友', '20091002');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('1', '6', '校友', '20091015');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('1', '10', '校友', '20091008');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('2', '5', '夫妻', '20090920');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('2', '9', '朋友', '20090925');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('3', '9', '夫妻', '20091005');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('4', '10', '情侶', '20090930');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('4', '1', '校友', '20091002');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('4', '6', '校友', '20091020');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('4', '10', '校友', '20090920');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('5', '2', '夫妻', '20090920');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('5', '7', '朋友', '20091003');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('6', '1', '校友', '20091015');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('6', '4', '校友', '20091020');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('6', '10', '校友', '20090919');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('7', '5', '朋友', '20091003');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('9', '3', '夫妻', '20091005');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('9', '2', '朋友', '20090925');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('10', '1', '校友', '20091008');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('10', '4', '校友', '20090920');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('10', '6', '校友', '20090919');
INSERT INTO `member_friendship` (`Mno`, `F_Mno`, `Type`, `Date`) VALUES ('10', '4', '情侶', '20090930');

#1_1_住台北新竹有朋友
SELECT m.*
FROM `member` AS m
WHERE m.area='台北';
#1_2_住台北新竹有朋友
SELECT m.*, f.*
FROM `member` AS m, member_friendship AS f
WHERE m.area='台北' and m.mno=f.mno;
#1_3_住台北新竹有朋友
SELECT m.*, f.*, n.name, n.area
FROM `member` AS m, member_friendship AS f, `member` AS N
WHERE m.area='台北' and m.mno=f.mno and f.f_mno=n.mno;
#1_4_住台北新竹有朋友
SELECT m.*, f.*, n.name, n.area
FROM `member` AS m, member_friendship AS f, `member` AS n
WHERE m.area='台北' and m.mno=f.mno and f.f_mno=n.mno and n.area='新竹';

#2_1_交友數量
SELECT mno, count(*)
FROM member_friendship
GROUP BY mno
ORDER BY count(*);
#2_2_交友數量_人數>=3且照數量排名
SELECT mno, count(*) AS ppl
FROM member_friendship
GROUP BY mno
HAVING count(*)>=3
ORDER BY count(*) DESC;
#2_3_交友數量_改成姓名
SELECT f.mno, m.name, count(*) AS ppl
FROM member_friendship AS f, `member` AS m
WHERE f.mno=m.mno
GROUP BY f.mno, m.name
HAVING count(*)>=3
ORDER BY count(*) DESC;
#2_4_暫存檔
CREATE TABLE tmp 
  SELECT mno, count(*) AS ppl
  FROM member_friendship
  GROUP BY mno
  HAVING count(*)>=3
  ORDER BY count(*) DESC;
#2_5_參考暫存檔
SELECT tmp.mno, name, ppl
FROM tmp, `member`
WHERE tmp.mno=`member`.mno;

#3_1_有朋友的人
SELECT m.name, count(*)
FROM member_friendship AS F LEFT JOIN `member` AS M ON m.mno=f.mno
GROUP BY m.name
HAVING count(*)>=0
ORDER BY count(*) DESC , m.name;
#3_2_有朋友的人-1
SELECT m.name
FROM member_friendship AS F LEFT JOIN `member` AS M ON m.mno=f.mno
ORDER BY m.name;
#3_2_有朋友的人-2
SELECT DISTINCT m.name
FROM member_friendship AS F LEFT JOIN `member` AS M ON m.mno=f.mno
ORDER BY m.name;
#3_3_有朋友的人
SELECT name
FROM `member`
WHERE mno IN
 (SELECT mno FROM  member_friendship)
ORDER BY name;

#4_1_沒朋友的人-1
SELECT m.name, f.f_mno
FROM `member` AS m LEFT JOIN member_friendship AS f ON m.mno=f.mno
ORDER BY m.name;
#4_1_沒朋友的人-2
SELECT m.name, f.f_mno
FROM `member` AS m LEFT JOIN member_friendship AS f ON m.mno=f.mno
WHERE f.f_mno is null
ORDER BY m.name;
#4_2_沒朋友的人
SELECT name
FROM `member`
WHERE mno not in (select mno from member_friendship)
ORDER BY name;

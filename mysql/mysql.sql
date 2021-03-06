一
、String 类
 1. mysql 常用函数
   length, concat, substr, upper, lower, trim,ifnull,isnull;
如果中文字段乱码:
set names gbk;
2. 其他函数
(1) lpad, 左边用 \* 号填充, 总字符串为长度为 10;
   rpad 右填充
select lpad("小猫", 10, " \* ")
(2)relpace,替换; #
二、数学函数
   1.
round:
四舍五入
   2.
ceil:
向下取整数
   3.
floor:
向上取整数
三、日期函数
  1.curdate
(),now
();
  2.
将字符串通过指定格式转化成日期:
str_to_date
select str_to_date('1992-7-12','%Y-%c-%d');
3.
将日期转换为字符串:
date_format
    date_format
('2019/10/10',"%Y-%m-%d")
  4.相差多少天
select datediff(max(hiredate),min(hiredate))
from emp;
四、流程控制
  1.if语句
select
if(10<6,'true','false');
select price, 
if(price is null,'happy','促销','sad','正常价格')
  2.case语句
   case 要判断的字段或表达式 
     when 常量1 then 要显示的结果1
     when 常量2 then 要显示的结果2
     else 要显示的结果
end 别名;
五、分组函数
 1.group by,sum,max,avg,min,
count:
分组函数都忽略null值
 2.
select distinct name, id
from user;//distinct必须写在前面
 3.
select count(distinct name, age
)from user;
 4.group
by:
select column, column2, column3
where condition
group by exxpress_ssion
order by column  desc
/asc
 5.
select count(1) , dept_id
from emp
group by dept_id
having count(1) > 2;
六、进阶自查询
   1.按子查询出现的位置
select
from , 
where
group by ...having..
      exists
(相关子查询)
七、插入方式
insert into table1
  (id, name)
select (id, name
)from t2

八、语法
 1.sql99语法
多表更新:
update t1 as t
inner/left/right join t2 as t2 
    on 连接条件
set column = val1,column2 = val2 
    where 条件
 2.sql92语法
(多表删除)
delete t1的别名
,t2的别名
   from t1 as t,t2 as t2 
   where 连接条件
   and 筛选条件;

delete t1的别名
,t2的别名
   from t1 as t
   inner/left/right join t2 as t2 
    on 连接条件
   where 连接条件
   #2.多表的删除
#案例:
删除张无忌的女朋友的信息
DELETE b T
FROM beauty b
  INNER JOIN boys bo ON b.、boyfriend id' = bo.、id'
WHERE bo. 、boyName‘='张无忌'
;

九、插入多行
INSERT
INTO my_
employees
VALUES
  (1, 'patel' , 'Ralph' , ' Rpatel' , 895) ,
  (2, ' Dancs' , 'Betty', ' Bdancs' , 860) ,
  (3, 'Biri' , 'Ben', 'Bbiri' , 1100) ,
  (4, ' Newman' , 'Chad' , . Cnewman' , 750) ,
(5, ' Ropeburn' , ' Audrey', ' Aropebur' , 1550) ;

    
十、案例:
#1.创建库Books
    CREATE DATABASE IF NOT EXISTS books;
#2.仅仅复制表的结构
    CREATE TABLE copy LIKE author;
#3.复制表的结构+数据
CREATE TABLE copy2 SELECT★ FROM author;
#4.只复制部分数据
CREATE TABLE copy3 SELECT id, au name  FROM author WHERE nation='中国' ;|

#5.添加列级约束
USE students ;
CREATE TABLE stuinfo (
id INT PRIMARY KEY,#主键
stuName VARCHAR(20) NOT NULL, #非空
gender CHAR(1) CHECK (gender='男' OR gender ='女'), #检查
seat INT UNIQUE, #唯-
age INT DEFAULT 18, #默认约束
majorId INT FOREIGN KEY REFERENCES major (id) #外键
3CREATE TABLE major (
id INT PRIMARY KEY,
majorName VARCHAR(20)
t) ;
#2.添加表级约束
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
id INT,
stuname VARCHAR(20) ，
gender CHAR(1) , 
seat INT,
age INT,
majorid INT,
CONSTRAINT pk PRIMARY KEY(id),#主键
CONSTRAINT uq UNIQUE (seat) ,#唯一键
CONSTRAINT ck JHECK (gender ='男' OR gender = ' 女') , #检查
CONSTRAINT fk_ stuinfo_ major FOREIGN KEY (majorid) REFERENCES major(id) #外键.

十一、主键与外键
主键和唯--的大对比:
保证唯一性是否 允许为空一 个 表中可以有多少个是 否允许组合
主键    V       x         至多有1个       V,但不推荐
唯-            V         可以有多个       V， 但不推荐

十二、事务的特性
事务的特性:
ACID
原子性: - -个事务不可再分割，要么都执行要么都不执行
一致性:一个事务执行会使数据从一一个一致状态切换到另外一个一致状态
隔离性:一个事务的执行不受其他事务的干扰
持久性: - -个事务一旦提交，则会永久的改变数据库的数据.

十三、数据库的隔离级别
对于同时运行的多个事务,当这些事务访问数据库中相同的数据时,如果没
有采取必要的隔离机制,就会导致各种并发问题:
➢脏读:对于两个事务T1, T2,T1读取了已经被T2更新但还没有被提交的字段.
     之后，若T2回滚,T1读取的内容就是临时且无效的.
➢不可重复读:对于两个事务T1, T2, T1读取了一个字段,然后T2更新了该字段.
          之后, T1再次读取同一个字段,值就不同了.
➢幻读:对于两个事务T1,T2,T1从一个表中读取了一个字段,然后T2在该表中插
     入了一些新的行.之后,如果T1再次读取同一个表,就会多出几行.
)数据库事务的隔离性:数据库系统必须具有隔离并发运行各个事务的能力,
使它们不会相互影响,避免各种并发问题.

●数据库提供的4种事务隔离级别:.
隔离级别
描述
READ UNCOMMITTED
允许事务读取未被其他事物提交的变更，脏读,不可重复读和幻读的问题都会出现
(读未提交数据)
READ COMMITED
只允许事务读取已经被其它事务提交的变更.可以避免脏读.但不可重复读和幻读问
(读已提交数据) 
题仍然可能出现
REPEATABLE READ
确保事务可以多次从一个字段中读取相同的值.在这个事务持续期问，禁止其他事物
(可重复读)
对这个字段进行更新.可以避免脏读和不可重复读，但幻读的问题仍然存在.
SERIALIZABLE(串 行化)
确保事务可以从一个表中读取相同的行.在这个事务持续期间,禁止其他事务对该表
执行插入,更新和删除操作.所有并发问题都可以避免,但性能十分低下.
●Oracle支持的2种事务隔离级别: READ COMMITED,
SERIALIZABLE。Oracle 默认的事务隔离级别为: READ
COMMITED~ c
●Mysq|支持4种事务隔离级别.Mysql默认的事务隔离级别
为:REPEATABLE READ

十四、存储过程
1.  CREATE procedure pre3()
    begin
    declare p1 int default 0;
    myloop : loop
      set p1 = p1+1;
      if p1 < 10 then iterate myloop;
      elseif p1 > 10 then leave myloop;
      end if;
      select p1;
    end loop myloop;
    end;

CALL pre3();

2.repeat语句
    REPEAT语句示例，id 值小于等于10之前，将重复执行循环过程，代码如下:
    DECLARE id INT DEFAULT 0;
    REPEAT
      SET id = id+ 1;
    UNTIL id>= 10
    END REPEAT:
3.while语句
 WHILE语句示例，i值小于10时，将重复执行循环过程，代码如下:
DECLARE i INT DEFAULT 0;
    WHILE i<10 DO
       SET i= i+1;
    END WHILE;
4.创建函数
#案例1:根据传入的成绩，来显示等级，比如传入的成绩: 90-100， 返回A，80-90， 返回B，60-80， 返回c，否则，返回D
CREATE FUNCTION test_ if(score INT) RETURNS CHAR
白BEGIN
IF score>=90 AND score<=100 THEN RETURN 'A' ;
ELSEIF score>=80 THEN RETURN 'B' ;
ELSEIF score>=60 THEN RETURN 'C' ;
ELSE RETURN 'D' ;
END IF;
END $
set global log_bin_trust_function_creators=TRUE(先执行，否则会报错1418)
 create function fn1 (sid int)
  returns int
   begin
   return (select count(*) from emp where id = sid);
  end
    #------------------------------案例演示-------
  #1.无参有返回
  #案例:返回公司的员工个数
  CREATE FUNCTION myf1 () RETURNS INT
  ]BEGIN
  DECLARE c INT DEFAULT 0;#定义变量
  SELECT COUNT(*) INTO c# 赋值
  FROM employees;
  RETURN C;
  END $
  SELECT myf1 () $
   案例2: 
      CREATE FUNCTION myf2 (empName VARCHAR(20) ) RETURNS DOUBLE
      日BEGIN
      SET @sal=0;#定义用户变量
      SELECT salary INTO @sal
      #赋值
      FROM employees
      WHERE last name = empName; 
      RETURN @sal ;
      LEND $
      SELECT myf2('k_ _ing') $
      ##f7J2: EÈßl]Z, iE®iÈÈßJÉJFtJIR
      CREATE FUNCTION myf3 (deptName VARCHAR(20) )
      RETURNS DOUBLE
      BEGIN
      DECLARE
      sal
      DOUBLE
      SELECT AVG(salary)
      INTO sal
      FROM employees
      JOIN
      departments d ON e. department_ id = d. department_ id
      WHERE d. depar tment_ name=deptName ;
      RETURN sal;
      END $
      SELECT myf3(' IT') $
    #三、查看函数
      SHOW CREATE FUNCTION myf3;
      #四、删除函数
      DROP FUNCTION myf3;
      #案例
      #一、创建函数，实现传入两个float，返回二者之和
      CREATE FUNCTION test fun1 (num1 FLOAT, num2 FLOAT)
      BEGIN
      DECLARE SUM FLOAT DEFAULT 0;
      SET SUM=num1 +num2 ;
      RETURN SUM;
      .END$
      SELECT test_ fun1 (1,2) $

十五、视图
 1.create or REPLACE view t_view as select quantity,price,price*quantity total from t
   select * from t_view
 2.查看视图详细信息：show create view t_view

十六、设置隔离级别
  1.查询当前数据库事务的隔离级别
    select @@transaction_isolation;
  2.设置事务隔离级别
    //设置read uncommitted级别：
    set session transaction isolation level read uncommitted;

    //设置read committed级别：
    set session transaction isolation level read committed;

    //设置repeatable read级别：
    set session transaction isolation level repeatable read;

    //设置serializable级别：
    set session transaction isolation level serializable;

    设置数据库系统的全局的隔离级别:
    set global transaction isolation level read committed;
十七、事务关键词
  set atuocommit = 0;
  start transaction ;
  savepoint;
  rollback,commit
  #3.演示savepoint的使用
  SET autocommit=0;
  START TRANSACTION ;
  DELETE FROM account WHERE id=25;
  SAVEPOINT a;#设置保存点
  DELETE FROM account WHERE id=28;
  ROLLBACK TO a;# 回滚到保存点

视图的可更新性和视图中查询的定义有关系，以下类型的|
视图是不能更新的。
包含以下关键字的sg!语句:分组函数、distinct、 group by
having、union或 者union all
常量视图
Select中包含子查询
中
join
from一个不能更新的视图
where子句的子查询引用了from子句中的表

十八、查看变量
  1.查看全局变量
    show gloabal variables;
  2.查看部分的全局变量
    show global variables like '%transaction_isolation%'
  3.查看指定的全局变量的值
    show @@globle.autocommit;

十九、存储过程例子
#案例2 :创建存储过程实现，用户是否登录成功
  CREATE PROCEDURE myp4 (IN username VARCHAR(20) , IN PASSWORD VARCHAR (20) )
  BEGIN
  DECLARE result INT DEFAULT 0;#声明并初始化
  SELECT COUNT (*) INTo result#赋值
  FROM admin
  WHERE admin.username = username
  AND admin.password = PASSWORD;
  SELECT IF (result>0, '
成功', '失败') ;#使用
  END $

#案例3:根据女神名，返回对应的男神名
  CREATE PROCEDURE myp5 (IN beautyName VARCHAR (20) , OUT boyName VARCHAR(20) )
  ]BEGIN
  SELECT bo. boyName INTO boyName
  FROM boys bo
  INNER JOIN beauty b ON bo.id = b.boyfriend id
  WHERE b. name=beautyName ;
  END $
  #调用
  CALL myp5('小昭' , @bName)
  SELECT @bName 

#案例4:根据女神名，返回对应的男神名和男神魅力值
  CREATE PROCEDURE myp6 (IN beautyName VARCHAR(20) , OUT boyName VARCHAR(20) ,OUT userCP INT)
  ] BEGIN
  SELECT bo.boyName ,bo.userCP INTO boyName, userCP
  FROM boys bo
  INNER JOIN beauty b ON bo.id = b.boyfriend id
  WHERE b. name=beautyName;
  END $
  #调用
  CALL myp6('小昭' , @bName, @usercp) $
   SELECT @bName，@usercp

  #5.创建带inout模式参数的存储过程
   #案例1:传入a和b两个值，最终a和b都翻倍并返回
    CREATE PROCEDURE myp8 (INOUT a INT， INOUT b INT)
    BBEGIN
    SET a=a*2 ;
    SET b=b*2 ;
    END $
    #调用
    SET @m=10
    SET @n=20
    CALL myp8 (@m, @n) 
    select @m,@n
  查看存储过程:
  show create procedure my2
  #案例
#6.带条件语句存储过程，根据传入的成绩，来显示等级，比如传入的成绩: 90-100， 显示A，80-90， 显示B，60-80， 显示c，否则，显示D
  CREATE PROCEDURE test_ case(IN score INT)
  BEGIN
  CASE
  WHEN score>=90 AND score<=100 THEN SELECT 'A' ;
  WHEN score>=80 THEN SELECT 'B';
  WHEN score>=60 THEN SELECT 'C' ;
  ELSE SELECT 'D' ;
  END CASE;
  END $

#7.案例:批量插入，根据次数插入到admin表中多条记录
  CREATE PROCEDURE pro_ while1 (IN insertCount INT)
  日BEGIN
  DECLARE i INT DEFAULT 1 ;
  白
  a:WHILE i<=insertCount DO
  INSERT INTO admin (username,、password^) VALUES('Rose'+i, '666') ;
  SET i=i+1;
  END WHILE a;
  END S
  #2.添加leave语句
#案例:批量插入，根据次数插入到admin表中多条记录，如果次数>20则停止
TRUNCATE TABLE adminS
DROP PROCEDURE test_ while1S .
CREATE PROCEDURE test_ while1 (IN insertCount INT)
BEGIN
DECLARE i INT DEFAULT 1;
a:WHILE i<=insertCount DO
INSERT INTO admin (username,、password^) VALUES (CONCAT ('xiaohua' ,i) , '0000') ;
IF i>=20 THEN LEAVE a;
END IF ;
SET i=i+1;
END WHILET a;
END $

二十、mysql锁相关
 1.表锁（偏读）
  a.#手动增加锁表;
   lock table t1(表名) read(write) ,t2 read(write),其他;
   说明：读锁是共享锁,不同session都可以同时读取表；
   读锁：当前session可以查询锁定的表，不能查询未锁定的其他表，不能更新；其他session可以读取锁定的表和未锁定的表，不能更新锁定的表；
  b.查看表加过的锁；
  show open tables;
MyISAM在执行查询语句(SELECT) 前，会自动给涉及的所有表加读锁，在执行增删改操作前，会自动给涉及的表加写锁。
MySQL的表级锁有两种模式:
表共享读锁(Table Read Lock)
表独占写锁(Table Write Lock)
结论:
结合上表，所以对MyISAM表进行操作，会有以下情况:
1、对MyISAM表的读操作(加读锁)，不会阻塞其他进程对同一表的读请求，但会阻塞对同- -表的写请求。只有当读锁释放后，
才会执行其它进程的写操作。
2、对MyISAM表的写操作(加写锁)，会阻塞其他进程对同一表的读和写操作，只有当写锁释放后，才会执行其它进程的读写操
简而言之，就是读锁会阻塞写，但是不会堵塞读。而写锁则会把读和写都堵塞。
3.查看锁时间 show status like "table%"
InnoDB与MyISAM的最大不同有两点:一是支持事务(TRANSACTION) ;二是采用了行级锁
+由于行锁支持事务，复习老知识.
B、锁定一行：
 1.begin
 select * from a1 where name = 'a' for update ;
 commit;
 2.查看行级锁定状态InnoDB;
   show status like 'innodb_row_lock%'

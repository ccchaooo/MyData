REM 添加字段
alter table T_JSXM_BDXX_INFO add (C_XMDLYZDW  varchar2(2000)  );
REM 添加字段注释：
comment on column t1.id is 'id';
REM 添加表注释：
COMMENT ON table t1 IS '个人信息';
REM 删除字段
alter table T_BJSY_CODE_FLDM drop column  C_SM;


--只读结果的查询可以使用decode 
b.C_ZYGC,b.C_ZBFBLX,decode(b.C_ZBFBLX,'1','总承包','2','总承包分包专业工程','3','招标人直接发包工程') C_ZBFBLXMC,

--使用Oracle自带的row_number()函数能够实现自动增加序号列的要求，但是同时引发一个问题，如果我们查询出来的数据需要使用Order By排序的话，那么我们会发现新增加的序号列是乱序的，它会根据我们Order By后面的字段重新排序，那么怎么解决这一问题呢。
--    很简单，我们再加上根据Order By排序就可以了。
select row_number() over(ORDER BY t.field0),  
t.field2,  
t.field3   
from table t   
ORDER BY t.field1;

--直接生成某选项的属性
NVL2(a.n_bdid,'true','') AS "selected"

--Oracle递归查询
SELECT * FROM T_BJSY_CP_FLDM ; 
SELECT N_FLID, C_FATHER,C_CPFLDM,LEVEL --,C_FLMC,C_FLMCQC,C_SM,C_YXBZ

from T_BJSY_CP_FLDM 

start with C_CPFLDM=00 

connect by C_FATHER=PRIOR C_CPFLDM  order by level,C_FATHER,C_CPFLDM ASC;


--查询被锁的对象
select object_name,machine,s.sid,s.serial#, 'alter system kill session '''||s.sid||','||s.serial#||''';'
  from v$locked_object l,dba_objects o ,v$session s
 where l.object_id = o.object_id
   and l.session_id = s.sid;


--如何在Oracle中复制表结构和表数据 【转载】
--1. 复制表结构及其数据：
create table table_name_new as select * from table_name_old
--2. 只复制表结构：
create table table_name_new as select * from table_name_old where 1=2;
--或者：
create table table_name_new like table_name_old
--3. 只复制表数据：
--如果两个表结构一样：
insert into table_name_new select * from table_name_old
--如果两个表结构不一样：
insert into table_name_new(column1,column2...) select column1,column2... from table_name_old

--更新多条字段
--对GSMC_GUID_VALUE_KEY与T_ZJSYS_ZJGC_ZTDWXX公司名称相同的记录进行操作,将B表的GUID更新至A表
 UPDATE T_ZJSYS_ZJGC_ZTDWXX mbt
 SET mbt.c_guid = (SELECT gs.c_guid 
   FROM GSMC_GUID_VALUE_KEY gs
   WHERE gs.c_gsmc = mbt.C_ZTDWMC)
 WHERE mbt.C_GUID IS NULL
   AND mbt.C_ZTDWMC IS NOT NULL
   AND EXISTS
 (SELECT 1 FROM GSMC_GUID_VALUE_KEY B WHERE mbt.C_ZTDWMC = B.C_GSMC);

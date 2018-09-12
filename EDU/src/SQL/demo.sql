
删除一张表重复记录（ID是自增唯一，重复记录：其他字段都是一样）
非常经典的一道面试题（可能存在很多数据，要求性能比较高）
1 louis 20
2 louis 20
3 jimmy 30
-37-
4 louis 20
------------------------------------------------------------------
delete from aa where id not in(select min(id) from aa group by name,age);

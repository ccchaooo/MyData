# encoding: utf-8
import mysql.connector
conn = mysql.connector.connect(
    user='root', password='chao1006', database='db')
cursor = conn.cursor()
# 建表
# cursor.execute('create table user (id varchar(20) , name varchar(20))')
# 插入数据
cursor.execute('insert into user (id, name) values (%s, %s)', ['6', 'Michael'])
cursor.execute('insert into user (id, name) values (%s, %s)', ['1', 'Michael'])
print("rowcount: %s" % cursor.rowcount)

# 提交事务
conn.commit()
# 关闭连接
cursor.close()


cursor = conn.cursor()
cursor.execute('select * from user where id = %s', ('6',))
values = cursor.fetchall()
print(values)
cursor.close()
conn.close()

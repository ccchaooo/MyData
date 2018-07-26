# 面向对象高级编程之 __slots__


# __slots__用于限制一个类的事例可以添加的属性
# __slots__定义的属性仅对当前类实例起作用，对继承的子类是不起作用的


class Student(object):
  __slots__ = ('name', 'age')


zhangsan = Student()

zhangsan.name = "张三"
zhangsan.age = "18"

print("姓名:%s,年龄:%s" % (zhangsan.name, zhangsan.age))

# 此行代码将报错
# zhangsan.gender = '女'


# 注意 __slots__定义的属性仅对当前类实例起作用，对继承的子类是不起作用的

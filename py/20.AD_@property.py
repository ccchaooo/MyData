# 使用@property


# 普通的setter和getter
class Student(object):
  def get_score(self):
    return self._score

  def set_score(self, value):
    if not isinstance(value, int):
      raise ValueError("分数只能是数值")
    if value < 0 or value > 100:
      raise ValueError("分数只能在0-100之间")
    self._score = value


lili = Student()
# 用于测试数值验证
# lili.set_score("abc")
# lili.set_score(-10)
# lili.set_score(120)
lili.set_score(95)
print("lili的得分是%s分" % lili.get_score())


# 使用Python内置的Python内置的decorator(装饰器) @property

class Teacher(object):
  # @property把一个getter方法变成属性
  @property
  def age(self):
    return self._age

  # @property本身又创建了另一个装饰器@score.setter，负责把一个setter方法变成属性赋值
  @age.setter
  def age(self, value):
    if not isinstance(value, int):
      raise ValueError("年龄只能是数值")
    if value > 200 or value < 0:
      raise ValueError("年龄不在合理范围内")
    self._age = value


t = Teacher()
# 用于测试数值验证
# t.age = "abc"
# t.age = -10
# t.age = 300
t.age = 25
print("年龄:%s岁" % t.age)


# 定义只读属性，只定义getter方法，不定义setter方法就是一个只读属性：
class Dog(object):
  def __init__(self):
    self._name = "胖虎"

  @property
  def name(self):
    return self._name

  @property
  def age(self):
    return self._age

  @age.setter
  def age(self, value):
    if not isinstance(value, int):
      raise ValueError("年龄只能是数值")
    if value < 0:
      raise ValueError("年龄不能是负数")
    self._age = value


d = Dog()
# d.name = "大熊"  #name是只读属性
# d.age = "abc"
# d.age = -10
d.age = 10
print("狗子姓名:%s,年龄:%s岁" % (d.name, d.age))

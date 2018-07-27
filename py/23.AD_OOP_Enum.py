from enum import Enum, unique
# 创建枚举类
Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May',
                       'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
# value属性则是自动赋给成员的int常量，默认从1开始计数。
for name, member in Month.__members__.items():
  print(name, '=>', member, ',', member.value)


# 自定义枚举类(可是用任意int值)
@unique  # (装饰器,保证唯一性)
class Gender(Enum):
  Male = 0
  Female = 1


class Student(object):
  def __init__(self, name, gender):
    self.name = name
    self.gender = gender


bart = Student('bart', Gender.Male)
if bart.gender == Gender.Male:
  print("pass test")
else:
  print("can't pass test")

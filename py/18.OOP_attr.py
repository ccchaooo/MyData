# 由于Python是动态语言，根据类创建的实例可以任意绑定属性。
# 给实例绑定属性的方法是通过实例变量，或者通过self变量：


class Student(object):
  def __init__(self, name):
    self.name = name


s = Student('Bob')
s.score = 90


# Student类本身需要绑定一个属性呢？可以直接在class中定义属性，这种属性是类属性，归Student类所有：
class Student(object):
  name = 'Student'


# 小结

# 实例属性属于各个实例所有，互不干扰；

# 类属性属于类所有，所有实例共享一个属性；

# 不要对实例属性和类属性使用相同的名字，因为相同名称的实例属性将屏蔽掉类属性(实例覆盖类)

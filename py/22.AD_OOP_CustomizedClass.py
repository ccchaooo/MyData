# 1.__slots__ 用于限制实例可以添加的属性

# 2.__str__() 类似于toString()方法


class Student(object):
  def __init__(self, name):
    self.name = name

  def __str__(self):
    return "Student Object (name:%s)" % self.name

  __repr__ = __str__


# print(Student('jack'))
# 显示变量调用的不是__str__()，而是__repr__()
# Student('candy')


# 3.__iter__() __next__() 实现斐波那契数列
class Fib(object):
  def __init__(self, max):
    self.max = max
    self.a, self.b = 0, 1  # :初始化计数器

  def __iter__(self):
    return self  # 实例本身就是迭代器对象,所以返回自己

  def __next__(self):
    self.a, self.b = self.b, self.a + self.b  # :计算下一个值
    if self.a > self.max:
      raise StopIteration()
    return self.a

# 测试100个
# for i in Fib(100):
#   print(i)


# 4.__getitem__ 根据下标取元素
class Fib2(object):
  def __getitem__(self, n):
    a, b = 1, 1
    for i in range(n):
      a, b = b, a + b
    return a


f = Fib2()
print("Fib2 的第%s个元素是:%s" % (100, f[100]))


# 5.__getattr__ 用于动态调用,比如:返回不存在的属性
class Teacher(object):
  def __init__(self):
    self.name = 'zhangsan'

  def __getattr__(self, attr):
    if attr == 'age':
      return 27


t = Teacher()
print(t.name)
print(t.age)
# 注意，只有在没有找到属性的情况下，才调用__getattr__，已有的属性，比如name，不会在__getattr__中查找。


# 6.__call__ 调用实例本身
class Cat(object):
  def __init__(self, name):
    self.name = name

  def __call__(self):
    print("调用实例本身,cat's name is: % s" % self.name)


c = Cat('mewoo')
c()


# __call__()还可以定义参数。对实例进行直接调用就好比对一个函数进行调用一样，所以你完全可以把对象看成函数，把函数看成对象，因为这两者之间本来就没啥根本的区别。

# 如果你把对象看成函数，那么函数本身其实也可以在运行期动态创建出来，因为类的实例都是运行期创建出来的，这么一来，我们就模糊了对象和函数的界限。

# 那么，怎么判断一个变量是对象还是函数呢？其实，更多的时候，我们需要判断一个对象是否能被调用，能被调用的对象就是一个Callable对象

# 获取对象信息
# 1.使用type()判断对象类型
# 基本类型
print("使用type()测试 123 的类型:", type(123))
print("使用type()测试 'str' 的类型:", type('str'))
print("使用type()测试 None 的类型:", type(None))
# 引用类型
print("使用type()测试 abs 的类型:", type(abs))

# type()返回的是对应的Class类型
print()
print('# type()返回的是对应的Class类型')
print("使用type()测试 123 和 450 是否为相同的Class类型:", type(123) == type(450))
print("使用type()测试 123 和 int 是否为相同的Class类型:", type(123) == type(int))
print("使用type()测试 'abc' 和 'efg' 是否为相同的Class类型:", type('abc') == type('efg'))
print("使用type()测试 'abc' 和 str 是否为相同的Class类型:", type('abc') == type(str))
print("使用type()测试 123 和 'abc' 是否为相同的Class类型:", type(123) == type('abc'))


# 2.判断一个对象是否是函数
import types


def fn():
  pass


print("type(fn) == types.FunctionType", type(fn) == types.FunctionType)
print("type(abs) == types.BuiltinFunctionType",
      type(abs) == types.BuiltinFunctionType)
print("type(lambda x: x) == types.LambdaType",
      type(lambda x: x) == types.LambdaType)
print("type((x for x in range(10))) == types.GeneratorType",
      type((x for x in range(10))) == types.GeneratorType)


# 3.使用isinstance()判断class的继承关系
print("# 3.使用isinstance()判断class的继承关系")


class Animal(object):
  def run(self):
    print('Animal is running...')


class Dog(Animal):
  pass


class Cat(Animal):
  pass


a = Animal()
d = Dog()
c = Cat()
print("isinstance(c,Cat):", isinstance(c, Cat))
print("isinstance(c,Animal:", isinstance(c, Animal))
print("isinstance(c,Dog):", isinstance(c, Dog))


# 能用type()判断的基本类型也可以用isinstance()判断：
print("isinstance 'abc'是否是 str 的类型:", isinstance('abc', str))

# 使用isinstance()判断一个变量是否是某些类型中的一种，比如下面的代码就可以判断是否是list或者tuple：
print(isinstance([1, 2, 3], (list, tuple)))
print(isinstance((1, 2, 3), (list, tuple)))


# 3.使用dir()获得一个对象的所有属性和方法，它返回一个包含字符串的list，
# 比如，获得一个str对象的所有属性和方法：

# >> > dir('ABC')
# ['__add__', '__class__', ..., '__subclasshook__', 'capitalize', 'casefold', ..., 'zfill']

# 仅仅把属性和方法列出来是不够的，配合getattr()、setattr()以及hasattr()，我们可以直接操作一个对象的状态：

class MyObject(object):
  def __init__(self):
    self.x = 9

  def power(self):
    return self.x * self.x


hasattr(obj, 'x')  # 有属性'x'吗？
hasattr(obj, 'y')  # 有属性'y'吗？
setattr(obj, 'y', 19)  # 设置一个属性'y'
getattr(obj, 'y')  # 获取属性'y'

# 如果试图获取不存在的属性，会抛出AttributeError的错误
# 可以传入一个default参数，如果属性不存在，就返回默认值：
getattr(obj, 'z', 404)  # 获取属性'z'，如果不存在，返回默认值404

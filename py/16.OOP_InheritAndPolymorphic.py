# base class
class Animal(object):
  def run(self):
    print('Animal is running...')


# inheritedclass
class Dog(Animal):
  pass


class Cat(Animal):
  pass


dog = Dog()
dog.run()

cat = Cat()
cat.run()


class Duck(Animal):
  def run(self):
    print("duck is running")

  def eat(self):
    print("duck is eatting")


duck = Duck()
print("重写基类方法:run()")
duck.run()
print("添加新方法:eat()")
duck.eat()


# 理解多态
def run_twice(animal):
  animal.run()
  animal.run()


run_twice(Duck())


# 多态真正的威力：
# 调用方只管调用，不管细节，而当我们新增一种Animal的子类时，只要确保run()方法编写正确，不用管原来的代码是如何调用的。


# 这就是著名的“开闭”原则：
# 对扩展开放：允许新增Animal子类；
# 对修改封闭：不需要修改依赖Animal类型的run_twice()等函数。


# 静态语言 vs 动态语言

# 对于静态语言（例如Java）来说，如果需要传入Animal类型，则传入的对象必须是Animal类型或者它的子类，否则，将无法调用run()方法。
# 对于Python这样的动态语言来说，则不一定需要传入Animal类型。我们只需要保证传入的对象有一个run()方法就可以了：

class Timer(object):
  def run(self):
    print("这是鸭子类型", 'Start...')


run_twice(Timer())
# 这就是动态语言的“鸭子类型”，它并不要求严格的继承体系，一个对象只要“看起来像鸭子，走起路来像鸭子”，那它就可以被看做是鸭子。

# Python的“file-like object“就是一种鸭子类型。对真正的文件对象，它有一个read()方法，返回其内容。但是，许多对象，只要有read()方法，都被视为“file-like object“。
# 许多函数接收的参数就是“file-like object“，你不一定要传入真正的文件对象，完全可以传入任何实现了read()方法的对象。


# 小结

# 继承可以把父类的所有功能都直接拿过来，这样就不必重零做起，子类只需要新增自己特有的方法，也可以把父类不适合的方法覆盖重写。

# 动态语言的鸭子类型特点决定了继承不像静态语言那样是必须的。

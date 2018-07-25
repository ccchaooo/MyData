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


class duck(Animal):
  def run(self):
    print("duck is running")

  def eat(self):
    print("duck is eatting")


duck = duck()
print("重写基类方法:run()")
duck.run()
print("添加新方法:eat()")
duck.eat()

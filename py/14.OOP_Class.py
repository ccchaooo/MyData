# 面向对象最重要的概念就是类（Class）和实例（Instance），必须牢记类是抽象的模板，比如Student类。
# 而实例是根据类创建出来的一个个具体的“对象”，每个对象都拥有相同的方法，但各自的数据可能不同。


# 类的定义
# 注意到__init__方法的第一个参数永远是self，表示创建的实例本身，因此，在__init__方法内部，就可以把各种属性绑定到self，因为self就指向创建的实例本身。
# 有了__init__方法，在创建实例的时候，就不能传入空的参数了，必须传入与__init__方法匹配的参数，但self不需要传，Python解释器自己会把实例变量传进去。
class Student(object):

  def __init__(self, name, score):
    self.name = name
    self.score = score

  def print_score(self):
    print('%s: %s' % (self.name, self.score))


lili = Student('lili', 98)
print(lili.print_score())


# 小结

# 类是创建实例的模板，而实例则是一个一个具体的对象，各个实例拥有的数据都互相独立，互不影响；

# 方法就是与实例绑定的函数，和普通函数不同，方法可以直接访问实例的数据；

# 通过在实例上调用方法，我们就直接操作了对象内部的数据，但无需知道方法内部的实现细节；

# 和静态语言不同，Python允许对实例变量绑定任何数据，也就是说，对于两个实例变量，虽然它们都是同一个类的不同实例，但拥有的变量名称都可能不同。

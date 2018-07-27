# 1.type()
# 动态语言和静态语言最大的不同，就是函数和类的定义，不是编译时定义的，而是运行时动态创建的。

# type()函数既可以返回一个对象的类型，又可以创建出新的类型，
# 比如，我们可以通过type()函数创建出Hello类，而无需通过class Hello(object)...的定义


# 要创建一个class对象，type()函数依次传入3个参数：
# 1.class的名称；
# 2.继承的父类集合，注意Python支持多重继承，如果只有一个父类，别忘了tuple的单元素写法；
# 3.class的方法名称与函数绑定，这里我们把函数fn绑定到方法名say上。
def fn(self, name='world'):
  print("hello,%s!" % name)


Hello = type('Hello', (object,), dict(say=fn))  # 创建Hello class
# 创建的结果如下:
# class Hello(object):
#   def say(self, name='world'):
#   print("hello,%s!", name)
h = Hello()
h.say()
print(type(Hello))
print(type(h))


# 2.metaclass
# metaclass，直译为元类，简单的解释就是：
# 当我们定义了类以后，就可以根据这个类创建出实例，所以：先定义类，然后创建实例。
# 但是如果我们想创建出类呢？那就必须根据metaclass创建出类，所以：先定义metaclass，然后创建类。
# 连接起来就是：先定义metaclass，就可以创建类，最后创建实例。
# 所以，metaclass允许你创建类或者修改类。换句话说，你可以把类看成是metaclass创建出来的“实例”。(有点像java的reflection)

# 举例 给我们自定义的MyList增加一个add方法：
class ListMetaclass(type):
  def __new__(cls, name, bases, attrs):
    attrs['add'] = lambda self, value: self.append(value)
    return type.__new__(cls, name, bases, attrs)


# 是用metaclass创建类
class Mylist(list, metaclass=ListMetaclass):
  pass


# 测试
L = Mylist()
L.add(1)
print(L)


##############################################################################################################################
# 通过metacl编写ORM框架
# ORM:Object Relational Mapping，即对象-关系映射
# 编写底层模块的第一步，就是先把调用接口写出来。比如，使用者如果使用这个ORM框架，想定义一个User类来操作对应的数据库表User，我们期待他写出这样的代码：

# class User(Model):
#     # 定义类的属性到列的映射：
#   id = IntegerField('id')
#   name = StringField('username')
#   email = StringField('email')
#   password = StringField('password')

# # 创建一个实例：
# u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# # 保存到数据库：
# u.save()

# 其中，父类Model和属性类型StringField、IntegerField是由ORM框架提供的，剩下的魔术方法比如save()全部由metaclass自动完成。
# 虽然metaclass的编写会比较复杂，但ORM的使用者用起来却异常简单。


# 现在，我们就按上面的接口来实现该ORM。
# 首先来定义Field类，它负责保存数据库表的字段名和字段类型：


class Field(object):

  def __init__(self, name, column_type):
    self.name = name
    self.column_type = column_type

  def __str__(self):
    return '<%s:%s>' % (self.__class__.__name__, self.name)


# 在Field的基础上，进一步定义各种类型的Field，比如StringField，IntegerField等等：
class StringField(Field):

  def __init__(self, name):
    super(StringField, self).__init__(name, 'varchar(100)')


class IntegerField(Field):

  def __init__(self, name):
    super(IntegerField, self).__init__(name, 'bigint')


# 下一步，就是编写最复杂的ModelMetaclass了：
class ModelMetaclass(type):

  def __new__(cls, name, bases, attrs):
    if name == 'Model':
      return type.__new__(cls, name, bases, attrs)
    print('Found model: %s' % name)
    mappings = dict()
    for k, v in attrs.items():
      if isinstance(v, Field):
        print('Found mapping: %s ==> %s' % (k, v))
        mappings[k] = v
    for k in mappings.keys():
      attrs.pop(k)
    attrs['__mappings__'] = mappings  # 保存属性和列的映射关系
    attrs['__table__'] = name  # 假设表名和类名一致
    return type.__new__(cls, name, bases, attrs)


# 以及基类Model：
class Model(dict, metaclass=ModelMetaclass):

  def __init__(self, **kw):
    super(Model, self).__init__(**kw)

  def __getattr__(self, key):
    try:
      return self[key]
    except KeyError:
      raise AttributeError(r"'Model' object has no attribute '%s'" % key)

  def __setattr__(self, key, value):
    self[key] = value

  def save(self):
    fields = []
    params = []
    args = []
    for k, v in self.__mappings__.items():
      fields.append(v.name)
      params.append('?')
      args.append(getattr(self, k, None))
    sql = 'insert into %s (%s) values (%s)' % (
        self.__table__, ','.join(fields), ','.join(params))
    print('SQL: %s' % sql)
    print('ARGS: %s' % str(args))


# 当用户定义一个class User(Model)时，Python解释器首先在当前类User的定义中查找metaclass，如果没有找到，就继续在父类Model中查找metaclass，找到了，就使用Model中定义的metaclass的ModelMetaclass来创建User类，也就是说，metaclass可以隐式地继承到子类，但子类自己却感觉不到。


# 在ModelMetaclass中，一共做了几件事情：

#     排除掉对Model类的修改；

#     在当前类（比如User）中查找定义的类的所有属性，如果找到一个Field属性，就把它保存到一个__mappings__的dict中，同时从类属性中删除该Field属性，否则，容易造成运行时错误（实例的属性会遮盖类的同名属性）；

#     把表名保存到__table__中，这里简化为表名默认为类名。

# 在Model类中，就可以定义各种操作数据库的方法，比如save()，delete()，find()，update等等。

# 我们实现了save()方法，把一个实例保存到数据库中。因为有表名，属性到字段的映射和属性值的集合，就可以构造出INSERT语句。

# 测试代码:
class User(Model):
    # 定义类的属性到列的映射：
  id = IntegerField('id')
  name = StringField('username')
  email = StringField('email')
  password = StringField('password')


u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
u.save()

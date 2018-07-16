# 1.位置参数
def power(x, n):
  s = 1
  while n > 0:
    n = n - 1
    s = s * x
  return s


# 2.默认参数(必选参数在前，默认参数在后)
# tips1: 变化大的参数放前面，变化小的参数放后面。变化小的参数就可以作为默认参数。
# tips2: 定义默认参数要牢记一点：默认参数必须指向不变对象！
def power_def_arg(x, n=2):
  s = 1
  while n > 0:
    n = n - 1
    s = s * x
  return s


# 3.可变参数
# tips:将tuple或者list转换为可变参数
def calc(*numbers):
  sum = 0
  for n in numbers:
    sum = sum + n * n
  return sum

# 普通调用
# print(calc(3, 4, 5, 6))
# 将tuple或者list转换为可变参数
# l = (1, 2, 3, 4, 5, 6)
# print(calc(*l))


# 4.关键字参数,关键字参数在函数内部自动组装为一个dict
# tips:正如可变参数可以将tuple或者list转换为可变参数,关键字参数可以将dict转换为参数
# tips:kw是参数的
def person(name, age, **kw):
  print("name", name, "age", age, "可变参数dict", kw)
# person("张三", 18)
# person("张三", 18, city='成都', gender="女")

# 关键字参数可以将dict转换为参数
# d = {"city": "成都", "gender": "女", "hight": 165};
# person("张三", 18, **d)


# 5.命名关键字参数,与关键字参数**kw不同。 命名关键字参数需要一个特殊分隔符*，*后面的参数被视为命名关键字参数。
def person_arg_named(name, age, *, city, job):
  print(name, age, city, job)


# 如果函数定义中已经有了一个可变参数，后面跟着的命名关键字参数就不再需要一个特殊分隔符*了：
def person_arg_named_with_variable_agrs(name, age, *args, city, job):
  print(name, age, args, city, job)


# 命名关键字参数必须传入参数名，这和位置参数不同。如果没有传入参数名，调用将报错
# 命名关键字参数可以有缺省值，从而简化调用：
def person_arg_name_def(name, age, *, city='Beijing', job):
  print(name, age, city, job)


# 使用命名关键字参数时，要特别注意，如果没有可变参数，就必须加一个*作为特殊分隔符。如果缺少*，Python解释器将无法识别位置参数和命名关键字参数：
def person(name, age, city, job):
    # 缺少 *，city和job被视为位置参数
  pass


# 小结:
# 参数组合:
# 在Python中定义函数，可以用必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数都可以组合使用。
# 但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。

# 小结2

# Python的函数具有非常灵活的参数形态，既可以实现简单的调用，又可以传入非常复杂的参数。

# 默认参数一定要用不可变对象，如果是可变对象，程序运行时会有逻辑错误！

# 要注意定义可变参数和关键字参数的语法：

# *args是可变参数，args接收的是一个tuple；

# **kw是关键字参数，kw接收的是一个dict。

# 以及调用函数时如何传入可变参数和关键字参数的语法：

# 可变参数既可以直接传入：func(1, 2, 3)，又可以先组装list或tuple，再通过*args传入：func(*(1, 2, 3))；

# 关键字参数既可以直接传入：func(a=1, b=2)，又可以先组装dict，再通过**kw传入：func(**{'a': 1, 'b': 2})。

# 使用*args和**kw是Python的习惯写法，当然也可以用其他参数名，但最好使用习惯用法。

# 命名的关键字参数是为了限制调用者可以传入的参数名，同时可以提供默认值。

# 定义命名的关键字参数在没有可变参数的情况下不要忘了写分隔符*，否则定义的将是位置参数。

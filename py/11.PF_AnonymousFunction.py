# 匿名函数lambda x: x * x实际上就是：


def f(x):
  return x * x


print(list(map(lambda x: x * x, [1, 2, 3, 4, 5, 6, 7, 8, 9])))


# 匿名函数赋值给一个变量
# f = lambda x: return x * x

# 匿名函数作为返回值
def build(x, y):
  return lambda x * x + y * y

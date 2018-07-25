# 偏函数原型
def int2(x, base=16):
  return int(x, base)


print(int2('123456789'))


# functools.partial就是帮助我们创建一个偏函数的
import functools
int2 = functools.partial(int, base=2)
print(int2('111111'))


# 小结
# 当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数，这个新函数可以固定住原函数的部分参数，从而在调用时更简单

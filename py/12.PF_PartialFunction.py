# 偏函数原型
def int2(x, base=16):
  return int(x, base)


print(int2('123456789'))


# functools.partial就是帮助我们创建一个偏函数的
import functools
int2 = functools.partial(int, base=2)
print(int2('111111'))

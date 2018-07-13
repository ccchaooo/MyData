# 1.invoke
from fundemo import my_abs
# result = my_abs("99")
# print(result)

# 可以返回多个值
from fundemo import doublereseult
# print(doublereseult())

# 内置函数
import math
print(math.pi)


# import math语句表示导入math包，并允许后续代码引用math包里的sin、cos等函数。
def move(x, y, step, angle=0):
  nx = x + step * math.cos(angle)
  ny = y - step * math.sin(angle)
  return nx, ny


# 返回值是一个tuple
# 但是，在语法上，返回一个tuple可以省略括号，而多个变量可以同时接收一个tuple，按位置赋给对应的值，所以，Python的函数返回多值其实就是返回一个tuple，但写起来更方便。
x, y = move(100, 100, 60, math.pi / 6)
print(x, y)
# 结果: 151.96152422706632 70.0
# 但其实这只是一种假象，Python函数返回的仍然是单一值：

r = move(100, 100, 60, math.pi / 6)
print(r)
# 结果: (151.96152422706632, 70.0)

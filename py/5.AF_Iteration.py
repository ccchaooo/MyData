# 导入迭代器模块
from collections import Iterable
# 在任何可迭代的对象都可以执行
# 检测一个对象是否可以被迭代
isinstance('abc', Iterable)
# dict
d = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'g': 6}
for key in d:
  print(key)
for value in d.values():
  print(value)
for k, v in d.items():
  print('key:', k, 'value:', v)

# 字符串
for ch in 'abc':
  print(ch)

# Python内置的enumerate函数可以把一个list变成索引-元素对
for i, values in enumerate({'a': 1, 'b': 2, 'c': 3}):
  print(i, value)

for x, y in [(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]:
  print(x, y)

# 习题 迭代器查询list 中的最大值和最小值
L = [1, 3, 4, 5, 6, 7, 88, 9, 3, 32, -1]
for x in L:
  if(x < L[0]):
    L[0] = x
  elif x > L[-1]:
    L[-1] = x
  print(L[0], L[-1])

# next()函数调用并不断返回下一个值的对象称为迭代器：Iterator。
# list、dict、str虽然是Iterable，却不是Iterator。

# 判断一个对象是否可迭代
from collections import Iterable
print(isinstance([], Iterable))

from collections import Iterator
print(isinstance([], Iterator))

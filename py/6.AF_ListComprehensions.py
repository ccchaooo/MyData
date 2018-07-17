# 导入迭代器模块
# 普通循环生产平方列表
L = []
for x in range(1, 11):
  L.append(x * x)
print(L)

# 列表产生器
print([x * x for x in range(11, 22)])

# 嵌套循环
print([m + n for m in 'ABC' for n in 'XYZ'])

import os  # 导入os模块，模块的概念后面讲到
# 列表产生器输出当前目录下所有文档
print([d for d in os.listdir('.')])  # os.listdir可以列出文件和目录

# for循环其实可以同时使用两个甚至多个变量，比如dict的items()可以同时迭代key和value：
d = {'x': 'A', 'y': 'B', 'z': 'C'}
for k, v in d.items():
  print(k, '=', v)

# AF_Slice
L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']
# 取前3个元素
print(L[1:3])
# 从0开始的话, 可以省略第一个参数
print(L[:3])
# 倒数切片
print(L[-3:-1])
# 倒着切片至最后一个
print(L[-2:])

# range(start, stop[, step])
L = list(range(100))
print(L)

# 可以通过切片轻松取出某一段数列。
# 比如前10个数：
print(L[:10])

# 后10个数：
print(L[-10:])

# 前11-20个数：
print(L[10:20])

# 前10个数，每两个取一个：
print(L[:10:2])

# 所有数，每5个取一个：
print(L[::5])


# tuple也是一种list，唯一区别是tuple不可变。因此，tuple也可以用切片操作，只是操作的结果仍是tuple：
L = (0, 1, 2, 3, 4, 5)
print(L[:3])

# 字符串'xxx'也可以看成是一种list，每个元素就是一个字符。因此，字符串也可以用切片操作，只是操作结果仍是字符串：
str = 'ABCDEFG'
print(str[:3])
print(str[::2])

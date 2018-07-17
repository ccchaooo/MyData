# 列表生成式与生成器的区别
# 列表生产式:
L = [x * x for x in range(5)]
print(L)

# 列表生成器
L = (x * x for x in range(10))
# L是一个对象,next方法可以获取下一个值
print(next(L))
print(L)
# list方法强制生成器对象L将全部值计算出来
for x in list(L):
  print(x)


# 函数生成器
# 函数和generator仅一步之遥。要把fib函数变成generator，只需要把print(b)改为yield b就可以了：
def fib(max):
  n, a, b = 0, 0, 1
  while n < max:
    yield b
    a, b = b, a + b
    n = n + 1
  return 'done'


# generator的函数，在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行。
g = fib(1000)
for x in range(100):
  print(next(g))

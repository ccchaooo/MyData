# 1.map:
# map()函数接收两个参数，一个是函数，一个是Iterable，
# map将传入的函数依次作用到序列的每个元素，并把结果作为新的Iterator返回。


def f(x):
  return x * x


rf = map(f, range(10))  # 返回迭代器对象
print(rf)
print(list(rf))


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 2.reduce
# reduce()把一个函数作用在一个序列[x1, x2, x3, ...]上，
# 这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，
# 其效果就是：reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)


def add(x, y):
  return x + y


from functools import reduce
ra = reduce(add, range(101))
print(ra)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 示例:str转int


def fn(x, y):
  return x * 10 + y


def char2num(s):
  digits = {'0': 0, '1': 1, '2': 2, '3': 3,
            '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}
  return digits[s]


result = reduce(fn, map(char2num, '99886'))
print(result)


# 3.filter()也接收一个函数和一个序列。
# 和map()不同的是，filter()把传入的函数依次作用于每个元素，然后根据返回值是True还是False决定保留还是丢弃该元素。
def is_odd(x):
  return x % 2 == 1


r_f = filter(is_odd, range(100))
print(list(r_f))


# 用filter求素数 埃氏筛法
# 构造奇数数列(这是一个无限序列生成器)
def _odd_iter():
  n = 1
  while True:
    n = n + 2
    yield n


# 筛选函数：
def _not_divisible(n):
  return lambda x: x % n > 0


# 定义一个生成器，不断返回下一个素数：
def primes():
  yield 2
  it = _odd_iter()  # 初始序列
  while True:
    n = next(it)  # 返回序列的第一个数
    yield n
    it = filter(_not_divisible(n), it)  # 构造新序列


# primes()也是一个无限序列，所以调用时需要设置一个退出循环的条件：
# 打印1000以内的素数:
for n in primes():
  if n < 100:
    print(n)
  else:
    break

# 小结
# filter()的作用是从一个序列中筛出符合条件的元素。由于filter()使用了惰性计算，所以只有在取filter()结果的时候，才会真正筛选并每次返回下一个筛出的元素。

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 4.sorted
# key可以接受参数
print(sorted([1, 3, -2, 5], key=abs))
# reverse=True表示反向排列
print(sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower, reverse=True))

# 小结
# sorted()也是一个高阶函数。用sorted()排序的关键在于实现一个映射函数。

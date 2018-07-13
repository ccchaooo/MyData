# print("hello world!")
# print("100+200=", 100 + 200)

# 输入
# # name = input("plase input your name:")
# # print("hello ,", name, "!")
# print(["可变字符串", "01", "02"])

# 条件
# age = 17
# if age >= 18:
#   print("adult")
# elif age >= 6:
#   print("teenager")
# else:
#   print("kid")

# 输入字符串转码成int()
# year = int(input())
# if (year % 400 == 0) or (year % 100 != 0 and year % 4 == 0):
#   print("闰年")
# else:
#   print("平年")

# 测试是否肥胖
# print("BMI检测开始:")
# sg = int(input('请输入身高(Cm)'))
# sg = sg / 100
# tz = int(input('请输入体重(Kg)'))
# BMI = tz / (sg * sg)
# print('您的BMI指数为:', '%.1f' % BMI)
# if BMI < 18.5:
#   print('过轻')
# elif BMI >= 18.5 and BMI <= 25:
#   print('正常')
# elif BMI > 25 and BMI <= 28:
#   print('过重')
# elif BMI > 28 and BMI <= 32:
#   print('肥胖')
# elif BMI > 32:
#   print('严重肥胖')

# range 与 for
# print("请输入上限:")
# num = int(input())
# sum = 0
# for x in range(num):
#   sum = sum + x
# print(sum)

# while循环
# sum = 0
# n = 100
# while n > 0:
#   sum = sum + n
#   n = n - 2
# print(sum)

# n = 0
# while n < 100:
#   n = n + 1
#   if n % 2 == 0:  # 如果n是偶数，执行continue语句
#     continue  # continue语句会直接继续下一轮循环，后续的print()语句不会执行
#   print(n)
# 逻辑运算
# 与或非
and or not

# 除法
# 浮点除法:/ 结果为浮点数
>> > 9 / 3
3.0
# 地板除法:// 结果为整数
>> > 10 // 3
3
# 取余
>> > 10 % 3
1

# 集合
# 有序集合
# 可变有序集合:list
>> > namelist = ["张三", "李四", "王五", "王五", "钱六"]
# API
# 1.长度
>> > len(namelist)
3
# 2.索引访问
>> > namelist[1]
"李四"
>> > namelist[-1]
"钱六"
>> > namelist[-2]
"王五"
# 3.追加
>> > namelist.append("陈七")
>> > namelist
  ["张三", "李四", "王五", "王五", "钱六", "陈七"]
# 4.插入
>> > namelist.insert(1, "jack")
>> > namelist
  ["张三", "jack", "李四", "王五", "王五", "钱六", "陈七"]
# 5.删除末尾
>> > namelist.pop()
>> > namelist
  ["张三", "jack", "李四", "王五", "王五", "钱六"]
# 6.指定位置删除
>> > namelist.pop(1)
>> > namelist
  ["张三", "李四", "王五", "王五", "钱六"]
# 7.制定位置替换:根据下标直接赋值
>> > namelist[1] = "赵大"
>> > namelist
  ["张三", "赵大", "王五", "王五", "钱六"]
# 8.空数组长度为0
>> > l = []
>> > len(l)
0

# 不可变有序集合tuple(元组)
>> > t = (1, 2)
# 1.空元组
>> > t = ()
>> > t
()
# 2.只有一个元素的元组,使用逗号以避免歧义 如果没有都有逗号"()"将被认为是算数括号
>> > t = (1,)
# 将集合作为tuple的元素时,tuple不可变,但是集合内的元素是可以变化的
# 所以,不要将集合作为不可变数组的元素


# 无序集合
# 字典/映射表 dict,对应于java的map key为不可变的
>> > d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>> > d['Michael']
95
# 如果key不存在，dict就会报错：
>> > d['Thomas']
Traceback(most recent call last):
  File "<stdin>", line 1, in < module >
KeyError: 'Thomas'
# 避免报错,方法一:判断是否存在
>> > 'Thomas' in d
False
# 避免报错,方法二:get
>> > d.get("Thomas")  # 如果不存在, 则返回None
>> > d.get("Thomas", -1)  # 制定返回值.如果不存在, 则返回-1
# 删除集合元素
>> > d.pop("Bob")
>> > d
{'Michael': 95, 'Tracy': 85}

# set集合
>> > s = set([1, 1, 2, 2, 3, 3])
>> > s
{1, 2, 3}
# 通过add(key)方法可以添加元素到set中，可以重复添加，但不会有效果：
>> > s.add(4)
>> > s
{1, 2, 3, 4}
>> > s.add(4)
>> > s
{1, 2, 3, 4}
# 通过remove(key)方法可以删除元素：
>> > s.remove(4)
>> > s
{1, 2, 3}

# set可以看成数学意义上的无序和无重复元素的集合，因此，两个set可以做数学意义上的交集、并集等操作：
>> > s1 = set([1, 2, 3])
>> > s2 = set([2, 3, 4])
>> > s1 & s2
{2, 3}
>> > s1 | s2
{1, 2, 3, 4}

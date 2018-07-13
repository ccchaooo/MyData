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

#数学算法
i = 81
while(i - 1 > 0):
  if(i / 9 % 3 == i % 9 % 3):
    i = i - 1
    continue
  print("A = %d ,B=%d" % (i / 9 + 1, i % 9 + 1))
  i = i - 1

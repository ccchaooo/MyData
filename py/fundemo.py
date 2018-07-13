# pass暂未
def placeholder():
  pass


def my_abs(x):
  if not isinstance(x, (int, float)):
    raise TypeError('参数类型错误')
  if x > 0:
    return x
  else:
    return -x


def doublereseult():
  return "第一个返回值","第二个返回值"

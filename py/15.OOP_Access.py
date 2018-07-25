# 在Python中，实例的变量名如果以__开头，就变成了一个私有变量（private），只有内部可以访问，外部不能访问
# 为什么要定义一个方法大费周折？因为在方法中，可以对参数做检查，避免传入无效的参数


class Student(object):

  # __init__:变量名类似__xxx__的，也就是以双下划线开头，并且以双下划线结尾的，是特殊变量，
  # 特殊变量是可以直接访问的，不是private变量，所以，不能用__name__、__score__这样的变量名。
  def __init__(self, name, score):
    # self._name:属性的名称前加上两个下划线__，在Python中，实例的变量名如果以__开头，就变成了一个私有变量（private），
    # 只有内部可以访问，外部不能访问
    self.__name = name
    self.__score = score

  def print_score(self):
    print('姓名:%s,分数:%s' % (self.__name, self.__score))


lili = Student('lili', 150)
lili.print_score()


# 双下划线开头的实例变量是不是一定不能从外部访问呢？其实也不是。
# 不能直接访问__name是因为Python解释器对外把__name变量改成了_Student__name，所以，仍然可以通过_Student__name来访问__name变量：
print(lili._Student__name)

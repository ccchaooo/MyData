# # datetime是Python处理日期和时间的标准库。
# 注意到datetime是模块，datetime模块还包含一个datetime类，通过from datetime import datetime导入的才是datetime这个类。
# 如果仅导入import datetime，则必须引用全名datetime.datetime。
# datetime.now()返回当前日期和时间，其类型是datetime。

# 获取时间
from datetime import datetime
now = datetime.now()
print("系统当前时间:%s" % now)


# 获取指定时间和日期
dt = datetime(2018, 7, 27, 14, 44)
print("我在%s学习到这一章" % dt)


# datetime转timestamp
tp = now.timestamp()
print("当前时间戳:%s" % tp)


# timestamp转date
t = 1429417200.0
d = datetime.fromtimestamp(t)
print("时间戳转成date:%s" % d)


# str转datetime
cday = datetime.strptime("2018-07-05 15:29:12", "%Y-%m-%d %H:%M:%S")
print(cday)


# datatime转str
print(now.strftime("%Y-%m-%d %H:%M:%S"))
print(now.strftime("%Y,%m,%d %H:%M:%S"))


# datetime加减
from datetime import datetime, timedelta
now = datetime.now()
print(now + timedelta(hours=10))
print(now + timedelta(days=10))
print(now + timedelta(days=10, hours=5))


# 本地时间转换为UTC时间
# 先通过utcnow()拿到当前的UTC时间，再转换为任意时区的时间
# 拿到UTC时间，并强制设置时区为UTC+0:00:
from datetime import datetime, timedelta, timezone
utc_dt = datetime.utcnow().replace(tzinfo=timezone.utc)
print(utc_dt)
# astimezone()将转换时区为北京时间:
bj_dt = utc_dt.astimezone(timezone(timedelta(hours=8)))
print(bj_dt)
# astimezone()将转换时区为东京时间:
tokyo_dt = utc_dt.astimezone(timezone(timedelta(hours=9)))
print(tokyo_dt)
# astimezone()将bj_dt转换时区为东京时间:
tokyo_dt2 = bj_dt.astimezone(timezone(timedelta(hours=9)))
print(tokyo_dt2)

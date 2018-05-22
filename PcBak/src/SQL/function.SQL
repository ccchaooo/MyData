--一行翻译成多行
NVL2(C.N_JGYSJLID,'已备案','未备案') C_BAZT_WZ , 
NVL2(C.N_JGYSJLID,1,0) C_BAZT 
VJ_JSON := JSON(NVL(PC_JSON,'{}'));

--decode
DECODE(C_QSYJ,
'1',
'合格',
'0',
'不合格',
'不合格') 
C_QSYJ_MC,


--Case具有两种格式。简单Case函数和Case搜索函数。
--简单Case函数
CASE gender
WHEN '1' THEN '男'
WHEN '2' THEN '女'
ELSE '其他' END 

--Case搜索函数
CASE WHEN gender = '1' THEN '男'
WHEN gender = '2' THEN '女'
ELSE '其他' END

--这两种方式，可以实现相同的功能。简单Case函数的写法相对比较简洁，但是和Case搜索函数相比，功能方面会有些限制，比如写判断式。
--还有一个需要注意的问题，Case函数只返回第一个符合条件的值，剩下的Case部分将会被自动忽略。

--比如说，下面这段SQL，你永远无法得到“第二类”这个结果
CASE WHEN col_1 IN ( 'a', 'b') THEN '第一类'
WHEN col_1 IN ('a') THEN '第二类'
ELSE'其他' END

--时间转换
TO_CHAR(D_QSSJ, 'YYYY-MM-DD HH24:MI:SS') D_QSSJ,

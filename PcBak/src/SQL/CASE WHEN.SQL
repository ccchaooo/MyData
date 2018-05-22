Oracle CASE WHEN 用法介绍

1. CASE WHEN 表达式有两种形式

复制代码
--简单Case函数  

CASE sex  
WHEN '1' THEN '男'  
WHEN '2' THEN '女'  
ELSE '其他' END  

--Case搜索函数  

CASE
WHEN sex = '1' THEN '男'  
WHEN sex = '2' THEN '女'  
ELSE '其他' END  
复制代码
 

2. CASE WHEN 在语句中不同位置的用法

2.1 SELECT CASE WHEN 用法

复制代码
SELECT   grade, COUNT (CASE WHEN sex = 1 THEN 1      /*sex 1为男生，2位女生*/
                       ELSE NULL
                       END) 男生数,
                COUNT (CASE WHEN sex = 2 THEN 1
                       ELSE NULL
                       END) 女生数
    FROM students GROUP BY grade;
复制代码
 

2.3 WHERE CASE WHEN 用法

复制代码
SELECT T2.*, T1.*
   FROM T1, T2
  WHERE (CASE WHEN T2.COMPARE_TYPE = 'A' AND
                   T1.SOME_TYPE LIKE 'NOTHING%'
                THEN 1
              WHEN T2.COMPARE_TYPE != 'A' AND
                   T1.SOME_TYPE NOT LIKE 'NOTHING%'
                THEN 1
              ELSE 0
           END) = 1
复制代码
 

2.4 GROUP BY CASE WHEN 用法

复制代码
SELECT  
CASE WHEN salary <= 500 THEN '1'  
WHEN salary > 500 AND salary <= 600  THEN '2'  
WHEN salary > 600 AND salary <= 800  THEN '3'  
WHEN salary > 800 AND salary <= 1000 THEN '4'  
ELSE NULL END salary_class, -- 别名命名
COUNT(*)  
FROM    Table_A  
GROUP BY  
CASE WHEN salary <= 500 THEN '1'  
WHEN salary > 500 AND salary <= 600  THEN '2'  
WHEN salary > 600 AND salary <= 800  THEN '3'  
WHEN salary > 800 AND salary <= 1000 THEN '4'  
ELSE NULL END;  
复制代码
 

3.关于IF-THEN-ELSE的其他实现

3.1 DECODE() 函数

select decode(sex, 'M', 'Male', 'F', 'Female', 'Unknown')
from   employees;
貌似只有Oracle提供该函数，而且不支持ANSI SQL，语法上也没CASE WHEN清晰，个人不推荐使用。


3.2 在WHERE中特殊实现

SELECT T2.*, T1.*
   FROM T1, T2
  WHERE (T2.COMPARE_TYPE = 'A' AND T1.SOME_TYPE LIKE 'NOTHING%')
         OR
        (T2.COMPARE_TYPE != 'A' AND T1.SOME_TYPE NOT LIKE 'NOTHING%')



--示例代码
OPEN P_RESULT_BDZBG FOR
SELECT NVL(LISTAGG(DW.C_MC,'；')
WITHIN GROUP(ORDER BY DW.C_MC ),'') INTO vs_zgj  
FROM T_JSXM_XMXX_INFO XM, T_JSXM_BDXX_INFO BD, T_CODE_JCDM DM
WHERE BD.N_XMID = XM.N_XMID AND BD.N_BDID = PN_BDID
AND 
      (CASE WHEN XM.C_XMLX = '0' AND BD.C_FBLX = '1'         --房建总承包
              THEN '0005'
            WHEN XM.C_XMLX = '0' AND BD.C_FBLX = '2'         --房建专业分包
              THEN '0007'
            WHEN XM.C_XMLX = '1' AND BD.C_FBLX = '1'         --市政总承包
              THEN '0006'
            WHEN XM.C_XMLX = '1' AND BD.C_FBLX = '2'         --市政专业分包
              THEN '0008'                                  
            ELSE '-1'
         END) = DM.C_LBDM;

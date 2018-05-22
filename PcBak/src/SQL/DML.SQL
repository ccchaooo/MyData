--现实返回行数
WHERE ROWNUM <= 101;
--CASE WHEN
( CASE WHEN A.D_SPYWCSJ < vd_sysdt THEN 1 ELSE 0 END ) C_YWCBZ,
--DECODE
DECODE(A.C_DQZT, '4', '审批中', '5', '审批完成', '6', '被退回', '审批中') C_DQZT --0：未完成；1：审批通过；2：整改退回
--DECODE用于更新
C_DQZT = DECODE(C_DQZT,'6','4',C_DQZT)

--CASE WHEN 与 instr连用
CASE WHEN (SELECT INSTR(t.C_LXPZWH_STR,to_char(a.N_LXID)) FROM T_JSXM_BDXX_INFO t WHERE t.N_BDID = PN_BDID )>0 THEN
'true'
ELSE 
''
END  

--注册建造师姓名(可能有多个拼接)
SELECT NVL(LISTAGG(DW.C_ZCJZS_XM,'；')
WITHIN GROUP(ORDER BY DW.C_ZCJZS_XM ),'') INTO vc_zcjzs
FROM T_BLSP_SP_MAIN   MA ,T_BLSP_JCSJ_ZBRXX_DW DW
WHERE  MA.N_BDID = DW.N_BDID AND MA.N_SPJLID = PN_SPJIID;

--Oracle 拼接字符串
SELECT NVL(LISTAGG(C_JGMC,'；') WITHIN GROUP(ORDER BY C_JGMC ),'')JSDW
           FROM T_JSXM_XMXX_JSDW

--oracle中substr函数的用法

--oracle 截取字符串
SUBSTR(vc_kcdw_zz,1,LENGTH(vc_kcdw_zz)-1)

--substr详解
1、substr(string string, int a, int b) 
--参数1:string 要处理的字符串 
--参数2：a 截取字符串的开始位置（起始位置是0） 
--参数3：b 截取的字符串的长度(而不是字符串的结束位置) 
--例如： 
substr("ABCDEFG", 0); --返回：ABCDEFG，截取所有字符 
substr("ABCDEFG", 2); --返回：CDEFG，截取从C开始之后所有字符 
substr("ABCDEFG", 0, 3); --返回：ABC，截取从A开始3个字符 
substr("ABCDEFG", 0, 100); --返回：ABCDEFG，100虽然超出预处理的字符串最长度，但不会影响返回结果，系统按预处理字符串最大数量返回。 
substr("ABCDEFG", -3, 3); --返回：EFG，注意参数-3，为负值时表示从尾部开始算起，字符串排列位置不变。 

2、substr(string string, int a) 
--参数1:string 要处理的字符串 
--参数2：a 可以理解为从索引a（注意：起始索引是0）处开始截取字符串，也可以理解为从第 （a+1）个字符开始截取字符串。 
--例如： 
substr("ABCDEFG", 0); --返回：ABCDEFG, 截取所有字符 
substr("ABCDEFG", 2); --返回：CDEFG，截取从C开始之后所有字符

--oracle中length、lengthb、substr、substrb用法小结 
SELECT length('叶德华abc') -- length按字符计，汉字、英文、数字都是1个字符，故这里返回6  
  FROM dual;  
SELECT lengthb('叶德华abc') -- length按字节计，我这里是UTF-8编码，汉字3个字节，英文一个字节，故这里返回12  
  FROM dual;  
SELECT substr('叶德华abc', -- substr按字符截取，截取到a，返回：叶德华a  
              1,  
              4)  
  FROM dual;  
SELECT substrb('叶德华abc',  
               1,  
               2) -- substrb按字节截取，2不足一个汉字长度，返回：两个空格  
  FROM dual;  
SELECT substrb('叶德华abc',  
               1,  
               3) -- substrb按字节截取，3刚好是一个汉字长度，返回：叶  
  FROM dual;  
SELECT substrb('叶德华abc',  
               1,  
               4) -- substrb按字节截取，4多余一个汉字少于两个汉字，返回：叶 加一个空格  
  FROM dual;

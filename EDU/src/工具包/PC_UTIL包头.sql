--              工具包
-- 创 建 日 期 ：2017-9-21             
-- 创 建 作 者 ：dengchao
--PCUT = PUBLIC UTIL
--PCUT 包头
--1.查询表是否存在
CREATE OR REPLACE PACKAGE PCUT
AS  
--1.查询表是否存在
FUNCTION f_table_exist
(
vs_table_name     IN        VARCHAR2
)
RETURN BOOLEAN;
--2.记录错误信息
FUNCTION f_save_errlog
(
ERRORCODE     IN        ERRLOG.CODE_ORA%TYPE,  
ERRORMSG      IN        ERRLOG.MSG_ORA%TYPE,   
ERRORDESC     IN        ERRLOG.ERRORDESC%TYPE  
)
RETURN BOOLEAN;
END PCUT;
/
SHOW ERROR;


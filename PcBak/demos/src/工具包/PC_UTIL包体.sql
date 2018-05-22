-- 工具包
-- 创 建 日 期 ：2017-9-21             
-- 创 建 作 者 ：dengchao
--PCUT 包体
CREATE OR REPLACE PACKAGE BODY PCUT
AS
--1.查询表是否存在
FUNCTION f_table_exist
(
vs_table_name     IN         VARCHAR2
)
RETURN BOOLEAN
IS
    vn_cnt        number;
BEGIN
    select count(*) INTO vn_cnt from user_tables where table_name = vs_table_name;
RETURN vn_cnt=1 ;

EXCEPTION
    WHEN OTHERS
    THEN
RETURN FALSE;
END f_table_exist;
--2.保存错误信息
FUNCTION f_save_errlog
(
ERRORCODE     IN             ERRLOG.CODE_ORA%TYPE,
ERRORMSG      IN             ERRLOG.MSG_ORA%TYPE,
ERRORDESC     IN             ERRLOG.ERRORDESC%TYPE
)
RETURN BOOLEAN
IS
vs_code         VARCHAR2(2000);
vs_pack_name    VARCHAR2(2000);
vs_MSG          VARCHAR2(2000);
BEGIN
    IF pcut.f_table_exist('ERRLOG') THEN
    --截取有用字符串
    vs_code         :='ORA'||ERRORCODE;
    vs_pack_name    :=substr(ERRORDESC,instr(ERRORDESC, '在')+1,instr(ERRORDESC, '",')) ; 
    vs_MSG          :=substr(ERRORMSG,instr(ERRORMSG, 'PL/SQL:')+7) ; 
    --向日志表 【 ERRLOG 】 插入数据
    INSERT INTO ERRLOG EL (EL.CODE_ORA,EL.MSG_ORA,EL.PACK_NAME) VALUES (vs_code,vs_MSG,vs_pack_name);
    COMMIT;
    RETURN TRUE; 
    ELSE
    RETURN false; 
    END IF;        
EXCEPTION          
    WHEN OTHERS    
    THEN           
    RETURN FALSE;  
END f_save_errlog;   
                   
END PCUT;
/
SHOW ERROR;




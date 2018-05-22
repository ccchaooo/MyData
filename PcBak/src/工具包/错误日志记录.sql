DROP TABLE ERRLOG;
DROP SEQUENCE ERROR_ID;
--创建ERRLOG表
CREATE  TABLE ERRLOG (
ID         INTEGER     ,
CODE_ORA   VARCHAR2(2000),
MSG_ORA    VARCHAR2(2000),
PACK_NAME  VARCHAR2(2000),    
OCCUR_DATE DATE,
PRO_NAME   VARCHAR2(2000),
ERRORDESC  VARCHAR2(2000)
);
--创建序列计算
CREATE SEQUENCE ERROR_ID  
INCREMENT BY 1   -- 每次加几个  
START WITH 1       -- 从1开始计数  
NOMAXVALUE        -- 不设置最大值  
NOCYCLE           --不循环
;
--触发器为日志添加ID和时间
CREATE OR REPLACE TRIGGER ERRLOG_ID
BEFORE INSERT OR UPDATE ON ERRLOG
FOR EACH ROW
DECLARE
   v_max    NUMBER;
BEGIN
   :NEW.ID          :=ERROR_ID.NEXTVAL;
   :NEW.OCCUR_DATE  :=SYSDATE;
END;
/
SHOW ERROR;
--  PLSQL异常处理块
--       EXCEPTION
--       WHEN OTHERS THEN
--                  PC_MSG:='操作失败 日志未保存';
--                  IF PCUT.save_errlog(SQLCODE,SUBSTR(SQLERRM, 1, 200),DBMS_UTILITY.format_error_backtrace)THEN
--                  PC_MSG:='操作失败 日志已保存';
--                  END IF;
--                  PN_RET:=-1;
--              ROLLBACK;
--              RETURN;
--  PLSQL异常处理块


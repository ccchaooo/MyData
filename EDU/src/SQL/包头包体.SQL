-- 6. 审图业务部门审批信息列表                                                   PK_SJWJSC_STSP_STQK_LIST
PROCEDURE PK_SJWJSC_STSP_STQK_LIST
(
PN_SPJLID              INTEGER,
PC_YWBMID              VARCHAR2,
P_RESULT            OUT     JW2017_PUBLIC.RESULTSET   --结果集返回
PN_RET              OUT     INTEGER , --结果返回标志 （1：有错，0：正常）
PC_MSG              OUT     VARCHAR2, --结果返回信息 （错误信息描述）
);
-- 6. 审图业务部门审批信息列表                                                   PK_SJWJSC_STSP_STQK_LIST
PROCEDURE PK_SJWJSC_STSP_STQK_LIST
  (
    PN_SPJLID              INTEGER,
    PC_YWBMID              VARCHAR2,
    P_RESULT            OUT     JW2017_PUBLIC.RESULTSET   --结果集返回
    PN_RET              OUT     INTEGER , --结果返回标志 （1：有错，0：正常）
    PC_MSG              OUT     VARCHAR2, --结果返回信息 （错误信息描述）
  )
  AS
  BEGIN
    PN_RET := 1;
    PC_MSG := '';
    ------------------------------------------------
    --code here



    --end
    ------------------------------------------------
    PN_RET := 0;
    PC_MSG := '';
  EXCEPTION
    WHEN OTHERS THEN
        PN_RET:= 1;
        PC_MSG:='操作失败';
        PC_MSG:=SQLCODE||' '||SQLERRM||' '||DBMS_UTILITY.format_error_backtrace;
    ROLLBACK;
    RETURN;
  END PK_SJWJSC_STSP_STQK_LIST;
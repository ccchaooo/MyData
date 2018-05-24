       flag            VARCHAR2(2000);
       errorException  EXCEPTION;                                           --声明异常  
       errorCode       INTEGER;                                             --异常代号  
       errorMsg        VARCHAR2(1000);                                      --异常信息
   --捕获异常
       exception             
       when others then  
                   errorCode := SQLCODE;      
                   errorMsg := SUBSTR(SQLERRM, 1, 200);   
                   flag := 'false';  
                   PC_MSG := 'flag=' || flag || ',errorCode=' || errorCode || ',errorMsg=' || errorMsg||' '||DBMS_UTILITY.format_error_backtrace;
              ROLLBACK;
              RETURN;
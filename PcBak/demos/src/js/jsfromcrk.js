
并联审批外网js设置session和获取session
$.f_set_session(p1,p2)   -- p1为json字符串，p2为回调带3个参数（可选）
$.f_get_session(p1,p2)   --p1为设置的session key，不指定时返回所有session（可选），p2为回调带3个参数，p1没指定时，p1为回调函数
$.f_get_session_syn(p1)  --同步返回指定的p1对应的session值

回调的3个参数为 data, textStatus, jqXHR 。就是jQuery-ajax成功的回调函数
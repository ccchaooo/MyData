String linkStr = "'<a href=\"javascript:f_deal('||N_XMID||','||N_BDID||')\">'||"+ 
"DECODE(C_ZT,'0','修改合同信息','1','查看合同信息','2','查看合同信息','填写合同信息')||'</a>" +
"<a href=\"/cdjw_sjba2018_ztyy/download/'||C_FORM_KEY||'/'||N_BAJLBH||'\"'||' title=\"下载收讫回函\"" +
" target=''_blank''>'||DECODE(C_ZT,'2','|下载 ','')||'</a>'";

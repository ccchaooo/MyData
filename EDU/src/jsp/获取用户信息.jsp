<%
    // 获取登录信息
    ZtLoginUserInfo loginUserInfo = GetztLoginUserInfo.getZtUserInfo(request);
    // System.out.println(JSONObject.toJSONString(loginUserInfo, SerializerFeature.WriteMapNullValue));
    String ztbh = loginUserInfo.getZtUserBh();
    String loginname = loginUserInfo.getLoginName();
    String username = loginUserInfo.getUserName();
    String jgdm = loginUserInfo.getUserJgdm();
    String logSession = loginUserInfo.getLogsessionID();;
    String LoginMode = loginUserInfo.getLoginMode();
    String AppUseArea = loginUserInfo.getAppArea();
    String casflag = loginUserInfo.getCasflag();
%>

<script type="text/javascript">
    var __userName = <%=loginUserInfo.username()%>;
</script>

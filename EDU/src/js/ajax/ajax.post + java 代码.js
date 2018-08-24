// JavaScript:
// 加载数据
var ajax = postUtil.newInstance();

ajax.post("../form/query/" + _fromKay + "/" + _sbjlbh).then(function(resp) {

});


//java
@RequestMapping(value = "/query/{formKey}/{pkid}", produces = "application/json;charset=utf-8")
@ResponseBody
public String query(@PathVariable("formKey") String formKey,
    @PathVariable("pkid") String pkid, HttpServletRequest request) {

    JSONObject retJSON = new JSONObject();
    retJSON.put("flag", "0");
    try {
        // 登录者信息
        //LoginUserInfo loginUserInfo = GetLoginUserInfo.getUserInfo(request);

        ZtLoginUserInfo ztLoginUserInfo = GetztLoginUserInfo.getZtUserInfo(request);

        String user = ztLoginUserInfo.getZtUserBh();
        String usermc = ztLoginUserInfo.getUserName();
        if (StringUtils.isBlank(user) || StringUtils.isBlank(usermc)) {
            throw new RuntimeException("无登录信息。");
        }

        String msg = sjbaFormService.queryFormData(formKey, pkid);

        retJSON.put("msg", msg);

    } catch (Exception e) {
        retJSON.put("flag", "1");
        retJSON.put("msg", e.getMessage());
        if (LOG.isErrorEnabled()) {
            LOG.error("保存formData失败：", e);
        }
    }

    return retJSON.toJSONString();
}

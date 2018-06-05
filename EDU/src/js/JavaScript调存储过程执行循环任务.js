//在对应的Iframe层进行调用
arrgs = [];
myindex = -1;
bg = function() {
    myindex = myindex + 1;
    if (myindex >= arrgs.length) {
        console.log(arrgs);
        return;
    }
    var ajax = new AjaxProxy();
    ajax.addParm("pageSize", 20);
    ajax.addParm("page", -1);
    ajax.addParm("keyword", $.trim(arrgs[myindex].gsmc));
    try {
        ajax.invokeJava("qyxxPublicService.getQyxxList", true, function(ap) {
            var arrayJsonObj = JSON.parse(ajax.getString("RESULT"));
            if (arrayJsonObj.length != 1) {
                bg();
            } else {
                console.log("公司名称:" + arrayJsonObj[0].companyName, "GUID:" + arrayJsonObj[0].guid);
            }
            bg();
        }, ajax);
    } catch (e) {
        bg();
    }
}

//在对应的Iframe层进行调用
arrgs = [];
myindex = -1;
bg = function() {
    myindex = myindex + 1;
    if (myindex >= arrgs.length) {
        console.log(myindex);
        return;
    } else {
        var ajax = new AjaxProxy();
        ajax.addParm("pageSize", 20);
        ajax.addParm("page", -1);
        ajax.addParm("keyword", $.trim(arrgs[myindex].gsmc));
        try {
            ajax.invokeJava("qyxxPublicService.getQyxxList", true, function(ap) {
                var arrayJsonObj = JSON.parse(ajax.getString("RESULT"));
                if (arrayJsonObj.length === 1) {
                    console.log("insert into GSMC_GUID_VALUE_KEY (c_gsmc, c_guid) values ('" + trim(arrayJsonObj[0].companyName), "', '" + arrayJsonObj[0].guid + "');");
                }
            }, ajax);
        } catch (e) {}
        bg();
    }
}



//@ajax

arrgs = [];
myindex = -1;
bg = function() {
    myindex = myindex + 1;
    if (myindex >= arrgs.length) {
        console.log(myindex);
        return;
    } else {
        try {
            $.ajax({
                type: 'post',
                url: '/cdjwztyypt/xmbj/queryDWXX.do',
                data: "成都兴洲数字电视传播有限公司",
                success: function(ret) {
                    if (ret.results.length === 1) {
                        console.log(ret.results[0]);
                    }
                }
            });

        } catch (e) {}
        bg();
    }
}

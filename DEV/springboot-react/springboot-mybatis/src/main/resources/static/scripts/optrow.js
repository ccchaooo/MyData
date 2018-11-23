var _lastIndex = "";
var lastData = {};
var app = angular.module("dwgcxxApp",["AjaxProxy2","calendar.cdmcs","select2.cdmcs","validates.cdmcs"]);
//控制器
app.controller("dwgcxxController",["$scope","postRaw","postUtil","$timeout",function ($scope,postRaw,postUtil,$timeout){

    // 初始化参数
    var _xmid    = xmid,    _bdid   = bdid,_xzqhdm   = xzqhdm,
        _xqbz    = xqbz,    _sbjlbh = sbjlbh,
        _formKey = formKey, _bdmc   = "";

    // 判断是不是非正常访问
    if(_xmid==""&&_bdid==""&&_xqbz==""&&_sbjlbh==""&&_formKey==""){
        layer.alert("非正常访问！点击确认后返回首页：",{icon: 7},function () {
            $.f_submit_post("../template.jsp");
        });
        return;
    }

    // 初始化信息
    $scope.dwgcList = [];

    $scope.dwgcInfo = {
        C_FBRWTBZ  : "0",
        C_SGTKJSBZ : "1"
    };

    //行政区划代码
    $scope._xzqhdm = _xzqhdm;

    // 判断是否查看
    if(_xqbz == "1"){
        $("#div_next").hide();
    }else{
        $("#div_back").hide();
    }

    // 初始化页面的radio样式
    $("input[type='radio']").iCheck({
        checkboxClass : "icheckbox_square-blue",
        radioClass    : "iradio_square-blue",
        increaseArea  : "20%"
    });

    // 设置[竣工结算书发、承包人双方是否签字、盖章]选中
    $("input[name='C_SFQZBZ'][value='1']").iCheck('check');
    $("input[name='C_SFQZBZ']").iCheck('disable');

    // 设置[发包人是否委托造价咨询企业]选中
    $("input[name='C_FBRWTBZ'][value='0']").iCheck('check');
    $("input[name='C_FBRWTBZ']").on('ifChecked', function(event){

        var _value =  $("input[type='radio'][name='C_FBRWTBZ']:checked").val();

        if(_value != null && _value != "" && _value != undefined){

            $scope.$apply(function () {

                $scope.dwgcInfo.C_FBRWTBZ = _value;

                // 延迟加载
                var _t = $timeout(function () {

                    $timeout.cancel(_t);

                    // 初始化页面的radio样式
                    $("input[type='radio'][name='C_SWTZJ_QZBZ']").iCheck({
                        checkboxClass : "icheckbox_square-blue",
                        radioClass    : "iradio_square-blue",
                        increaseArea  : "20%"
                    });

                    // 设置[受委托的造价咨询企业是否签字、盖章]选中
                    $("input[name='C_SWTZJ_QZBZ'][value='1']").iCheck('check');
                    $("input[name='C_SWTZJ_QZBZ']").iCheck('disable');

                    // 设置是否查看
                    f_isDetail();

                },100);

            });
        };
    });

    // 设置[约定条款办理]选中
    $("input[name='C_SGTKJSBZ'][value='1']").iCheck('check');
    $("input[name='C_SGTKJSBZ']").on('ifChecked', function(event){

        var _value =  $("input[type='radio'][name='C_SGTKJSBZ']:checked").val();

        if(_value != null && _value != "" && _value != undefined){

            $scope.$apply(function () {

                $scope.dwgcInfo.C_SGTKJSBZ = _value;

                // 设置是否查看
                f_isDetail();

            });

        };
    });

    // 获取标段子项目信息
    var queryZxm = function () {

        var ajax = postUtil.newInstance({xmid:_xmid,bdid:_bdid});

        // 等待
        var _index = layer.load(1, {
            shade: [0.1, "#FFFFFF"]
        });

        ajax.post("../jgjsj/query").then(function(resp){
            // 关闭
            layer.close(_index);

            // 是否查询到数据信息
            if(resp.data.flag != "0"){
                layer.alert("加载信息出错：" + resp.data.msg,{icon: 7});
                return;
            }

            if(_sbjlbh == "" && typeof(resp.data.sbjlbh) != "undefined"){
                _sbjlbh = resp.data.sbjlbh;
            }

            var jlhtInfo = angular.fromJson(resp.data.msg);


            //承包人姓名显示 (老项目)
            if (_xzqhdm != "510101") {
                jlhtInfo.forEach(function (zxm) {
                    if (zxm.C_CBRMC) {
                        $scope.cbrList = [];
                        zxm.C_CBRMC.split(";").forEach(function (cbr) {
                            $scope.cbrList.push({
                                text: cbr,
                                value: "此处不需要guid",
                                selected: "selected"
                            });
                        });
                        return false;
                    }
                });
            }

            var isPass = true;

            for(var i=0;i<jlhtInfo.length;i++){
                if(jlhtInfo[i]["C_DWGCXX"] == null ||jlhtInfo[i]["C_DWGCXX"] == "" || jlhtInfo[i]["C_DWGCXX"] == undefined){
                    isPass = false;
                }

                if(jlhtInfo[i]["C_BDMC"] != null && jlhtInfo[i]["C_BDMC"] != "" && jlhtInfo[i]["C_BDMC"] != undefined){
                    _bdmc = jlhtInfo[i]["C_BDMC"];
                }
            }

            if(!isPass){
                $("#btn_all").attr("disabled",true);
            }else{
                $("#btn_all").attr("disabled",false);
            }

            // 各个项目信息
            $scope.dwgcList  = jlhtInfo;

            // 延迟加载
            var _t = $timeout(function () {

                $timeout.cancel(_t);

                // 选中
                if(_lastIndex != ""){
                    initHtml(_lastIndex,"0");
                }else{
                    initHtml("0","0");
                }

                // 查看
                f_isDetail();
            },0);
        });
    }

    // 选中单位工程
    $scope.f_select_row = function (_index) {

        if(_lastIndex != "" && !isPass(lastData,$scope.dwgcInfo)){

            // 提示
            layer.confirm("子项目["+$scope.dwgcInfo["C_ZXMMC"]+"]填写信息变更信息未保存，是否放弃变更信息？", {icon:3}, function (idx) {
                layer.close(idx);

                $scope.$apply(function () {
                    initHtml(_index,"1");
                });

            });

        }else{
            initHtml(_index,"0");
        }

    }

    // 选中单位工程
    $scope.f_select = function (_index) {

        if(_lastIndex != "" && !isPass(lastData,$scope.dwgcInfo)){

            // 提示
            layer.confirm("子项目["+$scope.dwgcInfo.C_ZXMMC+"]备查信息变更后未保存，是否放弃变更信息？", {icon:3}, function (idx) {
                layer.close(idx);

                $scope.$apply(function () {
                    initHtml(_index,"1");
                });

            });

        }else{
            initHtml(_index,"0");
        }
    }

    // 判断
    var initHtml = function (_index,type) {

        // 放弃则重置信息
        if(type == "1"){
            angular.copy(lastData,$scope.dwgcList[_lastIndex]);
        }

        $(".dwgc_tr").css("background-color","");

        $("#dwgc_tr_"+_index).css("background-color","#f0f4f7");

        var data = $scope.dwgcList[_index];

        angular.copy(data,lastData);

        delete data["N_XMID"];
        if(data["C_DWGCXX"] != null && data["C_DWGCXX"] != "" && data["C_DWGCXX"] != undefined){

            var dwgcData = data["C_DWGCXX"];

            dwgcData["N_BDID"]  = data["N_BDID"];
            dwgcData["N_ZXMID"] = data["N_ZXMID"];
            dwgcData["C_ZXMMC"] = data["C_ZXMMC"];
            dwgcData["C_BDMC"]  = data["C_BDMC"];
            dwgcData["C_XMMC"]  = data["C_XMMC"];
            dwgcData["C_CBRMC"] = data["C_CBRMC"];
            dwgcData["C_FBRMC"] = data["C_FBRMC"];

            dwgcData["C_ZBSQTZSBH"] = data["C_ZBSQTZSBH"];

            $scope.dwgcInfo = dwgcData;

            var _t = $timeout(function () {
                $timeout.cancel(_t);
                // 竣工结算书发、承包人双方是否签字、盖章
                $("input[name='C_SFQZBZ'][value='" + dwgcData['C_SFQZBZ'] + "']").iCheck('check');

                // 发包人是否委托造价咨询企业
                $("input[name='C_FBRWTBZ'][value='" + dwgcData['C_FBRWTBZ'] + "']").iCheck('check');

                // 受委托的造价咨询企业是否签字、盖章
                $("input[name='C_SWTZJ_QZBZ'][value='" + dwgcData['C_SWTZJ_QZBZ'] + "']").iCheck('check');

                // 是否依据发、承包双方的建设工程施工合同约定条款办理竣工结算
                $("input[name='C_SGTKJSBZ'][value='" + dwgcData['C_SGTKJSBZ'] + "']").iCheck('check');

                // 计价方式
                if(dwgcData["C_JJFSDM"] != ""){
                    $scope.jjfsList = [{"value":dwgcData["C_JJFSDM"],"text":dwgcData["C_JJFSMC"],selected:true}];
                }

                // 结构型式
                if(dwgcData["C_JGLXDM"] != ""){
                    $scope.jgxsList = [{"value":dwgcData["C_JGLXDM"],"text":dwgcData["C_JGLXMC"],selected:true}];
                }

                // 咨询企业
                if(dwgcData["C_SWTZJ_QYBH"] != "" && typeof (dwgcData["C_SWTZJ_QYBH"]) != "undefined" ){
                    $scope.qyxxList = [{"value":dwgcData["C_SWTZJ_QYBH"],"text":dwgcData["C_SWTZJ_QYMC"],selected:true}];
                }
            },100);

        }else{

            data["C_FBRWTBZ"]  = "0";
            data["C_SGTKJSBZ"] = "1";

            $scope.dwgcInfo = data;

            var _t = $timeout(function () {
                $timeout.cancel(_t);

                // 竣工结算书发、承包人双方是否签字、盖章
                $("input[name='C_FBRWTBZ'][value='" + data['C_FBRWTBZ'] + "']").iCheck('check');


                // 是否依据发、承包双方的建设工程施工合同约定条款办理竣工结算
                $("input[name='C_SGTKJSBZ'][value='" + data['C_SGTKJSBZ'] + "']").iCheck('check');

            },0);
        }

        _lastIndex = _index;

    }

    // 判断是否改变
    var isPass = function (dataInfo,dwgcInfo) {

        var dwgcData = {};

        if(dataInfo["C_DWGCXX"] != null && dataInfo["C_DWGCXX"] != "" && dataInfo["C_DWGCXX"] != undefined){
            dwgcData = dataInfo["C_DWGCXX"];
        }else{
            dwgcData["C_FBRWTBZ"]  = "0";
            dwgcData["C_SGTKJSBZ"] = "1";
        }

        // dwgcData["N_BDID"]  = dataInfo["N_BDID"];
        // dwgcData["N_ZXMID"] = dataInfo["N_ZXMID"];
        // dwgcData["C_ZXMMC"] = dataInfo["C_ZXMMC"];
        // dwgcData["C_CBRMC"] = dataInfo["C_CBRMC"];
        // dwgcData["C_FBRMC"] = dataInfo["C_FBRMC"];
        // dwgcData["C_BDMC"]  = dataInfo["C_BDMC"];
        // dwgcData["C_XMMC"]  = dataInfo["C_XMMC"];
        // dwgcData["C_ZBSQTZSBH"] = dataInfo["C_ZBSQTZSBH"];

        // return angular.equals(dwgcData,dwgcInfo);

        //获取承包人名称
        var cbrarr = []
        $("select[ng-model='C_CBRMC']").find("option:checked").each(function(){
            cbrarr.push($(this).text());
        });

        dwgcInfo.C_CBRMC = cbrarr.join(";") || undefined;

        //采用另一种比较方式
        return !(dataInfo.N_BDID  !== dwgcInfo.N_BDID ||
            dataInfo.N_ZXMID !== dwgcInfo.N_ZXMID||
            dataInfo.C_ZXMMC !== dwgcInfo.C_ZXMMC||
            dataInfo.C_CBRMC !== dwgcInfo.C_CBRMC||
            dataInfo.C_FBRMC !== dwgcInfo.C_FBRMC||
            dataInfo.C_BDMC  !== dwgcInfo.C_BDMC ||
            dataInfo.C_XMMC  !== dwgcInfo.C_XMMC ||
            dataInfo.C_ZBSQTZSBH !== dwgcInfo.C_ZBSQTZSBH
        )
    }

    // 判断是否查看
    var f_isDetail = function(){
        // 判断是否查看
        if(_xqbz == "1"){
            $("input").attr("readonly","readonly");
            $("textarea").attr("readonly","readonly");
            $("select").attr("disabled","disabled");
            $("select").attr("disabled","disabled");
            $("input[name='C_FBRWTBZ']").iCheck('disable');
            $("input[name='C_SGTKJSBZ']").iCheck('disable');
        }
    }

    // 保存
    $scope.f_save = function () {

        var postInfo = {};

        var dwgcArr = new Array();

        // 判断是否修改
        if(_sbjlbh != null && _sbjlbh != "" && _sbjlbh != undefined){
            postInfo["N_SBJLBH"] = _sbjlbh;
        }else{
            postInfo["C_ZT"] = '0';
        }

        postInfo["N_XMID"] = _xmid;
        postInfo["C_BDMC"] = _bdmc;
        postInfo["N_BDID"] = _bdid;
        postInfo["C_ZBSQTZSBH"] = $scope.dwgcInfo.C_ZBSQTZSBH;


        //承包人
        if(_xzqhdm != "510101") {
            var cbrarr = []
            $("select[ng-model='C_CBRMC']").find("option:checked").each(function(){
                cbrarr.push($(this).text());
            });

            postInfo["C_CBRMC"] = cbrarr.join(";");
        }else{
            postInfo["C_CBRMC"] = $scope.dwgcInfo.C_CBRMC;
        }

        var dataList = $scope.dwgcList;

        for(var i=0;i<dataList.length;i++){

            if(i != _lastIndex){

                var data = $scope.dwgcList[i];

                if(data["C_DWGCXX"] != null && data["C_DWGCXX"] != "" && data["C_DWGCXX"] != undefined){

                    data["C_DWGCXX"]["N_XH"]    = i+1;
                    data["C_DWGCXX"]["N_BDID"]  = data["N_BDID"];
                    data["C_DWGCXX"]["N_ZXMID"] = data["N_ZXMID"];
                    data["C_DWGCXX"]["C_ZXMMC"] = data["C_ZXMMC"];
                    data["C_DWGCXX"]["C_CBRMC"] = data["C_CBRMC"];
                    data["C_DWGCXX"]["C_FBRMC"] = data["C_FBRMC"];
                    data["C_DWGCXX"]["C_ZBSQTZSBH"] = data["C_ZBSQTZSBH"];

                    dwgcArr.push(data["C_DWGCXX"]);
                    console.log(dwgcArr);
                }
            }else{

                var data = $scope.dwgcInfo;

                data["N_XH"] = i+1;

                //承包人名称
                if(_xzqhdm != "510101") {
                    data["C_CBRMC"] = cbrarr.join(';');
                }else{
                    data["C_CBRMC"] = $scope.dwgcInfo.C_CBRMC;
                }

                // 计价方式
                data["C_JJFSMC"] = $("select[name='jjfsList']").find("option:selected").text();

                // 结构型式
                data["C_JGLXMC"] = $("select[name='jgxsList']").find("option:selected").text();

                // 咨询企业
                data["C_SWTZJ_QYMC"] = $("select[name='qyxxList']").find("option:selected").text();

                // 竣工结算书发、承包人双方是否签字、盖章
                data["C_SFQZBZ"] = $("input[type='radio'][name='C_SFQZBZ']:checked").val();

                // 发包人是否委托造价咨询企业
                data["C_FBRWTBZ"] = $("input[type='radio'][name='C_FBRWTBZ']:checked").val();

                if(data["C_FBRWTBZ"] == "1"){
                    // 受委托的造价咨询企业是否签字、盖章
                    data["C_SWTZJ_QZBZ"] = $("input[type='radio'][name='C_SWTZJ_QZBZ']:checked").val();
                    // 发包人造价咨询企业经办人员姓名
                    data["C_FBR_JBRMC"] = "";
                    // 发包人造价咨询企业经办人员执业资格证号
                    data["C_FBR_JBRZYZH"] = "";
                }else{
                    // 受委托的造价咨询企业是否签字、盖章标志
                    data["C_SWTZJ_QZBZ"] = "";
                    // 受委托造价咨询企业标识编号
                    data["C_SWTZJ_QYBH"] = "";
                    // 受委托造价咨询企业名称
                    data["C_SWTZJ_QYMC"] = "";
                    // 受委托造价咨询企业等级
                    data["C_SWTZJ_QYDJ"] = "";
                    // 受委托造价咨询企业资质证书号
                    data["C_SWTZJ_QYZSH"] = "";
                    // 受委托造价咨询企业经办人员姓名
                    data["C_SWTZJ_JBRMC"] = "";
                    // 受委托造价咨询企业经办人员执业资格证号
                    data["C_SWTZJ_JBRZYZH"] = "";
                }

                // 是否依据发、承包双方的建设工程施工合同约定条款办理竣工结算
                data["C_SGTKJSBZ"] = $("input[type='radio'][name='C_SGTKJSBZ']:checked").val();
                // 判断
                if(data["C_SGTKJSBZ"] == "1"){
                    // 发包人造价人员姓名
                    data["C_FBR_ZJRYMC"] = "";
                    // 发包人执业资格证章号
                    data["C_FBR_ZYZGZZH"] = "";
                    // 承包人造价人员姓名
                    data["C_CBR_ZJRYMC"] = "";
                    // 承包人执业资格证章号
                    data["C_CBR_ZYZGZZH"] = "";
                    // 未按约定条款结算的原因
                    data["C_WATKJSYY"] = "";
                }

                dwgcArr.push(data);
            }
        }

        postInfo["dwgcxx-list"] = dwgcArr;

        var postData = {
            "formKey"  : _formKey,
            "postData" : postInfo
        }

        var post = postRaw.newInstance(postData);

        post.post("../jgjsj/save").then(function (resp) {

            if(resp.flag != "0"){
                layer.alert("保存信息出错：" + resp.msg,{icon: 7});
                return;
            }else{
                layer.alert("保存成功",{icon: 6}, function(index){

                    layer.close(index);

                    // 重新加载信息
                    queryZxm();

                });
            }

        });

    }


    // 企业信息改变
    $scope.f_qyxxChange = function () {

        var data = $("select[name='qyxxList']").data($scope.dwgcInfo.C_SWTZJ_QYBH);

        $scope.dwgcInfo.C_SWTZJ_QYZSH = data["C_ZZZSBH"];

        $scope.dwgcInfo.C_SWTZJ_QYDJ  = data["C_ZZDJ"];
    }

    // 下一步
    $scope.f_next = function () {

        var data = {
            "N_XMID"   : _xmid,
            "N_BDID"   : _bdid,
            "N_SBJLBH" : _sbjlbh,
            "formKey"  : _formKey,
            "C_XQBZ"   : _xqbz,
            "XZQHDM"   : _xzqhdm
        }

        $.f_submit_post("jgjsj_bdhz.jsp",data);
    }



    // 返回
    $scope.f_back = function () {

        $.f_submit_post("jgjsj_list.jsp");
    }


    // 初始化
    queryZxm();

}]);


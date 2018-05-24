var debug = false ;
var dison = false;
var test  = false;

var app = angular.module("zbbaApp",["AjaxProxy",'select2.cdmcs',"calendar.cdmcs"]);
//控制器
app.controller("zbbaController",["$scope","ajaxProxy","$timeout",function(scope,ajaxProxy,timeout){
    //由当前状态决定页面能否编辑
    scope.f_editable = true;
    scope.flag_sfkbj = true;
    scope.flag_sfth = false;
    console.log(scope.flag_sfkbj);


    //拼接子项目grid所需的中标规模单位所需
    var optstr = "";
    var zbzlList = [];//中标质量
    var zbgmdwlist = [] ; //
    var zbInfo={};//标段信息
    var zbba_input = {};
    //查询基础代码
    var BaseCode = {};
    // 初始化zbba_input
    scope.zbba_input = zbba_input;

    scope.zbrmcList = []; //中标单位
    scope.jldwList = [];  //监理单位
    scope.zjzxjgList = [];//造价咨询机构
    scope.zbrDetailList = [];
    scope.ztList = [];
    //中标单位类别
    scope.zbdwLbList = [];
    //中标单位类别Map
    var zbdwlb_map=  new Map(); 

    //用于缓存中标人的map
    var zbr_map = new Map();

    var queryBaseCode = function (callback){
        var ap_loadBaseCode = ajaxProxy;
        ap_loadBaseCode.invokeProc("APPUSER2017.JW2017_UTIL.PK_PRE_CODE").then(function(resp){
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                BaseCode = resp.data;
                callback();
            }else{
                layer.alert("基础代码加载失败"+resp.data.PC_MSG,{icon:7});
            }
    });};

    //加载 BaseCode
    var loadBaseCode =function (callback) {
        scope.jjfsList = BaseCode.P_RESULT_JJFS.row_value;      //计价方式
        scope.zbgmdwList = BaseCode.P_RESULT_ZBGMDW.row_value;    //中标规模单位
        scope.zbzlList = BaseCode.P_RESULT_ZBZL.row_value;        //中标质量
        scope.zbzlList[0].selected = true; //默认选中合格

        //拼接option所需的暂估价
        var arr_opt = [];
        var opt = "";
        var va  = "";
        var te  = "";

        for (var i=0; i<BaseCode.P_RESULT_ZBGMDW.row_count; i++) {
            va = BaseCode.P_RESULT_ZBGMDW.row_value[i].value;
            te = BaseCode.P_RESULT_ZBGMDW.row_value[i].text;
            // console.log("-----------",va,te);
            if(va == "02"){
                opt = "<option value=" + "&quot;"+va+"&quot;" + " selected='selected'" + ">" + te + "</option>";
            }else{
                opt = "<option value=" + "&quot;"+va+"&quot;" + ">" + te + "</option>";
            }
            arr_opt.push(opt);
        }
        optstr = arr_opt.join("");
        callback();
        // load_list();
    };

    //加载招标信息
    var loadzbInfo = function (callback){
        callback();
        var ap_loadzbInfo = ajaxProxy;
        //查询招标信息
        ap_loadzbInfo.addParm(1,__spjlid);
        ap_loadzbInfo.addParm(2,__bdid);

        ap_loadzbInfo.invokeProc("APPUSER2017.JW2017_SGXK.PK_QUERY_ZBINFO").then(function(resp){
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                //中标单位类别
                scope.zbdwLbList = resp.data.P_RESULT_ZBDWLB.row_value;
                //构造中标单位类别map,以便显示中标单位名称
                for (var i = 0; i < scope.zbdwLbList.length; i++) {
                    zbdwlb_map.put(scope.zbdwLbList[i].value,scope.zbdwLbList[i]);                    
                }
                console.log("zbdwlb_map",zbdwlb_map);

                zbInfo = resp.data.P_RESULT_ZBINFO.row_value[0];
                //是否隐藏总包标段
                scope.zb_show = zbInfo.C_FBLX == '1';
                //设置(市属+国投)标志
                scope.flag_SSGT = zbInfo.flag_SSGT == '1';
                //根据当前状态判定能否修改
                scope.f_editable = zbInfo.flag_editavle =='1' ? true:false;
                scope.warnning = "温馨提示:已接件或者处于审批中,备案信息无法修改";
                // console.log("zbInfo",zbInfo);
                // console.log("scope.f_editable",scope.f_editable);
            //将查询结果与 BaseCode 匹配
            scope.zbInfo = zbInfo;
            //findText 位于 /script/public/custom/customFunction.js
            scope.zbInfo.C_ZBFW        = findText(zbInfo.C_ZBFW,  BaseCode.P_RESULT_ZBFW.row_value);         //招标范围
            scope.zbInfo.C_ZBLX        = findText(zbInfo.C_ZBLX,  BaseCode.P_RESULT_ZBLX.row_value);         //招标类型
            scope.zbInfo.C_ZBFS        = findText(zbInfo.C_ZBFS,  BaseCode.P_RESULT_ZBFS.row_value);         //招标方式
            scope.zbInfo.C_ZBZZXS      = findText(zbInfo.C_ZBZZXS,BaseCode.P_RESULT_ZBZZXS.row_value);        //招标组织形式
            scope.zbInfo.C_FBLX        = findText(zbInfo.C_FBLX,  BaseCode.P_RESULT_FBLX.row_value);        //发包类型

            //由于修改页面显示内容
            scope.C_FBLX = zbInfo.C_FBLX;
            }else{
                layer.alert("招标基本信息加载失败"+resp.data.PC_MSG,{icon:7});
            }
    });};

//-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->
    //preload 用于判断是新增还是从数据库取值 从数据库取值时,禁用对中标人list的watch,以免取出的主体单位被覆盖掉
    //利用 鼠标悬浮 ng-mouseenter 启动对中标人list的watch 使得主体单位候选框与已选中标人保持一致
    var preload = true;
    scope.f_setpreload = function (){
        //仅在初次加载时判断
        if(scope.ztList.length>0){
            preload = false;
            return;
        }
        var _list = [];
        $("select[ng-model='zbba_input.zbrValueList']").find("option:checked").each(function(){
            if(scope.zbba_input.C_ZT == $(this).val()){
                _list.push({"value":$(this).val(),"text":$(this).text(),"selected":true});
            }else{
                _list.push({"value":$(this).val(),"text":$(this).text()});
            }
        });
        scope.ztList = _list;
        preload = false;

    };

    //监听中标人选择框,将选中的中标人加入主体候选列表
    scope.$watch("zbba_input.zbrValueList",function(n,o){
        if(!preload){

        //现将zbrDetailList缓存起来;
        for(var j = 0;j < scope.zbrDetailList.length;j++){
            zbr_map.put(scope.zbrDetailList[j].value,scope.zbrDetailList[j]);
        } 
        //缓存工程名称
        var gcmcList = [];  

        //--------------------------------------------------------------------------            
        var _list = [];
        $("select[ng-model='zbba_input.zbrValueList']").find("option:checked").each(function(){
            if(scope.zbba_input.C_ZT == $(this).val()){
                _list.push({"value":$(this).val(),"text":$(this).text(),"selected":true});
            }else{
                _list.push({"value":$(this).val(),"text":$(this).text()});
            }
            gcmcList.push($(this).text());
        });
        scope.ztList = _list;
        //--------------------------------------------------------------------------            

        //重新构造主体单位候选框和中标人map

        var tempZbrlist = [];

        // 重新构造zbrmcList
        for (var i = 0; i < scope.zbba_input.zbrValueList.length; i++) {
            //字符串 中标人的获取工程ID
            var tempZbrValue = scope.zbba_input.zbrValueList[i];
            //查看是否已缓存,如果已经缓存,则直接使用缓存的
            var item = zbr_map.get(tempZbrValue);
            // console.log("tempZbrValue",tempZbrValue);
            // console.log("item",item);
            if(item == undefined){
                tempZbrlist.push({"text":gcmcList[i],"value":tempZbrValue});
            }else{
                tempZbrlist.push(zbr_map.get(tempZbrValue));                
            }
        }
        //将变化同步至中标人详细信息数组
        scope.zbrDetailList = tempZbrlist;
        }

        pageEditable();
    },true);

    //监听主体单位选择框,将选中的主体单位加入option
    scope.$watch("zbba_input.C_ZT",function(n,o){
        scope.zbba_input.ztOpt = [];
        $("select[ng-model='zbba_input.C_ZT']").find("option:checked").each(function(){
            scope.zbba_input.ztOpt.push({"value":$(this).val(),"text":$(this).text()});
        });
        pageEditable();
    },true);

    //监听监理单位选择框,将选中的监理单位加入option
    scope.$watch("zbba_input.jldwList",function(n,o){
        scope.zbba_input.jldwOpt = [];
        $("select[ng-model='zbba_input.jldwList']").find("option:checked").each(function(){
            scope.zbba_input.jldwOpt.push({"value":$(this).val(),"text":$(this).text()});
        });
    },true);

    //监听造价咨询机构选择框,将选中的中标人加入主体候选列表
    scope.$watch("zbba_input.zjzxjgList",function(n,o){
        scope.zbba_input.zjzxjgOpt = [];
        $("select[ng-model='zbba_input.zjzxjgList']").find("option:checked").each(function(){
            scope.zbba_input.zjzxjgOpt.push({"value":$(this).val(),"text":$(this).text()});
        });
    },true);
    // scope.setPrefix = function(){
        // scope.seldwlb = zbdwlb_map.get(scope.zbba_input.C_ZBDW_LB).text.trim();
    // };
    //根据单位类别修改资质等级前缀
//-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->

    var list_zbr = function (bdid) {
        var ap = ajaxProxy;
        ap.addParm(1,bdid);

        //根据标志选择不同的存储过程 1 国投+市属 0 非国投+市属
        if(scope.flag_SSGT){
            //部分页面不可编辑
            myGrid.setColTypes("ro,ro,ro,ro,ro");
            $(".zxmsel").attr("disabled",true);
            //根据项目类型,修改部分按钮的表单验证(在jsp上处理)

            ap.invokeProc("APPUSER2017.ZZBSYS_SGXK_INTERFACE.PW_ZZBSYS_GETZBXX").then(function(resp){
            if(resp.status == 200 && resp.data.PN_FLAG*1 == 0){
                // alert("接口调用成功");
                //将已标段备案数据赋予页面
                //中标人
                 var res_zbr = resp.data.P_ZBRXX_RESULT.row_value;
                 var zbr_zt  = [];
                 for (var i = res_zbr.length - 1; i >= 0; i--) {
                     res_zbr[i].selected=true;
                     res_zbr[i].text = res_zbr[i].C_DWMC;
                     res_zbr[i].value = res_zbr[i].C_GUID;
                     if (res_zbr[i].C_ZTBZ == "1") {
                        zbr_zt[0] = {};
                        zbr_zt[0] = res_zbr[i];

                        zbr_zt[0].text =  res_zbr[i].C_DWMC;
                        zbr_zt[0].value = res_zbr[i].C_GUID;

                     }
                 }
                 scope.ztList = zbr_zt;

                 scope.zbrmcList = res_zbr;
                 //缓存至map
                 for (var i = 0; i < res_zbr.length; i++) {
                    zbr_map.put(res_zbr[i].value,res_zbr[i]);
                 }
                 scope.zbrDetailList = res_zbr;
                //标段信息
                //----------------------------------------------------------------------------------
                scope.zbba_input =  resp.data.P_ZBXX_RESULT.row_value[0];
                //----------------------------------------------------------------------------------

                // zbba_input.C_ZCJZS_XM    =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZCJZS_XM  ;
                // zbba_input.C_ZCJZS_ZSH   =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZCJZS_ZSH ;
                // zbba_input.D_KBSJ        =  resp.data.P_ZBXX_RESULT.row_value[0].D_KBSJ      ;
                // zbba_input.C_KBDD        =  resp.data.P_ZBXX_RESULT.row_value[0].C_KBDD      ;
                // zbba_input.N_ZBGM        =  resp.data.P_ZBXX_RESULT.row_value[0].N_ZBGM      ;
                // zbba_input.C_ZBGMDW      =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZBGMDW    ;
                // zbba_input.C_ZBGMMS      =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZBGMMS    ;
                // zbba_input.N_ZBGQ        =  resp.data.P_ZBXX_RESULT.row_value[0].N_ZBGQ      ;
                // zbba_input.C_ZBGQMS      =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZBGQMS    ;
                // zbba_input.C_ZBZL        =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZBZL      ;
                // zbba_input.C_JJFS        =  resp.data.P_ZBXX_RESULT.row_value[0].C_JJFS      ;
                // zbba_input.N_ZBJ         =  resp.data.P_ZBXX_RESULT.row_value[0].N_ZBJ       ;
                // zbba_input.C_ZBJMS       =  resp.data.P_ZBXX_RESULT.row_value[0].C_ZBJMS     ;

            }else{
                layer.alert("操作失败"+resp.data.PC_MSG,{icon:7});
            }
        });
        }else{
            //页面可编辑
            // alert("页面可编辑");
        }

    };


//-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->

//查询子项目
    var zxmList = {rows:[]};
    var queryZxm = function (callback){
        var ap = ajaxProxy;
        ap.addParm(1,__bdid);
        ap.addParm(2,1);
        ap.invokeProc("APPUSER2017.JW2017_UTIL.PK_QUERY_ZXMLIST").then(function(resp){
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                var res_zxm = resp.data.P_RESULT_LIST_ZXM;
                //子项目grid格式
   //                zxmList = {"rows":
                                // [{"id":"_1","zxmid":zxmid,"data":["项目名称1111","","","",""]},
                                 // {"id":"_2","zxmid":zxmid,"data":["项目名称2222","","","",""]}]};


                for (var i=0; i<res_zxm.row_count; i++) {
                    //赋值到zxmList
                    zxmList.rows.push({ id:"_"+i,zxmid: res_zxm.row_value[i].value,data:[res_zxm.row_value[i].text,res_zxm.row_value[i].N_JZMJ,"<SELECT id = '"+"__"+i+"'>"+ optstr +"</SELECT>","",""] });

                }
                callback();
            }else{
                layer.alert(""+resp.data.PC_MSG,{icon:7});
            }
    });};


    var myGrid = new dhtmlXGridObject('zxmGrid');
//初始化子项目列表,并填入数据

        var initzxmgrid =function (callback) {
            myGrid.setImagePath("../script/dhtmlx/skins/web/imgs/");
            myGrid.setHeader("子项目名称,子项目中标规模,子项目中标规模单位,子项目中标价（万元）,子项目中标单方价（万元）");
            myGrid.setInitWidthsP("*,20,12,13,13");
            myGrid.setColAlign("left,left,left,left,left");
            myGrid.setColTypes("ro,ro,ro,ed,ed");
            myGrid.enableAutoWidth(true);
            myGrid.init();
            myGrid.parse(zxmList,"json");
            myGrid.setColValidators([null,"ValidNumeric",null,"ValidNumeric","ValidNumeric"]);
            myGrid.attachEvent("onValidationError", function(id,index,value,rule){
                // your code here
                return true;
            });
            myGrid.attachEvent("onEditCell", function(stage,rId,cInd,nValue,oValue){
                // your code here
                if(stage == 2){
                    return myGrid.validateCell(rId,cInd);
                }
                return true;
            });
            callback();
    };

    //-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-
    var getzxminfo = function (){
        var zxminfo = [];
        //存放当前行数据
        var zxmtemp = [];
        //计数器 用于取得子项目项目id
        var i = 0;
        myGrid.forEachRow(function(id){
            zxmtemp = [];
            //将子项目id传入
            zxmtemp.push(zxmList.rows[i].zxmid);
            myGrid.forEachCell(id, function(cellObj, ind){
                    if (ind != 2) {
                        zxmtemp.push(cellObj.getValue());
                    }else{
                    //将otion的赋值给zxminfo
                      zxmtemp.push($("#_"+id).find("option:selected").attr("value"));
                    }
            });
            zxminfo.push(zxmtemp);
            i++;
        });
        return zxminfo;
    };


    var ycz_res_zxm = {};
    //加载页面信息
    var query_zbbainfo = function (callback1,callback2){
        var ap = ajaxProxy;
        ap.addParm(1,__spjlid);
        ap.invokeProc("APPUSER2017.JW2017_SGXK.PK_QUERY_ZBBA").then(function(resp){
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                console.log("resp",resp);
                scope.flag_sfkbj = resp.data.P_RESULT_ZBINFO.row_value[0].flag_sfkbj==0 ? false:true;
                scope.flag_sfth = resp.data.P_RESULT_ZBINFO.row_value[0].flag_sfth==1 ? true:false;
                console.log("flag_sfkbj",scope.flag_sfkbj);
                console.log("flag_sfth",scope.flag_sfth);

                if (resp.data.P_RESULT_BDINFO.row_count == 0) {
                    //审批记录不存在,则需要查询子项目
                    callback2();
                } else {
                    preload = true;
                    //存在审批记录,直接为页面赋值,并构造grid
                    scope.zbba_input = resp.data.P_RESULT_BDINFO.row_value[0];

                    //中标人与主体单位
                      var zbropt = resp.data.P_RESULT_ZBROPT;
                      // console.log("zbropt",zbropt);                            
                      scope.zbrmcList = zbropt.row_value;
                     //缓存至map
                     for (var i = 0; i < zbropt.row_count; i++) {
                        zbr_map.put(zbropt.row_value[i].value,zbropt.row_value[i]);
                     }               
                            
                      scope.ztList = zbropt.row_value;
                      scope.zbrDetailList = zbropt.row_value;
                      // console.log("zbr_map",zbr_map);                            
                      // console.log("scope.zbrDetailList",scope.zbrDetailList);                            
                      //联合体中标,设置主体单位
                      if (zbropt.row_value.length>1) {
                        for (var i = 0; i < zbropt.row_value.length; i++) {
                            if(zbropt.row_value[i].C_ZTBZ == 1){
                                //主题候选框
                                scope.zbba_input.C_ZT =  [zbropt.row_value[i].value];      
                                
                                scope.zbba_input.ztOpt = [{value:zbropt.row_value[i].value}];                                                                        
                            }
                        }
                        // scope.ztList = [{"text":resp.data.P_RESULT_BDINFO.row_value[0].C_ZHBR_MC,
                        //                           "value":resp.data.P_RESULT_BDINFO.row_value[0].N_ZHBR,
                        //                           "selected":true}];
                      }
                    //监理单位
                    scope.jldwList = [{"text":resp.data.P_RESULT_BDINFO.row_value[0].C_JLDW_MC,
                                        "value":resp.data.P_RESULT_BDINFO.row_value[0].N_JLDW,
                                        "selected":true}];
                    //造价咨询机构
                    scope.zjzxjgList = [{"text":resp.data.P_RESULT_BDINFO.row_value[0].C_ZJZXJG_MC,
                                       "value":resp.data.P_RESULT_BDINFO.row_value[0].N_ZJZXJG,
                                       "selected":true}];

                    //构造3个单位的select和子项目的grid;
                    //构造子项目grid
                    //子项目grid格式
   //                zxmList = {"rows":
//                                 [{"id":"_1","zxmid":zxmid,"data":["项目名称1111","","","",""]},
//                                  {"id":"_2","zxmid":zxmid,"data":["项目名称2222","","","",""]}]};
                    var yx_res_zxm = resp.data.P_RESULT_BDZXM;
                    for (var i=0; i<yx_res_zxm.row_count; i++) {
                        //赋值到zxmList
                        zxmList.rows.push({ id:"_"+i,
                                            zxmid: yx_res_zxm.row_value[i].zxmid,
                                            data:[yx_res_zxm.row_value[i].ZXMMC,
                                                  yx_res_zxm.row_value[i].ZBGM,
                                                  "<SELECT class='zxmsel' id = '"+"__"+i+"'>"+ optstr +"</SELECT>",
                                                  yx_res_zxm.row_value[i].ZBJ,
                                                  yx_res_zxm.row_value[i].DFZJ
                                                  ] });
                    }
                    ycz_res_zxm = yx_res_zxm;
                    //初始化grid
                    callback1();
                }
            }else{
                layer.alert(""+resp.data.PC_MSG,{icon:7});
            }
        });};
    //根据query_zbbainfo查询到的子项目信息设置grid中的中标单位默认值
    var setDefault = function () {
        for (var i = 0; i < ycz_res_zxm.row_count; i++) {
            $("#__"+i).val(ycz_res_zxm.row_value[i].ZBGMJLDW);
        }
    };

    var pageEditable = function(){
        if (!scope.f_editable) {
            $('input').each(function(){
             $(this).attr("disabled",true);  
            }); 
            $('select').each(function(){
                 $(this).attr("disabled",true);  
                });                               
            $('textarea').each(function(){
             $(this).attr("disabled",true);  
            });                                
        }        
    };
     //页面加载顺序: 查询基础代码 --> 加载基础代码 --> 加载招标信息  -->查询审批记录( 1.审批记录不存在 -->查询子项目 --> 初始化子项目grid
     //                       --> 加载可选下拉列表                            2.审批记录存在  -->直接初始化grid 查询并加载其余下拉框的已选值
     var init =function () {
        queryBaseCode(
            function(){
                // console.log("查询基础代码,queryBaseCode");
                loadBaseCode(
                    function(){
                        // console.log("加载基础代码,loadBaseCode");
                        loadzbInfo(function(){
                            // console.log("加载招标信息,loadzbInfo");
                            query_zbbainfo(
                                function(){
                                    // console.log("查询招标备案记录 如果审批记录存在,根据返回的子项目-->-->初始化grid-->-->query_zbbainfo-->-->-->-->->initzxmgrid>");
                                    initzxmgrid(
                                        function(){
                                            // console.log("设置默认值 添加点击事件 setDefault");
                                            list_zbr(__bdid);
                                            setDefault();
                                            pageEditable();
                                    });
                                         },
                                function(){
                                  // console.log("查询招标备案信息 如果审批记录不存在,查询标段子项目query_zbbainfo-->-->-->-->->queryZxm");
                                  queryZxm(function(){
                                      // console.log("initzxmgrid-->-->-->attachEvent");
                                      initzxmgrid(
                                        function(){
                                            list_zbr(__bdid);
                                            pageEditable();
                                        });
                                  });
                               }
                            );
                        });
                    }
                );
        });
     };
     //测试存储过程
     var test_PK_QUERY_ZBBA = function (){
            var ap = ajaxProxy;
            ap.addParm(1,__spjlid);
            ap.invokeProc("APPUSER2017.JW2017_SGXK.PK_QUERY_ZBBA").then(function(resp){
        if(resp.status == 200 && resp.data.PN_RET*1 == 0){
        }else{
                    layer.alert(""+resp.data.PC_MSG,{icon:7});
        }
            });};

    var test =function () {
        test_PK_QUERY_ZBBA();
        // scope.zbba_input = {};
    };

     init();
//     test();
    //-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-
    // 下一步事件
    scope.f_next = function(){
        scope.zbba_input.zxmGrid = getzxminfo();
        if (dison)
        {
            scope.next=true;
            return;
        }
        //禁用提交按钮
        scope.next=true;
        scope.zbba_input.N_SPJLID = __spjlid;
        scope.zbba_input.N_BDID = __bdid;

        scope.zbba_input.ztList = scope.ztList;
        //是否为国投+市属
        scope.zbba_input.flag_ssgt      = scope.flag_SSGT ? 1 : 0;

        //判断是否为联合体中标
        scope.zbba_input.flag_lht = scope.ztList.length > 1 ? 1 : 0;

        //将主体中标人筛选出来
        if (scope.ztList.length==1) {
            zbba_input.N_ZHBR       = scope.ztList[0].value;
            zbba_input.C_ZHBR_MC    = scope.ztList[0].text;
            zbba_input.C_ZHBR_ZZ    = scope.ztList[0].C_ZHBR_ZZ;
            zbba_input.C_ZCJZS_XM   = scope.ztList[0].C_ZCJZS_XM;
            zbba_input.C_AQSCXKZH   = scope.ztList[0].C_AQSCXKZH;
            zbba_input.C_ZCJZS_ZZDJ = scope.ztList[0].C_ZCJZS_ZZDJ;
            zbba_input.C_ZCJZS_ZSH  = scope.ztList[0].C_ZCJZS_ZSH;
            zbba_input.C_ZCJZS_BGDH = scope.ztList[0].C_ZCJZS_BGDH;
            zbba_input.C_ZCJZS_YDDH = scope.ztList[0].C_ZCJZS_YDDH; 
        } else {
            var tempzbr = scope.zbba_input.ztOpt[0].value;
            var tempname = scope.zbba_input.ztOpt[0].text;
            for (var i = 0; i < scope.ztList.length; i++) {
                if(tempzbr == scope.ztList[i].value){
                //如有需要,可以通过此处设置主体标注    
                zbba_input.N_ZHBR       = scope.ztList[i].value;
                zbba_input.C_ZHBR_MC    = scope.ztList[i].text;
                zbba_input.C_ZHBR_ZZ    = scope.ztList[i].C_ZHBR_ZZ;
                zbba_input.C_ZCJZS_XM   = scope.ztList[i].C_ZCJZS_XM;
                zbba_input.C_AQSCXKZH   = scope.ztList[i].C_AQSCXKZH;
                zbba_input.C_ZCJZS_ZZDJ = scope.ztList[i].C_ZCJZS_ZZDJ;
                zbba_input.C_ZCJZS_ZSH  = scope.ztList[i].C_ZCJZS_ZSH;
                zbba_input.C_ZCJZS_BGDH = scope.ztList[i].C_ZCJZS_BGDH;
                zbba_input.C_ZCJZS_YDDH = scope.ztList[i].C_ZCJZS_YDDH;    

                //将详细信息赋值给主体数组    
                scope.zbba_input.ztOpt = [scope.ztList[i]];            
                }
            }
        }


        scope.zbba_input.zbrDetailList =scope.zbrDetailList;
    

        var jsonInfo = angular.toJson(scope.zbba_input);
        console.log(scope.zbba_input);
//        return;
        var ap_save = ajaxProxy;
        ap_save.addParm(1,jsonInfo);
        ap_save.invokeProc("APPUSER2017.JW2017_SGXK.PK_CU_ZBBA").then(function(resp){
            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                  if(pra){
                      ajaxProxy.addParm("PN_SPJLID",N_SPJLID);
                      ajaxProxy.addParm("PC_YWLX",3);      
                      ajaxProxy.invokeProc("APPUSER2017.JW2017_SGXK.PK_SAVE_TJSP_STATUS").then(function(resp){
                            if(resp.status == 200 && resp.data.PN_RET*1 == 0){
                                layer.alert("保存成功，跳转下一步。",{icon:1},function(idx){
                                    layer.close(idx);
                                    $.f_submit_post("sgxksb_ajxx.jsp",{"spjlid":__spjlid, "bdid":__bdid,"xmid":__xmid});
                               });
                            }else{
                              layer.alert("修改已保存,但提交审批失败提交失败"+resp.data.PC_MSG,{icon:7});
                            }
                        });
                      }
                  else{
                        layer.alert("保存成功，跳转下一步。",{icon:1},function(idx){
                            layer.close(idx);
                            $.f_submit_post("sgxksb_ajxx.jsp",{"spjlid":__spjlid, "bdid":__bdid,"xmid":__xmid});
                       });
                  }



            }else{
                layer.alert("保存失败"+resp.data.PC_MSG,{icon:7});
            }
        });
    };
}]);

// placeholder
$(function(){
    $('input, textarea').placeholder();
});

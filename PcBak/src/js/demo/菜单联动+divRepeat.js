@sgxksb_zbba
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
        console.log("tempZbrValue",tempZbrValue);
        console.log("item",item);
        if(item == undefined){
            tempZbrlist.push({"text":gcmcList[i],"value":tempZbrValue});
        }else{
            tempZbrlist.push(zbr_map.get(tempZbrValue));                
        }
    }
    //将变化同步至中标人详细信息数组
    scope.zbrDetailList = tempZbrlist;
    }
},true);
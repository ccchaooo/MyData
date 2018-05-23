    //preload 用于判断是新增还是从数据库取值 从数据库取值时,禁用对中标人list的watch,以免取出的主体单位被覆盖掉
    //利用 鼠标悬浮 ng-mouseenter 启动对中标人list的watch 使得主体单位候选框与已选中标人保持一致
    var preload = false;
    scope.f_setpreload = function (){
        var _list = [];
        $("select[ng-model='zbba_input.zbrmcList']").find("option:checked").each(function(){
            if(scope.zbba_input.C_ZT == $(this).val()){
                _list.push({"value":$(this).val(),"text":$(this).text(),"selected":true});
            }else{
                _list.push({"value":$(this).val(),"text":$(this).text()});
            }
        });
        scope.selectedzbrList = _list;
        preload = false;

    };

    //监听中标人选择框,将选中的中标人加入主体候选列表
    scope.$watch("zbba_input.zbrmcList",function(n,o){
        if(!preload){
        var _list = [];
        $("select[ng-model='zbba_input.zbrmcList']").find("option:checked").each(function(){
            if(scope.zbba_input.C_ZT == $(this).val()){
                _list.push({"value":$(this).val(),"text":$(this).text(),"selected":true});
            }else{
                _list.push({"value":$(this).val(),"text":$(this).text()});
            }
        });
        scope.selectedzbrList = _list;

        }
    },true);
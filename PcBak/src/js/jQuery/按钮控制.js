var pageEditable = function(){
    if (!scope.f_editable || !scope.flag_sfkbj) {
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

//两种方法设置disabled属性
$('#areaSelect').attr("disabled",true);
$('#areaSelect').attr("disabled","disabled");

//三种方法移除disabled属性
$('#areaSelect').attr("disabled",false);
$('#areaSelect').removeAttr("disabled");
$('#areaSelect').attr("disabled","");

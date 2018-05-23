    // 获取验证码
    scope.getVerifyCode = function(){
        var time = Math.random();
        scope.verifycod="/cdjwztyypt/qyxx/kcsj/getVerifyCode.do?t="+time;
    };

    scope.getVerifyCode();


    // 校核验证码
    scope.f_checkVerifyCode = function(){
        // scope.dirty = true; //输入国验证码之后才启用
        // scope.codepass = false; //验证码是否通过

        // alert(scope.codeInput);
        if(scope.codeInput.length!= 4){
            // alert(scope.codeInput.length);
            return;
        }else{
            $.ajax({    
                type : "get",    
                url : "/cdjw_blsp/qyxx/kcsj/checkVerifyCode.do?code="+scope.codeInput,    
                data : "code=" + scope.codeInput,    
                async : true,    
                success : function(data){
                    data = JSON.parse(data);
                    console.log(data);
                    if(data.flag*1 != 0 ){
                        scope.$apply(function(){
                            scope.dirty = true; //输入国验证码之后才启用
                            scope.codepass = false; //验证码是否通过                            
                        })
                    }else{
                        scope.$apply(function(){
                            scope.dirty = true; //输入国验证码之后才启用
                            scope.codepass = true; //验证码是否通过
                        })
                    }
                }    
            }); 
        }
    };

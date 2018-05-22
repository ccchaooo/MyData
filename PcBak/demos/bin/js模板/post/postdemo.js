
			        $.post("../xmbj/saveBdxx.do",
               {"jsonStr":jsonInfo},
               function(resp){
                  if(resp.flag*1 == 0){
						layer.alert(
									"保存成功！",
									{icon:1},
									function(){
												if(test){
												location.href="/cdjwztyypt/xmbj/xmbj_bdxx.jsp?xmid="+xmid+"&bdid="+bdid;
												}else{
												location.href="/cdjwztyypt/xmbj/xmbj_bdxx_list.jsp?xmid="+__xmid;
												}
											  }
									);
						
				 }else{	
						layer.alert(resp.msg,{icon:7});
						}
						scope.$apply(function(){
						    scope.if_next=false;				
						});
               },
            "json");
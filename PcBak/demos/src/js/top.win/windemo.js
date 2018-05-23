var win = top.$.MdiWindow(window, 1024, 550, 0, 0, true);
            win.setTitle(title, "font-family:微软雅黑;font-size:14px");
            win.setWindowArguments(args);
            win.btnClose(true);
            win.btnMax(false);
            win.btnMin(false);
            win.isResize(false);
            win.onCancel(function(winindex){
                win.close(winindex);
                return false;
            });
            win.onClose(function(){
                f_query();
            });
            win.load("sjwjVerifying.jsp", window, function(obj){
            });

//===解决 windowArguments is not defined======//

// 被打开的mdi窗口需要设置一个入口函数function _init(args,mdi,layerIdx,parentWin);
// 1. 参数args：打开页面传到被打开页面的参数对象
// 2. 参数mdi：打开页面设置的win对象
// 3. 参数layerIdx：被打开的窗口的layer-zIndex，通过它关闭被打开的窗口top.layer.close(layerIdx);
// 4. 参数parentWin：打开页面的window对象，通过它可以设置返回值对象 parentWin.returnValue ={}        

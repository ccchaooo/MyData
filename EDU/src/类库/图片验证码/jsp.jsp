
<div class="row" style="margin-top: 20px;margin-bottom: 20px;">
    <div class="col-xs-5">
        <div class="form-group">
          <label class="control-label col-sm-3" for="inputSuccess3">请输入验证码</label>
          <div class="col-sm-6">
            <label class="sr-only" for="codeInput"></label>
            <input  ng-change="f_checkVerifyCode();" id="codeInput"  
                    class="form-control" 
                    aria-describedby="inputSuccess3Status" type="text" name="code" ng-model="codeInput" 
                    ng-minlength="4"
                    ng-maxlength="4"
                    ng-required="true"
                    placeholder="请填写验证码"/>  
          </div>
          <div class="col-sm-2" style="padding-left: 0;">
            <label class="sr-only"></label>
            <button ng-show="codepass && dirty" type="button" class="btn btn-success">(正确)</button>                                                                           
            <button ng-show="!codepass && dirty" type="button" class="btn btn-warning">(错误)</button>                                                                           
          </div>                                    
        </div>
    </div>      

    <div class="col-xs-5">
        <span class="form-inline">
           <img id="imgVerify" ng-src="{{verifycod}}"  alt="看不清楚?点击刷新" />&nbsp;&nbsp;
           <span class="glyphicon glyphicon-refresh" ng-click="f_getVerifyCode();"></span>
           <label ng-click="f_getVerifyCode();">点击更换</label>
        </span>                                
    </div>                                                      
</div>


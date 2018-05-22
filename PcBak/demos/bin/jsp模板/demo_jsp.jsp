获取参数并绑定到全局变量
	<%
        String xmid_str = request.getParameter("xmid");
        String zxmid_str = request.getParameter("zxmid");
        String gcid_str = request.getParameter("gcid");
        int xmid = 0;
        int zxmid = 0;
        int gcid = 0;
        try{
            xmid = Integer.parseInt(xmid_str);
            zxmid = Integer.parseInt(zxmid_str);
            gcid = Integer.parseInt(gcid_str);
                    
        }catch(Exception e){
            
        }
    %> 
    <script type="text/javascript">
        // 定义全局变量
        var __xmid="<%=xmid%>";
        var __zxmid="<%=zxmid%>";
        var __gcid="<%=gcid%>";
    </script>
标题
					<div class="row">
                        <h3 class="text-left" ng-model="ajxxInfo.title"><!-- {{ajxxInfo.title}} -->招标信息</h3>
                    </div>

多选框

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">脚手架类型
                                <small ng-show="ajxxForm.C_ZJCLX.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <select ui-select2 data-theme="bootstrap" class="form-control" name="C_ZJCLX" ng-model="ajxxInfo.C_ZJCLX"
                                    ng-required="true">
                                <option ng-repeat="zjc in zjcList" ng-value="zjc.value" ng-selected=" zjc.value==ajxxInfo.C_ZJCLX ">{{zjc.text}}</option>
                            </select>
                        </div>
                    </div>

单选框

						<div class="col-xs-6" >
                            <label class="control-label">是否跨区
                              <small ng-show="xmbjForm.C_SFKQ.$invalid" style="font-weight: normal;color: #F00;">必选项</small>
                            </label>
                            <select ui-select2 data-theme="bootstrap"  class="form-control" name="C_SFKQ" id="C_SFKQ" ng-model="xmbjInfo.C_SFKQ" ng-required="true">
                                <option ng-repeat="item in sfkqList" ng-value="item.value" ng-selected=" item.value == xmbjInfo.C_SFKQ ">{{item.text}}</option>
                            </select>
                        </div>


单列满行


                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">脚手架高度
                                <small ng-show="ajxxForm.N_JSJGD.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input class="form-control" type="text" name="N_JSJGD" ng-model="ajxxInfo.N_JSJGD"
                                   ng-required="true" ng-minlength="3" ng-maxlength="1000" placeholder="请填写脚手架高度"
                            />
                        </div>
                    </div>


单列半行

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">基础结构形式
                                <small ng-show="ajxxForm.N_JSJGD.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <input class="form-control" type="text" name="N_JSJGD" ng-model="ajxxInfo.N_JSJGD"
                                   ng-required="true" ng-minlength="3" ng-maxlength="1000" placeholder="<选项>"
                            />
                        </div>
                    </div>

2列满行

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">第一列
                                <small ng-show="ajxxForm.N_JSJGD.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input class="form-control" type="text" name="N_JSJGD" ng-model="ajxxInfo.N_JSJGD"
                                   ng-required="true" ng-minlength="3" ng-maxlength="1000" placeholder="请填写脚手架高度"
                            />
                        </div>
						<div class="col-xs-6" >
                            <label class="control-label">第二列
                                <small ng-show="ajxxForm.N_JSJGD.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input class="form-control" type="text" name="N_JSJGD" ng-model="ajxxInfo.N_JSJGD"
                                   ng-required="true" ng-minlength="3" ng-maxlength="1000" placeholder="请填写项目经理"
                            />
                        </div>
                    </div>

下一步
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-4"></div>
                        <div class="col-xs-4">
                            <button class="btn btn-block btn-success" ng-disabled="ajxxForm.$invalid && !next" ng-click="f_next();">下一步</button>
                        </div>
                    </div>

文本域
					<div class="form-group" style="margin-top: 20px;"> 
						<label class="control-label">备注
                                <small ng-show="ajxxForm.C_BZ.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
						<textarea class="form-control" rows="3" ng-model="ajxxInfo.C_BZ"></textarea> 
					</div> 
数值单位
					<div class="input-group">
					    <input class="form-control" type="text" name="N_BDTZ" ng-model="bdInfo.N_BDTZ"
					           ng-required="true"
					           ng-pattern="/^[0-9]\d*$|^(?:[1-9][0-9]*\.[0-9]+|0\.(?!0+$)[0-9]+)$/"
					           ng-maxlength="10" placeholder="请填写标段投资额"
					    />
					    <div class="input-group-addon">万元</div>
					</div>
带选项的多选框
		            <div class="row" style="margin-top: 20px;">
		                <div class="col-xs-12" >
		                    <label class="control-label">选择标段暂估价内容
		                        <small ng-show="bdForm.C_BDZGJNR.$invalid" style="font-weight: normal;color: #F00;"></small>
		                    </label>
		                    <select ui-select2 data-theme="bootstrap" class="form-control" name="C_BDZGJNR" ng-model="bdInfo.C_BDZGJNR" multiple="multiple" >
		                        <option ng-if=" bdInfo.C_FBLX=='1' " ng-repeat="bdzgjnr in zgjnrZcbList" ng-value="bdzgjnr.value">{{bdzgjnr.text}}</option>
		                        <option ng-if=" bdInfo.C_FBLX=='3' " ng-repeat="bdzgjnr in zgjnrZzfbList" ng-value="bdzgjnr.value">{{bdzgjnr.text}}</option>
		                    </select>
		                </div>
		            </div>
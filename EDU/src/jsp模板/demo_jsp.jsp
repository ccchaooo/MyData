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

checkbox                        
                    </div>
                          <div class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" style="padding-left: 0;">
                              <label class="control-label">增加企业资质
                                <small  style="font-weight: normal;color: #F00;"><br/>
                                  <input type="checkbox" ng-model="addqy">
                                </small>
                              </label>
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

//日期设置时分秒
<input  ng-disabled="flag_SSGT" style="cursor:hand" onfocus="this.blur()" class="form-control" name="D_KBSJ" type="text" ng-model="zbba_input.D_KBSJ"
                                    data-calendar-cdmcs data-date-format="%Y-%m-%d %H:%i" ng-required="true" placeholder="请填写开标时间"/>

日期不可手写
style="cursor:hand" onfocus="this.blur()"

/*设置cell的滚动条样式*/
div#contentForm{
	position: relative;
	width: 100%;
	height: 100%;
	overflow: auto;
}

表单位通过则禁用
ng-disabled="zbbaForm.$invalid"

ng的密码
equals="regInfo.C_PASSWORD"

ng-repeat

                    <div ng-repeat="ele_zbr in zbrDetailList">
                        <div class="row">
                            <div class="col-xs-12" style="padding-top: 40px;">
                                 <%--<label class="control-label">请填写单位信息:--%>
                                <%--</label>--%>
                                <h4>
                                    <span ng-if="zbba_input.zbrValueList.length > 1">{{($index+1)+'、'}}</span>
                                    <span>请填写中标单位“</span>
                                    <span>{{ele_zbr.text}}</span>
                                    <span>”相关信息</span>
                                </h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6" >
                                <label class="control-label">单位类别
                                    <small ng-if="zbbaForm['C_ZBDW_LB_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <select ng-change="setPrefix()" ng-disabled="flag_SSGT && ele_zbr.flag_item.C_ZBDW_LB != null && ele_zbr.flag_item.C_ZBDW_LB != ''"
                                        select2-cdmcs="zbdwLbList" class="form-control" name="C_ZBDW_LB_{{$index}}" ng-model="ele_zbr.C_ZBDW_LB"
                                        placeholder="请选择单位类别"
                                        ng-required="true">
                                </select>
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    <!-- <span ng-bind="seldwlb"></span> -->
                                    <span>资质等级</span>
                                    <small ng-if="zbbaForm['C_ZHBR_ZZ_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  class="form-control" type="text" name="C_ZHBR_ZZ_{{$index}}" ng-model="ele_zbr.C_ZHBR_ZZ"
                                        ng-required="true" ng-maxlength="200" size="200"
                                         placeholder="请填资质等级"
                                />
                            </div>
                        </div>
                        <div ng-if="ele_zbr.C_ZBDW_LB =='003'||ele_zbr.C_ZBDW_LB =='004'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">项目负责人姓名
                                    <small ng-if="zbbaForm['C_XMFZR_XM_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input class="form-control" type="text" name="C_XMFZR_XM_{{$index}}" ng-model="ele_zbr.C_XMFZR_XM"
                                       ng-required="true"
                                       placeholder="请填项目负责人姓名"
                                />
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    <span >项目负责人移动电话</span>
                                    <small ng-if="zbbaForm['C_XMFZR_YDDH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input onkeyup="dumpNum(11)"  class="form-control" type="text" name="C_XMFZR_YDDH_{{$index}}" ng-model="ele_zbr.C_XMFZR_YDDH"
                                        ng-required="true"
                                        placeholder="请填项目负责人移动电话"
                                />
                            </div>
                        </div>
                        <div ng-if="ele_zbr.C_ZBDW_LB =='001'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">安全生产许可证号
                                    <small ng-if="zbbaForm['C_AQSCXKZH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input   class="form-control" type="text" name="C_AQSCXKZH_{{$index}}" ng-model="ele_zbr.C_AQSCXKZH"
                                         ng-required="true"
                                         ng-maxlength="30" placeholder="请填安全生产许可证号"
                                />
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师姓名
                                    <small ng-if="zbbaForm['C_ZCJZS_XM_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input ng-readonly="flag_SSGT && ele_zbr.flag_item.C_ZCJZS_XM != null && ele_zbr.flag_item.C_ZCJZS_XM != ''"  class="form-control" type="text" name="C_ZCJZS_XM_{{$index}}" ng-model="ele_zbr.C_ZCJZS_XM"
                                       ng-required="true"
                                       placeholder="请填注册建造师"
                                />
                            </div>
                        </div>
                        <div ng-if="ele_zbr.C_ZBDW_LB =='001'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师等级
                                    <small ng-if="zbbaForm['C_ZCJZS_ZZDJ_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  class="form-control" type="text" name="C_ZCJZS_ZZDJ_{{$index}}" ng-model="ele_zbr.C_ZCJZS_ZZDJ"
                                        ng-required="true"
                                        placeholder="请填注册建造师等级"
                                />
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师证书号
                                    <small ng-if="zbbaForm['C_ZCJZS_ZSH_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input ng-readonly="flag_SSGT && ele_zbr.flag_item.C_ZCJZS_ZSH != null && ele_zbr.flag_item.C_ZCJZS_ZSH != ''" class="form-control" type="text" name="C_ZCJZS_ZSH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_ZSH"
                                       ng-required="true"
                                       placeholder="请填注册建造师证书号"
                                />
                            </div>
                        </div>
                        <div ng-if="ele_zbr.C_ZBDW_LB =='001'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师移动电话
                                    <small ng-if="zbbaForm['C_ZCJZS_YDDH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  onkeyup="dumpNum(11)" class="form-control" type="text" name="C_ZCJZS_YDDH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_YDDH"
                                        ng-required="true"
                                        minlength="11"
                                        placeholder="请填注册建造师移动电话"
                                />
                            </div>
                          <div ng-if="ele_zbr.C_ZBDW_LB =='001'" class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师办公电话
                                    <small ng-if="zbbaForm['C_ZCJZS_BGDH_'+$index].$invalid" style="font-weight: normal;color: #F00;"></small>
                                </label>
                                <input  onkeyup="dumpTel()" class="form-control" type="text" name="C_ZCJZS_BGDH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_BGDH"
                                        ng-required="false"
                                        placeholder="请填注册建造师办公电话"
                                />
                            </div>
                        </div>
                    </div>

链接触发事件
                  <div><a href="javascript:;" style="display: inline-block;" ng-click="f_getpic(ele_qyzz.SAVED_C_ZSBH);">查看已登记的资质证书</a></div>
                  <img ng-src="{{pic_src}}" style="cursor: pointer;"/>

a标签打开图片       <div><a href="{{ele_qyzz.pic_src}}" style="display: inline-block;" target="_blank" ng-click="f_getpic('2',ele_qyzz.C_ZZID,ele_qyzz.index);" ng-bind="ele_qyzz.fun"></a></div>


angular中的单位
                <div class="col-xs-3" >
                    <label class="control-label">建筑层数（地上）
                        <small ng-show="zxmForm.N_JZCS_DS.$invalid" style="font-weight: normal;color: #F00;">只能输入正整数，最大长度3。</small>
                    </label>
                    <div class="input-group">
                        <input class="form-control" type="text" name="N_JZCS_DS" ng-model="zxmInfo.N_JZCS_DS"
                               ng-pattern="/^[0-9]{1}[0-9]{0,2}$/"
                               ng-maxlength="3" placeholder="请填写地上建筑层数"
                        />
                        <div class="input-group-addon">层</div>
                    </div>
                </div>
table中的单位
            <td class="xmxx_lm" ><label>项目总建筑面积</label></td>
            <td class="xmxx_nr">
                <div class="input-group" style="width: 100%">
                    <input type="text" onKeyUp="dumpfloat(10,6);"  ng-model="xmInfo.N_ZJZMJ" 
                        onpaste="dumpfloat(10,6);" style="width: 100%;"
                        class="form-control" name="N_ZJZMJ" id="N_ZJZMJ"
                        aria-describedby="basic-addon2"> <span
                        class="input-group-addon" 
                        id="basic-addon2">平方米</span>
                </div>
            </td>

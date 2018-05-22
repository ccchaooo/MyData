<div ng-repeat="ele_zbr in selectedzbrList">
	<div class="row">
		<div class="col-xs-12" style="padding-top: 40px;">
			 <label class="control-label">请填写单位信息:
			</label>
			<h4 ng-bind="ele_zbr.text"> </h4>
		</div>
	</div>      
	<div class="row" style="margin-top: 20px;">
		<div class="col-xs-6" >
			<label class="control-label">安全生产许可证号
				<small ng-show="zbbaForm['C_AQSCXKZH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
			</label>
			<input   class="form-control" type="text" name="C_AQSCXKZH_{{$index}}" ng-model="ele_zbr.C_AQSCXKZH"
					 ng-required="true"
					 ng-maxlength="30" placeholder="请填安全生产许可证号"
			/>
		</div>
		<div class="col-xs-6" >
			<label class="control-label">资质等级
				<small ng-show="zbbaForm.C_ZHBR_ZZ.$invalid" style="font-weight: normal;color: #F00;">*</small>
			</label>
			<input  class="form-control" type="text" name="C_ZHBR_ZZ" ng-model="ele_zbr.C_ZHBR_ZZ"
					ng-required="true"
					ng-maxlength="10" placeholder="请填资质等级"
			/>
		</div>
	</div>
</div>
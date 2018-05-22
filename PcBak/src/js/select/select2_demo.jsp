<link rel="stylesheet" type="text/css" href="../script/select2/css/select2.min.css" />
<link rel="stylesheet" type="text/css" href="../script/select2/css/select2-bootstrap.min.css" />
<script type="text/javascript" src="../script/select2/js/select2.full.min.js"></script>
<script type="text/javascript" src="../script/select2/js/i18n/zh-CN.js"></script>

<script type="text/javascript" src="../script/angular/select2.js"></script>
<script type="text/javascript" src="../script/angular/select2.cdmcs.js"></script>


若使用了ng,则
var app = angular.module("bdxxApp",["AjaxProxy","ui.select2","select2.cdmcs","DHTMLXGrid"]);

ui-select2:
<select ui-select2 data-theme="bootstrap" class="form-control" name="C_LXPZDW_QH" ng-model="bdInfo.C_LXPZDW_QH"  ng-required="true">
	<option ng-repeat="lxpzdw in lxpzdwList" ng-value="lxpzdw.value" ng-selected=" lxpzdw.value == bdInfo.C_LXPZDW_QH " >{{lxpzdw.text}}</option>
</select>

麦柯封装的select2
<select select2-cdmcs="bdInfo.bdzxmlList" class="form-control" name="bdzxm" ng-model="bdInfo.bdzxm"
        ng-required="true"
		multiple="multiple"
		>
</select>
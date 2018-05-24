js:
var app = angular.module("bdxxApp",["AjaxProxy","ui.select2","select2.cdmcs","DHTMLXGrid"]);
jsp:
<select select2-cdmcs="jldwList" class="form-control" name="N_JLDW" ng-model="zbbaInfo.N_JLDW"
                                        ng-required="true"
										multiple<!--多选框--!> >
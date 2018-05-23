<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <title>成都市建筑主体网上办事</title>

    <link rel="stylesheet" type="text/css" href="../script/bootstrap-3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../pub.css" />
    <!--[if lt IE 8]>
    <script type="text/javascript">
        alert("请使用主流浏览器访问，系统不支持IE8以下版本。");
    </script>
    <![endif]-->
    <!--[if IE 8]>
    <script type="text/javascript" src="../script/angular/ie8/example/vendor/es5-shim.min.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../script/public/iefix/html5shiv.min.js"></script>
    <script type="text/javascript" src="../script/public/iefix/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="../script/public/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../script/public/jquery/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="../script/public/pageEleValidate/inputValidate.js"></script>
    <script type="text/javascript" src="../script/angular/ie8/dist/angular.min.js"></script>
    <script type="text/javascript" src="../script/angular/ajaxProxy.js"></script>
    <script type="text/javascript" src="../script/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../script/layer/layer.js"></script>

    <link rel="stylesheet" type="text/css" href="../script/select2/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="../script/select2/css/select2-bootstrap.min.css" />
    <script type="text/javascript" src="../script/select2/js/select2.full.min.js"></script>
    <script type="text/javascript" src="../script/select2/js/i18n/zh-CN.js"></script>

    <script type="text/javascript" src="../script/angular/select2.cdmcs.js"></script>

    <link rel="stylesheet" type="text/css" href="../script/dhtmlx/skins/skyblue/dhtmlx.css" />
    <link rel="stylesheet" type="text/css" href="../script/dhtmlx/skins/material/dhtmlx.css" />
    <link rel="stylesheet" type="text/css" href="../script/dhtmlx/skins/web/dhtmlx.css" />
    <script type="text/javascript" src="../script/dhtmlx/codebase/dhtmlx.js"></script>

    <script type="text/javascript" src="../script/public/pageEleValidate/inputValidate.js"></script>
    <script type="text/javascript" src="../script/public/custom/customFunction.js"></script>
    <script type="text/javascript" src="../script/public/custom/JavaScriptMap.js"></script>

    <script type="text/javascript" src="../script/angular/dhtmlxgrid.js"></script>
    <script type="text/javascript" src="../script/angular/dhtmlCalendar.cdmcs.js"></script>

    <script type="text/javascript" src="../script/dhtmlx/codebase/dhtmlXCalendarLocal_zhCN.js"></script>
    <style>
        .zbxxTitle{
            background: #f4f4f4;
            width:170px;
            text-align: right;
        }
    </style>
</head>

<body>
<div class="container-fluid" style="background: #e5e6ed;">

    <%@ include file="../header.jsp" %>
    <div ng-app="zbbaApp" ng-controller="zbbaController" class="container" ng-cloak style="background: #FFF;margin-top: 15px;">
        <div class="row" style="padding: 30px;">
            <form name="zbbaForm" novalidate>
                <div class="col-xs-9">
                    <div class="row">
                        <h2 class="text-center">招标备案信息录入</h2>
                        <!-- <h4 ng-show="!scope.f_editable" class="text-center" style="color:#F00" ng-bind="warnning"></h4> -->
                    </div>
<!--                     {{zbba_input }} -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h3>招标信息</h3>
                            <table class="table table-bordered">
                                <tr>
                                    <td colspan="4"><strong>招标基本信息</strong></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">项目名称</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_XMMC"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">标段名称</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_BDMC"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">招标范围</td>
                                    <td><span ng-bind="zbInfo.C_ZBFW"></span></td>
                                    <td class="zbxxTitle">招标类型</td>
                                    <td><span ng-bind="zbInfo.C_ZBLX"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">招标方式</td>
                                    <td><span ng-bind="zbInfo.C_ZBFS"></span></td>
                                    <td class="zbxxTitle">招标组织形式</td>
                                    <td><span ng-bind="zbInfo.C_ZBZZXS"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">发包类型</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_FBLX"></span></td>
                                </tr>
                                <tr ng-show = "!zb_show">
                                    <td class="zbxxTitle">总包标段</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_ZBBD"></span></td>
                                </tr>
                                <tr >
                                    <td class="zbxxTitle">标段暂估价内容</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_BDZGJNR"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">标段所在区域</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_BDQY"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">招标人</td>
                                    <td><span ng-bind="zbInfo.C_ZBR_MC"></span></td>
                                    <td class="zbxxTitle">招标人联系人</td>
                                    <td><span ng-bind="zbInfo.C_ZBR_LXR"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">招标人联系人办公电话</td>
                                    <td><span ng-bind="zbInfo.C_ZBR_LXRBGDH"></span></td>
                                    <td class="zbxxTitle">招标人联系人移动电话</td>
                                    <td><span ng-bind="zbInfo.C_ZBR_LXRSJ"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">招标过程情况说明</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_XMMC"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><strong>代理机构信息</strong></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">代理机构名称</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_ZBDL_MC"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">联系人</td>
                                    <td><span ng-bind="zbInfo.C_ZBDL_LXR"></span></td>
                                    <td class="zbxxTitle">办公电话</td>
                                    <td><span ng-bind="zbInfo.C_ZBDL_LXRBGDH"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">移动电话</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_ZBDL_LXRSJ"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><strong>项目管理单位信息</strong></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">项目管理单位名称</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_XMGLDW_MC"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">联系人</td>
                                    <td><span ng-bind="zbInfo.C_XMGLDW_LXR"></span></td>
                                    <td class="zbxxTitle">办公电话</td>
                                    <td><span ng-bind="zbInfo.C_XMGLDW_LXRBGDH"></span></td>
                                </tr>
                                <tr>
                                    <td class="zbxxTitle">移动电话</td>
                                    <td colspan="3"><span ng-bind="zbInfo.C_XMGLDW_LXRSJ"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="padding-top: 40px;">
                            <h3>中标单位信息</h3>
                        </div>
                    </div>

                    <div>
                        <code></br>
                            <span>zbrmcList 中标人候选项 ------</span><span>{{zbrmcList.length}}</span>{{zbrmcList|json}}
                        </code>
                    </div> 
                    <div>
                        <code></br>
                            <span>zbba_input.zbrValueList 中标人value------</span><span>{{zbba_input.zbrValueList.length}}</span>{{zbba_input.zbrValueList|json}}
                        </code>
                    </div>                     
                    <div>
                        <code></br>
                            <span>ztList主体候选项------</span><span>{{ztList.length}}</span>{{ztList|json}}
                        </code>
                    </div>
                    <div>
                        <code></br>
                            <span>zbba_input.C_ZT主体value------</span><span>{{zbba_input.C_ZT.length}}</span>{{zbba_input.C_ZT|json}}
                        </code>
                    </div>
                    <div>
                        <code></br>
                            <span>zbrDetailList中标人详细信息------</span><span>{{zbrDetailList.length}}</span>{{zbrDetailList|json}}
                        </code>
                    </div>

<!--                     <div>
                        <code></br>
                            <span>保存的信息</span><span>{{zbba_input}}</span>{{zbba_input.C_ZT|json}}
                        </code>
                    </div>
 -->
                    <div ng-mouseenter = "f_setpreload()" class="row" style="margin-top: 20px;">
                        <div class="col-xs-12">
                            <label class="control-label">中标单位
                                <small ng-show="zbbaForm.zbrmcList.$invalid" style="font-weight: normal;color: #F00;">必选项。</small>
                            </label>
                            <select ng-if = "!flag_SSGT" select2-cdmcs="zbrmcList" class="form-control" name="zbrmcList" ng-model="zbba_input.zbrValueList"
                                    data-ajax--url="<%=basePath%>xmbj/queryDWXX.do" data-ajax--cache="true"
                                    data-ajax--method="post" data-ajax--delay="500"
                                    multiple="multiple" data-placeholder="输入单位名称关键字搜索" >
                            </select>
                        </div>
                    </div>
                    <div ng-if=" zbba_input.zbrValueList.length > 1 " class="row" style="margin-top: 20px;">
                        <div ng-mouseenter = "f_setpreload()" class="col-xs-12" >
                            <label class="control-label">主体单位
                                <small ng-show="zbbaForm['C_ZT_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <select  select2-cdmcs="ztList" class="form-control"  name="C_ZT_{{$index}} " ng-model="zbba_input.C_ZT"
                                    ng-required="true" placeholder="联合体中标请填写牵头单位">
                            </select> 
                        </div>
                    </div>
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
                                    <small ng-show="zbbaForm['C_ZBDW_LB_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <select ng-change="setPrefix()" ng-disabled="flag_SSGT" select2-cdmcs="zbdwLbList" class="form-control" name="C_ZBDW_LB" ng-model="ele_zbr.C_ZBDW_LB" 
                                        placeholder="请选择单位类别"
                                        ng-required="true">
                                </select>
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    <!-- <span ng-bind="seldwlb"></span> -->
                                    <span>资质等级</span>
                                    <small ng-show="zbbaForm['C_ZHBR_ZZ_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  class="form-control" type="text" name="C_ZHBR_ZZ_{{$index}}" ng-model="ele_zbr.C_ZHBR_ZZ"
                                        ng-required="true"
                                        ng-maxlength="10" placeholder="请填资质等级"
                                />
                            </div>
                        </div> 
                        <div ng-show="ele_zbr.C_ZBDW_LB =='001'||ele_zbr.C_ZBDW_LB =='002     '" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">项目负责人姓名
                                    <small ng-show="zbbaForm['C_XMFZR_XM_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input ng-readonly="flag_SSGT"  class="form-control" type="text" name="C_XMFZR_XM_{{$index}}" ng-model="ele_zbr.C_XMFZR_XM"
                                       ng-required="true"
                                       placeholder="请填项目负责人姓名"
                                />
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    <span >项目负责人移动电话</span>
                                    <small ng-show="zbbaForm['C_XMFZR_YDDH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input onkeyup="dumpNum(11)"  class="form-control" type="text" name="C_XMFZR_YDDH_{{$index}}" ng-model="ele_zbr.C_XMFZR_YDDH"
                                        ng-required="true"
                                        placeholder="请填项目负责人移动电话"
                                />
                            </div>
                        </div>
                        <div ng-show="ele_zbr.C_ZBDW_LB =='000'" class="row" style="margin-top: 20px;">
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
                                <label class="control-label">
                                    注册建造师姓名
                                    <small ng-show="zbbaForm['C_ZCJZS_XM_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input ng-readonly="flag_SSGT"  class="form-control" type="text" name="C_ZCJZS_XM_{{$index}}" ng-model="ele_zbr.C_ZCJZS_XM"
                                       ng-required="true"
                                       placeholder="请填注册建造师"
                                />
                            </div>
                        </div>
                        <div ng-show="ele_zbr.C_ZBDW_LB =='000'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师等级
                                    <small ng-show="zbbaForm['C_ZCJZS_ZZDJ_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  class="form-control" type="text" name="C_ZCJZS_ZZDJ_{{$index}}" ng-model="ele_zbr.C_ZCJZS_ZZDJ"
                                        ng-required="true"
                                        placeholder="请填注册建造师等级"
                                />
                            </div>
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师证书号
                                    <small ng-show="zbbaForm['C_ZCJZS_ZSH_'+$index].$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input ng-readonly="flag_SSGT" class="form-control" type="text" name="C_ZCJZS_ZSH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_ZSH"
                                       ng-required="true"
                                       placeholder="请填注册建造师证书号"
                                />
                            </div>                            
                        </div>
                        <div ng-show="ele_zbr.C_ZBDW_LB =='000'" class="row" style="margin-top: 20px;">
                            <div class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师移动电话
                                    <small ng-show="zbbaForm['C_ZCJZS_YDDH_'+$index].$invalid" style="font-weight: normal;color: #F00;">*</small>
                                </label>
                                <input  onkeyup=" dumpNum(11)" class="form-control" type="text" name="C_ZCJZS_YDDH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_YDDH"
                                        ng-minlength="11"
                                        ng-required="true"
                                        placeholder="请填注册建造师移动电话"
                                />
                            </div>     
                          <div ng-show="ele_zbr.C_ZBDW_LB =='000'" class="col-xs-6" >
                                <label class="control-label">
                                    注册建造师办公电话
                                    <small ng-show="zbbaForm['C_ZCJZS_BGDH_'+$index].$invalid" style="font-weight: normal;color: #F00;"></small>
                                </label>
                                <input  onkeyup="dumpTel()" class="form-control" type="text" name="C_ZCJZS_BGDH_{{$index}}" ng-model="ele_zbr.C_ZCJZS_BGDH"
                                        ng-required="false"
                                        placeholder="请填注册建造师办公电话"
                                />
                            </div>                                                   
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="padding-top: 40px;">
                            <h3>监理单位信息</h3>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12">
                            <label class="control-label">单位名称
                                <small ng-show="zbbaForm.jldwList.$invalid" style="font-weight: normal;color: #F00;">必选项。</small>
                            </label>
                            <select select2-cdmcs="jldwList" class="form-control" name="jldwList" ng-model="zbba_input.jldwList"
                                        data-ajax--url="<%=basePath%>xmbj/queryDWXX.do" data-ajax--cache="true"
                                        data-ajax--method="post" data-ajax--delay="500"
                                        ng-required="true" data-placeholder="输入单位名称关键字搜索">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">监理资质
                                <small ng-show="zbbaForm.C_JLDW_ZZ.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <input  class="form-control" type="text" name="C_JLDW_ZZ" ng-model="zbba_input.C_JLDW_ZZ"
                                    placeholder="请填写监理资质"
                            />
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">联系人
                                <small ng-show="zbbaForm.C_JLDW_LXR.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <input  class="form-control" type="text" name="C_JLDW_LXR" ng-model="zbba_input.C_JLDW_LXR"
                                    placeholder="请填写联系人"
                            />
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">联系人办公电话
                                <small ng-show="zbbaForm.C_JLDW_LXR_BGDH.$invalid" style="font-weight: normal;color: #F00;">格式错误</small>
                            </label>
                            <input  onkeyup="dumpTel()" class="form-control" type="text" name="C_JLDW_LXR_BGDH" ng-model="zbba_input.C_JLDW_LXR_BGDH"
                                    ng-maxlength="20" placeholder="请填写联系人办公电话"
                            />
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">联系人移动电话
                                <small ng-show="zbbaForm.C_JLDW_LXR_YDDH.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  onkeyup="dumpNum(11)" class="form-control" type="text" name="C_JLDW_LXR_YDDH" ng-model="zbba_input.C_JLDW_LXR_YDDH"
                                    ng-minlength="11" placeholder="请填写联系人移动电话"
                            />
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">总监理工程师
                                <small ng-show="zbbaForm.C_ZJLGCS.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  class="form-control" type="text" name="C_ZJLGCS" ng-model="zbba_input.C_ZJLGCS"
                                    ng-required="true"
                                    placeholder="请填写总监理工程师"
                            />
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">总监理工程师身份证号
                                <small ng-show="zbbaForm.C_ZJLGCS_SFZH.$invalid" style="font-weight: normal;color: #F00;">请填写18位身份证号码</small>
                            </label>
                            <input  onkeyup="dumpSFZ()" class="form-control" type="text" name="C_ZJLGCS_SFZH" ng-model="zbba_input.C_ZJLGCS_SFZH"
                                    ng-maxlength="18" placeholder="请填写总监理工程师身份证号"
                            />
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">总监理工程师证书号
                                <small ng-show="zbbaForm.C_ZJLGCS_ZSH.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <input   class="form-control" type="text" name="C_ZJLGCS_ZSH" ng-model="zbba_input.C_ZJLGCS_ZSH"
                                    placeholder="请填写总监理工程师证书号"
                            />
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">总监理工程师办公电话
                                <small ng-show="zbbaForm.C_ZJLGCS_BGDH.$invalid" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <input  onkeyup="dumpTel()" class="form-control" type="text" name="C_ZJLGCS_BGDH" ng-model="zbba_input.C_ZJLGCS_BGDH"
                                    ng-maxlength="20" placeholder="请填写总监理工程师办公电话"
                            />
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">总监理工程师移动电话
                                <small ng-show="zbbaForm.C_ZJLGCS_YDDH.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  onkeyup="dumpNum(11)" class="form-control" type="text" name="C_ZJLGCS_YDDH" ng-model="zbba_input.C_ZJLGCS_YDDH"
                                    ng-minlength="11"
                                    ng-required="true"
                                    placeholder="请填总监理工程师移动电话"
                            />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="padding-top: 40px;">
                            <h3>中标信息</h3>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">开标时间
                                <small ng-show="zbbaForm.D_KBSJ.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  ng-disabled="flag_SSGT" style="cursor:hand" onfocus="this.blur()" class="form-control" name="D_KBSJ" type="text" ng-model="zbba_input.D_KBSJ"
                                    data-calendar-cdmcs data-date-format="%Y-%m-%d %H:%i" ng-required="true" placeholder="请填写开标时间"/>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">开标地点
                                <small ng-show="zbbaForm.C_KBDD.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input ng-readonly="flag_SSGT" class="form-control" type="text" name="C_KBDD" ng-model="zbba_input.C_KBDD"
                                   ng-required="true" placeholder="请填写开标地点"
                            />
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">中标规模
                                <small ng-show="zbbaForm.N_ZBGM.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input onkeyup="dumpfloat(10,6)" ng-readonly="flag_SSGT"  class="form-control" type="text" name="N_ZBGM" ng-model="zbba_input.N_ZBGM"
                                   ng-required="true" placeholder="请填写中标规模"
                            />
                        </div>
                        <div class="col-xs-6">
                            <label class="control-label">中标规模单位
                                <small ng-show="zbbaForm.C_ZBGMDW.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <select ng-disabled="flag_SSGT" select2-cdmcs="zbgmdwList" class="form-control" name="C_ZBGMDW" ng-model="zbba_input.C_ZBGMDW" ng-required="true">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">中标规模描述
                                <small ng-show="zbbaForm.C_ZBGMMS.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <textarea ng-readonly="flag_SSGT" class="form-control" type="text" name="C_ZBGMMS" ng-model="zbba_input.C_ZBGMMS"
                                      placeholder="请填写中标规模描述"
                            ></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">中标工期
                                <small ng-show="zbbaForm.N_ZBGQ.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input  ng-readonly="flag_SSGT" onkeyup="dumpNum(5)" class="form-control" type="text" name="N_ZBGQ" ng-model="zbba_input.N_ZBGQ"
                                       ng-required="true" ng-maxlength="6" placeholder="请填写中标工期"
                                />
                                <div class="input-group-addon">天</div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <label class="control-label">中标质量
                                <small ng-show="zbbaForm.C_ZBZL.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <select  ng-disabled="flag_SSGT" select2-cdmcs="zbzlList" class="form-control" name="C_ZBZL" ng-model="zbba_input.C_ZBZL" ng-required="true">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">中标工期描述
                                <small ng-show="zbbaForm.C_ZBGQMS.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <textarea ng-readonly="flag_SSGT" class="form-control" type="text" name="C_ZBGQMS" ng-model="zbba_input.C_ZBGQMS"
                                      placeholder="请填写中标工期描述"
                            ></textarea>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6">
                            <label class="control-label">计价单位
                                <small ng-show="zbbaForm.C_JJFS.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <select  ng-disabled="flag_SSGT" select2-cdmcs="jjfsList" class="form-control" name="C_JJFS" ng-model="zbba_input.C_JJFS" ng-required="true">
                            </select>
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">中标价
                                <small ng-show="zbbaForm.N_ZBJ.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input ng-readonly="flag_SSGT" onkeyup="dumpfloat(10,6)"  class="form-control" type="text" name="N_ZBJ" ng-model="zbba_input.N_ZBJ"
                                       ng-required="true" placeholder="请填写中标价"
                                />
                                <div class="input-group-addon">万元</div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12" >
                            <label class="control-label">中标价描述
                                <small ng-show="zbbaForm.C_ZBJMS.$invalid && !flag_SSGT" style="font-weight: normal;color: #F00;"></small>
                            </label>
                            <textarea ng-readonly="flag_SSGT" class="form-control" type="text" name="C_ZBJMS" ng-model="zbba_input.C_ZBJMS"
                                      placeholder="请填写中标价描述"
                            ></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="padding-top: 40px;">
                            <h3>合同信息</h3>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">合同开工时间
                                <small ng-show="zbbaForm.D_HTKGSJ.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  style="cursor:hand" onfocus="this.blur()" class="form-control" name="D_HTKGSJ" type="text" ng-model="zbba_input.D_HTKGSJ"
                                    data-calendar-cdmcs ng-required="false" placeholder="请填写合同开工时间"/>
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">合同竣工时间
                                <small ng-show="zbbaForm.D_HTJGSJ.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <input  style="cursor:hand" onfocus="this.blur()" class="form-control" name="D_HTJGSJ" type="text" ng-model="zbba_input.D_HTJGSJ"
                                    data-calendar-cdmcs ng-required="false" placeholder="请填写合同竣工时间"/>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">签约合同价
                                <small ng-show="zbbaForm.N_HTJ.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input onkeyup="dumpfloat(10,6)" class="form-control" type="text" name="N_HTJ" ng-model="zbba_input.N_HTJ"
                                        ng-required="false" placeholder="请填写签约合同价"
                                />
                                <div class="input-group-addon">万元</div>
                            </div>
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">安全文明施工费
                                <small ng-show="zbbaForm.N_AQWMSGF.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input onkeyup="dumpfloat(10,6)"  class="form-control" type="text" name="N_AQWMSGF" ng-model="zbba_input.N_AQWMSGF"
                                        required="false"
                                        placeholder="请填写安全文明施工费"
                                />
                                <div class="input-group-addon">万元</div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-6" >
                            <label class="control-label">安全文明施工措施费
                                <small ng-show="zbbaForm.C_AQWMCSF.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input  onkeyup="dumpfloat(10,6)"  class="form-control" type="text" name="C_AQWMCSF" ng-model="zbba_input.C_AQWMCSF"
                                        ng-required="false" placeholder="请填写安全文明施工措施费"
                                />
                                <div class="input-group-addon">万元</div>
                            </div>
                        </div>
                        <div class="col-xs-6" >
                            <label class="control-label">单方造价
                                <small ng-show="zbbaForm.N_DFZJ.$invalid" style="font-weight: normal;color: #F00;">*</small>
                            </label>
                            <div class="input-group">
                                <input onkeyup="dumpfloat(10,6)"  class="form-control" type="text" name="N_DFZJ" ng-model="zbba_input.N_DFZJ"
                                        ng-required="false" placeholder="请填写单方造价"
                                />
                                <div class="input-group-addon">元/平方米</div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12">
                            <label class="control-label">造价咨询机构名称
                                <small ng-show="zbbaForm.zjzxjgList.$invalid" style="font-weight: normal;color: #F00;">必选项。</small>
                            </label>
                            <select select2-cdmcs="zjzxjgList" class="form-control" name="zjzxjgList" ng-model="zbba_input.zjzxjgList"
                                        data-ajax--url="<%=basePath%>xmbj/queryDWXX.do" data-ajax--cache="true"
                                        data-ajax--method="post" data-ajax--delay="500"
                                        ng-required="true"  data-placeholder="输入单位名称关键字搜索">                            >
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="padding-top: 40px;">
                            <h3>子项目信息</h3>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-12">
                            <div id="zxmGrid" style="width: 100%;height:200px;">
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3">
                            <button class="btn btn-block btn-default" onclick="window.location='<%=basePath%>back.jsp'" >上一步</button>
                        </div>
                        <div ng-mouseenter = "f_setpreload()" class="col-xs-3">
                            <button class="btn btn-block btn-success"   ng-click="f_next();">下一步</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-3" style="padding-top: 100px;">
                    <%@include file="sgxk_status.jsp"%>
                </div>
            </form>
        </div>
    </div>

    <div class="row" style="height: 30px;">
        &nbsp;
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
<script type="text/javascript" src="./script/sgxksb_zbba.js"></script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 64511
  Date: 2018/10/21
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <meta charset="utf-8">
      <meta name="renderer" content="webkit">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
      <title>主页</title>

      <link rel="stylesheet" type="text/css" href="../../controls/bootstrap/css/bootstrap.min.css" />
      <!--[if lt IE 8]>
      <script type="text/javascript">
          alert("请使用主流浏览器访问，系统不支持IE8以下版本。");
      </script>
      <![endif]-->
      <!--[if IE 8]>
      <script type="text/javascript" src="../../script/angular/ie8/example/vendor/es5-shim.min.js"></script>
      <![endif]-->

      <!--[if lt IE 9]>
      <script type="text/javascript" src="../../script/public/iefix/html5shiv.min.js"></script>
      <script type="text/javascript" src="../../script/public/iefix/respond.min.js"></script>
      <![endif]-->

      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
      <script type="text/javascript" src="../../script/public/jquery/jquery.min.js"></script>
      <script type="text/javascript" src="../../script/public/jquery/jquery.placeholder.min.js"></script>
      <script type="text/javascript" src="../../script/public/jquery/jquery.json.js"></script>
      <script type="text/javascript" src="../../controls/bootstrap/js/bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css" href="./../../controls/dhtmlx-5.0/skins/web/dhtmlx.css"/>
      <script type="text/javascript" src="../../controls/dhtmlx-5.0/codebase/dhtmlx.js"></script>
      <script type="text/javascript" src="../../script/dhtmlx/codebase/dhtmlx.js"></script>
      <script type="text/javascript" src="../../script/angular/ie8/dist/angular.min.js"></script>
      <script type="text/javascript" src="/scripts/optrow.js"></script>
      <style>
          html, body {
              width: 100%;
              height: 100%;
              margin: 0;
              padding:0;
              /*overflow: hidden;*/
              font-family: 微软雅黑, 黑体, 宋体;
          }
      </style>
  </head>
  <body ng-controller="homeController">
    <div class="container-fluid" style="background: #e5e6ed;">

      <div ng-app="dwgcxxApp" ng-controller="dwgcxxController" class="container" style="background: #FFF;margin: 15px auto;">

          <div class="row" style="padding-top: 30px;padding-bottom: 30px;">

              <form name="dwgcForm" novalidate>

                  <div class="col-xs-4">

                      <div data-spy="affix" data-offset-top="220"  style="top: 20px;">
                          <%--多个显示--%>
                          <table  border="1" class="table table-bordered" style="width: 360px;">
                              <col width='80%'></col>
                              <col ></col>
                              <tr style="height: 55px;">
                                  <th align='left' colspan="3" style="vertical-align: middle;">标段单项（单位）工程信息</th>
                              </tr>
                              <tr>
                                  <td align='center'>工程名称</td>
                                  <td align='center'>操作</td>
                              </tr>
                              <tr ng-repeat="dwgcInfo in dwgcList" class="dwgc_tr" id="dwgc_tr_{{$index}}" ng-click="f_select_row($index)">
                                  <td>{{dwgcInfo.C_ZXMMC}}</td>
                                  <td align="center" style="vertical-align: middle"><a ng-click="f_select($index)">选&nbsp;&nbsp;择</a></td>
                              </tr>
                          </table>
                      </div>
                  </div>

                  <div class="col-xs-8" style="border-left: 1px solid #b3b3b3;">

                      <div class="row">
                          <div class="col-xs-12">
                              <h2 class="text-center" id="title_font">单位（单项）工程结算信息填写</h2>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-12">
                              <table style="width: 100%;">
                                  <col width='22%'></col>
                                  <col />
                                  <tr height="40">
                                      <td align='left' class="info_tr">单位(单项)工程名称</td>
                                      <td align='left' class="info_tr">
                                          <span ng-model="dwgcInfo.C_ZXMMC" class="control-label">{{dwgcInfo.C_ZXMMC}}</span>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align='center' colspan="2">
                                          <p class="bottom_line"></p>
                                      </td>
                                  </tr>
                                  <tr height="40">
                                      <td align='left' class="info_tr">发包人</td>
                                      <td align='left' class="info_tr">
                                          <span ng-model="dwgcInfo.C_FBRMC" class="control-label">{{dwgcInfo.C_FBRMC}}</span>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align='center' colspan="2">
                                          <p class="bottom_line"></p>
                                      </td>
                                  </tr>
                                  <tr ng-if="_xzqhdm != '510101'" height="40">
                                      <td align='left' class="info_tr">承包人</td>
                                      <td align='left' class="info_tr">
                                          <select select2-cdmcs="cbrList"  data-theme="bootstrap" class="form-control"  name="cbrList"
                                                  ng-model="C_CBRMC"  ng-required="true"  style="width: 100%;"
                                                  style="width: 100%"
                                                  data-ajax--url="/cdjwztyypt/xmbj/queryDWXX.do" data-ajax--cache="true"
                                                  data-ajax--method="post" data-ajax--delay="500" multiple="true"
                                                  data-placeholder="输入单位名称关键字搜索" >
                                          </select>

                                      </td>
                                  </tr>
                                  <tr ng-if="_xzqhdm == '510101'" height="40">
                                      <td align='left' class="info_tr">承包人</td>
                                      <td align='left' class="info_tr">
                                          <span class="control-label">{{dwgcInfo.C_CBRMC}}</span>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align='center' colspan="2">
                                          <p class="bottom_line"></p>
                                      </td>
                                  </tr>
                                  <tr height="40">
                                      <td align='left' class="info_tr">中标收讫通知书编号</td>
                                      <td ng-if="_xzqhdm == '510101'" align='left' class="info_tr">
                                          <span ng-model="dwgcInfo.C_ZBSQTZSBH" class="control-label">{{dwgcInfo.C_ZBSQTZSBH}}</span>
                                      </td>
                                      <td ng-if="_xzqhdm != '510101'" align='left' class="info_tr">
                                          <input class="form-control" type="text" name="C_ZBSQTZSBH" ng-model="dwgcInfo.C_ZBSQTZSBH"
                                                 ng-required="true" placeholder="请填写中标收讫通知书编号" />

                                      </td>
                                  </tr>
                                  <tr>
                                      <td align='center' colspan="2">
                                          <p class="bottom_line"></p>
                                      </td>
                                  </tr>
                              </table>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-12">
                              <label class="control-label">承包内容
                                  <small ng-show="dwgcForm.C_CBNR.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。
                                  </small>
                              </label>
                              <textarea class="form-control" name="C_CBNR" ng-model="dwgcInfo.C_CBNR"
                                        style="resize:none;height: 100px;" ng-required="true" placeholder="请输入承包内容">
                            </textarea>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-6">
                              <label class="control-label">中标金额（万元）
                                  <small ng-show="dwgcForm.N_ZBJE.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_ZBJE" ng-model="dwgcInfo.N_ZBJE"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入中标金额" />
                          </div>

                          <div class="col-xs-6" >
                              <label class="control-label">合同金额（万元）
                                  <small ng-show="dwgcForm.N_HTJE.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_HTJE" ng-model="dwgcInfo.N_HTJE"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入合同金额" />
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-6">
                              <label class="control-label">结算金额（万元）
                                  <small ng-show="dwgcForm.N_JSJE.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_JSJE" ng-model="dwgcInfo.N_JSJE"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入结算金额" />
                          </div>

                          <div class="col-xs-6" >
                              <label class="control-label">建筑规模（平方米）
                                  <small ng-show="dwgcForm.N_JZGM.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_JZGM" ng-model="dwgcInfo.N_JZGM"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入建筑规模" />
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-6">
                              <label class="control-label">计价方式
                                  <small ng-show="dwgcForm.jjfsList.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。
                                  </small>
                              </label>
                              <select select2-cdmcs="jjfsList" class="for-input form-control"  name="jjfsList"
                                      ng-model="dwgcInfo.C_JJFSDM"  ng-required="true" style="width: 100%;"
                                      data-ajax--url="/cdjwztyypt/code/jcdm.do?dmfl=2027&defaultDM="
                                      data-ajax--cache="true"
                                      data-ajax--method="post" data-ajax--delay="500"
                                      data-placeholder="选择计价方式">
                              </select>
                          </div>

                          <div class="col-xs-6" >
                              <label class="control-label">结构型式
                                  <small ng-show="dwgcForm.jgxsList.$invalid" style="font-weight: normal;color: #F00;">
                                      必选项。
                                  </small>
                              </label>
                              <select select2-cdmcs="jgxsList" class="for-input form-control"  name="jgxsList"
                                      ng-model="dwgcInfo.C_JGLXDM"  ng-required="true" style="width: 100%;"
                                      data-ajax--url="/cdjwztyypt/code/jcdm.do?dmfl=1005&defaultDM="
                                      data-ajax--cache="true"
                                      data-ajax--method="post" data-ajax--delay="500"
                                      data-placeholder="选择结构型式">
                              </select>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">

                          <div class="col-xs-6">
                              <label class="control-label">层数
                                  <small ng-show="dwgcForm.N_CS.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正整数
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_CS" ng-model="dwgcInfo.N_CS"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":0}'
                                     ng-required="true" placeholder="请输入层数" />
                          </div>


                          <div class="col-xs-6" >
                              <label class="control-label">高度（米）
                                  <small ng-show="dwgcForm.N_GD.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_GD" ng-model="dwgcInfo.N_GD"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入高度" />
                          </div>

                      </div>

                      <div class="row div_content" style="margin-top: 25px;">
                          <div class="col-xs-6">
                              <label class="control-label">长度（米）
                                  <small ng-show="dwgcForm.N_CD.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。只能输入正数(最多6位小数)
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="N_CD" ng-model="dwgcInfo.N_CD"
                                     validates="isNumber" data-validates-options='{"precision":19,"scale":6}'
                                     ng-required="true" placeholder="请输入长度" />
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 25px;">

                          <div class="col-xs-6" >
                              <label class="control-label">开工日期
                                  <small ng-show="dwgcForm.D_KGRQ.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="D_KGRQ" ng-model="dwgcInfo.D_KGRQ"
                                     ng-required="flase" data-calendar-cdmcs placeholder="请选择开工日期" maxlength="20"
                              />
                          </div>

                          <div class="col-xs-6">
                              <label class="control-label">竣工日期
                                  <small ng-show="dwgcForm.D_JGRQ.$invalid" style="font-weight: normal;color: #F00;">
                                      必填项。
                                  </small>
                              </label>
                              <input class="form-control" type="text" name="D_JGRQ" ng-model="dwgcInfo.D_JGRQ"
                                     ng-required="flase" data-calendar-cdmcs placeholder="请选择竣工日期" maxlength="20"
                              />
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 40px;">
                          <div class="col-xs-6">
                              <label class="control-label">竣工结算书发、承包人双方是否签字、盖章</label>
                          </div>
                          <div class="col-xs-2">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_SFQZBZ" value="1" >
                                  <span style="padding-left: 10px;">是</span>
                              </label>
                          </div>
                          <div class="col-xs-4">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_SFQZBZ" value="0" >
                                  <span style="padding-left: 10px;">否</span>
                              </label>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 40px;">
                          <div class="col-xs-6">
                              <label class="control-label">发包人是否委托造价咨询企业</label>
                          </div>
                          <div class="col-xs-2">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_FBRWTBZ" value="1" >
                                  <span style="padding-left: 10px;">委托</span>
                              </label>
                          </div>
                          <div class="col-xs-4">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_FBRWTBZ" value="0" >
                                  <span style="padding-left: 10px;">不委托</span>
                              </label>
                          </div>
                      </div>

                      <%-- 委托信息--%>
                      <div class="row div_content" ng-if = " dwgcInfo.C_FBRWTBZ=='1' ">
                          <div class="col-xs-12">
                              <!-- 委托信息 -->
                              <fieldset style="margin-top: 25px;">
                                  <legend><span>发包人造价咨询信息或受委托的造价咨询企业信息</span></legend>

                                  <div class="row" style="margin-top: 10px;">
                                      <div class="col-xs-6">
                                          <label class="control-label">受委托的造价咨询企业是否签字、盖章</label>
                                      </div>
                                      <div class="col-xs-2">
                                          <label class="radio-inline" style="margin: 0px;">
                                              <input type="radio"  name="C_SWTZJ_QZBZ" value="1" >
                                              <span style="padding-left: 10px;">是</span>
                                          </label>
                                      </div>
                                      <div class="col-xs-4">
                                          <label class="radio-inline" style="margin: 0px;">
                                              <input type="radio"  name="C_SWTZJ_QZBZ" value="0" >
                                              <span style="padding-left: 10px;">否</span>
                                          </label>
                                      </div>
                                  </div>

                                  <div class="row" style="margin-top: 25px;">
                                      <div class="col-xs-6">
                                          <label class="control-label">企业名称
                                              <small ng-show="dwgcForm.qyxxList.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <select select2-cdmcs="qyxxList"  data-theme="bootstrap" class="form-control"
                                                  ng-model="dwgcInfo.C_SWTZJ_QYBH"  ng-required="true" style="width: 100%;"
                                                  data-ajax--url="../jgjsj/queryQyxx" ng-change = "f_qyxxChange()"
                                                  data-ajax--cache="true"  name="qyxxList"
                                                  data-ajax--method="post" data-ajax--delay="500"
                                                  data-placeholder="选择企业名称" ng-disabled=" _xqbz=='1' " >
                                          </select>
                                      </div>

                                      <div class="col-xs-6" >
                                          <label class="control-label">等级
                                              <small ng-show="dwgcForm.C_SWTZJ_QYDJ.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_SWTZJ_QYDJ" ng-model="dwgcInfo.C_SWTZJ_QYDJ"
                                                 ng-required="true" placeholder="请填入等级" disabled="disabled" />
                                      </div>

                                  </div>

                                  <div class="row" style="margin-top: 25px;">
                                      <div class="col-xs-6">
                                          <label class="control-label">资质证书号
                                              <small ng-show="dwgcForm.C_SWTZJ_QYZSH.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_SWTZJ_QYZSH" ng-model="dwgcInfo.C_SWTZJ_QYZSH"
                                                 ng-required="false" placeholder="请填入资质证书号" disabled="disabled" />
                                      </div>
                                  </div>

                                  <div class="row" style="margin-top: 25px;">

                                      <div class="col-xs-6">
                                          <label class="control-label">造价人员姓名
                                              <small ng-show="dwgcForm.C_SWTZJ_JBRMC.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_SWTZJ_JBRMC" ng-model="dwgcInfo.C_SWTZJ_JBRMC"
                                                 ng-required="true" placeholder="请填入造价人员姓名" />
                                      </div>

                                      <div class="col-xs-6" >
                                          <label class="control-label">执业资格证号
                                              <small ng-show="dwgcForm.C_SWTZJ_JBRZYZH.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_SWTZJ_JBRZYZH" ng-model="dwgcInfo.C_SWTZJ_JBRZYZH"
                                                 ng-required="false" placeholder="请填入执业资格证号" />
                                      </div>

                                  </div>


                              </fieldset>
                          </div>
                      </div>

                      <%-- 委托信息--%>
                      <div class="row div_content" ng-if = " dwgcInfo.C_FBRWTBZ=='0' ">
                          <div class="col-xs-12">
                              <!-- 委托信息 -->
                              <fieldset style="margin-top: 25px;">
                                  <legend><span>发包人造价人员执业资格</span></legend>
                                  <div class="row">
                                      <div class="col-xs-6">
                                          <label class="control-label">姓名
                                              <small ng-show="dwgcForm.C_FBR_JBRMC.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_FBR_JBRMC" ng-model="dwgcInfo.C_FBR_JBRMC"
                                                 ng-required="true" placeholder="请填入姓名" />
                                      </div>

                                      <div class="col-xs-6" >
                                          <label class="control-label">执业资格证号
                                              <small ng-show="dwgcForm.C_FBR_JBRZYZH.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_FBR_JBRZYZH" ng-model="dwgcInfo.C_FBR_JBRZYZH"
                                                 ng-required="true" placeholder="请填入执业资格证号" />
                                      </div>

                                  </div>

                              </fieldset>
                          </div>
                      </div>

                      <%-- 承包人造信息--%>
                      <div class="row div_content">
                          <div class="col-xs-12">
                              <!-- 承包人造信息 -->
                              <fieldset style="margin-top: 25px;">
                                  <legend><span>承包人造价人员执业资格</span></legend>

                                  <div class="row">

                                      <div class="col-xs-6">
                                          <label class="control-label">姓名
                                              <small ng-show="dwgcForm.C_CBR_JBRMC.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_CBR_JBRMC" ng-model="dwgcInfo.C_CBR_JBRMC"
                                                 ng-required="true" placeholder="请填入姓名" />
                                      </div>

                                      <div class="col-xs-6" >
                                          <label class="control-label">执业资格证号
                                              <small ng-show="dwgcForm.C_CBR_JBRZYZH.$invalid" style="font-weight: normal;color: #F00;">
                                                  必填项。
                                              </small>
                                          </label>
                                          <input class="form-control" type="text" name="C_CBR_JBRZYZH" ng-model="dwgcInfo.C_CBR_JBRZYZH"
                                                 ng-required="true" placeholder="请填入执业资格证号" />
                                      </div>

                                  </div>

                              </fieldset>
                          </div>
                      </div>

                      <div class="row div_content" style="margin-top: 40px;">
                          <div class="col-xs-8">
                              <label class="control-label">是否依据发、承包双方的建设工程施工合同约定条款办理竣工结算</label>
                          </div>
                          <div class="col-xs-2">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_SGTKJSBZ" value="1" >
                                  <span style="padding-left: 10px;">是</span>
                              </label>
                          </div>
                          <div class="col-xs-2">
                              <label class="radio-inline" style="margin: 0px;">
                                  <input type="radio"  name="C_SGTKJSBZ" value="0" >
                                  <span style="padding-left: 10px;">否</span>
                              </label>
                          </div>
                      </div>

                      <%-- 不依据条款填写信息--%>
                      <div class="row div_content" style="margin-top: 25px"  ng-if = " dwgcInfo.C_SGTKJSBZ=='0' ">

                          <div class="col-xs-12">

                              <div class="row">
                                  <div class="col-xs-6">
                                      <label class="control-label">发包人造价人员姓名
                                          <small ng-show="dwgcForm.C_FBR_ZJRYMC.$invalid" style="font-weight: normal;color: #F00;">
                                              必填项。
                                          </small>
                                      </label>
                                      <input class="form-control" type="text" name="C_FBR_ZJRYMC" ng-model="dwgcInfo.C_FBR_ZJRYMC"
                                             ng-required="true" placeholder="请填入发包人造价人员姓名" />
                                  </div>

                                  <div class="col-xs-6" >
                                      <label class="control-label">发包人执业资格证章号
                                          <small ng-show="dwgcForm.C_FBR_ZYZGZZH.$invalid" style="font-weight: normal;color: #F00;">
                                              必填项。
                                          </small>
                                      </label>
                                      <input class="form-control" type="text" name="C_FBR_ZYZGZZH" ng-model="dwgcInfo.C_FBR_ZYZGZZH"
                                             ng-required="true" placeholder="请填入发包人执业资格证章号" />
                                  </div>
                              </div>

                              <div class="row" style="margin-top: 20px;">
                                  <div class="col-xs-6">
                                      <label class="control-label">承包人造价人员姓名
                                          <small ng-show="dwgcForm.C_CBR_ZJRYMC.$invalid" style="font-weight: normal;color: #F00;">
                                              必填项。
                                          </small>
                                      </label>
                                      <input class="form-control" type="text" name="C_CBR_ZJRYMC" ng-model="dwgcInfo.C_CBR_ZJRYMC"
                                             ng-required="true" placeholder="请填入承包人造价人员姓名" />
                                  </div>

                                  <div class="col-xs-6" >
                                      <label class="control-label">承包人执业资格证章号
                                          <small ng-show="dwgcForm.C_CBR_ZYZGZZH.$invalid" style="font-weight: normal;color: #F00;">
                                              必填项。
                                          </small>
                                      </label>
                                      <input class="form-control" type="text" name="C_CBR_ZYZGZZH" ng-model="dwgcInfo.C_CBR_ZYZGZZH"
                                             ng-required="true" placeholder="请填入承包人执业资格证章号" />
                                  </div>
                              </div>

                              <div class="row" style="margin-top: 20px;">
                                  <div class="col-xs-12">
                                      <label class="control-label">未按约定条款结算的原因
                                          <small ng-show="dwgcForm.C_WATKJSYY.$invalid" style="font-weight: normal;color: #F00;">
                                              必填项。
                                          </small>
                                      </label>
                                      <textarea class="form-control" name="C_WATKJSYY" ng-model="dwgcInfo.C_WATKJSYY"
                                                style="resize:none;height: 100px;" ng-required="true" placeholder="请输入未按约定条款结算的原因">
                                    </textarea>
                                  </div>
                              </div>

                          </div>

                      </div>

                      <div class="row div_content" style="margin-top: 35px;">

                          <div class="col-xs-12">
                              <label class="control-label">备注
                                  <small ng-show="dwgcForm.C_BZ.$invalid" style="font-weight: normal;color: #F00;">
                                  </small>
                              </label>
                              <textarea class="form-control" name="C_BZ" ng-model="dwgcInfo.C_BZ"
                                        style="resize:none;height: 100px;" ng-required="false" placeholder="请输入备注">
                            </textarea>
                          </div>

                      </div>

                      <div class="row div_content" style="margin-top: 20px;">
                          <div class="col-xs-12"><hr/></div>
                      </div>

                      <div class="row" style="margin-top: 20px;" id="div_next">

                          <div class="col-xs-3 col-xs-offset-1">
                              <button class="btn btn-block btn-success" ng-click="f_next()" id="btn_all">竣工结算信息汇总</button>
                          </div>

                          <div class="col-xs-3 col-xs-offset-1">
                              <button class="btn btn-block btn-success" ng-disabled="dwgcForm.$invalid" ng-click="f_save()">保存单位工程结算信息</button>
                          </div>

                          <div class="col-xs-2 col-xs-offset-1">
                              <button class="btn btn-block btn-default" ng-click="f_back()">返　回</button>
                          </div>

                      </div>

                      <div class="row" style="margin-top: 20px;" id="div_back">

                          <div class="col-xs-3 col-xs-offset-2">
                              <button class="btn btn-block btn-success" ng-click="f_next()">竣工结算汇总信息查看</button>
                          </div>

                          <div class="col-xs-3 col-xs-offset-2">
                              <button class="btn btn-block btn-default" ng-click="f_back()">返　回</button>
                          </div>

                      </div>

                  </div>


              </form>

          </div>

      </div>

  </div>
  </body>
</html>

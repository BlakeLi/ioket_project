<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <style>
        .checkbox-group{
            width: 70px;
        }
    </style>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">欢迎您,<small>${sessionScope.employee.e_name}</small></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul id = "navtab" class="nav navbar-nav navbar-right" role="tablist">
                <li><a href="/">注销</a></li>
            </ul>.
        </div>
    </div>
</nav>
<!--主题内容-->
<div class="container">
    <ul id="customerTab" class="nav nav-tabs">
        <li class="dropdown">
            <a href="#" id="recruitTabDrop" class="dropdown-toggle" data-toggle="dropdown">招聘管理<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#recruitUp" tabindex="-1" data-toggle="tab">查看招聘信息</a></li>
                <li><a href="#recruitDown" tabindex="-1" data-toggle="tab">查看招聘草稿</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" id="depAndPosTabDrop" class="dropdown-toggle" data-toggle="dropdown">部门与职位<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#dep" tabindex="-1" data-toggle="tab">查看部门信息</a></li>
                <li><a href="#pos" tabindex="-1" data-toggle="tab">查看职位信息</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" id="employeeTabDrop" class="dropdown-toggle" data-toggle="dropdown">员工管理<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#employeeState" tabindex="-1" data-toggle="tab">员工状态修改</a></li>
                <li><a href="#employeeSalary" tabindex="-1" data-toggle="tab">员工薪资结算</a></li>
                <li><a href="#employeeReward" tabindex="-1" data-toggle="tab">员工奖惩</a></li>
                <li><a href="#employeeAttendance" tabindex="-1" data-toggle="tab">员工考勤查看</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" id="fifsTabDrop" class="dropdown-toggle" data-toggle="dropdown">面试管理<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#fifsCv" tabindex="-1" data-toggle="tab">查看简历情况</a></li>
                <li><a href="#fifsEnroll" tabindex="-1" data-toggle="tab">查看面试情况</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" id="trainingTabDrop" class="dropdown-toggle" data-toggle="dropdown">培训管理<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#trainingWillDo" tabindex="-1" data-toggle="tab">查看培训草稿</a></li>
                <li><a href="#trainingDoing" tabindex="-1" data-toggle="tab">查看正在进行的培训</a></li>
                <li><a href="#trainingDone" tabindex="-1" data-toggle="tab">查看已经完成的培训</a></li>
            </ul>
        </li>
    </ul>
    <div id="tabContent" class="tab-content">
        <!--已发布招聘框-->
        <div class="tab-pane fade active" id="recruitUp">
            <div class="panel panel-default">
                <div class="panel-heading">
                    发布的招聘
                </div>
                <div class="panel-body">
                    招聘信息如下
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>发布时间</td>
                        <td>招聘主题</td>
                        <td>招聘简介</td>
                        <td>地址</td>
                        <td>薪资</td>
                        <td>职位</td>
                    </tr>
                    <c:forEach items="${sessionScope.p_recruits}" var="i">
                        <c:forEach items="${sessionScope.position}" var="j">
                            <c:if test="${i.pos_id eq j.pos_id}">
                                <tr>
                                    <td>${i.rct_publish_time}</td>
                                    <td>${i.rct_title}</td>
                                    <td>${i.rct_introduction}</td>
                                    <td>${i.rct_address}</td>
                                    <td>薪资：￥${i.rct_salary}/月</td>
                                    <td>${j.pos_name}</td>
                                    <td>
                                        <a class="btn btn-danger" href="updateRct?rct_id=${i.rct_id}&rct_is_draft=${i.rct_is_draft}">撤销招聘</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    要删除已经发布的招聘信息，请先进行撤销操作
                </div>
            </div>
        </div><!--已发布招聘框完-->
        <!--未发布招聘框-->
        <div class="tab-pane fade" id="recruitDown">
            <div class="panel panel-default">
                <div class="panel-heading">
                    未发布的招聘草稿
                </div>
                <div class="panel-body">
                    招聘草稿信息如下
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>招聘主题</td>
                        <td>招聘简介</td>
                        <td>地址</td>
                        <td>薪资</td>
                        <td>职位</td>
                    </tr>
                    <c:forEach items="${sessionScope.u_recruits}" var="i">
                        <c:forEach items="${sessionScope.position}" var="j">
                            <c:if test="${i.pos_id eq j.pos_id}">
                                <tr>
                                    <td>${i.rct_title}</td>
                                    <td>${i.rct_introduction}</td>
                                    <td>${i.rct_address}</td>
                                    <td>薪资：￥${i.rct_salary}/月</td>
                                    <td>${j.pos_name}</td>
                                    <td>
                                        <button class="btn btn-success" data-toggle="modal" data-target="#recruitChange-modal" data-title="修改草稿" data-rct_id="${i.rct_id}" data-pos_id="${i.pos_id}">修改草稿</button>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="publishRecruit?rct_id=${i.rct_id}">发布招聘</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger" href="delRct?rct_id=${i.rct_id}">删除草稿</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#recruitPage-modal" data-title="招聘草稿">编写草稿</button>
                </div>
            </div>
        </div><!--未发布招聘框完-->
        <!--部门-->
        <div class="tab-pane fade" id="dep">
            <div class="panel panel-default">
                <div class="panel-heading">
                    部门
                </div>
                <div class="panel-body">
                    以下是部门信息
                </div>
                <table id="dep_table" class="table table-hover">
                    <tr>
                        <td class="col-lg-2">部门ID</td>
                        <td class="col-lg-2">部门名称</td>
                        <td class="col-lg-2">部门成立时间</td>
                    </tr>
                    <c:forEach items="${sessionScope.department}" var="i">
                        <tr>
                            <td class="col-lg-2">${i.dep_id}</td>
                            <td class="col-lg-2">${i.dep_name}</td>
                            <td class="col-lg-2">${i.dep_date}</td>
                            <td class="col-lg-3">
                                <form role="form" class="form form-inline dep_update_form" method="post" action="updateDep">
                                    <div class="form-group">
                                        <input type="hidden" name="dep_id" value="${i.dep_id}">
                                        <input class="form-control dep_update_name" type="text" name="dep_name" placeholder="修改部门名称,请输入" maxlength="30" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="form-control btn btn-success dep_update_submit" value="修改部门名称">
                                    </div>
                                </form>
                            </td>
                            <td class="col-lg-1">
                                <form  role="form" class="form form-inline" method="post" action="delDep">
                                    <div class="form-group">
                                        <input type="hidden" name="dep_id" value="${i.dep_id}">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-danger" value="删除部门">
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    <form id="dep_add_form" role="form" class="form form-inline" method="post" action="addDep">
                        <div class="form-group">
                            <label class="control-label">新部门名称</label>
                            <input class="form-control" type="text" id="dep_name" name="dep_name" placeholder="请输入一个新部门名称" maxlength="30" required>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control btn btn-primary" id="dep_submit" value="新增部门">
                        </div>
                    </form>
                </div>
            </div>
        </div><!--部门完-->
        <!--职位-->
        <div class="tab-pane fade" id="pos">
            <div class="panel panel-default">
                <div class="panel-heading">
                    职位
                </div>
                <div class="panel-body">
                    选择部门
                    <select id="dep_display" class="form-control">
                        <option hidden selected value="">请选择</option>
                        <c:forEach items="${sessionScope.department}" var="i">
                            <option value="${i.dep_id}">${i.dep_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <table id="pos_display" class="table table-hover">
                    <tr>
                        <td>职位ID</td>
                        <td>职位名称</td>
                    </tr>
                </table>
                <div class="panel-footer">
                    <form id="pos_add_form" role="form" class="form form-inline" action="addPos" method="post">
                        <div class="form-group">
                            <label class="control-label">新职位名称</label>
                            <input id="pos_dep_id" type="hidden" name="dep_id" value="">
                            <input class="form-control" type="text" id="pos_name" name="pos_name" placeholder="请输入一个新职位名称" maxlength="30" required>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control btn btn-primary" id="pos_submit" value="新增职位">
                        </div>
                    </form>
                </div>
            </div>
        </div><!--职位完-->
        <!--员工状态修改-->
        <div class="tab-pane fade" id="employeeState" >
            <div class="panel panel-default">
                <div class="panel-heading">
                    员工信息
                </div>
                <div class="panel-body">
                    <c:forEach items="${sessionScope.employees}" var="i">
                        <c:forEach items="${sessionScope.position}" var="j">
                            <c:if test="${i.pos_id eq j.pos_id}">
                                <div class="well well-lg col-lg-12">
                                    <div class="panel panel-primary col-lg-3">员工ID:${i.e_id}</div>
                                    <div class="panel panel-default col-lg-3">员工姓名:${i.e_name}</div>
                                    <div class="panel panel-default col-lg-3">员工职位:${j.pos_name}</div>
                                    <c:choose>
                                        <c:when test="${i.e_state eq 0}">
                                            <div class="panel panel-default col-lg-3">员工在职状态:试用期</div>
                                        </c:when>
                                        <c:when test="${i.e_state eq 1}">
                                            <div class="panel panel-default col-lg-3">员工在职状态:在职</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="panel panel-default col-lg-3">员工在职状态:离职</div>
                                        </c:otherwise>
                                    </c:choose>
                                    <form role="form" class="form col-lg-6" action="updateEmpPos" method="post">
                                        <div class="form-group">
                                            <label class="control-label">职位:</label>
                                            <select class="form-control emp_dep">
                                            </select>
                                            <select class="form-control emp_pos">
                                                <option value="" hidden selected>请选择职位</option>
                                            </select>
                                            <input type="hidden" name="pos_id" value="">
                                            <input type="hidden" name="e_id" value="${i.e_id}">
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" value="修改职位" class="btn btn-success"/>
                                        </div>
                                    </form>
                                    <form role="form" class="form col-lg-6" action="updateEmpState" method="post">
                                        <div class="form-group">
                                            <label class="control-label">在职状态:</label>
                                            <select class="form-control emp_state">
                                                <option value="" hidden selected>请选择在职状态</option>
                                                <option value="0">试用期</option>
                                                <option value="1">在职</option>
                                                <option value="2">离职</option>
                                            </select>
                                            <input type="hidden" name="e_state" value="">
                                            <input type="hidden" name="e_id" value="${i.e_id}">
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" value="修改在职状态" class="btn btn-success"/>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--员工状态修改完-->
        <!--员工工资结算-->
        <div class="tab-pane fade" id="employeeSalary">
            <div class="panel panel-default">
                <div class="panel-heading">
                    员工信息
                </div>
                <div class="panel-body">
                    <c:forEach items="${sessionScope.employees}" var="i">
                        <c:forEach items="${sessionScope.position}" var="j">
                            <c:if test="${i.pos_id eq j.pos_id}">
                                <div class="well well-lg col-lg-12">
                                    <div class="panel panel-primary col-lg-3">员工ID:${i.e_id}</div>
                                    <div class="panel panel-default col-lg-3">员工姓名:${i.e_name}</div>
                                    <div class="panel panel-default col-lg-3">员工职位:${j.pos_name}</div>
                                    <c:choose>
                                        <c:when test="${i.e_state eq 0}">
                                            <div class="panel panel-default col-lg-3">员工在职状态:试用期</div>
                                        </c:when>
                                        <c:when test="${i.e_state eq 1}">
                                            <div class="panel panel-default col-lg-3">员工在职状态:在职</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="panel panel-default col-lg-3">员工在职状态:离职</div>
                                        </c:otherwise>
                                    </c:choose>
                                    <form role="form" class="form col-lg-6" action="addSalary" method="post">
                                        <div class="form-group">
                                            <input type="hidden" name="e_id" value="${i.e_id}">
                                            <input type="submit" value="结算工资" class="btn btn-success"/>
                                        </div>
                                    </form>
                                    <button class="btn btn-primary col-lg-6" data-toggle="modal" data-target="#troubleSalView-modal" data-title="薪资复议" data-e_id="${i.e_id}">查看薪资复议记录</button>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--员工工资结算完-->
        <!--员工奖罚-->
        <div class="tab-pane fade" id="employeeReward">
            <div class="panel panel-default">
                <div class="panel-heading">
                    员工信息
                </div>
                <div class="panel-body">
                    <select id="dep_reward" class="form-control col-lg-4">
                        <option hidden selected value="">请选择部门</option>
                        <c:forEach items="${sessionScope.department}" var="i">
                            <option value="${i.dep_id}">${i.dep_name}</option>
                        </c:forEach>
                    </select>
                    <select id="pos_reward" class="form-control col-lg-4">
                        <option hidden selected value="">请选择职位</option>
                    </select>
                    <select id="emp_reward" class="form-control col-lg-4">
                        <option hidden selected value="">请选择人员</option>
                    </select>
                </div>
                <table class="table table-hover empRewardTab">
                </table>
                <div class="panel-footer">
                    <form id="RewardAddForm" role="form" class="form-inline form" action="addReward" method="post">
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="e_id">
                            <input type="text" class="form-control" name="r_reason" placeholder="原因" required maxlength="30">
                            <input type="text" class="form-control" name="r_money" placeholder="金额" required maxlength="4">
                            <input id = "add_rewards" type="submit" class="form-control btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div><!--员工奖罚完-->
        <!--员工出勤-->
        <div class="tab-pane fade" id="employeeAttendance">
            <div class="panel panel-default">
                <div class="panel-heading">
                    员工考勤
                </div>
                <div class="panel-body">
                    <input id="e_id_atd" name="e_id" placeholder="请输入员工ID"/>
                    <select id="months_choose" class="form-control">
                        <option value="" hidden selected>请选择月份</option>
                        <option value="1">一月</option>
                        <option value="2">二月</option>
                        <option value="3">三月</option>
                        <option value="4">四月</option>
                        <option value="5">五月</option>
                        <option value="6">六月</option>
                        <option value="7">七月</option>
                        <option value="8">八月</option>
                        <option value="9">九月</option>
                        <option value="10">十月</option>
                        <option value="11">十一月</option>
                        <option value="12">十二月</option>
                    </select>
                </div>
                <table class="table table-hover">
                    <tbody id="atd_check_tbody">
                    </tbody>
                </table>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--员工出勤完-->
        <!--面试申请-->
        <div class="tab-pane fade" id="fifsCv">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查看面试申请
                </div>
                <div class="panel-body">
                    以下是面试申请
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>招聘主题</td>
                        <td>招聘简介</td>
                        <td>地址</td>
                        <td>薪资</td>
                        <td>应聘人员姓名</td>
                        <td>查看记录</td>
                    </tr>
                    <c:forEach items="${sessionScope.fifs}" var="i">
                        <c:if test="${i.f_is_accept eq 0}">
                            <c:forEach items="${sessionScope.p_recruits}" var="j">
                                <c:if test="${i.rct_id eq j.rct_id}">
                                    <c:forEach items="${sessionScope.cv}" var="c">
                                        <c:if test="${i.cv_id eq c.cv_id}">
                                            <tr>
                                                <td>${j.rct_title}</td>
                                                <td>${j.rct_introduction}</td>
                                                <td>${j.rct_address}</td>
                                                <td>薪资：￥${j.rct_salary}/月</td>
                                                <td>${c.cv_name}</td>
                                                <c:choose>
                                                    <c:when test="${i.f_is_read eq 0}">
                                                        <td>未查看</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>已查看</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    <button class="btn btn-primary" data-toggle="modal" data-target="#ViewCv-modal" data-title="查看简历" data-cv_id="${i.cv_id}" data-f_id="${i.f_id}">查看简历</button>
                                                </td>
                                                <td>
                                                    <form role="form" class="form" action="acceptFifs" method="post">
                                                        <input class="form-control" type="hidden" name="f_id" value="${i.f_id}">
                                                        <div class="form-group">
                                                            <label class="control-label">请输入面试时间</label>
                                                            <input type="datetime-local" class="form-control" name="f_date" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="submit" class="btn btn-primary" value="同意申请">
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--面试申请完-->
        <!--录用-->
        <div class="tab-pane fade" id="fifsEnroll">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查看面试申请
                </div>
                <div class="panel-body">
                    以下是面试申请
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>招聘主题</td>
                        <td>招聘简介</td>
                        <td>地址</td>
                        <td>薪资</td>
                        <td>应聘人员姓名</td>
                        <td>查看记录</td>
                    </tr>
                    <c:forEach items="${sessionScope.fifs}" var="i">
                        <c:if test="${i.f_is_accept eq 1}">
                            <c:forEach items="${sessionScope.p_recruits}" var="j">
                                <c:if test="${i.rct_id eq j.rct_id}">
                                    <c:forEach items="${sessionScope.cv}" var="c">
                                        <c:if test="${i.cv_id eq c.cv_id}">
                                            <tr>
                                                <td>${j.rct_title}</td>
                                                <td>${j.rct_introduction}</td>
                                                <td>${j.rct_address}</td>
                                                <td>薪资：￥${j.rct_salary}/月</td>
                                                <td>${c.cv_name}</td>
                                                <c:choose>
                                                    <c:when test="${i.f_is_read eq 0}">
                                                        <td>未查看</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>已查看</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    <form role="form" class="form" action="enroll" method="post">
                                                        <input class="form-control" type="hidden" name="f_id" value="${i.f_id}">
                                                        <div class="form-group">
                                                            <label class="control-label">请输入员工账号</label>
                                                            <input id="e_account" type="text" class="form-control" name="e_account" maxlength="10" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label">请输入员工密码</label>
                                                            <input id="e_pass" type="text" class="form-control" name="e_pass" maxlength="10" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label">请输入电话号码</label>
                                                            <input id="phoneNumber" type="text" class="form-control" name="e_phone" maxlength="11" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label">请输入银行卡号</label>
                                                            <input id="cardNumber" type="text" class="form-control" name="e_debit" maxlength="16" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="submit" class="btn btn-primary" value="录用">
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--录用完-->
        <!--培训草稿-->
        <div class="tab-pane fade" id="trainingWillDo">
            <div class="panel panel-default">
                <div class="panel-heading">
                    未发布的培训
                </div>
                <div class="panel-body">
                    培训草稿信息如下
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>培训主题</td>
                        <td>培训内容</td>
                        <td>地址</td>
                        <td>开始时间</td>
                        <td>结束时间</td>
                    </tr>
                    <c:forEach items="${sessionScope.u_trainings}" var="i">
                        <tr>
                            <td>${i.t_title}</td>
                            <td>${i.t_context}</td>
                            <td>${i.t_address}</td>
                            <td>${i.t_start_time}</td>
                            <td>${i.t_end_time}</td>
                            <td>
                                <button class="btn btn-success" data-toggle="modal" data-target="#trainingChange-modal" data-title="修改草稿" data-t_id="${i.t_id}">修改草稿</button>
                            </td>
                            <td>
                                <button class="btn btn-primary" data-toggle="modal" data-target="#trainingPublish-modal" data-title="发布培训" data-t_id="${i.t_id}">发布培训</button>
                            </td>
                            <td>
                                <a class="btn btn-danger" href="delTraining?t_id=${i.t_id}&t_is_publish=${i.t_is_publish}">删除草稿</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#trainingCreate-modal" data-title="新建培训信息">编写草稿</button>
                </div>
            </div>
        </div><!--培训草稿完-->
        <!--进行中培训查看-->
        <div class="tab-pane fade" id="trainingDoing">
            <div class="panel panel-default">
                <div class="panel-heading">
                    进行中的培训
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <td>培训ID</td>
                            <td>培训主题</td>
                            <td>培训内容</td>
                            <td>开始时间</td>
                            <td>结束时间</td>
                        </tr>
                        <c:forEach items="${sessionScope.p_trainings}" var="i">
                            <tr>
                                <td>${i.t_id}</td>
                                <td>${i.t_title}</td>
                                <td>${i.t_context}</td>
                                <td>${i.t_start_time}</td>
                                <td>${i.t_end_time}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--进行中培训完-->
        <!--完成的培训-->
        <div class="tab-pane fade" id="trainingDone">
            <div class="panel panel-default">
                <div class="panel-heading">
                    已完成的培训
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <td>培训ID</td>
                            <td>培训主题</td>
                            <td>培训内容</td>
                            <td>开始时间</td>
                            <td>结束时间</td>
                        </tr>
                        <c:forEach items="${sessionScope.f_trainings}" var="i">
                            <tr>
                                <td>${i.t_id}</td>
                                <td>${i.t_title}</td>
                                <td>${i.t_context}</td>
                                <td>${i.t_start_time}</td>
                                <td>${i.t_end_time}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="panel-footer">
                </div>
            </div>
        </div><!--完成的培训完-->
    </div>
</div>
<!--简历信息模态框-->
<div class="modal fade" id="ViewCv-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" method="post">
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">姓名:</label>
                        <input class="form-control" type="text" name="cv_name" readonly>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">性别:</label>
                        <input class="form-control" name="cv_gender" type="text" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">生日:</label>
                        <input class="form-control" name="cv_birth" type="date" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="cv_address" type="text" placeholder="不超过80个字" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">文化程度:</label>
                        <input class="form-control" name="cv_education" type="text" placeholder="education" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业院校:</label>
                        <input class="form-control" name="cv_school" type="text" placeholder="school" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主学专业:</label>
                        <input class="form-control" name="cv_major" type="text" placeholder="major" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">入学时间:</label>
                        <input class="form-control" name="cv_enroll_date" type="date" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业时间:</label>
                        <input class="form-control" name="cv_graduation_date" type="date" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">期望薪资:</label>
                        <input class="form-control" name="cv_salary" type="text" readonly/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要经历</label>
                        <textarea class="form-control" name="cv_experience" readonly></textarea>
                    </div>
                </form>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</div><!--简历模态框完-->
<!--新建招聘模态框-->
<div class="modal fade" id="recruitPage-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="addRct" method="post">
                    <div class="form-group">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="rct_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="rct_introduction" maxlength="250"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="rct_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">职位:</label>
                        <select id="dep_rct" class="form-control">
                        </select>
                        <select id="pos_rct" class="form-control">
                            <option value="" hidden selected>请选择职位</option>
                        </select>
                        <input id="pos_save_rct" type="hidden" name="pos_id" value="">
                    </div>
                    <div class="form-group">
                        <label class="control-label">薪资:</label>
                        <input class="form-control" name="rct_salary" type="number"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">联系员工ID:</label>
                        <input class="form-control" name="e_id" type="number"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="method" value="insert" type="hidden">
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="recruit-submit" class="btn btn-info btn-group-lg btn-group-justified" value="上传招聘草稿"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--新建招聘模态框完-->
<!--修改招聘信息模态框-->
<div class="modal fade" id="recruitChange-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="updateRct" method="post">
                    <div class="form-group">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="rct_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="rct_introduction" maxlength="250"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="rct_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">职位:</label>
                        <select id="dep_id_change" class="form-control">
                        </select>
                        <select id="pos_id_change" class="form-control">
                            <option value="" hidden selected>请选择职位,如果不修改请不要选择</option>
                        </select>
                        <!--隐藏属性-->
                        <input id="pos_id_save_change" type="hidden" name="pos_id" value="">
                        <input id="rct_id" type="hidden" name="rct_id" value="">
                        <input id="rct_is_draft" type="hidden" name="rct_is_draft" value="">
                    </div>
                    <div class="form-group">
                        <label class="control-label">薪资:</label>
                        <input class="form-control" name="rct_salary" type="text" maxlength="10"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">联系员工ID:</label>
                        <input class="form-control" name="e_id" type="text" maxlength="5"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="method" value="insert" type="hidden">
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="change-submit" class="btn btn-info btn-group-lg btn-group-justified" value="上传招聘草稿"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--修改招聘信息模态框完-->
<!--查看问题薪资记录模态框-->
<div class="modal fade" id="troubleSalView-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover">
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div><!--查看问题薪资记录模态框完-->
<!--新建培训模态框-->
<div class="modal fade" id="trainingCreate-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="addTraining" method="post">
                    <div class="form-group">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="t_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="t_context"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="t_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">培训开始时间:</label>
                        <input class="form-control" name="t_start_time" type="date"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">培训结束时间:</label>
                        <input class="form-control" name="t_end_time" type="date"/>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="trainingCreate-submit" class="btn btn-info btn-group-lg btn-group-justified" value="上传培训草稿"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--新建培训模态框完-->
<!--修改培训信息模态框-->
<div class="modal fade" id="trainingChange-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="updateTraining" method="post">
                    <input type="hidden" class="form-control" name="t_id">
                    <div class="form-group">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="t_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="t_context" maxlength="250"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="t_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">培训开始时间:</label>
                        <input class="form-control" name="t_start_time" type="date"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">培训结束时间:</label>
                        <input class="form-control" name="t_end_time" type="date"/>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="trainingChange-submit" class="btn btn-info btn-group-lg btn-group-justified" value="上传培训草稿"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--修改培训信息模态框完-->
<!--发布培训信息模态框-->
<div class="modal fade" id="trainingPublish-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="updatePublishT" method="post">
                    <input type="hidden" class="form-control" name="t_id">
                    <div class="form-group">
                        <label class="control-label">职位筛选:</label>
                        <select id="dep_tra" class="form-control">
                            <option value="" hidden selected>请选择部门</option>
                            <c:forEach items="${sessionScope.department}" var="i">
                                <option value="${i.dep_id}">${i.dep_name}</option>
                            </c:forEach>
                        </select>
                        <select id="pos_tra" class="form-control">
                            <option value="" hidden selected>请选择职位</option>
                        </select>
                    </div>
                    <div class="form-group" data-toggle="buttons">
                        <c:forEach items="${sessionScope.employees}" var="i">
                            <label class="btn btn-default checkbox-group" id="e_id${i.e_id}">
                                <input class="form-control" type="checkbox" value="${i.e_id}" name="e_ids">${i.e_name}
                            </label>
                        </c:forEach>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="trainingPublicT-submit" class="btn btn-info btn-group-lg btn-group-justified" value="上传培训"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--修改发布信息模态框完-->

<script>
    $(document).ready(function () {
        //新建招聘二级联动
        $.ajax({
            type:"get",
            url:"findDep",
            success:function (data) {
                var department = $("#dep_id");
                var emp_dep = $(".emp_dep");
                var dep_rct = $("#dep_rct")
                department.empty();
                emp_dep.empty();
                dep_rct.empty();
                department.append("<option value='' hidden selected>请选择部门</option>");
                emp_dep.append("<option value='' hidden selected>请选择部门</option>");
                dep_rct.append("<option value='' hidden selected>请选择部门</option>");
                for(var i in data){
                    department.append("<option value='"+data[i]['dep_id']+"'>"+data[i]['dep_name']+"</option>");
                    emp_dep.append("<option value='"+data[i]['dep_id']+"'>"+data[i]['dep_name']+"</option>");
                    dep_rct.append("<option value='"+data[i]['dep_id']+"'>"+data[i]['dep_name']+"</option>");
                }
            }
        });
        //员工列表里面的二级联动
        $(".emp_dep").on("change",function(){
            var position = $(this).next();
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $(".emp_pos").on("change",function(){
            var pos_id = $(this).next();
            pos_id.val($(this).val());
        });

        //奖罚的二级联动
        $("#dep_reward").on("change",function(){
            var position = $(this).next();
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $("#pos_reward").on("change",function(){
            var position = $(this).next();
            $.ajax({
                type:"get",
                url:"findEmpByPos",
                data:"pos_id="+$(this).val(),
                success:function (data) {
                    position.empty();
                    position.append("<option value='' hidden selected>请选择人员</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['e_id']+"'>"+data[i]['e_name']+"</option>");
                    }
                }
            });
        });

        $("#emp_reward").on("change",function () {
            var table = $(".empRewardTab");
            $("#RewardAddForm").find("input[name='e_id']").val($(this).val());
            $.ajax({
                type:"get",
                url:"findRewByEmp",
                data:"e_id="+$(this).val(),
                success:function (data) {
                    table.empty();
                    var tableBody = table.append("<tbody></tbody>");
                    var th =$("<tr></tr>");
                    tableBody.append(th);
                    th.append("<td>奖惩时间</td>");
                    th.append("<td>奖惩理由</td>");
                    th.append("<td>奖惩金额</td>");
                    for(var i in data){
                        var tr = $("<tr></tr>");
                        tableBody.append(tr);
                        tr.append("<td>"+data[i]['r_date']+"</td>");
                        tr.append("<td>"+data[i]['r_reason']+"</td>");
                        tr.append("<td>"+data[i]['r_money']+"</td>");
                        var change = $("<td></td>");
                        tr.append(change);
                        var formChange = $("<form role='form' class='form form-inline' action='updateReward' method='post'></form>");
                        change.append(formChange);
                        var formChangeDiv = formChange.append("<div class='form-group'></div>");
                        formChangeDiv.append("<input type='hidden' name='r_id' value='"+data[i]['r_id']+"'>");
                        formChangeDiv.append("<input type='text' name='r_reason' class='form-control' maxlength='20' placeholder='原因' required>");
                        formChangeDiv.append("<input type='text' name='r_money' class='form-control' maxlength='4' placeholder='金额' required>");
                        formChangeDiv.append("<input type='submit' id='rewardChangeDiv_submit' class='form-control btn btn-success' value='修改信息'>");
                        var del = $("<td></td>");
                        tr.append(del);
                        var formDel = $("<form role='form' class='form form-inline' action='delReward' method='post'></form>");
                        del.append(formDel);
                        var formDelDiv = formDel.append("<div class='formGroup'></div>");
                        formDelDiv.append("<input type='hidden' name='r_id' value='"+data[i]['r_id']+"'>");
                        formDelDiv.append("<input type='submit' id='rewardDelDiv_submit' class='form-control btn btn-danger' value='删除记录' disabled>");
                    }
                }
            });
            $("#rewardChangeDiv_submit").on("click",function () {
                var reg=/\d/;
                var money = $(this).prev();
                if(!reg.test(money.val())){
                    $(this).attr("onsubmit","return false");
                }
                $(this).attr("onsubmit","return true");
            })

        });

        //员工列表里面的状态变动
        $(".emp_state").on("change",function(){
            var state = $(this).next();
            state.val($(this).val());
        });

        //部门职位里的二级联动
        $("#dep_id").on("change",function () {
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    var position = $("#pos_id");
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $("#pos_id").on("change",function () {
            $("#pos_id_save").val($("#pos_id").val());
        });

        //新建招聘信息
        $("#dep_rct").on("change",function () {
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    var position = $("#pos_rct");
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $("#pos_rct").on("change",function () {
            $("#pos_save_rct").val($("#pos_rct").val());
        });

        //修改招聘信息的二级联动
        $.ajax({
            type:"get",
            url:"findDep",
            success:function (data) {
                var department = $("#dep_id_change");
                department.empty();
                department.append("<option value='' hidden selected>请选择部门,如果不修改请不要选择</option>");
                for(var i in data){
                    department.append("<option value='"+data[i]['dep_id']+"'>"+data[i]['dep_name']+"</option>");
                }
            }
        });
        $("#dep_id_change").on("change",function () {
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    var position = $("#pos_id_change");
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位,如果不修改请不要选择</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $("#pos_id_change").on("change",function () {
            $("#pos_id_save_change").val($("#pos_id_change").val());
        })
    });

    //新建招聘模态框控制器
    $("#recruitPage-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        modal.find(".modal-title").text(title);
    });

    //新建招聘按钮上传限定
    $("#recruit-submit").click(function () {
        var reg = /\d/;
        var modal =$("#recruitPage-modal");
        var title = modal.find(".modal-body form input[name='rct_title']").val();
        var introduction = modal.find(".modal-body form input[name='rct_introduction']").val();
        var address = modal.find(".modal-body form input[name='rct_address']").val();
        var position = modal.find(".modal-body form input[name='pos_id']").val();
        var salary = modal.find(".modal-body form input[name='rct_salary']").val();
        var e_id = modal.find(".modal-body form input[name='e_id']").val();
        if(title===""||introduction===""||address===""||position===""||salary===""||e_id===""||!reg.test(salary)||!reg.test(e_id)){
            return;
        }
        modal.find(".modal-body form").submit();
    });

    //修改招聘模态框控制器
    $("#recruitChange-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        var form = modal.find(".modal-body form");
        modal.find(".modal-title").text(title);
        $.ajax({
            type:"get",
            url:"findRct",
            data:"rct_id="+a.data("rct_id"),
            success:function (date) {
                form.find("input[name='rct_title']").val(date['rct_title']);
                form.find("textarea[name='rct_introduction']").val(date['rct_introduction']);
                form.find("input[name='rct_address']").val(date['rct_address']);
                $("#pos_id_save_change").val(date['pos_id']);
                form.find("input[name='rct_id']").val(date['rct_id']);
                form.find("input[name='rct_is_draft']").val(date['rct_is_draft']);
                form.find("input[name='rct_salary']").val(date['rct_salary']);
                form.find("input[name='e_id']").val(date['e_id']);
            }
        });
    });

    //显示简历信息模态框控制器
    $("#ViewCv-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        var form = modal.find(".modal-body form");
        modal.find(".modal-title").text(title);
        $.ajax({
            type:"get",
            url:"chooseFifs",
            data:"cv_id="+a.data("cv_id")+"&f_id="+a.data("f_id"),
            success:function (date) {
                form.find("input[name='cv_name']").val(date['cv_name']);
                form.find("input[name='cv_gender']").val(date['cv_gender']);
                form.find("input[name='cv_birth']").val(date['cv_birth']);
                form.find("input[name='cv_address']").val(date['cv_address']);
                form.find("input[name='cv_school']").val(date['cv_school']);
                form.find("input[name='cv_education']").val(date['cv_education']);
                form.find("input[name='cv_major']").val(date['cv_major']);
                form.find("input[name='cv_enroll_date']").val(date['cv_enroll_date']);
                form.find("input[name='cv_graduation_date']").val(date['cv_graduation_date']);
                form.find("input[name='cv_salary']").val(date['cv_salary']);
                form.find("textarea[name='cv_experience']").text(date['cv_experience']);
            }
        });
    });

    //修改招聘按钮上传限定
    $("#change-submit").click(function () {
        var reg =/\d/;
        var modal =$("#recruitChange-modal");
        var title = modal.find(".modal-body form input[name='rct_title']").val();
        var introduction = modal.find(".modal-body form textarea[name='rct_introduction']").val();
        var address = modal.find(".modal-body form input[name='rct_address']").val();
        var position = modal.find(".modal-body form input[name='pos_id']").val();
        var id = modal.find(".modal-body form input[name='rct_id']").val();
        var is_draft = modal.find(".modal-body form input[name='rct_is_draft']").val();
        var salary = modal.find(".modal-body form input[name='rct_salary']").val();
        var e_id = modal.find(".modal-body form input[name='e_id']").val();
        if(title===""||introduction===""||address===""||position===""||salary===""||e_id===""||id===""||is_draft===""||!reg.test(salary)||!reg.test(e_id)){
            return;
        }
        modal.find(".modal-body form").submit();
    });

</script>
<!--培训-->
<script>
    //新建培训模态框控制器
    $("#trainingCreate-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        modal.find(".modal-title").text(title);
    });

    //新建招聘按钮上传限定
    $("#trainingCreate-submit").click(function () {
        var modal =$("#trainingCreate-modal");
        var title = modal.find(".modal-body form input[name='t_title']").val();
        var context = modal.find(".modal-body form input[name='t_context']").val();
        var address = modal.find(".modal-body form input[name='t_address']").val();
        var startTime = modal.find(".modal-body form input[name='t_start_time']").val();
        var endTime = modal.find(".modal-body form input[name='t_end_time']").val();
        if(title===""||context===""||address===""||startTime===""||endTime===""){
            return;
        }
        modal.find(".modal-body form").submit();
    });

    //修改培训模态框回显控制器
    $("#trainingChange-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var t_id = a.data("t_id");
        var modal = $(this);
        var form = modal.find(".modal-body form");
        modal.find(".modal-title").text(title);
        modal.find("input[name='t_id']").val(t_id);
        $.ajax({
            type:"get",
            url:"findTra",
            data:"t_id="+t_id,
            success:function (date) {
                form.find("input[name='t_title']").val(date['t_title']);
                form.find("textarea[name='t_context']").val(date['t_context']);
                form.find("input[name='t_address']").val(date['t_address']);
                form.find("input[name='t_start_time']").val(date['t_start_time']);
                form.find("input[name='t_end_time']").val(date['t_end_time']);
            }
        });
    });

    //修改培训按钮上传限定
    $("#trainingChange-submit").click(function () {
        var modal =$("#trainingChange-modal");
        var title = modal.find(".modal-body form input[name='t_title']").val();
        var context = modal.find(".modal-body form input[name='t_context']").val();
        var address = modal.find(".modal-body form input[name='t_address']").val();
        var startTime = modal.find(".modal-body form input[name='t_start_time']").val();
        var endTime = modal.find(".modal-body form input[name='t_end_time']").val();
        var t_id = modal.find(".modal-body form input[name='t_id']").val();
        if(title===""||context===""||address===""||startTime===""||endTime===""||t_id===""){
            return;
        }
        modal.find(".modal-body form").submit();
    });

    //上传培训模态框控制器
    $("#trainingPublish-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var t_id = a.data("t_id");
        var modal = $(this);
        modal.find(".modal-title").text(title);
        modal.find(".modal-body form input[name='t_id']").val(t_id);
        $("#dep_tra").on("change",function () {
            $.ajax({
                type:"get",
                url:"findEmpNotInDep",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    for (var i in data){
                        $("#e_id"+data[i]['e_id']).css("display","none");
                    }
                }
            });
            $.ajax({
                type:"get",
                url:"findEmpByDep",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    for (var i in data){
                        $("#e_id"+data[i]['e_id']).css("display","block");
                    }
                }
            });
            $.ajax({
                type:"get",
                url:"findPos",
                data:"dep_id="+$(this).val(),
                success:function (data) {
                    var position = $("#pos_tra");
                    position.empty();
                    position.append("<option value='' hidden selected>请选择职位</option>");
                    for(var i in data){
                        position.append("<option value='"+data[i]['pos_id']+"'>"+data[i]['pos_name']+"</option>");
                    }
                }
            });
        });
        $("#pos_tra").on("change",function () {
            $.ajax({
                type:"get",
                url:"findEmpNotInPos",
                data:"pos_id="+$(this).val(),
                success:function (data) {
                    for (var i in data){
                        $("#e_id"+data[i]['e_id']).css("display","none");
                    }
                }
            });
            $.ajax({
                type:"get",
                url:"findEmpByPos",
                data:"pos_id="+$(this).val(),
                success:function (data) {
                    for (var i in data){
                        $("#e_id"+data[i]['e_id']).css("display","block");
                    }
                }
            });
        });
    });

    $("#trainingPublicT-submit").click(function () {
        var modal =$("#trainingPublish-modal");
        modal.find(".modal-body form").submit();
    });

</script><!--培训-->
<script>
    //部门新增判定
    $("#dep_submit").on("click",function(){
        var dep_name = $("#dep_name").val();
        var dep_form = $("#dep_add_form");
        if(dep_name!==""){
            dep_form.submit();
        }
    });
    //部门修改判定
    $(".dep_update_submit").on("click",function (){
        var form = $(this).parent().parent();
        var dep_update_name = form.find(".dep_update_name").val();
        if(dep_update_name!==""){
            form.submit();
        }
    });
    // 职位展示二级联动
    $("#dep_display").on("change",function () {
        var dep_id = $(this).val();
        $("#pos_dep_id").val(dep_id);
        var table = $("#pos_display");
        $.ajax({
            type:"get",
            url:"findPos",
            data:"dep_id="+$(this).val(),
            success:function (data) {
                table.empty();
                var body = table.append("<tbody></tbody>");
                body.append("<tr>" +
                    "                <td>职位ID</td>" +
                    "                <td>职位名称</td>" +
                    "            </tr>");
                for(var i in data){
                    body.append("<tr><td class='col-lg-3'>"+data[i]['pos_id']+"</td><td class='col-lg-3'>"+data[i]['pos_name']+"</td>" +
                        "<td>" +
                        "<form role='form' class='form form-inline pos_update_form' method='post' action='updatePos'>" +
                        "<div class='form-group'>" +
                        "<input type='hidden' name='pos_id' value='"+data[i]['pos_id']+"'>" +
                        "<input type='hidden' name='dep_id' value='"+data[i]['dep_id']+"'>" +
                        "<input class='form-control pos_update_name' type='text' name='pos_name' placeholder='修改职位名称,请输入' maxlength='30'>" +
                        "</div>" +
                        "<div class='form-group'>" +
                        "<input type='submit' class='btn btn-success form-control pos_update_submit' value='修改职位ID'>" +
                        "</div>" +
                        "</form>" +
                        "</td>" +
                        "<td>" +
                        "<form role='form' class='form form-inline' method='post' action='delPos'>" +
                        "<div class='form-group'>" +
                        "<input type='hidden' name='pos_id' value='"+data[i]['pos_id']+"'>" +
                        "</div>" +
                        "<div class='form-group'>" +
                        "<input class='form-control btn btn-danger' type='submit' value='删除职位'>" +
                        "</div>" +
                        "</form>" +
                        "</td>" +
                        "</tr>");
                }
                //职位修改判定
                // $("#pos_update_submit").on("click",function (){
                //     var form = $(this).parent().parent();
                //     var pos_update_name = form.find(".pos_update_name").val();
                //     if(pos_update_name!==""){
                //         form.submit();
                //     }
                // });
            }
        })
    });
    //职位新增判定
    $("#pos_submit").on("click",function () {
        var dep_id = $("#pos_dep_id").val();
        if(dep_id==""){
            $("#pos_add_form").attr("onsubmit","return false");
        }
        $("#pos_add_form").attr("onsubmit","return true");
    })
</script>
<script>
    $("#troubleSalView-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        var tableBody = modal.find("table tbody");
        modal.find(".modal-title").text(title);
        $.ajax({
            type:"get",
            url:"findTrouble",
            data:"e_id="+a.data("e_id"),
            success:function (data) {
                tableBody.empty();
                var th = tableBody.append("<tr></tr>");
                th.append("<td>结算日期</td>");
                th.append("<td>绩效奖金</td>");
                th.append("<td>加班费用</td>");
                th.append("<td>奖罚奖金</td>");
                th.append("<td>社保</td>");
                th.append("<td>总额</td>");
                for(var i in data){
                    if(data[i]['s_is_trouble']==1){
                        var tr = tableBody.append("<tr></tr>");
                        tr.append("<td>"+data[i]['s_date']+"</td>");
                        tr.append("<td>"+data[i]['s_performance']+"</td>");
                        tr.append("<td>"+data[i]['s_extra']+"</td>");
                        tr.append("<td>"+data[i]['s_reward']+"</td>");
                        tr.append("<td>"+data[i]['s_s_insurance']+"</td>");
                        tr.append("<td>"+data[i]['s_total']+"</td>");
                        tr.append("<td><a href='updateSalary?s_id="+data[i]['s_id']+"' class='btn btn-success'>完成复议</a></td>");
                    }
                }
            }
        });
    });
</script>
<!--考勤查看-->
<script>
    $("#e_id_atd").on("keyup",function() {
        var tbody = $("#atd_check_tbody");
        var reg = /\d/;
        var months = $("#months_choose").val();
        if(reg.test($(this).val())&&months===""){
            $.ajax({
                type:"get",
                url:"findATDByE_id",
                data:"e_id="+$(this).val(),
                success:function (data) {
                    tbody.empty();
                    var th = tbody.append("<tr></tr>");
                    th.append("<td>员工ID</td>");
                    th.append("<td>上班打卡时间</td>");
                    th.append("<td>下班打卡时间</td>");
                    th.append("<td>状态1</td>");
                    th.append("<td>状态2</td>");
                    for(var i in data){
                        var tr = tbody.append("<tr></tr>");
                        tr.append("<td>"+data[i]['e_id']+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_start_time'])+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_end_time'])+"</td>");
                        if(data[i]['atd_start_info']===1){
                            tr.append("<td>迟到</td>");
                        }
                        if(data[i]['atd_end_info']===1){
                            tr.append("<td>早退</td>");
                        }
                        if(data[i]['atd_state']===1){
                            tr.append("<td>旷工</td>");
                        }
                    }
                }
            })
        }else if(reg.test($(this).val())&&months!==""){
            $.ajax({
                type:"get",
                url:"findATDByE_idAndMonths",
                data:"e_id="+$(this).val()+"&months="+months,
                success:function (data) {
                    tbody.empty();
                    var th = tbody.append("<tr></tr>");
                    th.append("<td>员工ID</td>");
                    th.append("<td>上班打卡时间</td>");
                    th.append("<td>下班打卡时间</td>");
                    th.append("<td>状态1</td>");
                    th.append("<td>状态2</td>");
                    for(var i in data){
                        var tr = tbody.append("<tr></tr>");
                        tr.append("<td>"+data[i]['e_id']+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_start_time'])+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_end_time'])+"</td>");
                        if(data[i]['atd_start_info']===1){
                            tr.append("<td>迟到</td>");
                        }
                        if(data[i]['atd_end_info']===1){
                            tr.append("<td>早退</td>");
                        }
                        if(data[i]['atd_state']===1){
                            tr.append("<td>旷工</td>");
                        }
                    }
                }
            })
        }
    });

    $("#months_choose").on("change",function() {
        var tbody = $("#atd_check_tbody");
        var reg = /\d/;
        var e_id =$("#e_id_atd").val();
        if(reg.test(e_id)){
            $.ajax({
                type:"get",
                url:"findATDByE_idAndMonths",
                data:"e_id="+e_id+"&months="+$(this).val(),
                success:function (data) {
                    tbody.empty();
                    var th = tbody.append("<tr></tr>");
                    th.append("<td>员工ID</td>");
                    th.append("<td>上班打卡时间</td>");
                    th.append("<td>下班打卡时间</td>");
                    th.append("<td>状态1</td>");
                    th.append("<td>状态2</td>");
                    for(var i in data){
                        var tr = tbody.append("<tr></tr>");
                        tr.append("<td>"+data[i]['e_id']+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_start_time'])+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_end_time'])+"</td>");
                        if(data[i]['atd_start_info']===1){
                            tr.append("<td>迟到</td>");
                        }
                        if(data[i]['atd_end_info']===1){
                            tr.append("<td>早退</td>");
                        }
                        if(data[i]['atd_state']===1){
                            tr.append("<td>旷工</td>");
                        }
                    }
                }
            })
        }else if(e_id===""){
            $.ajax({
                type:"get",
                url:"findATDByMonths",
                data:"months="+$(this).val(),
                success:function (data) {
                    tbody.empty();
                    var th = tbody.append("<tr></tr>");
                    th.append("<td>员工ID</td>");
                    th.append("<td>上班打卡时间</td>");
                    th.append("<td>下班打卡时间</td>");
                    th.append("<td>状态1</td>");
                    th.append("<td>状态2</td>");
                    for(var i in data){
                        var tr = tbody.append("<tr></tr>");
                        tr.append("<td>"+data[i]['e_id']+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_start_time'])+"</td>");
                        tr.append("<td>"+new Date(data[i]['atd_end_time'])+"</td>");
                        if(data[i]['atd_start_info']===1){
                            tr.append("<td>迟到</td>");
                        }
                        if(data[i]['atd_end_info']===1){
                            tr.append("<td>早退</td>");
                        }
                        if(data[i]['atd_state']===1){
                            tr.append("<td>旷工</td>");
                        }
                    }
                }
            })
        }
    });
</script><!--考勤查看完-->
<!--表单验证-->
<script>
    $("#add_rewards").on("click",function () {
        var reg = /\d/;
        var money = $(this).prev().val();
        if(!reg.test(money)){
            $("#RewardAddForm").attr("onsubmit","return false");
        }
        $("#RewardAddForm").attr("onsubmit","return true");
    })
</script>
</body>
</html>
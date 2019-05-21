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
        <li><a href="#depAndPos" data-toggle="tab">部门与职位</a></li>
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
                                        <a class="btn btn-primary" href="updateRct?rct_id=${i.rct_id}&rct_is_draft=${i.rct_is_draft}">撤销招聘</a>
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
        </div>
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
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#recruitChange-modal" data-title="修改草稿" data-rct_id="${i.rct_id}">修改草稿</button>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="publishRecruit?rct_id=${i.rct_id}">发布招聘</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="delRct?rct_id=${i.rct_id}">删除草稿</a>
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
        </div>
        <div class="tab-pane fade" id="depAndPos"></div>
        <div class="tab-pane fade" id="employeeState"></div>
        <div class="tab-pane fade" id="employeeSalary"></div>
        <div class="tab-pane fade" id="employeeReward"></div>
        <div class="tab-pane fade" id="employeeAttendance"></div>
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
        </div>
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
        </div>
        <div class="tab-pane fade" id="trainingWillDo"></div>
        <div class="tab-pane fade" id="trainingDoing"></div>
        <div class="tab-pane fade" id="trainingDone"></div>
    </div>
</div>
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
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="rct_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="rct_introduction"></textarea>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="rct_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">职位:</label>
                        <select id="dep_id" class="form-control">
                        </select>
                        <select id="pos_id" class="form-control">
                            <option value="" hidden selected>请选择职位</option>
                        </select>
                        <input id="pos_id_save" type="hidden" name="pos_id" value="">
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">薪资:</label>
                        <input class="form-control" name="rct_salary" type="number"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">联系员工ID:</label>
                        <input class="form-control" name="e_id" type="number"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
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
</div>
<!--修改招聘信息-->
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
                        <input class="form-control" name="cv_salary" type="number" readonly/>
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
</div>
<!--修改招聘信息-->
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
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">标题：</label>
                        <input class="form-control" type="text" name="rct_title" placeholder="请输入一个标题" maxlength="30">
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要内容:</label>
                        <textarea class="form-control" name="rct_introduction"></textarea>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="rct_address" type="text" placeholder="请输入地址" maxlength="30"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
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
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">薪资:</label>
                        <input class="form-control" name="rct_salary" type="number"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">联系员工ID:</label>
                        <input class="form-control" name="e_id" type="number"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
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
</div>

<script>
    $(document).ready(function () {
        //新建招聘二级联动
        $.ajax({
            type:"get",
            url:"findDep",
            success:function (data) {
                var department = $("#dep_id");
                department.empty();
                department.append("<option value='' hidden selected>请选择部门</option>");
                for(var i in data){
                    department.append("<option value='"+data[i]['dep_id']+"'>"+data[i]['dep_name']+"</option>");
                }
            }
        });
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
        var modal =$("#recruitPage-modal");
        var title = modal.find(".modal-body form input[name='rct_title']").val();
        var introduction = modal.find(".modal-body form input[name='rct_introduction']").val();
        var address = modal.find(".modal-body form input[name='rct_address']").val();
        var position = modal.find(".modal-body form input[name='pos_id']").val();
        var salary = modal.find(".modal-body form input[name='rct_salary']").val();
        var e_id = modal.find(".modal-body form input[name='e_id']").val();
        if(title===""||introduction===""||address===""||position===""||salary===""||e_id===""){
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
                form.find("input[name='pos_id_change']").val(date['pos_id']);
                form.find("input[name='rct_id']").val(date['rct_id']);
                form.find("input[name='rct_is_draft']").val(date['rct_is_draft']);
                form.find("input[name='rct_salary']").val(date['rct_salary']);
                form.find("input[name='e_id']").val(date['e_id']);
            }
        });
    });

    //显示招聘信息模态框控制器
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
        var modal =$("#recruitChange-modal");
        var title = modal.find(".modal-body form input[name='rct_title']").val();
        var introduction = modal.find(".modal-body form textarea[name='rct_introduction']").val();
        var address = modal.find(".modal-body form input[name='rct_address']").val();
        var position = modal.find(".modal-body form input[name='pos_id']").val();
        var id = modal.find(".modal-body form input[name='rct_id']").val();
        var is_draft = modal.find(".modal-body form input[name='rct_is_draft']").val();
        var salary = modal.find(".modal-body form input[name='rct_salary']").val();
        var e_id = modal.find(".modal-body form input[name='e_id']").val();
        if(title===""||introduction===""||address===""||position===""||salary===""||e_id===""||id===""||is_draft===""){
            return;
        }
        modal.find(".modal-body form").submit();
    });

</script>

</body>
</html>
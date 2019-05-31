<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <script src="../js/jquery-3.1.0.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <style>
        #timeBtn{
            width: 100px;
            height: 100px;
            border-radius: 50px;
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
<br/>
<br/>
<br/>
<div class="container">
    <!--考勤打卡-->
    <button class="btn btn-default timeBtn" id="timeBtn"><p><strong>打卡</strong></p></button>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--个人信息-->
    <div class="panel panel-default">
        <div class="panel-heading">
            个人信息
        </div>
        <div class="panel-body">
            用户个人信息如下
            <div class="well well-lg col-lg-12">
                <div class="panel panel-primary col-lg-3">员工ID:${sessionScope.employee.e_id}</div>
                <div class="panel panel-default col-lg-3">员工姓名:${sessionScope.employee.e_name}</div>
                <div class="panel panel-default col-lg-3">家庭住址:${sessionScope.employee.e_address}</div>
                <div class="panel panel-default col-lg-3">电话号码:${sessionScope.employee.e_phone}</div>
                <div class="panel panel-default col-lg-3">信用卡:${sessionScope.employee.e_debit}</div>
                <div class="panel panel-default col-lg-3">工资:${sessionScope.employee.e_salary}</div>
                <div class="panel panel-default col-lg-3">入职时间:${sessionScope.employee.e_enroll_date}</div>
            </div>
        </div>
        <div class="panel-footer">
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--通讯录-->
    <div class="panel panel-default">
        <div class="panel-heading">
            通讯录
        </div>
        <div class="panel-body">
            通讯录信息如下
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
        <table class="table table-hover">
            <c:forEach items="${sessionScope.employees}" var="i">
                <tr>
                    <td id="e_id${i.e_id}">
                        <div class="well well-lg col-lg-12">
                            <div class="panel panel-primary col-lg-3">员工ID:${i.e_id}</div>
                            <div class="panel panel-default col-lg-3">员工姓名:${i.e_name}</div>
                            <div class="panel panel-default col-lg-3">家庭住址:${i.e_address}</div>
                            <div class="panel panel-default col-lg-3">电话号码:${i.e_phone}</div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="panel-footer">
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--薪资-->
    <div class="panel panel-default">
        <div class="panel-heading">
            薪资信息
        </div>
        <div class="panel-body">
            您上个月的薪资记录如下
            <div class="well well-lg col-lg-12">
                <div class="panel panel-primary col-lg-3">基本薪资:${sessionScope.employee.e_salary}</div>
                <div class="panel panel-default col-lg-3">绩效奖金:${sessionScope.salaryEmp.s_performance}</div>
                <div class="panel panel-default col-lg-3">加班费用/全勤奖:${sessionScope.salaryEmp.s_extra}</div>
                <div class="panel panel-default col-lg-3">奖惩记录:${sessionScope.salaryEmp.s_reward}</div>
                <div class="panel panel-default col-lg-3">社保:${sessionScope.salaryEmp.s_s_insurance}</div>
                <div class="panel panel-default col-lg-3">总额:${sessionScope.salaryEmp.s_total}</div>
            </div>
        </div>
        <div class="panel-footer">
            <c:choose>
                <c:when test="${sessionScope.salaryEmp.s_is_trouble eq 1}">
                    <a class="form-control btn btn-primary" href="troubleApply" style="display: none">复议申请</a>
                </c:when>
                <c:otherwise>
                    <a class="form-control btn btn-primary" href="troubleApply">复议申请</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--奖罚-->
    <div class="panel panel-default">
        <div class="panel-heading">
            奖罚记录信息
        </div>
        <div class="panel-body">
            以下是您上个月的奖罚记录信息
        </div>
        <table class="table table-hover">
            <c:forEach items="${sessionScope.rewards}" var="i">
                <tr>
                    <td>
                        <div class="panel panel-default col-lg-4">奖惩时间:${i.r_date}</div>
                        <div class="panel panel-default col-lg-4">奖惩原因:${i.r_reason}</div>
                        <div class="panel panel-danger col-lg-4">奖惩金额:${i.r_money}</div>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="panel-footer">
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--培训-->
    <div class="panel panel-default">
        <div class="panel-heading">
            培训信息
        </div>
        <div class="panel-body">
            最新培训信息如下
        </div>
        <table class="table table-hover">
            <c:forEach items="${sessionScope.trainingEmp}" var="i">
                <tr>
                    <td>培训标题：${i.t_title}</td>
                    <td>培训内容：${i.t_context}</td>
                    <td>培训开始时间：${i.t_start_time}</td>
                    <td>培训结束时间：${i.t_end_time}</td>
                    <td>培训地址：${i.t_address}</td>
                </tr>
            </c:forEach>
        </table>
        <div class="panel-footer">
        </div>
    </div>
</div>

<script>
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

    $("#timeBtn").on("click",function () {
        $.ajax({
            type:"get",
            url:"checkTime",
            success:function (data) {
                alert("打卡成功");
            }
        })
    })
</script>
</body>
</html>
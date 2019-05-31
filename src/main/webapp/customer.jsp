<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome, Dear customer</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <style>
        .genderBtn{
            width: 210px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">欢迎您,<small>${sessionScope.customer.c_account}</small></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul id = "navtab" class="nav navbar-nav navbar-right" role="tablist">
                <li><a href="/">注销</a></li>
            </ul>.
        </div>
    </div>
</nav>

<div class="container">
    <ul id="customerTab" class="nav nav-tabs">
        <li class="active"><a href="#cv" data-toggle="tab">想看个人简历，点我</a></li>
        <li><a href="#recruit" data-toggle="tab"> 这里是招聘信息</a></li>
        <li class="dropdown">
            <a href="#" id="customerTabDrop" class="dropdown-toggle" data-toggle="dropdown">我的面试<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#acceptCv" tabindex="-1" data-toggle="tab">我们正在努力审核的面试申请</a></li>
                <li><a href="#agreeCv" tabindex="-1" data-toggle="tab">我们诚邀您来进行面试</a></li>
            </ul>
        </li>
    </ul>
    <div id="tabContent" class="tab-content">
        <div class="tab-pane fade active" id="cv">
            <div class="panel panel-default">
                <div class="panel-heading">
                    简历信息
                </div>
                <div class="panel-body">
                    您的简历信息如下
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>ID</td>
                        <td>姓名</td>
                        <td>生日</td>
                        <td>地址</td>
                        <td>毕业院校</td>
                        <td>主要专业</td>
                        <td>主要经历</td>
                    </tr>
                    <c:forEach items="${sessionScope.cvs}" var="i">
                        <tr>
                            <td>${i.cv_id}</td>
                            <td>${i.cv_name}</td>
                            <td>${i.cv_birth}</td>
                            <td>${i.cv_address}</td>
                            <td>${i.cv_school}</td>
                            <td>${i.cv_major}</td>
                            <td>${i.cv_experience}</td>
                            <td>
                                <button class="changeCvBtn btn btn-primary" data-toggle="modal" data-target="#cvOld-modal" data-title="修改简历" data-cv_id="${i.cv_id}">修改简历</button>
                            </td>
                            <td>
                                <a class="deleteCvBtn btn btn-primary" href="delCv?cv_id=${i.cv_id}">删除简历</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#cvPage-modal" data-title="我的新简历">我需要新简历</button>
                </div>
            </div>
        </div>
        <div class="tab-pane fade active" id="recruit">
            <div class="panel panel-default">
                <div class="panel-heading">
                    招聘信息
                </div>
                <div class="panel-body">
                    下面看看我们公司的招聘信息吧
                </div>
                <table class="table table-hover">
                    <tr>
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
                                    <td>${i.rct_title}</td>
                                    <td>${i.rct_introduction}</td>
                                    <td>${i.rct_address}</td>
                                    <td>薪资：￥${i.rct_salary}/月</td>
                                    <td>${j.pos_name}</td>
                                    <td>
                                        <form id="changeForm" role="form" class="form" action="addFifs" method="get">
                                            <div class="form-group form-inline">
                                                <input id="changeCv_id" name="cv_id" class="form-control" type="text" maxlength="3" placeholder="请输入简历ID哦" required/>
                                                <input name="rct_id" type="hidden" value="${i.rct_id}"/>
                                                <input id="changCv" class="changeCvBtn btn btn-primary" type="submit" value="投递简历">
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    如果我们觉得您合适我们的岗位会给您发送面试申请哦，投递简历后记得查看
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="acceptCv">
            <div class="panel panel-default">
                <div class="panel-heading">
                    您的面试申请
                </div>
                <div class="panel-body">
                    下面是您的面试申请哦，请等待我们工作人员进行审核，谢谢您的耐心。
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>招聘主题</td>
                        <td>招聘信息</td>
                        <td>薪资</td>
                        <td>简历ID</td>
                    </tr>
                    <c:forEach items="${sessionScope.acceptF}" var="i">
                        <c:forEach items="${sessionScope.p_recruits}" var="j">
                            <c:if test="${i.rct_id eq j.rct_id}">
                                <tr>
                                    <td>${j.rct_title}</td>
                                    <td>${j.rct_introduction}</td>
                                    <td>薪资：￥${j.rct_salary}/月</td>
                                    <td>${i.cv_id}</td>
                                    <td>
                                        <a class="cancelCv btn btn-primary" href="delFifs?f_id=${i.f_id}">取消申请</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="agreeCv">
            <div class="panel panel-default">
                <div class="panel-heading">
                    您的面试申请
                </div>
                <div class="panel-body">
                    下面是您的面试申请哦，请尽快来面试哦。
                </div>
                <table class="table table-hover">
                    <tr>
                        <td>招聘主题</td>
                        <td>招聘信息</td>
                        <td>薪资</td>
                        <td>简历ID</td>
                        <td>面试时间</td>
                        <td>面试地址</td>
                    </tr>
                    <c:forEach items="${sessionScope.agreeF}" var="i">
                        <c:forEach items="${sessionScope.p_recruits}" var="j">
                            <c:if test="${i.rct_id eq j.rct_id}">
                                <tr>
                                    <td>${j.rct_title}</td>
                                    <td>${j.rct_introduction}</td>
                                    <td>薪资：￥${j.rct_salary}/月</td>
                                    <td>${i.cv_id}</td>
                                    <td>${i.f_date}</td>
                                    <td>${j.rct_address}</td>
                                    <td>
                                        <a class="agreeCv btn btn-primary" href="agreeFifs?f_id=${i.f_id}&agree=1">同意申请</a>
                                        <a class="cancelCv btn btn-primary" href="agreeFifs?f_id=${i.f_id}&agree=0">取消申请</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                </div>
            </div>
        </div>
    </div>
</div>
<!--模态框新简历-->
<div class="modal fade" id="cvPage-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="addCv" method="post">
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">姓名:</label>
                        <input class="form-control" type="text" name="cv_name" placeholder="name" required maxlength="20">
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1" data-toggle="buttons">
                        <label class="genderBtn btn btn-primary active">
                            <input class="form-control" type="radio" name="cv_gender" autocomplete="off" checked value="男"/>男
                        </label>
                        <label class="genderBtn btn btn-primary">
                            <input class="form-control" type="radio" name="cv_gender" autocomplete="off" value="女"/>女
                        </label>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">生日:</label>
                        <input class="form-control" name="cv_birth" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="cv_address" type="text" placeholder="不超过40个字" maxlength="80" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">文化程度:</label>
                        <input class="form-control" name="cv_education" type="text" placeholder="education" maxlength="8" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业院校:</label>
                        <input class="form-control" name="cv_school" type="text" placeholder="school" maxlength="20" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主学专业:</label>
                        <input class="form-control" name="cv_major" type="text" placeholder="major" maxlength="15" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">入学时间:</label>
                        <input class="form-control" name="cv_enroll_date" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业时间:</label>
                        <input class="form-control" name="cv_graduation_date" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">期望薪资:</label>
                        <input class="form-control" name="cv_salary" type="text" required maxlength="10"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要经历</label>
                        <textarea class="form-control" name="cv_experience" required maxlength="250"></textarea>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="submit" class="btn btn-info btn-group-lg btn-group-justified" value="我填好了"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--模态框修改简历-->
<div class="modal fade" id="cvOld-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form role="form" class="form" action="updateCv" method="post">
                    <input type="hidden" name="cv_id">
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">姓名:</label>
                        <input class="form-control" type="text" name="cv_name" placeholder="name" required>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1" data-toggle="buttons">
                        <label class="genderBtn btn btn-primary active">
                            <input class="form-control" type="radio" name="cv_gender" autocomplete="off" value="男" checked/>男
                        </label>
                        <label class="genderBtn btn btn-primary">
                            <input class="form-control" type="radio" name="cv_gender" autocomplete="off" value="女"/>女
                        </label>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">生日:</label>
                        <input class="form-control" name="cv_birth" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">地址:</label>
                        <input class="form-control" name="cv_address" type="text" placeholder="不超过80个字" maxlength="80" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">文化程度:</label>
                        <input class="form-control" name="cv_education" type="text" placeholder="education" maxlength="8" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业院校:</label>
                        <input class="form-control" name="cv_school" type="text" placeholder="school" maxlength="20" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主学专业:</label>
                        <input class="form-control" name="cv_major" type="text" placeholder="major" maxlength="15" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">入学时间:</label>
                        <input class="form-control" name="cv_enroll_date" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">毕业时间:</label>
                        <input class="form-control" name="cv_graduation_date" type="date" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">期望薪资:</label>
                        <input class="form-control" name="cv_salary" type="text" maxlength="10"/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要经历</label>
                        <textarea class="form-control" name="cv_experience" required maxlength="250"></textarea>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" class="cv-change btn btn-info btn-group-lg btn-group-justified" value="我要修改">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#cvPage-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        modal.find(".modal-title").text(title);
    });

    //简历新增按钮设定
    $("#submit").click(function () {
        var modal =$("#cvPage-modal");
        var name = modal.find(".modal-body form input[name='cv_name']").val();
        var birth = modal.find(".modal-body form input[name='cv_birth']").val();
        var address = modal.find(".modal-body form input[name='cv_address']").val();
        var school = modal.find(".modal-body form input[name='cv_school']").val();
        var education = modal.find(".modal-body form input[name='cv_education']").val();
        var major = modal.find(".modal-body form input[name='cv_major']").val();
        var enroll_date = modal.find(".modal-body form input[name='cv_enroll_date']").val();
        var graduation_date = modal.find(".modal-body form input[name='cv_graduation_date']").val();
        var salary = modal.find(".modal-body form input[name='cv_salary']").val();
        var experience = modal.find(".modal-body form input[name='cv_experience']").val();
        var reg =/\d/;
        if(name===""||birth===""||address===""||school===""||education===""||major===""||enroll_date===""||graduation_date===""||salary===""||experience===""||!reg.test(salary)){
            return;
        }
        modal.find(".modal-body form").submit();
    });

    $("#cvOld-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var title = a.data("title");
        var modal = $(this);
        var form = modal.find(".modal-body form");
        modal.find(".modal-title").text(title);
        $.ajax({
            type:"get",
            url:"getCv",
            data:"cv_id="+a.data("cv_id"),
            success:function (date) {
                form.find("input[name='cv_id']").val(date['cv_id']);
                form.find("input[name='cv_name']").val(date['cv_name']);
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

        //建立修改按钮设定
        $(".cv-change").click(function () {
            var modal =$("#cvOld-modal");
            var id = modal.find(".modal-body form input[name='cv_id']").val();
            var name = modal.find(".modal-body form input[name='cv_name']").val();
            var birth = modal.find(".modal-body form input[name='cv_birth']").val();
            var address = modal.find(".modal-body form input[name='cv_address']").val();
            var school = modal.find(".modal-body form input[name='cv_school']").val();
            var education = modal.find(".modal-body form input[name='cv_education']").val();
            var major = modal.find(".modal-body form input[name='cv_major']").val();
            var enroll_date = modal.find(".modal-body form input[name='cv_enroll_date']").val();
            var graduation_date = modal.find(".modal-body form input[name='cv_graduation_date']").val();
            var salary = modal.find(".modal-body form input[name='cv_salary']").val();
            var experience = modal.find(".modal-body form input[name='cv_experience']").val();
            var reg =/\d/;
            if(id===""||name===""||birth===""||address===""||school===""||education===""||major===""||enroll_date===""||graduation_date===""||salary===""||experience===""||!reg.test(salary)){
                return;
            }
            modal.find(".modal-body form").submit();
        });
    })
</script>
<script>
    $("#changCv").on("click",function () {
        var reg = /\d/;
        var id = $("#changeCv_id").val();
        if(!reg.test(id)){
            $("#changeForm").attr("onsubmit","return false");
        }
        $("#changeForm").attr("onsubmit","return ture");
    })
</script>
</body>
</html>
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
        <div class="tab-pane fade active" id="recruitUp"></div>
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
                            <tr>
                                <td>${i.rct_title}</td>
                                <td>${i.rct_introduction}</td>
                                <td>${i.rct_address}</td>
                                <td>薪资：￥${i.rct_salary}/月</td>
                                <td>${j.pos_name}</td>
                                <td>
                                    <button class="changeCvBtn btn btn-primary" data-toggle="modal" data-target="#recruitChange-modal" data-title="修改草稿" data-rct_id="${i.rct_id}">修改简历</button>
                                </td>
                                <td>
                                    <a class="deleteCvBtn btn btn-primary" href="delCv?rct_id=${i.rct_id}">发布招聘</a>
                                </td>
                                <td>
                                    <a class="deleteCvBtn btn btn-primary" href="delCv?rct_id=${i.rct_id}">删除草稿</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </table>
                <div class="panel-footer">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#recruitPage-modal" data-title="招聘草稿">编写草稿</button>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="depAndPos">

        </div>
        <div class="tab-pane fade" id="employeeState"></div>
        <div class="tab-pane fade" id="employeeSalary"></div>
        <div class="tab-pane fade" id="employeeReward"></div>
        <div class="tab-pane fade" id="employeeAttendance"></div>
        <div class="tab-pane fade" id="fifsCv"></div>
        <div class="tab-pane fade" id="fifsEnroll"></div>
        <div class="tab-pane fade" id="trainingWillDo"></div>
        <div class="tab-pane fade" id="trainingDoing"></div>
        <div class="tab-pane fade" id="trainingDone"></div>
    </div>
</div>
<!--招聘模态框-->
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
                        <input class="form-control" type="text" name="cv_name" placeholder="name" required>
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
                        <input class="form-control" name="cv_salary" type="number" required/>
                    </div>
                    <div class="form-group col-lg-10 col-lg-offset-1">
                        <label class="control-label">主要经历</label>
                        <textarea class="form-control" name="cv_experience" required></textarea>
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

</body>
</html>
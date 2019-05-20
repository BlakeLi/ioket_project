<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>This is our main page</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <style>
        .jumbotron{
            background: url("image/mainpage.jpg") no-repeat fixed top;
            background-size: 100% 100%;
            opacity:0.7;
        }
        .jumbotron .container{
            color: white;
        }
    </style>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">小李的公司</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul id = "navtab" class="nav navbar-nav navbar-right" role="tablist">
                <li><a>公司简介</a></li>
                <li><a data-toggle="modal" data-target="#mainPage-modal" data-url="registerCustomer" data-title="游客注册">游客注册</a></li>
                <li><a data-toggle="modal" data-target="#mainPage-modal" data-url="loginCustomer" data-title="游客登陆">游客登陆</a></li>
                <li><a data-toggle="modal" data-target="#mainPage-modal" data-url="Cregister" data-title="员工登陆">员工登陆</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--主题巨幕-->
<div class="jumbotron">
    <div class="container">
        <h1>你好，世界</h1>
        <p>欢迎来到小李的公司，我们诚挚的邀请您加入我们的团队</p>
        <p>这是第二段语句这是第二段语句这是第二段语句这是第二段语句这是第二段语句</p>
        <p>这是第三段语句这是第三段语句</p>
        <p>这是第三段语句这是第三段语句这是第三段语句</p>
        <p>这是第三段语句这是第三段语句这是第三段语句</p>
    </div>
</div>

<!--主题内容-->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            招聘信息
        </div>
        <div class="panel-body">
            最新招聘信息如下
        </div>
        <table class="table table-hover">
            <c:forEach items="${sessionScope.p_recruits}" var="i">
            <tr>
                <td>${i.rct_title}</td>
                <td></td>
                <td>薪资：￥${i.rct_salary}/月</td>
            </tr>
            </c:forEach>
        </table>
        <div class="panel-footer">
            <button class="btn btn-default">加入我们</button>
        </div>
    </div>
</div>

<!--模态框-->
<div class="modal fade" id="mainPage-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden = "true">&times</span>
                </button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="form-group">
                        <label class="control-label">
                            账号
                            <span class="glyphicon" aria-hidden="true"></span>
                        </label>

                        <input type="text" name="name" class="form-control" placeholder="username" maxlength="8" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">
                            密码
                            <span class="glyphicon" aria-hidden="true"></span>
                        </label>
                        <input type="password" name="pass" class="form-control" placeholder="password" maxlength="12" required/>
                    </div>
                    <div class="form-group" id="pass2">
                        <label class="control-label">
                            重复密码
                            <span class="glyphicon" aria-hidden="true"></span>
                        </label>
                        <input type="password" name="pass2_input" class="form-control" placeholder="password" maxlength="12" required/>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="form group">
                        <input type="submit" id="submit" class="btn btn-info btn-group-lg btn-group-justified" value="确认"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // 模态框显示
    $("#mainPage-modal").on("show.bs.modal",function (e) {
        var a = $(e.relatedTarget);
        var url = a.data("url");
        var title = a.data("title");
        var modal = $(this);

        if(url !== "registerCustomer"){
            $("#pass2").css("display","none");
        }else{
            $("#pass2").css("display","block");
        }

        modal.find(".modal-title").text(title);
        modal.find(".modal-body form").attr("action",url);
    });

    $("#navtab a").hover(function (e){
        e.preventDefault();
        $(this).tab("show");
    });

    $("input[name='name']").on("keyup",function () {
        var reg_name = /^[A-Za-z]/;
        var input_name = $(this);
        if(reg_name.test(input_name.val())){
            input_name.prev().children("span").removeClass("glyphicon-remove");
            input_name.prev().children("span").addClass("glyphicon-ok");
        }else{
            input_name.prev().children("span").removeClass("glyphicon-ok");
            input_name.prev().children("span").addClass("glyphicon-remove");
        }
    });

    $("input[name='pass2_input']").on("keyup",function () {
        var input_pass = $("input[name='pass']");
        var input_pass2 = $(this);
        if(input_pass.val()===input_pass2.val()){
            input_pass2.prev().children("span").removeClass("glyphicon-remove");
            input_pass2.prev().children("span").addClass("glyphicon-ok");
        }else{
            input_pass2.prev().children("span").removeClass("glyphicon-ok");
            input_pass2.prev().children("span").addClass("glyphicon-remove");
        }
    });

    $("#submit").click(function () {
        var reg_name = /^[A-Za-z]/;
        var modal =$("#mainPage-modal");
        var input_name = $("input[name='name']");
        var input_pass = $("input[name='pass']");
        var input_pass2= $("input[name='pass2_input']");
        if(reg_name.test(input_name.val())&&input_pass.val()===input_pass2.val()){
            modal.find(".modal-body form").submit();
        }
    })
</script>
</body>
</html>
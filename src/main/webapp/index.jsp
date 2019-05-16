<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>This is my Spring JSP</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script>
        $(document).ready(function () {
            $(".changeCv").click(function (){
                var button = $(this);
                var form = button.parent();
                form.children("input").removeAttr("disabled");
                form.children("textarea").removeAttr("disabled");
                form.children("input.updateCv").removeAttr("hidden");
                form.children("input.changeCv").attr("hidden","hidden");
            })
        })
    </script>
</head>
<body>
<fieldset>
    <legend>register</legend>
    <form action="registerCustomer" method="post">
        account:<input name="name"/>
        password:<input type="password" name="pass"/>
        <input type="submit"/>
    </form>
</fieldset>

<fieldset>
    <legend>login</legend>
    <form action="loginCustomer" method="post">
        account:<input name="name"/>
        password:<input type="password" name="pass"/>
        <input type="submit"/>
    </form>
</fieldset>

<div>
    <form action="recruitPublished" method="post">
        <input type="submit"/>
    </form>
    <c:forEach items="${sessionScope.p_recruits}" var="i">
        ${i.rct_title}
    </c:forEach>
</div>
<fieldset>
    <legend>Cv add process</legend>
    <form action="addCv" method="post"><br/>
        <input type="hidden" name="c_id" value="1">
        姓名：<input name="cv_name"/><br/>
        性别：<input type="radio" name="cv_gender" value="男"/>男<input type="radio" name="cv_gender" value="女"/>女<br/>
        生日：<input name="cv_birth" type="date"/><br/>
        地址：<input name="cv_address"/><br/>
        毕业院校：<input name="cv_school"/><br/>
        文化程度：<input name="cv_education"/><br/>
        专业：<input name="cv_major"/><br/>
        入学时间：<input name="cv_enroll_date" type="date"/><br/>
        毕业时间：<input name="cv_graduation_date" type="date"/><br/>
        目标薪资：<input name="cv_salary" type="number"/><br/>
        经历：<textarea name="cv_experience"></textarea><br/>
        <input type="submit"/>
    </form>
</fieldset>
<div>
    <form action="getCvs" method="post">
        <input type="submit" value="获取简历"/>
    </form>
    <c:forEach items="${sessionScope.cvs}" var="i">
        <form method="post" action="updateCv">
            <input type="hidden" name="c_id" value="${i.c_id}">
            <input type="hidden" name="cv_id" value="${i.cv_id}">
            姓名：<input name="cv_name" value="${i.cv_name}" disabled/><br/>
            性别：<input name="cv_gender" value="${i.cv_gender}" disabled/>
            生日：<input name="cv_birth" type="date" value="${i.cv_birth}" disabled/><br/>
            地址：<input name="cv_address" value="${i.cv_birth}" disabled/><br/>
            毕业院校：<input name="cv_school" value="${i.cv_school}" disabled/><br/>
            文化程度：<input name="cv_education" value="${i.cv_education}" disabled/><br/>
            专业：<input name="cv_major" value="${i.cv_major}" disabled/><br/>
            入学时间：<input name="cv_enroll_date" type="date" value="${i.cv_enroll_date}" disabled/><br/>
            毕业时间：<input name="cv_graduation_date" type="date" value="${i.cv_graduation_date}" disabled/><br/>
            目标薪资：<input name="cv_salary" type="number" value="${i.cv_salary}" disabled/><br/>
            经历：<textarea name="cv_experience" disabled>${i.cv_experience}</textarea><br/>
            <input type="button" class="changeCv" value="修改"/>
            <input type="submit" class="updateCv" value="确认" hidden/>
        </form>
        <br/><br/>
    </c:forEach>
</div>

<div>
    <form action="addFifs" method="post">
        <input type="hidden" name="rct_id" value="1"/>
        <input type="hidden" name="cv_id" value="1"/>
        <input type="submit" value="投递简历"/>
    </form>
</div>
</body>
</html>

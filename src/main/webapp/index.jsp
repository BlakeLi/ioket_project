<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>This is my Spring JSP</title>
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
</body>
</html>

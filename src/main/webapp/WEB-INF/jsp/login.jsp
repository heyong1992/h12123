<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>罗一下评论分析</title>
</head>

<body>
错误信息：<h4>${msg}</h4>
<form action="/login" method="post">
    <p>账号：<input type="text" name="username" value="hey"/></p>
    <p>密码：<input type="text" name="password" value="123456"/></p>
    <p><input type="submit" value="登录"/></p>
</form>

</body>
</html>
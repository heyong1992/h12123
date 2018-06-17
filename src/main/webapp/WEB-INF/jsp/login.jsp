<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>搬砖平台登录</title>


</head>
<style>

    div{
        width:200px;/*定宽*/
        margin:20px auto;/* margin-left 与 margin-right 设置为 auto */
        padding-top: 200px;
    }

    .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        display: inline-block;
        font-size: 16px;
    }

    .button:hover {
        background-color: #3e8e41;
    }
</style>

<body bgcolor="#f0f8ff">
<div>
    <form action="/login" method="post">
        <h3>问道搬砖辅助平台</h3>
        账号：<input type="text" name="username" value="hey"/></p>
        密码：<input type="text" name="password" value="123456"/></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" value="登录"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" class="button" onclick="window.location.href='/userInfo/detail'" value="注册"/>
        ${msg}---


    </form>

</div>



</body>

</html>
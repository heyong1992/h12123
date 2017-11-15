<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<%--<%
String contextPath = request.getContextPath();
request.setAttribute("contextPath", contextPath);
%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>UserInfo</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<form action="/userInfo/list" method="post" class="form-horizontal">
<table border="0">
    <tr>

                <td >姓名:<input placeholder="姓名" name="name" value="${queryObj.name}" class="form-control" type="text"></td>

                <td >密码:<input placeholder="密码" name="password" value="${queryObj.password}" class="form-control" type="text"></td>

                <td >密码盐:<input placeholder="密码盐" name="salt" value="${queryObj.salt}" class="form-control" type="text"></td>

                <td >状态:<input placeholder="状态" name="state" value="${queryObj.state}" class="form-control" type="text"></td>

                <td >用户名:<input placeholder="用户名" name="username" value="${queryObj.username}" class="form-control" type="text"></td>

                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/userInfo/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
                <th>创建时间</th>
                <th>姓名</th>
                <th>密码</th>
                <th>密码盐</th>
                <th>状态</th>
                <th>用户名</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td><input value="${p.id}" type="checkbox"></td>
                    <td>${p.id}</td>
                     <td>${p.createDate}</td>
                     <td>${p.name}</td>
                     <td>${p.password}</td>
                     <td>${p.salt}</td>
                     <td>${p.state}</td>
                     <td>${p.username}</td>
                     <td class="text-navy">
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/userInfo/detail?id=${p.id}'">查看</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/userInfo/detail?id=${p.id}'">更新</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/userInfo/delete?id=${p.id}'">删除</button>
                            <button type="button" class="btn btn-primary"  onclick="fenpei(${p.id})">分配</button>
                      </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</div>
</body>

<script type="text/javascript">

    function fenpei(id) {
        //iframe层
        parent.layer.open({
            type: 2,
            title: '用户角色分配',
            shadeClose: true,
            shade: false,
            area: ['1150px', '650px'],
            content: '/userInfo/toSysRole?userId='+id //iframe的url
            ,btn: ['关闭']
            ,btn1: function(index, layero){
                //按钮【按钮一】的回调
            }
        });
    }
</script>
</html>
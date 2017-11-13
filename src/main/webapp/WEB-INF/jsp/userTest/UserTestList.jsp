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
    <title>UserTest</title>
</head>
<body>
<p>
<p>
<table border="0">
    <tr>
            //名称
        <td ><input placeholder="名称" class="form-control" type="text"></td>
            //描述
        <td ><input placeholder="描述" class="form-control" type="text"></td>
    </tr>
</table>
<button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th>名称</th>
                <th>描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <% for(p in list){ %>
                <tr>
                    name <td>${p.name}</td>
                    desc <td>${p.desc}</td>
                     <td class="text-navy">
                            <button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail?id=${p.id}'">查看</button>
                            <button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail?id=${p.id}'">更新</button>
                            <button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/delete?id=${p.id}'">删除</button>
                      </td>
                </tr>
            <% } %>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
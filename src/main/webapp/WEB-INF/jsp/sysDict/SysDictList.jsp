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
    <title>SysDict</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<form action="/sysDict/list" method="post" class="form-horizontal">
<table border="0">
    <tr>
                <td >名称:<input placeholder="名称" name="name" value="${queryObj.name}" class="form-control" type="text"></td>

                <td >类型编号:<input placeholder="类型编号" name="typeNum" value="${queryObj.typeNum}" class="form-control" type="text"></td>


                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/sysDict/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
                <th>名称</th>
                <th>类型编号</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td><input value="${p.id}" type="checkbox"></td>
                    <td>${p.id}</td>
                     <td>${p.name}</td>
                     <td>${p.typeNum}</td>
                     <td>${p.createDate}</td>
                     <td class="text-navy">
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/sysDict/detail?id=${p.id}'">查看</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/sysDict/detail?id=${p.id}'">更新</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/sysDict/delete?id=${p.id}'">删除</button>
                      </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</div>
</body>
</html>
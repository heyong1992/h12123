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
    <title>HeyContent</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<form action="/heyContent/list" method="post" class="form-horizontal">
<table border="0">
    <tr>
                <td >标题:<input placeholder="标题" name="title" value="${queryObj.title}" class="form-control" type="text"></td>

                <td >类型id:<input placeholder="类型id" name="dictId" value="${queryObj.dictId}" class="form-control" type="text"></td>


                <td >发布人:<input placeholder="发布人" name="userId" value="${queryObj.userId}" class="form-control" type="text"></td>

                <td >:<input placeholder="" name="content" value="${queryObj.content}" class="form-control" type="text"></td>

                <td >文章标签:<input placeholder="文章标签" name="tag" value="${queryObj.tag}" class="form-control" type="text"></td>

                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/heyContent/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
                <th>标题</th>
                <th>类型id</th>
                <th>创建时间</th>
                <th>发布人</th>
                <th></th>
                <th>文章标签</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td><input value="${p.id}" type="checkbox"></td>
                    <td>${p.id}</td>
                     <td>${p.title}</td>
                     <td>${p.dictId}</td>
                     <td>${p.createDate}</td>
                     <td>${p.userId}</td>
                     <td>${p.content}</td>
                     <td>${p.tag}</td>
                     <td class="text-navy">
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyContent/detail?id=${p.id}'">查看</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyContent/detail?id=${p.id}'">更新</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyContent/delete?id=${p.id}'">删除</button>
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
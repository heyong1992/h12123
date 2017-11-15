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
    <title>${className?cap_first}</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<form action="/${className}/list" method="post" class="form-horizontal">
<table border="0">
    <tr>
        <#list columnList as pl>
            <#if pl.column_type == "Timestamp">
                <#--<td >${pl.column_desc}:<input class="form-control layer-date" name="${pl.column_name}" value="${r"$"}{queryObj.${pl.column_name}}" placeholder="YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></td>-->
            <#elseif pl.column_type == "int">

            <#else>
                <td >${pl.column_desc}:<input placeholder="${pl.column_desc}" name="${pl.column_name}" value="${r"$"}{queryObj.${pl.column_name}}" class="form-control" type="text"></td>
            </#if>

        </#list>
                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/${className}/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
            <#list columnList as pl>
                <th>${pl.column_desc}</th>
            </#list>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${r"$"}{list}" var="p">
                <tr>
                    <td><input value="${r"$"}{p.id}" type="checkbox"></td>
                    <td>${r"$"}{p.id}</td>
                    <#list columnList as pl>
                     <td>${r"$"}{p.${pl.column_name}}</td>
                    </#list>
                     <td class="text-navy">
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/${className}/detail?id=${r"$"}{p.id}'">查看</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/${className}/detail?id=${r"$"}{p.id}'">更新</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/${className}/delete?id=${r"$"}{p.id}'">删除</button>
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
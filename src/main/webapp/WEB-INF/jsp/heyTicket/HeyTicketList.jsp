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
    <title>HeyTicket</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
<form action="/heyTicket/list" method="post" class="form-horizontal">
<table border="0">
    <tr>
                <td >身份证号:<input placeholder="身份证号" name="cardInfos" value="${queryObj.cardInfos}" class="form-control" type="text"></td>

                <td >目的地:<input placeholder="目的地" name="endAddress" value="${queryObj.endAddress}" class="form-control" type="text"></td>

                <td >出发时间:<input placeholder="出发时间" name="goDate" value="${queryObj.goDate}" class="form-control" type="text"></td>

                <td >QQ号码:<input placeholder="QQ号码" name="qqNumber" value="${queryObj.qqNumber}" class="form-control" type="text"></td>

                <td >出发地:<input placeholder="出发地" name="startAddress" value="${queryObj.startAddress}" class="form-control" type="text"></td>

                <td >联系电话:<input placeholder="联系电话" name="telPhone" value="${queryObj.telPhone}" class="form-control" type="text"></td>

                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/heyTicket/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
                <th>身份证号</th>
                <th>目的地</th>
                <th>出发时间</th>
                <th>QQ号码</th>
                <th>出发地</th>
                <th>联系电话</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td><input value="${p.id}" type="checkbox"></td>
                    <td>${p.id}</td>
                     <td>${p.cardInfos}</td>
                     <td>${p.endAddress}</td>
                     <td>${p.goDate}</td>
                     <td>${p.qqNumber}</td>
                     <td>${p.startAddress}</td>
                     <td>${p.telPhone}</td>
                     <td class="text-navy">
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyTicket/detail?id=${p.id}'">查看</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyTicket/detail?id=${p.id}'">更新</button>
                            <button type="button" class="btn btn-primary"  onclick="window.location.href='/heyTicket/delete?id=${p.id}'">删除</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp" %>
<%--<%
    String contextPath = request.getContextPath();
    request.setAttribute("contextPath", contextPath);
%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>SysPermission</title>
</head>
<body>
<p>
<p>
<form action="/sysPermission/list" method="post" class="form-horizontal">
<table border="0">
    <tr>
        <td><input placeholder="菜单名称" value="${queryObj.name}" name="name" class="form-control" type="text"></td>
        <td><input placeholder="资源类型" value="${queryObj.resourceType}" name="resourceType" class="form-control" type="text"></td>
        <td><input placeholder="url" value="${queryObj.url}" name="url" class="form-control"  type="text"></td>
        <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>

<button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail'">新增</button>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>菜单名称</th>
                <th>资源类型</th>
                <th>url</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${menuList}" var="m">
            <tr>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.resourceType}</td>
                <td>${m.url}</td>
                <td class="text-navy">
                    <button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail?id=${m.id}'">查看</button>
                    <button type="button" class="btn btn-w-m btn-info"  onclick="window.location.href='/sysPermission/detail?id=${m.id}'">更新</button>
                    <button type="button" class="btn btn-w-m btn-info"  onclick="del(${m.id})">删除</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script type="text/javascript">
    function del(permissionId){
        var url="/sysPermission/delete";
        $.ajax({
            url: url,
            type: 'post',
            data:{"id":permissionId},
            dataType: 'text',
            timeout: 1000,
            success: function (data, status) {
                if(data=="false"){
                    alert("该权限已分配角色,无法删除");
                }else{
                    window.location.href="/sysPermission/list";
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown+"==="+textStatus+"==="+jqXHR.responseText);
                console.log(err)
            }
        })
    }
</script>
</html>
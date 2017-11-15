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
<form action="/sysRole/toSysPermission" method="post" class="form-horizontal">
<table border="0">
    <tr>
        <td><input placeholder="菜单名称" value="${queryObj.name}" name="name" class="form-control" type="text"></td>
        <td><input placeholder="资源类型" value="${queryObj.resourceType}" name="resourceType" class="form-control" type="text"></td>
        <td><input placeholder="url" value="${queryObj.url}" name="url" class="form-control"  type="text"></td>
        <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
    </tr>
</table>
</form>
<p>
<p>
<div class="ibox float-e-margins">
    <div class="ibox-content">

        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>序号</th>
                <th>菜单名称</th>
                <th>资源类型</th>
                <th>url</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${menuList}" var="m">
            <tr>
                <td><input type="checkbox" ${m.isCheck} name="check" value="${m.id}" onclick="assignAuth(this)"></td>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.resourceType}</td>
                <td>${m.url}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script type="text/javascript">
    function assignAuth(v) {
        var url="";
        if(v.checked==true){
            url="/sysRole/assignAuth";
        }else{
            url="/sysRole/cancleAuth";
        }
        var roleId="${sysPermission.id}";
        $.ajax({
            url: url,
            type: 'post',
            data:{"roleId":roleId,"permissionId":$(v).val()},
            dataType: 'text',
            timeout: 1000,
            success: function (data, status) {
                alert("11122");
            },
            fail: function (err, status) {
                alert(data+"===");
                console.log(err)
            }
        })
    }
</script>
</html>
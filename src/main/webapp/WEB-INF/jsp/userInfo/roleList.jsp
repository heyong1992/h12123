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
    <title>SysRole</title>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <form action="/sysRole/list" method="post" class="form-horizontal">
        <table border="0">
            <tr>

                <td >是否有效:<input placeholder="是否有效" name="available" value="${queryObj.available}" class="form-control" type="text"></td>

                <td >描述:<input placeholder="描述" name="description" value="${queryObj.description}" class="form-control" type="text"></td>

                <td >角色:<input placeholder="角色" name="role" value="${queryObj.role}" class="form-control" type="text"></td>

                <td ><button type="submit" class="btn btn-primary">  查  询  </button></td>
            </tr>
        </table>
    </form>
    <button type="button" class="btn btn-primary"  onclick="window.location.href='/sysRole/detail'">新增</button>
    <p>
    <p>
    <div class="ibox float-e-margins">
        <div class="ibox-content">

            <table class="table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>序号</th>
                    <th>是否有效</th>
                    <th>描述</th>
                    <th>角色</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${roleList}" var="p">
                    <tr>
                        <td><input type="checkbox" ${p.isCheck} value="${p.id}" onclick="assignAuth(this)"></td>
                        <td>${p.id}</td>
                        <td>${p.available}</td>

                        <td>${p.description}</td>
                        <td>${p.role}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    function assignAuth(v) {
        var url="";
        if(v.checked==true){
            url="/userInfo/assignAuth";
        }else{
            url="/userInfo/cancleAuth";
        }
        var userId="${userId}";
        $.ajax({
            url: url,
            type: 'post',
            data:{"userId":userId,"roleId":$(v).val()},
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
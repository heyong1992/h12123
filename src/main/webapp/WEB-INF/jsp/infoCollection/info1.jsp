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
    <div class="col-sm-10">
        <input class="form-control" type="text">
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>文件上传
                <small>https://github.com/episage/bootstrap-3-pretty-file-upload</small>
            </h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_advanced.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li>
                        <a href="form_advanced.html#">选项1</a>
                    </li>
                    <li>
                        <a href="form_advanced.html#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <div id="file-pretty">
                <div class="form-group">
                    <label class="font-noraml">文件选择（单选）</label>
                    <div><input class="form-control" style="display: none;" type="file">				<div class="input-append input-group" "="">					<span class="input-group-btn">						<button class="btn btn-white" type="button">选择文件</button>					</span>					<input class="input-large form-control" type="text">				</div>				</div>
            </div>
            <div class="form-group">
                <label class="font-noraml">文件选择（多选）</label>
                <div><input multiple="multiple" class="form-control" style="display: none;" type="file">				<div class="input-append input-group" "="">					<span class="input-group-btn">						<button class="btn btn-white" type="button">选择文件</button>					</span>					<input class="input-large form-control" type="text">				</div>				</div>
        </div>
    </div>

</form>
<button type="button" class="btn btn-primary"  onclick="window.location.href='/userInfo/detail'">新增</button>
<p>

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
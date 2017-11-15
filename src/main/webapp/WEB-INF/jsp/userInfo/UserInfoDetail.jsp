<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>UserInfo</title>
</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
        </div>
        <div class="ibox-content">
            <form action="/userInfo/add" method="post" class="form-horizontal">

                <input type="hidden" name="id" value="${obj.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="name" value="${obj.name}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="password" value="${obj.password}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="username" value="${obj.username}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>


                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <button class="btn btn-primary" type="submit">保存内容</button>
                        <button class="btn btn-white" type="submit">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
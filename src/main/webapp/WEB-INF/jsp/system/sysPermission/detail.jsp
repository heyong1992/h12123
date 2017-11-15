<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<html>
<head>

</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
        </div>
        <div class="ibox-content">
            <form action="/sysPermission/add" method="post" class="form-horizontal">

                <div class="form-group">
                    <label class="col-sm-2 control-label">菜单名称</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="name" value="${sysPermission.name}">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">上级菜单</label>

                    <div class="col-sm-10">
                        <formTags:select isHead="true" name="parentId" size="1" optionsList="${menuList}" class="form-control m-b"/>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">权限url</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="permission" value="${sysPermission.permission}">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">资源类型</label>

                    <div class="col-sm-10">
                        <select class="form-control m-b" name="resourceType">
                            <option value="menu">menu</option>
                        </select>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">url</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="url" value="${sysPermission.url}">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <%--<div class="form-group">
                    <label class="col-sm-2 control-label">列尺寸</label>

                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-md-2">
                                <input type="text" placeholder=".col-md-2" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <input type="text" placeholder=".col-md-3" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <input type="text" placeholder=".col-md-4" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>--%>
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
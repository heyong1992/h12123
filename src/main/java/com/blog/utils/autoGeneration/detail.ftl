<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${className?cap_first}</title>
</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
        </div>
        <div class="ibox-content">
            <form action="/${className}/add" method="post" class="form-horizontal">

                <input type="hidden" name="id" value="${r"$"}{obj.id}">
                <#list columnList as pl>
                <div class="form-group">
                    <label class="col-sm-2 control-label">${pl.column_desc}</label>
                    <div class="col-sm-10">
                        <#if pl.column_type == "Timestamp">
                            ${pl.column_desc}<input class="form-control layer-date" name="${pl.column_name}"  value="${r"$"}{obj.${pl.column_name}}" placeholder="YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                        <#elseif pl.column_type == "int">

                        <#else>
                            <input class="form-control" type="text" name="${pl.column_name}" value="${r"$"}{obj.${pl.column_name}}">
                        </#if>

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                </#list>


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
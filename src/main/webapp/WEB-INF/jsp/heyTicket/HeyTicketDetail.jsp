<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>HeyTicket</title>
</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
        </div>
        <div class="ibox-content">
            <form action="/heyTicket/add" method="post" class="form-horizontal">

                <input type="hidden" name="id" value="${obj.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="cardInfos" value="${obj.cardInfos}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">目的地</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="endAddress" value="${obj.endAddress}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">出发时间</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="goDate" value="${obj.goDate}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">QQ号码</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="qqNumber" value="${obj.qqNumber}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">出发地</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="startAddress" value="${obj.startAddress}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">联系电话</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="telPhone" value="${obj.telPhone}">

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
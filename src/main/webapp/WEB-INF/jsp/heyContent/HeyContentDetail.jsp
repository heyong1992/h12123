<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/head.jsp"%>
<%@ taglib prefix="formTags" uri="/WEB-INF/tag/select.tld" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>HeyContent</title>
</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
        </div>
        <div class="ibox-content">
            <form action="/heyContent/add" method="post" class="form-horizontal">

                <input type="hidden" name="id" value="${obj.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="title" value="${obj.title}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">类型id</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="dictId" value="${obj.dictId}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">创建时间</label>
                    <div class="col-sm-10">
                            <input class="form-control layer-date" name="createDate"  value="${obj.createDate}" placeholder="YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">发布人</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="userId" value="${obj.userId}">

                    </div>
                </div>
                <div class="hr-line-dashed"></div>

                <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label"></label>--%>
                    <%--<div class="col-sm-10">--%>
                        <%--<input class="form-control" type="text" name="content" value="${obj.content}">--%>

                    <%--</div>--%>
                <%--</div>--%>
                <!-- 加载编辑器的容器 -->
                <script id="container" name="content" type="text/plain">
${obj.content}
                </script>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">文章标签</label>
                    <div class="col-sm-10">
                            <input class="form-control" type="text" name="tag" value="${obj.tag}">

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


<!-- 配置文件 -->
<script type="text/javascript" src="${ctx }/utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${ctx }/utf8-jsp/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>
</body>
</html>
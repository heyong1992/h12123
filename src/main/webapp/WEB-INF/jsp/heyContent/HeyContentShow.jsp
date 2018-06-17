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

        <div class="ibox-content">
            ${obj.content}
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
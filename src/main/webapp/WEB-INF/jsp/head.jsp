<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>管理后台</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <%--<link rel="shortcut icon" href="favicon.ico">

    <script src="${ctx }/hplus+/js/jquery.min.js?v=2.1.4"></script>

    <link href="${ctx }/hplus+/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="${ctx }/hplus+/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx }/hplus+/css/animate.min.css" rel="stylesheet">
    <link href="${ctx }/hplus+/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${ctx }/hplus+/css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="${ctx }/hplus+/css/style.min.css?v=4.0.0" rel="stylesheet">


    <!-- 非基本的css -->
    <link href="${ctx }/hplus+/css/plugins/jsTree/style.min.css" rel="stylesheet">

    <link href="${ctx }/hplus+/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${ctx }/hplus+/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">

    <link href="${ctx }}/hplus+/css/my-hplus+.css?v=1" rel="stylesheet">
    <link href="${ctx }}/hplus+/css/edian.css?v=2" rel="stylesheet">

    <script src="${ctx }/hplus+/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/hplus+/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="${ctx }/hplus+/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/layer/layer.min.js"></script>
    <script src="${ctx }/hplus+/js/hplus+.min.js?v=4.0.0"></script>
    <script src="${ctx }/hplus+/js/contabs.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/pace/pace.min.js"></script>

    <!-- 非基本的js -->
    <script src="${ctx }/hplus+/js/plugins/jsTree/jstree.min.js"></script>




    <script src="${ctx }/hplus+/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="${ctx }/hplus+/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${ctx }/hplus+/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="${ctx }/hplus+/js/plugins/footable/footable.all.min.js"></script>
    <script src="${ctx }/hplus+/js/content.min.js?v=1.0.0"></script>
    <script src="${ctx }/hplus+/js/plugins/staps/jquery.steps.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${ctx }/hplus+/js/demo/bootstrap-table-demo.min.js"></script>

    <script src="${ctx }/hplus+/js/plugins/layer/laydate/laydate.js"></script>--%>



    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ctx }/hplus+/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx }/hplus+/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx }/hplus+/css/animate.css" rel="stylesheet">
    <link href="${ctx }/hplus+/css/style.css?v=4.1.0" rel="stylesheet">

    <!-- 全局js -->
    <script src="${ctx }/hplus+/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx }/hplus+/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx }/hplus+/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx }/hplus+/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx }/hplus+/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${ctx }/hplus+/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${ctx }/hplus+/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${ctx }/hplus+/js/plugins/pace/pace.min.js"></script>

    <script src="${ctx }/hplus+/js/plugins/layer/laydate/laydate.js"></script>


</head>

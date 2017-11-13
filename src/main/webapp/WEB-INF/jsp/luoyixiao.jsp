<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="js/echarts.js"></script>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <script src="js/plugins/layer/laydate/laydate.js"></script>

    <title>${type}评论分析</title>
</head>

<body>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="sr-only2" >请选择日期：</label>
<input id="queryTime" class="form-control layer-date" value="${queryDate}" placeholder="YYYY-MM-DD" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">&nbsp;&nbsp;-&nbsp;&nbsp;
    <input id="endDate" class="form-control layer-date" value="${endDate}" placeholder="YYYY-MM-DD" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
<input type="button" class="btn btn-primary btn-sm" onclick="changeDate()" value=" 搜 索 ">
<div id="main" style="width: 1200px;height:800px;"></div>

<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>列表展示</h5>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a href="table_basic.html#">选项1</a>
                </li>
                <li>
                    <a href="table_basic.html#">选项2</a>
                </li>
            </ul>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">

        <table class="table table-striped">
            <thead>
            <tr>
                <th>时间/小时</th>
                <th>正面评论统计/小时</th>
                <th>负面评论统计/小时</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="v" items="${showList}">
                <tr>
                    <td>${v[0]}</td>
                    <td>${v[1]}</td>
                    <td>${v[2]}</td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>


    function changeDate(){
        var queryDate=document.getElementById("queryTime").value;
        var endDate=document.getElementById("endDate").value;
        window.location.href="http://localhost:8080/hey/luoyixiao?type=${type}&queryDate="+queryDate+"&endDate="+endDate;

    }
    var times="${times}";
    var wellCounts="${wellCounts}";
    var pollCounts="${pollCounts}";
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        title: {
            text: '${type}评论走向图',
            subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['正面评论','负面评论']
        },
        xAxis:  {
            type: 'category',
            boundaryGap: false,
            data: times.split(",")
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value}'
            }
        },
        series: [
            {
                name:'正面评论',
                type:'line',
                data:wellCounts.split(",")
            },
            {
                name:'负面评论',
                type:'line',
                data:pollCounts.split(",")
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="js/plugins/pace/pace.min.js"></script>
</body>
</html>
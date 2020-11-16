<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="layui-layout layui-layout-admin">
    <div class="layui-body" style="font-size: 200%;display:flex;">
        <div id="EchartZhu1" style="width: 400px;height: 400px;flex:5"></div>
        <div id="EchartZhu2" style="width: 400px;height: 400px;flex:5"></div>
    </div>
</div>
<script>
    var chartZhu1 = echarts.init(document.getElementById('EchartZhu1'));
    var optionchartBing1 = {
        title: {
            text: '今日登录人数统计',
            x: 'center' //标题居中
        },
        tooltip: {
            // trigger: 'item' //悬浮显示对比
        },
        legend: {
            orient: 'vertical', //类型垂直,默认水平
            left: 'left', //类型区分在左 默认居中
            data: ['SUPER', 'ROOT']
        },
        series: [{
            type: 'pie', //饼状
            radius: '30%', //圆的大小
            center: ['50%', '50%'], //居中
            data: [
                {
                    value: 5,
                    name: 'SUPER'
                },
                {
                    value: 20,
                    name: 'ROOT'
                }
            ]
        }]
    };
    chartZhu1.setOption(optionchartBing1, true);
    var chartZhu2 = echarts.init(document.getElementById('EchartZhu2'));
    //指定图表配置项和数据
    var optionchartBing2 = {
        title: {
            text: '录入学生情况'
        },
        tooltip: {},
        legend: {
            data: ['数量']
        },
        xAxis: {
            data: ['张三', '李四', '王五', '赵六', '孙七', '周八', '吴九']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '数量',
            type: 'bar', //柱状
            data: [122,103,117,126,130,110,125],
            itemStyle: {
                normal: { //柱子颜色
                    color: 'red'
                }
            },
        }]
    };
    chartZhu2.setOption(optionchartBing2, true);
</script>
</body>
</html>
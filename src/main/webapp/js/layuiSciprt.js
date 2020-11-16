$(function () {
    //加载弹出层
    layui.use(['form', 'element','laydate','table','echarts'], function () {
        var $=layui.jquery;
            layer = layui.layer;
            element = layui.element;
            laydate = layui.laydate;
              table = layui.table;
             echarts = layui.echarts;
        laydate.render({
            elem:'#date',
        });
        });
    layui.config({
        version: 1,
        base: '${pageContext.request.contextPath}/js/' //这个就是你放Echart.js的目录
    })
})
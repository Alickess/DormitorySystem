<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="layui-body">
        <div class="x-nav">
          <span class="layui-breadcrumb" >
            <a href="${pageContext.request.contextPath}/pages/main.jsp" >首页</a>
            <a href="javascript:;">访问日志</a>
          </span>
        </div>
        <div class="layui-btn-group">
            <a href="${pageContext.request.contextPath}/syslog/findAll.do" class="layui-btn "><i class="layui-icon">&#xe669;刷新</i></a>
        </div>
        <div>
            <table class="layui-table">
                <thead>
                <tr>
                    <th>id</th>
                    <th>访问时间</th>
                    <th>访问用户</th>
                    <th>访问IP</th>
                    <th>资源URL</th>
                    <th>执行时间</th>
                    <th>访问方法</th>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="syslog">
                    <tr>
                        <td>${syslog.id}</td>
                        <td>${syslog.visitTimeStr }</td>
                        <td>${syslog.username }</td>
                        <td>${syslog.ip }</td>
                        <td>${syslog.url}</td>
                        <td>${syslog.executionTime}毫秒</td>
                        <td>${syslog.method}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="layui-input-inline" style="font-size:150%">
            <label >当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页,总计${pageInfo.total}条记录</label>
        </div>
        <div class="layui-input-inline" style="position: relative;left: 250px">
            <a href="${pageContext.request.contextPath}/syslog/findAll.do?pageNo=${pageInfo.firstPage}"  class="layui-btn">第一页</a>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a href="${pageContext.request.contextPath}/syslog/findAll.do?pageNo=${pageInfo.pageNum-1}"  class="layui-btn">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a href="${pageContext.request.contextPath}/syslog/findAll.do?pageNo=${pageInfo.pageNum+1}"  class="layui-btn">下一页</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/syslog/findAll.do?pageNo=${pageInfo.lastPage}"  class="layui-btn">最后页</a>
        </div>
        <div class="layui-input-inline" style="font-size: 150%;position: relative;left: 600px">
            转到第<select id="changePageNo">
            <c:forEach items="${pageInfo.navigatepageNums}" var="pageNo">
                <option value="${pageNo}">${pageNo}</option>
            </c:forEach>
        </select>页
            <button type="button" class="layui-btn" id="changePageNoBtn">确定</button>
        </div>
    </div>

</div>
<script>
    $("#changePageNoBtn").click(function () {
        var pageNo = $("#changePageNo").val();
        location.href = "${pageContext.request.contextPath}/syslog/findAll.do?pageNo="
            + pageNo;
    })
</script>
</body>
</html>
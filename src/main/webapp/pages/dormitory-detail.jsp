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
        <div>
          <span class="layui-breadcrumb" >
            <a href="${pageContext.request.contextPath}/pages/main.jsp" >首页</a>
            <a href="${pageContext.request.contextPath}/dormitory/findAll.do">宿舍管理</a>
            <a href="javascript:;">信息管理</a>
          </span>
        </div>
        <div>
            <form class="layui-form"  action="${pageContext.request.contextPath}/dormitory/updateDormitory.do" method="post">
                <input type="hidden" value="${dormitory.id}" name="id"  class="layui-input"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍编号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="dormitoryName"  value="${dormitory.dormitoryName}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">楼房编号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="buildingName"  value="${dormitory.buildingName}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">总床数：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="totalBed"  value="${dormitory.totalBed}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">使用床数：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="useBed"  value="${dormitory.useBed}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">管理员：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="administrator"  value="${dormitory.administrator}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn layui-btn-normal">修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
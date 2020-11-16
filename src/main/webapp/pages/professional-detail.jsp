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
            <a href="${pageContext.request.contextPath}/professional/findAll.do">专业管理</a>
            <a href="javascript:;">信息管理</a>
          </span>
        </div>
        <div>
            <form class="layui-form"  action="${pageContext.request.contextPath}/professional/updateProfessional.do" method="post">
                <input type="hidden" value="${professional.id}" name="id"  class="layui-input"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">班级：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="classId"  value="${professional.classId}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">专业：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="className"  value="${professional.className}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">辅导员：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="counselor"  value="${professional.counselor}"  class="layui-input">
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
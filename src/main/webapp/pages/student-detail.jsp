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
            <a href="${pageContext.request.contextPath}/student/findAll.do">学生管理</a>
            <a href="javascript:;">信息管理</a>
          </span>
        </div>
        <div>
            <form class="layui-form"  action="${pageContext.request.contextPath}/student/updateStudent.do" method="post">
                <input type="hidden" value="${student.id}" name="id"  class="layui-input"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="number"  value="${student.number}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="name"  value="${student.name}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked>
                        <input type="radio" name="sex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="age"  value="${student.age}"  class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="phone"  value="${student.phone}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍Id：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="dormitoryId"  value="${student.dormitoryId}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业Id：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="professionalId"  value="${student.professionalId}"  class="layui-input">
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
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
            <a href="${pageContext.request.contextPath}/admin/findAll.do">管理员管理</a>
            <a href="javascript:;">信息管理</a>
          </span>
        </div>
        <div>
            <form class="layui-form"  action="${pageContext.request.contextPath}/admin/updateAdmin.do" method="post">
                <input type="hidden" value="${admin.id}" name="id"  class="layui-input"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="username"  value="${admin.username}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-inline">
                        <input type="password" required lay-verify="required" name="password"  value="${admin.password}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="name"  value="${admin.name}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="phone"  value="${admin.phone}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">权限：</label>
                    <div class="layui-input-inline">
                        <select name="roleId">
                            <option value="1" >SUPER</option>
                            <option value="2" >ROOT</option>
                        </select>
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
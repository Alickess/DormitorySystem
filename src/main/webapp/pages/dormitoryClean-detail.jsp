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
            <a href="${pageContext.request.contextPath}/dormitoryClean/findAll.do">宿舍卫生管理</a>
            <a href="javascript:;">信息管理</a>
          </span>
        </div>
        <div>
            <form class="layui-form"  action="${pageContext.request.contextPath}/dormitoryClean/updateDormitoryClean.do" method="post">
                <input type="hidden" value="${dormitoryClean.id}" name="id"  class="layui-input"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍id：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="dormitoryId"  value="${dormitoryClean.dormitoryId}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍编号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required"  readonly="readonly" value="${dormitoryClean.dormitoryName}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">楼房编号：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" readonly="readonly"  value="${dormitoryClean.buildingName}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">创建时间：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required"  readonly="readonly" value="${dormitoryClean.creatTimeStr}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">更新时间：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" readonly="readonly"  value="${dormitoryClean.updateTimeStr}"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">评分：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="grade"  value="${dormitoryClean.grade}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">评价：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="appraise"  value="${dormitoryClean.appraise}"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">管理员：</label>
                    <div class="layui-input-inline">
                        <input type="text" required lay-verify="required" name="administrator"  value="${dormitoryClean.administrator}"  class="layui-input">
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
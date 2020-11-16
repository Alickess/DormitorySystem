<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>宿舍管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/layuiSciprt.js"></script>
    <script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>

</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">宿舍管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect="">
                <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">
                    <security:authentication property="principal.username"/></a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/findAdminByUserName.do?username=<security:authentication property="principal.username"/>">修改信息</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/logout.do">注销</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/main.jsp">首页</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/announcement.jsp">平台公告</a></li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">宿舍信息</a>
                    <dl class="layui-nav-child">
                        <security:authorize access="hasAnyRole('ROLE_SUPER','ROLE_ROOT')">
                        <dd><a href="${pageContext.request.contextPath}/student/findAll.do" >学生管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/dormitory/findAll.do" >宿舍管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/dormitoryClean/findAll.do" >宿舍卫生管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/professional/findAll.do" >专业管理</a></dd>
                        </security:authorize>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">管理员信息</a>
                    <dl class="layui-nav-child">
                        <security:authorize access="hasRole('ROLE_SUPER')">
                        <dd><a href="${pageContext.request.contextPath}/admin/findAll.do" >管理员管理</a></dd>
                        </security:authorize>
                        <dd><a href="${pageContext.request.contextPath}/admin/findAdminByUserName.do?username=<security:authentication property="principal.username"/>">个人信息</a></dd>
                        <security:authorize access="hasRole('ROLE_SUPER')">
                        <dd><a href="${pageContext.request.contextPath}/syslog/findAll.do" >访问日志</a></dd>
                        </security:authorize>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © zwu.edu.com - made By 葛冰佳
    </div>
</div>
</body>
</html>
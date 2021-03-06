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
            <a href="javascript:;">管理员管理</a>
          </span>
        </div>
        <form class="layui-form" action="${pageContext.request.contextPath}/admin/findAll.do" >
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="id"  placeholder="请输入id" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="roleId">
                        <option value="0" selected></option>
                        <option value="1" >SUPER</option>
                        <option value="2" >ROOT</option>
                    </select>
                </div>
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </form>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn" id="saveBtn"><i class="layui-icon">&#xe642;增加</i></button>
            <a href="${pageContext.request.contextPath}/admin/findAll.do" class="layui-btn "><i class="layui-icon">&#xe669;刷新</i></a>
        </div>
        <div>
            <table class="layui-table" >
                <thead>
                <tr>
                    <th>id</th>
                    <th>用户</th>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>权限</th>
                    <th>操作</th>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="admin">
                    <tr>
                        <td>${admin.id}</td>
                        <td>${admin.username}</td>
                        <td>${admin.name}</td>
                        <td>${admin.phone}</td>
                        <td>${admin.roleStr}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/findAdminById.do?id=${admin.id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe66f;详情</i></a>
                            <a href="javascript:;" onclick="member_del(this,'${admin.id}')" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe640;删除</i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="layui-input-inline" style="font-size:150%">
            <label >当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页,总计${pageInfo.total}条记录</label>
        </div>
        <div class="layui-input-inline" style="position: relative;left: 250px">
            <a href="${pageContext.request.contextPath}/admin/findAll.do?pageNo=${pageInfo.firstPage}"  class="layui-btn">第一页</a>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a href="${pageContext.request.contextPath}/admin/findAll.do?pageNo=${pageInfo.pageNum-1}"  class="layui-btn">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a href="${pageContext.request.contextPath}/admin/findAll.do?pageNo=${pageInfo.pageNum+1}"  class="layui-btn">下一页</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/admin/findAll.do?pageNo=${pageInfo.lastPage}"  class="layui-btn">最后页</a>
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

    <%--添加弹出层--%>
    <div class="layui-row" id="saveDiv" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="saveForm"  action="${pageContext.request.contextPath}/admin/saveAdmin.do">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="username"  value=""  class="layui-input" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input type="password" required lay-verify="required" name="password"  value=""  class="layui-input" placeholder="请输入密码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="name"  value=""  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="phone"  value=""  class="layui-input" placeholder="请输入手机号">
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
                        <button type="submit" class="layui-btn layui-btn-normal">增加</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#saveBtn").click(function () {
        layer.open({
            type: 1,
            title:"添加用户",
            skin: 'layui-layer-rim', //加上边框
            area: ['400px', '360px'], //宽高
            content: $("#saveDiv").html()  //调到新增页面
        });
        $("#saveForm")[0].reset();
    })
    $("#changePageNoBtn").click(function () {
        var pageNo = $("#changePageNo").val();
        location.href = "${pageContext.request.contextPath}/admin/findAll.do?pageNo="
            + pageNo;
    })
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/admin/deleteAdmin.do",{"id":id},function (data) {
                if(data = true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/admin/findAll.do';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/admin/findAll.do';},2000);
                }
            });
        });
    }
</script>
</body>
</html>
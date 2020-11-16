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
            <a href="javascript:;">学生管理</a>
          </span>
        </div>
        <form class="layui-form" action="${pageContext.request.contextPath}/student/findAll.do" >
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="number"  placeholder="请输入学号" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="name"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </form>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn" id="saveBtn"><i class="layui-icon">&#xe642;增加</i></button>
            <a href="${pageContext.request.contextPath}/student/findAll.do" class="layui-btn "><i class="layui-icon">&#xe669;刷新</i></a>
        </div>
        <div>
            <table class="layui-table" >
                <thead>
                <tr>
                    <th>id</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>手机号</th>
                    <th>宿舍编号</th>
                    <th>楼房编号</th>
                    <th>专业班级</th>
                    <th>专业名称</th>
                    <th>操作</th>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="student">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.number}</td>
                        <td>${student.name}</td>
                        <td>${student.sex}</td>
                        <td>${student.age}</td>
                        <td>${student.phone}</td>
                        <td>${student.dormitoryName}</td>
                        <td>${student.buildingName}</td>
                        <td>${student.classId}</td>
                        <td>${student.className}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/student/findStudentById.do?id=${student.id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe66f;详情</i></a>
                            <a href="javascript:;" onclick="member_del(this,'${student.id}')" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe640;删除</i></a>
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
            <a href="${pageContext.request.contextPath}/student/findAll.do?pageNo=${pageInfo.firstPage}"  class="layui-btn">第一页</a>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a href="${pageContext.request.contextPath}/student/findAll.do?pageNo=${pageInfo.pageNum-1}"  class="layui-btn">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a href="${pageContext.request.contextPath}/student/findAll.do?pageNo=${pageInfo.pageNum+1}"  class="layui-btn">下一页</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/student/findAll.do?pageNo=${pageInfo.lastPage}"  class="layui-btn">最后页</a>
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
            <form class="layui-form" id="saveForm"  action="${pageContext.request.contextPath}/student/saveStudent.do">
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="number"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="name"  value=""  class="layui-input" placeholder="请输入姓名">
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
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="age"  value=""  class="layui-input" placeholder="请输入年龄">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="phone"  value=""  class="layui-input" placeholder="请输入手机号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍Id：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="dormitoryId"  value=""  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业Id：</label>
                    <div class="layui-input-block">
                        <input type="text" required lay-verify="required" name="professionalId"  value=""  class="layui-input">
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
            title:"添加学生",
            skin: 'layui-layer-rim', //加上边框
            area: ['500px', '420px'], //宽高
            content: $("#saveDiv").html()  //调到新增页面
        });
        $("#saveForm")[0].reset();
    })
    $("#changePageNoBtn").click(function () {
        var pageNo = $("#changePageNo").val();
        location.href = "${pageContext.request.contextPath}/student/findAll.do?pageNo="
            + pageNo;
    })

    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("${pageContext.request.contextPath}/student/deleteStudent.do",{"id":id},function (data) {
                if(data = true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/student/findAll.do';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/student/findAll.do';},2000);
                }
            });
        });
    }
</script>
</body>
</html>
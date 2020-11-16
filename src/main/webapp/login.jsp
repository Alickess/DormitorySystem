<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>
<body style="background-image:url('image/bk.jpg');background-repeat: no-repeat">
<form action="${pageContext.request.contextPath}/login.do" method="post" style="width: 360px;margin:20% auto" >
    <div class="login-box" style="width: 360px;margin:7% auto">
            <div class="layui-form-item">
                <label class="layui-form-label">账户</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="title"  placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" lay-verify="title"  placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="submit" class="layui-btn">
                </div>
            </div>
    </div>
</form>
<script src="layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
    });
</script>
</body>
</html>
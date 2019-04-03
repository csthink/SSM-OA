<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    request.setAttribute("basePath", basePath);
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>登录页面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="">
    <base href="<%=basePath%>/">
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/animate-css/vivify.min.css">
    <link rel="stylesheet" href="/css/c3/c3.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css">
    <link rel="stylesheet" href="/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/dropify.min.css">
    <link rel="stylesheet" href="/css/sweetalert.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/css/site.min.css">
</head>
<body class="theme-orange">
<div class="pattern">
    <span class="red"></span>
    <span class="indigo"></span>
    <span class="blue"></span>
    <span class="green"></span>
    <span class="orange"></span>
</div>
<div class="auth-main particles_js">
    <div class="auth_div vivify popIn">
        <div class="auth_brand">
            <a class="navbar-brand" href="javascript:void(0);"><img src="/image/icon.svg" width="30" height="30" class="d-inline-block align-top mr-2" alt="">OA</a>
        </div>
        <div class="card">
            <div class="header">
                <jsp:include page="/WEB-INF/views/layout/messages.jsp" flush="true"/>
            </div>
            <div class="body">
                <p class="lead">OA 员工登录</p>
                <form action="/user/login" method="post" class="form-auth-small m-t-20" id="login-form" novalidate>
                    <div class="form-group">
                        <label for="id" class="control-label sr-only">工号</label>
                        <input type="text" class="form-control round" id="id" name="id" value="" placeholder="请输入工号">
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label sr-only">密码</label>
                        <input type="password" class="form-control round" id="password" name="password" value="" placeholder="请输入密码">
                    </div>
                    <div class="form-group clearfix">
                        <label class="fancy-checkbox element-left">
                            <input type="checkbox" name="remember">
                            <span>记住我</span>
                        </label>
                    </div>
                    <input id="submit" type="submit" class="btn btn-primary btn-round btn-block" value="登录"/>
<%--                    <div class="bottom">--%>
<%--                        <span class="helper-text m-b-10"><i class="fa fa-lock"></i> <a href="/login/toForgotPassword">忘记密码?</a></span>--%>
<%--                    </div>--%>
                </form>
            </div>
        </div>
    </div>
    <div id="particles-js"></div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/libscripts.bundle.js"></script>
<script src="/js/vendorscripts.bundle.js"></script>
<script src="/js/c3.bundle.js"></script>
<script src="/js/bootstrap-datepicker.min.js"></script>
<script src="/js/mainscripts.bundle.js"></script>
<script src="/js/dropify.js"></script>
<script src="/js/dropify-form.js"></script>
<script src="/js/commonUtils.js"></script>
<script src="/js/commonService.js"></script>
<script src="/js/sweetalert.min.js"></script>
</body>
</html>

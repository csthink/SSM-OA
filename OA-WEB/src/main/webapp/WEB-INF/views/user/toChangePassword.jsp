<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    request.setAttribute("basePath", basePath);
%>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>修改密码</title>
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
        <div class="card forgot-pass">
            <div class="header">
                <jsp:include page="/WEB-INF/views/layout/messages.jsp" flush="true"/>
            </div>
            <div class="body">
                <p class="lead mb-3"><strong>重置密码</strong></p>
                <form action="/user/changePassword" method="post" class="form-auth-small" id="login-forgot-password-form" novalidate>
                    <div class="form-group">
                        <label for="oldPassword" class="control-label sr-only">旧密码</label>
                        <input type="password" class="form-control round" id="oldPassword" name="oldPassword" value="" placeholder="请输入旧密码">
                    </div>
                    <div class="form-group">
                        <label for="newPassword1" class="control-label sr-only">新密码</label>
                        <input type="password" class="form-control round" id="newPassword1" name="newPassword1" value="" placeholder="请输入新密码">
                    </div>
                    <div class="form-group">
                        <label for="newPassword2" class="control-label sr-only">重复密码</label>
                        <input type="password" class="form-control round" id="newPassword2" name="newPassword2" value="" placeholder="请再次输入新密码">
                    </div>
                    <input id="submit" type="submit" class="btn btn-primary btn-round btn-block" value="修改密码"/>
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

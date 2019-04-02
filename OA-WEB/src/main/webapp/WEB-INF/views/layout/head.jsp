<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <title>CRM | ${TITLE}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="">
    <base href="${basepath}/">
    <link rel="shortcut icon" href="/image/favicon.ico" type="image/x-icon">
    <!-- VENDOR CSS -->
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
        <%
//            if (null != session.getAttribute("USER")) {
//                Employee employee = (Employee) session.getAttribute("USER");
//                request.setAttribute("employee", employee);
//            }
        %>
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="m-t-30">
                <img src="/image/icon.svg" width="40" height="40" alt="CRM">
            </div>
            <p>系统加载中...</p>
        </div>
    </div>

    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>

    <div id="wrapper">
        <nav class="navbar navbar-fixed-top">

            <div class="container-fluid">
                <div class="navbar-left">
                    <div class="navbar-btn">
                        <a href="index.html"> <img src="/image/icon.svg" alt="CRM Logo" class="img-fluid logo"></a>
                        <button type="button" class="btn-toggle-offcanvas"><i class="lnr lnr-menu fa fa-bars"></i></button>
                    </div> <!-- /navbar-left -->
                </div> <!-- /navbar-left -->

                <div class="navbar-right">
                    <div id="navbar-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="/login/logout.do" class="icon-menu"><i class="icon-power"></i></a></li>
                        </ul>
                    </div> <!-- /navbar-menu -->
                </div> <!-- /navbar-right -->
            </div> <!-- /container-fluid -->

            <div class="progress-container">
                <div class="progress-bar" id="myBar"></div>
            </div> <!-- /progress-container -->
        </nav> <!-- /navbar-fixed-top -->

        <div id="megamenu" class="megamenu particles_js">
            <div id="particles-js"></div>
        </div> <!-- /megamenu -->

        <div id="left-sidebar" class="sidebar">

            <div class="navbar-brand">
                <a href="index.html"><img src="/image/icon.svg" alt="CRM Logo" class="img-fluid logo"><span>CRM</span></a>
                <button type="button" class="btn-toggle-offcanvas btn btn-sm float-right"> <i class="lnr lnr-menu fa fa-chevron-circle-left"></i> </button>
            </div>

            <div class="sidebar-scroll">

                <div class="user-account">
                    <div class="user_div">
<%--                        <img src="/upload/${employee.photo}" class="user-photo" alt="User Profile Picture">--%>
                        <img src="/image/sm/avatar1.jpg" class="user-photo" alt="User Profile Picture">
                    </div>

                    <div class="dropdown">
                        <span>欢迎,</span>
<%--                        <a href="javascript:void(0);" class="dropdown-toggle user-name" data-toggle="dropdown"><strong>${employee.username}</strong></a>--%>
                        <a href="javascript:void(0);" class="dropdown-toggle user-name" data-toggle="dropdown"><strong>Peter</strong></a>
                        <ul class="dropdown-menu dropdown-menu-right account vivify flipInY">
                            <li><a href=""><i class="icon-user"></i>我的信息</a></li>
                            <li><a href=""><i class="icon-settings"></i>设置</a></li>
                            <li class="divider"></li>
                            <li><a href="/login/logout.do"><i class="icon-power"></i>退出系统</a></li>
                        </ul>
                    </div>
                </div> <!-- /user-account -->

                <nav id="left-sidebar-nav" class="sidebar-nav">
                    <ul id="main-menu" class="metismenu">
                        <!-- <li class="header">Main</li> -->
                        <li class="active"><a href="/login/logout.do"><i class="icon-logout"></i><span>退出系统</span></a></li>

                        <li class="header">系统管理</li>

                        <li class="<c:out value="${requestUri.contains('/employee/') ? 'active' : ''}"/>">
                            <a href="javascript:void(0);" class="has-arrow"><i class="icon-users"></i><span>员工管理</span></a>
                            <ul>
                                <li class="<c:out value="${requestUri.contains('/employee/list.do') ? 'active' : ''}"/>"><a href="/employee/list.do">员工列表</a></li>
                                <li class="<c:out value="${requestUri.contains('/employee/toAdd.do') ? 'active' : ''}"/>"><a href="/employee/toAdd.do">添加员工</a></li>
                             </ul>
                        </li>
                        <li class="<c:out value="${requestUri.contains('/department/') ? 'active' : ''}"/>">
                            <a href="javascript:void(0);" class="has-arrow"><i class="icon-users"></i><span>部门管理</span></a>
                            <ul>
                                <li class="<c:out value="${requestUri.contains('/department/list.do') ? 'active' : ''}"/>"><a href="/department/list.do">部门列表</a></li>
                                <li class="<c:out value="${requestUri.contains('/department/toAdd.do') ? 'active' : ''}"/>"><a href="/department/toAdd.do">添加部门</a></li>
                            </ul>
                        </li>

                        <li class="<c:out value="${requestUri.contains('/log/') ? 'active' : ''}"/>">
                            <a href="javascript:void(0);" class="has-arrow"><i class="icon-doc"></i><span>日志信息</span></a>
                            <ul>
                                <li class="<c:out value="${requestUri.contains('/log/operationLog.do') ? 'active' : ''}"/>"><a href="/log/operationLog.do">操作日志</a></li>
                                <li class="<c:out value="${requestUri.contains('/log/loginLog.do') ? 'active' : ''}"/>"><a href="/log/loginLog.do">登录日志</a></li>
                                <li class="<c:out value="${requestUri.contains('/log/systemLog.do') ? 'active' : ''}"/>" ><a href="/log/systemLog.do">系统日志</a></li>
                            </ul>
                        </li>

                        <li>
                            <a href="javascript:void(0);" class="has-arrow"><i class="icon-home"></i><span>个人中心</span></a>
                            <ul>
                                <li><a href="forms-basic.html">个人信息</a></li>
                                <li><a href="/login/toForgotPassword.do">修改密码</a></li>
                            </ul>
                        </li>

                    </ul> <!-- /main-menu -->
                </nav><!-- /left-sidebar-nav -->
            </div> <!-- /sidebar-scroll -->
        </div><!-- /left-sidebar -->
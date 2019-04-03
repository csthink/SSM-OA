<%@ page import="com.csthink.oa.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/head.jsp" flush="true"/>
<div id="main-content">
    <div class="block-header">
        <div class="row clearfix">
            <div class="col-md-6 col-sm-12">
                <!-- <h1>个人信息</h1> -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
<%--                        <li class="breadcrumb-item"><a href="javascript:void(0);">个人中心</a></li>--%>
                        <li class="breadcrumb-item active" aria-current="page">个人中心</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
<%--                <a href="/employee/toAdd" class="btn btn-sm btn-primary btn-round" title="">新增员工</a>--%>
            </div>
        </div>
    </div> <!-- /block-header -->

    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-lg-8 col-md-8 offset-2">
                <div class="col-md-12">
                    <div class="card social">
                        <div class="profile-header d-flex justify-content-between justify-content-center">
                            <div class="d-flex">
                                <div class="mr-3">
                                    <img src="/image/user.png" class="rounded" alt="">
                                </div>
                                <div class="details">
                                    <h5 class="mb-0">${sessionScope.employee.realName}</h5>
                                    <span class="text-light">${sessionScope.employee.post}</span>
                                </div>
                            </div>
<%--                            <div>--%>
<%--                                <button class="btn btn-primary btn-sm">Follow</button>--%>
<%--                                <button class="btn btn-success btn-sm">Message</button>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-lg-6 col-md-6 offset-3">
                    <div class="card">
                        <div class="header">
                            <h2>员工信息</h2>
                            <ul class="header-dropdown dropdown">
                                <li><a href="javascript:void(0);" class="full-screen"><i class="icon-frame"></i></a></li>
<%--                                <li class="dropdown">--%>
<%--                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a>--%>
<%--                                    <ul class="dropdown-menu">--%>
<%--                                        <li><a href="javascript:void(0);">Action</a></li>--%>
<%--                                        <li><a href="javascript:void(0);">Another Action</a></li>--%>
<%--                                        <li><a href="javascript:void(0);">Something else</a></li>--%>
<%--                                    </ul>--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <small class="text-muted">姓名: </small>
                                    <p>${sessionScope.employee.realName}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <small class="text-muted">工号: </small>
                                    <p>${sessionScope.employee.id}</p>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <small class="text-muted">用户名: </small>
                                    <p>${sessionScope.employee.username}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <small class="text-muted">所在部门: </small>
                                    <p>${sessionScope.employee.department.deptName}</p>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <small class="text-muted">职位: </small>
                                    <p>${sessionScope.employee.post}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /container-fluid -->
</div> <!-- /main-content -->

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
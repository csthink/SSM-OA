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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">员工管理</a></li>
                        <li class="breadcrumb-item active" aria-current="page">员工列表</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
                <a href="/employee/toAdd" class="btn btn-sm btn-primary btn-round" title="">新增员工</a>
            </div>
        </div>
    </div> <!-- /block-header -->

    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-lg-8 col-md-8 offset-2">
                <div class="table-responsive">
                    <table class="table table-hover table-custom spacing5">
                        <thead>
                        <tr>
                            <th>员工编号</th>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>所在部门</th>
                            <th>职务</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="emp">
                            <tr>
                                <td><span>${emp.id}</span></td>
                                <td><span>${emp.username}</span></td>
                                <td><span>${emp.realName}</span></td>
                                <td><span>${emp.department.deptName}</span></td>
                                <td><span>${emp.post}</span></td>
                                <td><span><fmt:formatDate value="${emp.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span></td>
                                <td>
                                    <a href="/employee/toEdit?id=${emp.id}" class="btn btn-primary btn">编辑</a>
                                    <a href="/employee/remove?id=${emp.id}" class="btn btn-danger">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div> <!-- /container-fluid -->
</div> <!-- /main-content -->

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
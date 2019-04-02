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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">部门管理</a></li>
                        <li class="breadcrumb-item active" aria-current="page">部门列表</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
                <a href="/department/toAdd" class="btn btn-sm btn-primary btn-round" title="">创建部门</a>
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
                            <th>部门编号</th>
                            <th>部门名称</th>
                            <th>地址</th>
                            <th>联系电话</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="dept">
                            <tr>
                                <td><span>${dept.id}</span></td>
                                <td><span>${dept.deptName}</span></td>
                                <td><span>${dept.address}</span></td>
                                <td><span>${dept.tel}</span></td>
                                <td><span><fmt:formatDate value="${dept.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span></td>
                                <td><span><fmt:formatDate value="${dept.updateTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span></td>
                                <td>
                                    <a href="/department/toEdit?id=${dept.id}" class="btn btn-primary btn-sm">编辑</a>
                                    <a href="/department/remove?id=${dept.id}" class="btn btn-danger btn-sm deptRemove">删除</a>
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
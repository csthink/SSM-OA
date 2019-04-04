<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/layout/head.jsp" flush="true"/>

<div id="main-content">
    <div class="block-header">
        <div class="row clearfix">
            <div class="col-md-6 col-sm-12">
                <!-- <h1>个人信息</h1> -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">报销单管理</a></li>
                        <li class="breadcrumb-item active" aria-current="page">个人报销单</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
                <a href="/expense_claim/list" class="btn btn-sm btn-primary btn-round" title="">待处理报销单</a>
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
                            <th>事由</th>
                            <th>状态</th>
                            <th>创建人</th>
                            <th>金额</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="ec">
                            <tr>
                                <td><span>${ec.cause}</span></td>
                                <td><span>${ec.status}</span></td>
                                <td><span>${ec.creatorEmployee.realName}</span></td>
                                <td><span>${ec.totalAmount}</span></td>
                                <td><span><spring:eval expression="ec.createTime"/></span></td>
                                <td><a href="/expense_claim/detail?id=${ec.id}" class="btn btn-primary">详情</a></td>
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
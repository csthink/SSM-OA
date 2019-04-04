<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <li class="breadcrumb-item active" aria-current="page">报销单信息</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
                <a href="/expense_claim/toAdd" class="btn btn-sm btn-primary btn-round" title="">创建报销单</a>
            </div>
        </div>
    </div> <!-- /block-header -->

    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-8 offset-2">
                <div class="card">
                    <div class="header">
                        <h2>基本信息</h2>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <p>报销事由</p>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10">
                                <p>${expenseClaim.cause}</p>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <p>创建人</p>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <p>${expenseClaim.creatorEmployee.realName}</p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <p>创建时间</p>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <p><spring:eval expression="expenseClaim.createTime"/></p>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <p>待处理人</p>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <p>${expenseClaim.dealEmployee.realName}</p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <p>状态</p>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <p>${expenseClaim.status}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="header">
                        <h2>费用明细</h2>
                    </div>
                    <div class="body">
                        <c:forEach items="${items}" var="item">
                            <div class="row clearfix">
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <p>${item.expenseType}</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <p>${item.amount}</p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <p>${item.remark}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="card">
                    <div class="header">
                        <h2>处理流程</h2>
                    </div>
                    <div class="body">
                        <c:forEach items="${records}" var="record">
                            <div class="row clearfix">
                                <div class="col-lg-1 col-md-1 col-sm-1">
                                    <p>${record.dealEmployee.realName}</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <p><spring:eval expression="record.dealTime" /></p>
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1">
                                    <p>${record.dealType}</p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <p>备注: ${record.remark}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- /container-fluid -->
</div> <!-- /main-content -->

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
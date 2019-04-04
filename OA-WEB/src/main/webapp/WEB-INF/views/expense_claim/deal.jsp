<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.csthink.oa.global.ExpenseClaimConstant" %>
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
                <a href="/expense_claim/list" class="btn btn-sm btn-primary btn-round" title="">待处理报销单</a>
            </div>
        </div>
    </div> <!-- /block-header -->

    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-8 offset-2">
                <!-- 报销单信息 -->
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
                <!-- 报销单明细信息 -->
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
                <!-- 报销单处理记录 -->
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

                <!-- 处理操作 -->
                <div class="card">
                    <div class="header">
                        <h2></h2>
                    </div>
                    <div class="body">
                        <form:form modelAttribute="record" action="/expense_claim/deal" method="post">
                            <!-- 报销单编号 -->
                            <form:hidden path="expenseClaimId"/>
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="remark" class="control-label"></label>
                                        <form:input path="remark" cssClass="form-control" required="required"/>
                                        <span class="help-block">请填写处理说明</span>
                                    </div>
                                </div>
                            </div>

                            <div id="items">
                                <div class="row clearfix item">
                                    <!-- 处理操作按钮 -->
                                    <div class="col-lg-6 col-md6 col-sm-6 offset-6">
                                        <c:if test="${sessionScope.employee.post.equals(ExpenseClaimConstant.POST_FM) || sessionScope.employee.post.equals(ExpenseClaimConstant.POST_GM)}">
                                            <button type="submit" class="btn btn-success" name="dealType" value="${ExpenseClaimConstant.DEAL_PASS}" >${ExpenseClaimConstant.DEAL_PASS}</button>
                                            <button type="submit" class="btn btn-info" name="dealType" value="${ExpenseClaimConstant.DEAL_BACK}" >${ExpenseClaimConstant.DEAL_BACK}</button>
                                            <button type="submit" class="btn btn-danger" name="dealType" value="${ExpenseClaimConstant.DEAL_REJECT}" >${ExpenseClaimConstant.DEAL_REJECT}</button>
                                        </c:if>
                                        <c:if test="${sessionScope.employee.post.equals(ExpenseClaimConstant.POST_CASHIER)}">
                                            <button type="submit" class="btn btn-success" name="dealType" value="${ExpenseClaimConstant.DEAL_PAID}" >${ExpenseClaimConstant.DEAL_PAID}</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- /container-fluid -->
</div> <!-- /main-content -->

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
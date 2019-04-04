<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/layout/head.jsp" flush="true"/>

<div id="main-content">
    <div class="block-header">
        <div class="row clearfix">
            <div class="col-md-6 col-sm-12">
                <!-- <h1>个人信息</h1> -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">报销单管理</a></li>
                        <li class="breadcrumb-item active" aria-current="page">创建报销单</li>
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
                <div class="card">
                    <div class="header">
                        <h2>填写报销单</h2>
                    </div>
                    <div class="body">
                        <form:form id="expense_claim_add" modelAttribute="info" action="/expense_claim/add" method="post">
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label for="expenseClaim.cause" class="control-label"></label>
                                        <form:input path="expenseClaim.cause" cssClass="form-control" required="required"/>
                                        <span class="help-block">请填写报销事由</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <h6>报销明细</h6>
                                </div>
                            </div>
                            <div id="items">
                                <div class="row clearfix item">
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <div class="form-group">
                                            <label for="items[0].expenseType"></label>
                                            <form:select path="items[0].expenseType" cssClass="custom-select expenseType" items="${items}"/>
                                            <span class="help-block">请选择报销类型</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <div class="form-group">
                                            <label for="items[0].amount" class="control-label"></label>
                                            <form:input path="items[0].amount" cssClass="form-control amount"/>
                                            <span class="help-block">请填写报销金额</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-5">
                                        <div class="form-group">
                                            <label for="items[0].remark" class="control-label"></label>
                                            <form:input path="items[0].remark" cssClass="form-control remark"/>
                                            <span class="help-block">请填写报销备注</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-sm-1">
                                        <button type="button" class="btn btn-danger mb-2 m-t-20 deleteItemBtn" title="Delete">
                                            <span class="sr-only">DeleteItemRow</span> <i class="fa fa-trash-o"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-lg-2 col-md-2 col-sm-2">
                                    <div class="form-group">
                                        <label for="expenseClaim.totalAmount" class="control-label"></label>
                                        <form:input path="expenseClaim.totalAmount" cssClass="form-control totalAmount" readonly="readonly" required="required"/>
                                        <span class="help-block">总金额</span>
                                    </div>
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 offset-9">
                                    <button type="button" class="btn btn-primary mb-2 m-t-20" id="addItemBtn" title="add">
                                        <span class="sr-only">AddItemRow</span> <i class="fa fa-plus-square-o"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-lg-2 col-md-2 col-sm-2 offset-8">
                                    <div class="form-group">
                                        <label for="submit" class="control-label"></label>
                                        <input type="submit" id="submit" class="btn btn-primary" value="保存">
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
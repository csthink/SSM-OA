<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/layout/head.jsp" flush="true"/>

<div id="main-content">
        <div class="block-header">
            <div class="row clearfix">
                <div class="col-md-6 col-sm-12">
                    <!-- <h1>个人信息</h1> -->
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">部门管理</a></li>
                            <li class="breadcrumb-item active" aria-current="page">新增部门</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-6 col-sm-12 text-right hidden-xs">
                    <a href="/department/list" class="btn btn-sm btn-primary btn-round" title="">部门列表</a>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-6 offset-3">
                    <div class="card">
                        <div class="header">
                            <h2>新增部门</h2>
                        </div>
                        <div class="body">
                            <form:form  modelAttribute="department" action="department/add" method="post" id="department-add-form" novalidate="novalidate">
                                <div class="form-group">
                                    <label for="deptName">部门名</label>
                                    <form:input cssClass="form-control" path="deptName" value="" placeholder="请输入部门名称"/>
                                </div>
                                <div class="form-group">
                                    <label for="address">地址</label>
                                    <form:input  cssClass="form-control" path="address" value="" placeholder="请输入部门地址"/>
                                </div>
                                <div class="form-group">
                                    <label for="tel">电话</label>
                                    <form:input cssClass="form-control" path="tel" value="" placeholder="请输入部门电话"/>
                                </div>
                                <br>
                                <input id="submit" type="submit" class="btn btn-primary" value="保存"/>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">员工管理</a></li>
                        <li class="breadcrumb-item active" aria-current="page">新增员工</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right hidden-xs">
                <a href="/employee/list" class="btn btn-sm btn-primary btn-round" title="">员工列表</a>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-6 offset-3">
                <div class="card">
                    <div class="header">
                        <jsp:include page="/WEB-INF/views/layout/messages.jsp" flush="true"/>
                    </div>
                    <div class="body">
                        <form:form modelAttribute="employee" action="/employee/add" method="post" class="needs-validation" novalidate="novalidate">
                            <div class="form-group">
                                <label for="username">用户名</label>
                                <form:input path="username" cssClass="form-control" value="" placeholder="请输入用户名" required="required" autofocus="autofocus" maxlength="20"/>
                                <div class="valid-feedback">valid</div>
                                <div class="invalid-feedback">invalid</div>
                            </div>

                            <div class="form-group">
                                <label for="realName">姓名</label>
                                <form:input path="realName" cssClass="form-control" value="" placeholder="请输入姓名" required="required"/>
                                <div class="valid-feedback">valid</div>
                                <div class="invalid-feedback">invalid</div>
                            </div>

                            <div class="form-group">
                                <label for="deptId">所在部门</label>
                                <div class="form-group">
                                    <form:select path="deptId" items="${departmentList}" itemLabel="deptName" itemValue="id"/>
<%--                                    <form:select path="deptId">--%>
<%--                                        <c:forEach items="${departmentList}" var="dept">--%>
<%--                                            <option value="${dept.id}">${dept.deptName}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </form:select>--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="post">职务</label>
                                <div class="form-group">
                                    <form:select path="post" items="${postList}"/>
<%--                                    <form:select path="post">--%>
<%--                                        <c:forEach items="${postList}" var="post">--%>
<%--                                            <option value="${post}">${post}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </form:select>--%>
                                </div>
                            </div>

                            <br/>
                            <input id="submit" type="submit" class="btn btn-primary" value="保存"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/foot.jsp" flush="true"/>
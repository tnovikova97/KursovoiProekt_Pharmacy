<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Список лекарств</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <%--    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>--%>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</head>
<body>
<div class="container">
    <div class="col-md-offset-2 col-md-7">
        <h2 class="text-center">Управление списком продукци</h2>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Добавить лекарство</div>
            </div>
            <div class="panel-body">
                <form:form action="saveCustomer" cssClass="form-horizontal"
                           method="post" modelAttribute="medicament" >

                    <!-- need to associate this data with customer id -->
                    <form:hidden path="id" />

                    <div class="form-group">
                        <label for="title" class="col-md-3 control-label">Название</label>
                        <div class="col-md-9">
                            <form:input path="title" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-md-3 control-label">Цена</label>
                        <div class="col-md-9">
                            <form:input path="price" cssClass="form-control" type = "number"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantity" class="col-md-3 control-label">Количество</label>
                        <div class="col-md-9">
                            <form:input path="quantity" cssClass="form-control" type = "number" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dateStart" class="col-md-3 control-label">Дата изготовления</label>
                        <div class="col-md-9">
                            <form:input path="dateStart" cssClass="form-control" type = "date"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dateEnd" class="col-md-3 control-label">Годен до</label>
                        <div class="col-md-9">
                            <form:input path="dateEnd" cssClass="form-control" type = "date"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="company" class="col-md-3 control-label">Компания</label>
                        <div class="col-md-9">
                            <form:input path="company" cssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-md-3 control-label">Описание</label>
                        <div class="col-md-9">
                            <form:textarea path="description" cssClass="form-control"  />
                        </div>
                    </div>


                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <form:button class="btn btn-success">Добавить</form:button>
                        </div>
                    </div>

                </form:form>
            </div>
            <div align="center">
            </div>
            <a class="btn btn-primary" href="${contextPath}/med/list">Вернуться к списку лекарств</a>
        </div>
    </div>



</div>
</body>
</html>
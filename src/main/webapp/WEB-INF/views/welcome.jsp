<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@include file="_menu.jsp"%>

<div class="container">

<%--    welcome --%>
<%--
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Здравствуй ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
        </h2>
    </c:if>
    --%>
    <hr/>


    <div>
        <!-- Button -->
        <div style="display:flex;">

            <div>
                <a class="btn btn-primary" href="${contextPath}/med/listMedicament">Список всех лекарств</a>

                <a class="btn btn-primary" href="${contextPath}/med/sorterByPrice">Сортировать по цене</a>

                <a class="btn btn-primary" href="${contextPath}/med/sorterByQuantity">Сортировать по количеству</a>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a class="btn btn-warning" style="margin-left: 100px" href="${contextPath}/med/list">Редактировать</a>
                </sec:authorize>
            </div>

            <div style="margin-left: auto">
            <form action="${contextPath}/med/search" class="form-inline">
                <div class="form-group mb-2">
                    <input type="text" class="form-control" name="title" placeholder="Поиск по названию лекарства"/>
                    <input type="submit" value="Поиск" class="btn btn-primary" />
                </div>
            </form>
            </div>
        </div>
    </div>

    <hr/>

    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">Список лекарств</div>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-bordered">
                <tr>
                    <th>Название</th>
                    <th>Цена</th>
                    <th>Количество</th>
                    <th>Дата изготовление</th>
                    <th>Годен до</th>
                    <th>Компания</th>
                    <th>Описание</th>
                </tr>

                <!-- loop over and print our medicament -->
                <c:forEach var="med" items="${medicament}">

                    <tr>
                        <td>${med.title}</td>
                        <td>${med.price}</td>
                        <td>${med.quantity}</td>
                        <td>${med.dateStart}</td>
                        <td>${med.dateEnd}</td>
                        <td>${med.company}</td>
                        <td>${med.description}</td>
                    </tr>

                </c:forEach>

            </table>

        </div>
    </div>





</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
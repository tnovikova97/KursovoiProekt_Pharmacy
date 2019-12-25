<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type">
    <title>Список лекарств</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
        <script src="<c:url value="/resources/js/jquery-3.4.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>

<%@include file="_menu.jsp"%>

<div class="container">

    <hr/>

    <div class="col-md-offset-1 col-md-10">
        <h2 style="width: 1000px" align="center">Управление списком продукции</h2>
        <hr style="width: 1000px"/>



        <div style="display:flex;">
            <div>
                <input type="button" value="Добавить лекартсво"
                       onclick="window.location.href='showForm'; return false;"
                       class="btn btn-primary" />  |  <a class="btn btn-primary" href="${contextPath}/welcome">Вернуться на главную</a>
            </div>
            <div style="margin-left: auto">
                <form action="${contextPath}/med/searchAdmin" class="form-inline">
                    <div class="form-group mb-2">
                        <input type="text" class="form-control" name="title" placeholder="Поиск по названию лекарства"/>
                        <input type="submit" value="Поиск" class="btn btn-primary" />
                    </div>
                </form>
            </div>
        </div>

        <hr />


        <div class="panel panel-info" style="width: 1000px">
            <div class="panel-heading">
                <div class="panel-title">Список лекарств</div>
            </div>
            <div class="panel-body" style="width: 1000px">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Название</th>
                        <th>Цена</th>
                        <th>Количество</th>
                        <th>Дата изготовление</th>
                        <th>Годен до</th>
                        <th>Компания</th>
                        <th>Описание</th>
                        <th style="width: 200px">Действия</th>
                    </tr>

                    <!-- loop over and print medicament -->
                    <c:forEach var="med" items="${medicament}">

                        <!-- construct an "update" link with medicament id -->
                        <c:url var="updateLink" value="/med/updateForm">
                            <c:param name="id" value="${med.id}" />
                        </c:url>

                        <!-- construct an "delete" link with medicament id -->
                        <c:url var="deleteLink" value="/med/delete">
                            <c:param name="id" value="${med.id}" />
                        </c:url>

                        <tr>
                            <td>${med.title}</td>
                            <td>${med.price}</td>
                            <td>${med.quantity}</td>
                            <td>${med.dateStart}</td>
                            <td>${med.dateEnd}</td>
                            <td>${med.company}</td>
                            <td>${med.description}</td>


                            <td>
                                <!-- display the update link --> <a class="btn btn-warning" href="${updateLink}">Обновить</a>
                                 <a href="${deleteLink}" class="btn btn-danger"
                                     onclick="if (!(confirm('Вы уверены, что хотите удалить данное лекарство? ' +
                                      'Are you sure you want to delete this medicament?'))) return false">Удалить</a>
                            </td>

                        </tr>

                    </c:forEach>

                </table>

            </div>
        </div>
    </div>

</div>
</body>
</html>
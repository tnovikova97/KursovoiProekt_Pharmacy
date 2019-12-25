<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Menu</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">

    <nav class="navbar navbar-light" style="background-color: #d9edf7; color: #31708f; display: flex; flex-direction: row; align-items: center; margin-top: 10px">
        <div class="container-fluid" style="margin-right: 450px;" >
            <div class="navbar-header">
                <a class="navbar-brand" href="#">ТвояАптека</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="${contextPath}/med/listMedicament">Главная</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Страницы<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Page 1-1</a></li>
                        <li><a href="#">Page 1-2</a></li>
                        <li><a href="#">Page 1-3</a></li>
                    </ul>
                </li>
                <li><a href="#">О нас</a></li>

            </ul>
        </div>

        <div class="navbar-header" style="margin-right: 30px; ">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <div>
                <form id="logoutForm" method="post" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                    <div style="display: flex">
                    <h4 style="margin-right: 10px">Здравствуй ${pageContext.request.userPrincipal.name} </h4>
                        <a class="btn btn-primary" onclick="document.forms['logoutForm'].submit()">Выйти</a>
                    </div>
                </div>
            </c:if>
        </div>

    </nav>

</div>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>

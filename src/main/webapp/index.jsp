<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

<div class="container">

    <nav class="navbar navbar-light" style="background-color: #d9edf7; color: #31708f; display: flex; flex-direction: row; align-items: center; margin-top: 10px">
        <div class="container-fluid" >
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">ТвояАптека</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="${contextPath}/index.jsp">Главная</a></li>
                <li class="active"><a href="${contextPath}/welcome">Медикаменты</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="active"><a href="${contextPath}/admin">Страница администратора</a></li>
                </sec:authorize>
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

<div class="container" style="
                            display: flex;
                            flex-direction: column;
                            align-items: center;">

    <div>
        <hr/>
            <h2>Приветствуем Вас на главной странице ТвояАптека</h2>
        <hr/>
    </div>

    <!--        используем библиотеку js owlCarousel,
                        она использует jquery-->

    <div class="owl-carousel owl-theme" id="carousel2">
        <div><img src="${contextPath}/resources/img/1.jpg" alt="Img"></div>
        <div><img src="${contextPath}/resources/img/2.jpg" alt="Img"></div>
        <div><img src="${contextPath}/resources/img/3.jpg" alt="Img"></div>
    </div>




</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"/>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>
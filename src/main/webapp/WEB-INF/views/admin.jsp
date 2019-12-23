<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Page</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Admin Page ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>
</div>


<c:url var="addAction" value="/medicament/add"/>

<form:form action="${addAction}" commandName="medicament" method="post">
    <table>
        <c:if test="${!empty medicament.title}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8"  type = "hidden" disabled="true" />
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="title"/>
                </form:label>
            </td>
            <td>
                <form:input path="title" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="quantity">
                    <spring:message text="quantity"/>
                </form:label>
            </td>
            <td>
                <form:input path="quantity" type = "number"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="dateStart">
                    <spring:message text="dateStart"/>
                </form:label>
            </td>
            <td>
                <form:input path="dateStart" type = "date"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="dateEnd">
                    <spring:message text="dateEnd"/>
                </form:label>
            </td>
            <td>
                <form:input path="dateEnd" type = "date" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="company">
                    <spring:message text="company"/>
                </form:label>
            </td>
            <td>
                <form:input path="company" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty medicament.title}">
                    <input type="submit"
                           value="<spring:message text="Edit "/>" />
                </c:if>
                <c:if test="${empty medicament.title}">
                    <input type="submit"
                           value="<spring:message text="Add "/>" />
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>Persons List</h3>

<table>
    <thead>
    <tr>
        <th>title</th>
        <th>price</th>
        <th>quantity</th>
        <th>date start</th>
        <th>date end</th>
        <th>company</th>
        <th>description</th>
        <th colspan="2">actions</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listMedicament}" var="med">
        <tr>
            <td>${med.title}</td>
            <td>${med.price}</td>
            <td>${med.quantity}</td>
            <td>${med.dateStart}</td>
            <td>${med.dateEnd}</td>
            <td>${med.company}</td>
            <td>${med.description}</td>

            <td><a href="<c:url value='/edit/${med.id}' />" >Edit</a></td>
            <td><a href="<c:url value='/remove/${med.id}' />" >Delete</a></td>
        </tr>

        <%--        <td><a href="/edit${med.id}" >update</a></td>--%>
        <%--        <td><a href="/remove/${med.id}" >update</a></td>--%>
    </c:forEach>
    </tbody>
</table>






<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
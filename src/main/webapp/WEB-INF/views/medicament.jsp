<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Татьяна
  Date: 23.12.2019
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>Admin Page</title>
    </head>
<body>
<h1>
    Add a Medicament
</h1>

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




</body>
</html>

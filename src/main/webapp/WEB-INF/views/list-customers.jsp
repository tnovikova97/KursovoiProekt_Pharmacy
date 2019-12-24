<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type">
    <title>javaguides.net</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <%--    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>--%>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h2>CRM - Customer Relationship Manager</h2>
        <hr />

        <input type="button" value="Add Customer"
               onclick="window.location.href='showForm'; return false;"
               class="btn btn-primary" />
        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Customer List</div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>title</th>
                        <th>price</th>
                        <th>quantity</th>
                        <th>date s</th>
                        <th>date e</th>
                        <th>company</th>
                        <th>description</th>
                        <th>Action</th>
                    </tr>

                    <!-- loop over and print our customers -->
                    <c:forEach var="tempCustomer" items="${customers}">

                        <!-- construct an "update" link with customer id -->
                        <c:url var="updateLink" value="/med/updateForm">
                            <c:param name="id" value="${tempCustomer.id}" />
                        </c:url>

                        <!-- construct an "delete" link with customer id -->
                        <c:url var="deleteLink" value="/med/delete">
                            <c:param name="id" value="${tempCustomer.id}" />
                        </c:url>

                        <tr>
                            <td>${tempCustomer.title}</td>
                            <td>${tempCustomer.price}</td>
                            <td>${tempCustomer.quantity}</td>
                            <td>${tempCustomer.dateStart}</td>
                            <td>${tempCustomer.dateEnd}</td>
                            <td>${tempCustomer.company}</td>
                            <td>${tempCustomer.description}</td>

                            <td>
                                <!-- display the update link --> <a href="${updateLink}">Update</a>
                                | <a href="${deleteLink}"
                                     onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
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
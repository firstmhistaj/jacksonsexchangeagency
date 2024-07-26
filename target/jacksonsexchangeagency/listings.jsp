<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Browse Listings - Jackson's Exchange Agency</title>
    <link rel="stylesheet" type="text/css" href="resources/styles.css">
</head>
<body>
<h2>Browse Listings</h2>
<table border="1">
    <thead>
        <tr>
            <th>Item ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Owner</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${items}">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.description}</td>
                <td>${item.owner}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>

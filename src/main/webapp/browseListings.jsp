<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Browse Listings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f4f4f4;
        }
        header, footer {
            width: 100%;
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 10px 0;
        }
        nav a {
            margin: 0 10px;
            text-decoration: none;
            color: white;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .item-img {
            max-width: 100px;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Browse Listings</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        </nav>
    </header>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Condition</th>
                    <th>Owner</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>
                            <c:if test="${not empty item.photoUrl}">
                                <img src="${pageContext.request.contextPath}/${item.photoUrl}" alt="${item.name}" class="item-img"/>
                            </c:if>
                        </td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.category}</td>
                        <td>${item.condition}</td>
                        <td>${item.owner}</td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/item_details?id=${item.id}">View Details</a>
                            <a href="${pageContext.request.contextPath}/updateItemForm?id=${item.id}">Update</a>
                            <a href="${pageContext.request.contextPath}/delete_item?id=${item.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                            <a href="${pageContext.request.contextPath}/expressInterestForm?id=${item.id}">Express Interest</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 Jackson's Exchange Agency. All rights reserved.</p>
    </footer>
</body>
</html>

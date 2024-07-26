<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Details - Jackson's Exchange Agency</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        header {
            background-color: #007bff;
            color: white;
            width: 100%;
            padding: 20px;
            text-align: center;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            margin: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
        }
        p {
            color: #666;
            margin: 10px 0;
            font-size: 16px;
        }
        .item-image {
            text-align: center;
            margin: 20px 0;
        }
        .item-image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Jackson's Exchange Agency</h1>
    </header>

    <div class="container">
        <h1>${item.name}</h1>
        <p><strong>Description:</strong> ${item.description}</p>
        <p><strong>Category:</strong> ${item.category}</p>
        <p><strong>Condition:</strong> ${item.condition}</p>
        <p><strong>Owner:</strong> ${item.owner}</p>
        <div class="item-image">
            <c:if test="${not empty item.photoUrl}">
                <img src="${pageContext.request.contextPath}/${item.photoUrl}" alt="${item.name}"/>
            </c:if>
        </div>
        <a href="${pageContext.request.contextPath}/browseListings">Back to Listings</a>
    </div>

    <footer>
        <p>&copy; 2024 Jackson's Exchange Agency. All rights reserved.</p>
    </footer>
</body>
</html>

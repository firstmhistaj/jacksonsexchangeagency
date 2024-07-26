<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Respond to Exchange - Jackson's Exchange Agency</title>
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
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #007bff;
        }
        p {
            color: #333;
            margin-bottom: 20px;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        button.reject {
            background-color: #dc3545;
        }
        button.reject:hover {
            background-color: #c82333;
        }
        a {
            text-decoration: none;
            color: #007bff;
            display: block;
            margin-top: 20px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Respond to Exchange Request</h1>
        <p>Exchange ID: <c:out value="${exchange.id}" /></p>
        <p>Item : <c:out value="${exchange.itemName}" /></p>
        <p>User : <c:out value="${exchange.userName}" /></p>
        
        <form action="${pageContext.request.contextPath}/respondToExchange" method="post">
            <input type="hidden" name="exchangeId" value="${exchange.id}">
            <div class="button-container">
                <button type="submit" name="response" value="Accept">Accept</button>
                <button type="submit" name="response" value="Reject" class="reject">Reject</button>
            </div>
        </form>
        
        <a href="${pageContext.request.contextPath}/browseListings">Back to Listings</a>
    </div>
</body>
</html>

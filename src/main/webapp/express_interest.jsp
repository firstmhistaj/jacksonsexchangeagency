<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Express Interest</title>
</head>
<body>
    <h1>Express Interest in Item</h1>
    <form action="${pageContext.request.contextPath}/expressInterest" method="post">
        <input type="hidden" name="itemId" value="${item.id}">

        <p>Are you sure you want to express interest in this item?</p>
        <p>Name: ${item.name}</p>
        <p>Description: ${item.description}</p>
        <p>Category: ${item.category}</p>
        <p>Condition: ${item.condition}</p>
        <p>Owner: ${item.owner}</p>
        <img src="${pageContext.request.contextPath}/${item.photoUrl}" alt="Item Photo" width="100">
        <button type="submit">Express Interest</button>
    </form>
</body>
</html> -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Express Interest</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            display: inline-block;
        }
        p {
            margin: 10px 0;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Express Interest in Item</h1>
        <form action="${pageContext.request.contextPath}/expressInterest" method="post">
            <input type="hidden" name="itemId" value="${item.id}">
  
            <p>Are you sure you want to express interest in this item?</p>
            <p>Name: ${item.name}</p>
            <p>Description: ${item.description}</p>
            <p>Category: ${item.category}</p>
            <p>Condition: ${item.condition}</p>
            <p>Owner: ${item.owner}</p>
            <!-- Other item details here -->
            <button type="submit">Express Interest</button>
        </form>
    </div>
</body>
</html>

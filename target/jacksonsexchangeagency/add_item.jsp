<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Item</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        textarea,
        select,
        input[type="file"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .back-link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Item for Exchange</h1>
        <form action="${pageContext.request.contextPath}/add_item" method="post" enctype="multipart/form-data">
            <label for="name">Item Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value="Electronics">Electronics</option>
                <option value="Clothing">Clothing</option>
                <option value="Furniture">Furniture</option>
                <option value="Services">Services</option>
            </select>

            <label for="condition">Condition:</label>
            <input type="text" id="condition" name="condition" required />

            <label for="owner">Owner:</label>
            <input type="text" id="owner" name="owner" required />

            <label for="photo">Photo:</label>
            <input type="file" id="photo" name="photo" accept="image/*" required />

            <input type="submit" value="Add Item" />
        </form>
        <a class="back-link" href="${pageContext.request.contextPath}/browseListings">Back</a>
    </div>
</body>
</html>

<!-- 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Item</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Add New Item for Exchange</h1>
        <form action="${pageContext.request.contextPath}/classifyItem" method="post">
            <label for="name">Item Name:</label>
            <input type="text" id="name" name="name" required /><br/>

            <label for="features">Features:</label>
            <textarea id="features" name="features" required></textarea><br/>

            <input type="submit" value="Classify Item" />
        </form>
        <a href="${pageContext.request.contextPath}/browseListings">Back</a>
    </div>
</body>
</html>
 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Item - Jackson's Exchange Agency</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }
        header nav {
            margin-top: 10px;
        }
        header nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            transition: color 0.3s;
        }
        header nav a:hover {
            color: #e0e0e0;
        }
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
            margin: auto;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            width: 100%;
        }
        form p {
            margin: 10px 0;
        }
        form input[type="text"], form textarea, form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form textarea {
            resize: vertical;
            min-height: 100px;
        }
        form input[type="file"] {
            padding: 0;
        }
        form button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        form button:hover {
            background-color: #0056b3;
        }
        .photo-preview {
            margin: 10px 0;
        }
        .photo-preview img {
            max-width: 100px;
            border-radius: 4px;
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
        <nav>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/browseListings">Browse Listings</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </nav>
    </header>
    
    <div class="container">
        <h1>Update Item</h1>
        <form action="${pageContext.request.contextPath}/updateItem" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${item.id}">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" value="${item.name}" required>
            </p>
            <p>
                <label for="description">Description:</label><br>
                <textarea id="description" name="description" required>${item.description}</textarea>
            </p>
            <p>
                <label for="category">Category:</label><br>
                <input type="text" id="category" name="category" value="${item.category}" required>
            </p>
            <p>
                <label for="condition">Condition:</label><br>
                <input type="text" id="condition" name="condition" value="${item.condition}" required>
            </p>
            <p>
                <label for="owner">Owner:</label><br>
                <input type="text" id="owner" name="owner" value="${item.owner}" required>
            </p>
            <p>
                <label for="photo">Photo:</label><br>
                <input type="file" id="photo" name="photo"><br>
                <span>Current Photo:</span><br>
                <div class="photo-preview">
                    <img src="${pageContext.request.contextPath}/${item.photoUrl}" alt="Item Photo">
                </div>
            </p>
            <input type="hidden" name="existingPhotoUrl" value="${item.photoUrl}">
            <button type="submit">Update Item</button>
        </form>
    </div>
    
    <footer>
        <p>&copy; 2024 Jackson's Exchange Agency. All rights reserved.</p>
    </footer>
</body>
</html>

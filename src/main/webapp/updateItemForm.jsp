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
            margin: 20px auto;
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
        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        form input[type="text"], form textarea, form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        form textarea {
            resize: vertical;
            min-height: 100px;
        }
        form input[type="file"] {
            padding: 5px 0;
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
            margin-top: 10px;
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
        @media (max-width: 768px) {
            header nav {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            header nav a {
                margin: 5px 0;
            }
            .container {
                width: 100%;
                padding: 15px;
                box-shadow: none;
            }
            form {
                width: 100%;
            }
            form p {
                margin: 5px 0;
            }
        }
        @media (max-width: 480px) {
            header {
                padding: 15px;
            }
            header h1 {
                font-size: 24px;
            }
            header nav a {
                font-size: 14px;
            }
            form label, form input[type="text"], form textarea, form select, form button {
                font-size: 14px;
            }
            form button {
                padding: 8px 16px;
            }
            .photo-preview img {
                max-width: 80px;
            }
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
        <form action="${pageContext.request.contextPath}/updateItemForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${item.id}">
            <p>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${item.name}" required>
            </p>
            <p>
                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${item.description}</textarea>
            </p>
            <p>
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" value="${item.category}" required>
            </p>
            <p>
                <label for="condition">Condition:</label>
                <input type="text" id="condition" name="condition" value="${item.condition}" required>
            </p>
            <p>
                <label for="owner">Owner:</label>
                <input type="text" id="owner" name="owner" value="${item.owner}" required>
            </p>
            <p>
                <label for="photo">Photo:</label>
                <input type="file" id="photo" name="photo">
                <span>Current Photo:</span>
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

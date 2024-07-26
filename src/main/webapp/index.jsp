<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jackson's Exchange Agency</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #343a40;
        }
        header {
            background-color: #212529;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        nav {
            background-color: #343a40;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin: 0;
        }
        nav ul li a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            transition: background-color 0.3s;
        }
        nav ul li a:hover {
            background-color: #495057;
        }
        .hero {
            background: url('${pageContext.request.contextPath}/resources/images/hero-bg.jpg') no-repeat center center/cover;
            color: white;
            text-align: center;
            padding: 150px 20px;
            position: relative;
        }
        .hero::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }
        .hero h1, .hero p {
            position: relative;
            z-index: 2;
        }
        .hero h1 {
            font-size: 4em;
            margin: 0;
        }
        .hero p {
            font-size: 1.5em;
            margin: 20px 0 0;
        }
        .search-bar {
            margin: -40px auto 20px;
            max-width: 800px;
            text-align: center;
        }
        .search-bar input[type="text"] {
            width: 70%;
            padding: 15px;
            font-size: 1.2em;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-bar button {
            padding: 15px 30px;
            font-size: 1.2em;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }
        .categories {
            display: flex;
            justify-content: space-around;
            margin: 40px auto;
            max-width: 1200px;
        }
        .category {
            text-align: center;
            padding: 20px;
            flex: 1;
            transition: transform 0.3s;
        }
        .category img {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .category h3 {
            margin-top: 10px;
            color: #343a40;
        }
        .category:hover {
            transform: translateY(-10px);
        }
        .featured-products {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .featured-products h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: 700;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .product {
            background: #fff;
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: calc(33.333% - 40px);
            box-sizing: border-box;
            transition: box-shadow 0.3s, transform 0.3s;
        }
        .product:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-10px);
        }
        .product img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .product h3 {
            color: #007bff;
            font-weight: 700;
        }
        .product p {
            color: #666;
        }
        footer {
            background-color: #212529;
            color: white;
            text-align: center;
            padding: 20px 10px;
            margin-top: 40px;
        }
        footer a {
            color: #007bff;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Jackson's Exchange Agency</h1>
        <p>Your one-stop shop for exchanging quality items</p>
    </header>
    
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/register.jsp">Register</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/browseListings">Browse Listings</a></li>
            <li><a href="${pageContext.request.contextPath}/add_item.jsp">Add New Item</a></li>
            <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/predict">Prediction</a></li>
        </ul>
    </nav>
    
    <div class="hero">
        <h1>Find Your Next Favorite Item</h1>
        <p>Browse our diverse selection and exchange items with ease.</p>
    </div>
    
    <div class="search-bar">
        <form action="${pageContext.request.contextPath}/predict" method="get">
            <input type="text" name="query" placeholder="Search for items...">
            <button type="submit">Search</button>
        </form>
    </div>
    
    <div class="categories">
        <div class="category">
            <img src="${pageContext.request.contextPath}/resources/images/electronics.jpg" alt="Electronics">
            <h3>Electronics</h3>
        </div>
        <div class="category">
            <img src="${pageContext.request.contextPath}/resources/images/clothing.jpg" alt="Clothing">
            <h3>Clothing</h3>
        </div>
        <div class="category">
            <img src="${pageContext.request.contextPath}/resources/images/furniture.jpg" alt="Furniture">
            <h3>Furniture</h3>
        </div>
    </div>
    
    <div class="featured-products">
        <h2>Featured Products</h2>
        <div class="products">
            <div class="product">
                <img src="${pageContext.request.contextPath}/resources/images/product1.jpg" alt="Product 1">
                <h3>Product 1</h3>
                <p>Description of product 1.</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/resources/images/product2.jpg" alt="Product 2">
                <h3>Product 2</h3>
                <p>Description of product 2.</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/resources/images/product3.jpg" alt="Product 3">
                <h3>Product 3</h3>
                <p>Description of product 3.</p>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2024 Jackson's Exchange Agency. All rights reserved.</p>
        <p><a href="${pageContext.request.contextPath}/privacy.jsp">Privacy Policy</a> | <a href="${pageContext.request.contextPath}/terms.jsp">Terms of Service</a></p>
        <a href="${pageContext.request.contextPath}/item_details?id=${item.id}">View Details</a>
    </footer>
</body>
</html>

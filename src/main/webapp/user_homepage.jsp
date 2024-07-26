<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.jacksonsexchangeagency.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Homepage - Jackson's Exchange Agency</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            color: #666;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
        }
        .user-info {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .user-info img {
            border-radius: 50%;
            margin-right: 20px;
            width: 100px;
            height: 100px;
        }
        .user-stats, .recent-activities, .quick-links, .recommendations, .notifications {
            margin-bottom: 20px;
        }
        .user-stats, .recent-activities, .quick-links, .recommendations, .notifications {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
        }
        .user-stats h2, .recent-activities h2, .quick-links h2, .recommendations h2, .notifications h2 {
            color: #007bff;
            margin-top: 0;
        }
        .notification-item, .activity-item, .recommendation-item, .quick-link {
            margin: 10px 0;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: white;
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
        <div class="user-info">
            <img src="${pageContext.request.contextPath}/resources/images/profile-pic.jpg" alt="Profile Picture">
            <div>
                <h1>Welcome, <c:out value="${user.fullname}" />!</h1>
                <p>This is your homepage. Here you can manage your listings, browse other items, and update your profile.</p>
            </div>
        </div>

        <div class="user-stats">
            <h2>Your Statistics</h2>
            <p><strong>Items Listed:</strong> 10</p>
            <p><strong>Items Sold:</strong> 5</p>
            <p><strong>Active Exchanges:</strong> 3</p>
        </div>

        <div class="recent-activities">
            <h2>Recent Activities</h2>
            <div class="activity-item">
                <p><strong>Added a new item:</strong> "Vintage Camera" on July 22, 2024</p>
            </div>
            <div class="activity-item">
                <p><strong>Updated profile:</strong> Changed profile picture on July 20, 2024</p>
            </div>
            <!-- Add more recent activities as needed -->
        </div>

        <div class="quick-links">
            <h2>Quick Links</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/manageListings">Manage Your Listings</a></li>
                <li><a href="${pageContext.request.contextPath}/viewMessages">View Messages</a></li>
                <li><a href="${pageContext.request.contextPath}/notifications">Notifications</a></li>
                <li><a href="${pageContext.request.contextPath}/settings">Account Settings</a></li>
            </ul>
        </div>

        <div class="recommendations">
            <h2>Recommended For You</h2>
            <div class="recommendation-item">
                <p><strong>Item:</strong> "Leather Jacket"</p>
                <p><a href="${pageContext.request.contextPath}/item_details?id=123">View Details</a></p>
            </div>
            <div class="recommendation-item">
                <p><strong>Item:</strong> "Smartwatch"</p>
                <p><a href="${pageContext.request.contextPath}/item_details?id=456">View Details</a></p>
            </div>
            <!-- Add more recommendations as needed -->
        </div>

        <div class="notifications">
            <h2>Notifications</h2>
            <div class="notification-item">
                <p><strong>New message:</strong> You have a new message from User123.</p>
                <p><a href="${pageContext.request.contextPath}/viewMessages">View Messages</a></p>
            </div>
            <div class="notification-item">
                <p><strong>Item update:</strong> "Vintage Camera" has been approved.</p>
            </div>
            <!-- Add more notifications as needed -->
        </div>

        <ul>
            <li><a href="${pageContext.request.contextPath}/browseListings">Browse Listings</a></li>
            <li><a href="${pageContext.request.contextPath}/add_item.jsp">Add New Item</a></li>
            <li><a href="${pageContext.request.contextPath}/update_profile.jsp">Update Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        </ul>
    </div>
    
    <footer>
        <p>&copy; 2024 Jackson's Exchange Agency. All rights reserved.</p>
    </footer>
</body>
</html>

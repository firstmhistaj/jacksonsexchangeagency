<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classification Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        p {
            font-size: 1.2em;
            color: #666;
            text-align: center;
        }
        .result {
            font-size: 1.5em;
            color: #333;
            text-align: center;
            margin: 20px 0;
        }
        .button {
            display: block;
            width: 50%;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Classification Result</h1>
        <p class="result">Predicted Category: ${predictedCategory}</p>
        <a href="form.jsp" class="button">Classify Another Item</a>
    </div>
</body>
</html>

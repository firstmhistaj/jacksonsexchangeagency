<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Item Category Prediction</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: auto;
            overflow: hidden;
        }
        #main-header {
            background-color: #333;
            color: #fff;
            padding-top: 30px;
            min-height: 70px;
            border-bottom: #77aaff 3px solid;
        }
        #main-header h1 {
            text-align: center;
            text-transform: uppercase;
            margin: 0;
            font-size: 24px;
        }
        form {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            border: #ccc 1px solid;
        }
        form label {
            display: block;
            margin: 5px 0 5px;
        }
        form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
        }
        form input[type="submit"] {
            display: block;
            width: 100%;
            background: #333;
            color: #fff;
            border: 0;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        form input[type="submit"]:hover {
            background: #555;
        }
    </style>
</head>
<body>
    <header id="main-header">
        <div class="container">
            <h1>Search Item Category</h1>
        </div>
    </header>
    <div class="container">
        <form action="predict" method="post">
            <label for="brand">Brand:</label>
            <select name="brand" id="brand">
                <option value="">Select Brand</option>
                <option value="Apple">Apple</option>
                <option value="Nike">Nike</option>
                <option value="IKEA">IKEA</option>
                <option value="Sony">Sony</option>
                <option value="DFS">DFS</option>
                <option value="Samsung">Samsung</option>
                <option value="Next">Next</option>
                <option value="None">None</option>
            </select>

            <label for="ram">RAM:</label>
            <select name="ram" id="ram">
                <option value="">Select RAM</option>
                <option value="8">8</option>
                <option value="6">6</option>
                <option value="3">3</option>
                <option value="None">None</option>
            </select>

            <label for="model">Model:</label>
            <select name="model" id="model">
                <option value="">Select Model</option>
                <option value="iPhone_X">iPhone_X</option>
                <option value="PlayStation_5">PlayStation_5</option>
                <option value="S20">S20</option>
                <option value="S10">S10</option>
                <option value="None">None</option>
            </select>

            <label for="size">Size:</label>
            <select name="size" id="size">
                <option value="">Select Size</</option>
                <option value="Small">Small</option>
                <option value="Medium">Medium</option>
                <option value="Large">Large</option>
                <option value="7">7</option>
                <option value="None">None</option>
            </select>

            <label for="type">Type:</label>
            <select name="type" id="type">
                <option value="">Select Type</option>
                <option value="Sofa">Sofa</option>
                <option value="Bookcase">Bookcase</option>
                <option value="Chair">Chair</option>
                <option value="None">None</option>
            </select>

            <label for="colour">Colour:</label>
            <select name="colour" id="colour">
                <option value="">Select Colour</option>
                <option value="Silver">Silver</option>
                <option value="Black">Black</option>
                <option value="Brown">Brown</option>
                <option value="Gold">Gold</option>
                <option value="White">White</option>
                <option value="Green">Green</option>
                <option value="Blue">Blue</option>
                <option value="None">None</option>
            </select>

            <input type="submit" value="Predict">
        </form>
    </div>
</body>
</html>
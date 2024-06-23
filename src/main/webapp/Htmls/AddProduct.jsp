<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .form_container {
            max-width: 500px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-top: 10px;
            font-size:20px;
        }
        input[type="text"], input[type="submit"] {
            width: 80%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
        	width:60%;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<div class="form_container">
	<h1>Add Product</h1>
    <form action="/CourseWork/AddProductServlet" method="post">
        <label for="productName">Product Name:</label><br>
        <input type="text" id="productName" name="productName"><br>
        <label for="price">Price:</label><br>
        <input type="text" id="price" name="price"><br>
        <label for="quantity">Quantity:</label><br>
        <input type="text" id="quantity" name="quantity"><br><br>
        <label for="productImage">Product Image:</label><br>
        <input type="file" id="productImage" name="productImage"><br><br>
        <label for="description">Description:</label><br>
        <input type="text" id="description" name="description"><br><br>
        <input type="submit" value="Add Product">
        
    </form>
    </div>
</body>
</html>
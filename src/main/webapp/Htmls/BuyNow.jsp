<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Purchase Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        p {
            color: #333;
            font-size: 20px;
        }
        .btn {
            background-color: #4CAF50;
            color: #fff;
            font-size: 20px;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank you for your purchase!</h1>
        <p>Your order has been successfully placed.</p>
        <a href="/CourseWork/Htmls/Home.jsp" class="btn">Continue Shopping</a>
    </div>
</body>
</html>
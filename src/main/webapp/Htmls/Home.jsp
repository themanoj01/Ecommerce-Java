<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="/CourseWork/CSS/Home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

    <div class="videos">
        <video autoplay loop><source src="/CourseWork/image/large.mp4" type="video/mp4"></video>
        <div class="hero">
            <h2 style="font-size: 2.5rem; margin-bottom: 15px;">Enjoy with apple</h2>
            <p style="margin-bottom: 15px; text-align: justify;"> From powerful iPhones to sleek MacBooks, explore a world where creativity meets functionality. Elevate your digital experience and embrace the future with style.</p>
            <button><a href="#catagories">Shop Now</a></button>
        </div>
    </div>

    <section class="catagories-section">
        <div class="catagories" id="catagories">
            <div class="card">
                <a href="/CourseWork/ProductServlet?productName=mac"><img src="/CourseWork/devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
            </div>
            <div class="card">
                <a href="/CourseWork/ProductServlet?productName=iphone"><img src="/CourseWork/devices/Phone/Iphone 15 pro max.png" alt="error"></a>
            </div>
            <div class="card">
                <a href="/CourseWork/ProductServlet?productName=watch"><img src="/CourseWork/devices/Watch/Apple watch se.png" alt="error"></a>
            </div>
            <div class="card">
                <a href="/CourseWork/ProductServlet?productName=airpod"><img src="/CourseWork/devices/Earpods/AirPods (3rd generation).jpeg" alt="error"></a>
            </div>
        </div>
    </section>

    <!-- <section class="top-featured">
        <h1>Top Featured</h1>
        <div class="scroll">
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        <a href="#"><img src="devices/Laptop/mac pro 16 inch.jfif" alt="error"></a>
        </div>
    </section> -->

    <h1 style="margin-left: 110px; margin-top: 70px;">Just For You</h1>

    <section class="top-card">
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Phone/iphone 15.png" alt="">
            </div>
            <div class="card-details">
                <h2>Iphone 15</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 15">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Laptop/mac13 air m3 15 inch.png" alt="error">
            </div>
            <div class="card-details">
                <h2>Mac M3 15 inch</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook Air M3 15-inch">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Watch/Apple watch hermes.jfif" alt="">
            </div>
            <div class="card-details">
                <h2>Watch hermes</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch hermes">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Earpods/AirPods (3rd generation).jpeg" alt="">
            </div>
            <div class="card-details">
                <h2>Earpods 3rd gen </h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=AirPods 3rd Gen">Buy Now</a></button>
            </div>
        </div>

        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Phone/Iphone 13.png" alt="">
            </div>
            <div class="card-details">
                <h2>Iphone 13</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Iphone 13">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Laptop/mac13 air m2 13 inch.png" alt="error">
            </div>
            <div class="card-details">
                <h2>Mac M2 13 inch</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=MacBook air m2 13-inch">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Watch/Apple watch ultra 2.jfif" alt="">
            </div>
            <div class="card-details">
                <h2>Watch Ultra 2</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Apple Watch Ultra 2">Buy Now</a></button>
            </div>
        </div>
        <div class="bigcard">
            <div class="card-img">
                <img src="/CourseWork/devices/Earpods/AirPods Pro (2nd generation).jfif" alt="">
            </div>
            <div class="card-details">
                <h2>Earpods 2nd gen</h2>
                <button><a href="/CourseWork/Htmls/ProductDetail.jsp?productName=Airpods pro 2nd Gen">Buy Now</a></button>
            </div>
        </div>
    </section>

    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="index.js"></script>
</body>
</html>
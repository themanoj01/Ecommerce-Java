<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About us</title>
<link rel="stylesheet" href="/CourseWork/CSS/AboutUS.css">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute("ReviewMessage");
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:red; font-weigth: 100; font-size:1.5rem;"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>

	<div class="containers">
    <h1>Get to know us</h1>
    <p>Welcome to AppleHub, your ultimate destination for all Apple products!

        At AppleHub, we're passionate about providing you with the latest and greatest Apple products, along with exceptional customer service and support. Whether you're looking for the newest iPhone, MacBook, iPad, or Apple Watch, we've got you covered.</p>
        <img src="/CourseWork/image/whyus.jpg" alt="error loading" width="auto" height="500px">
    <div class="mission">
      <h2>Our Mission</h2>
      <p>
        Our mission is to bring all the Apple products to customers around the world.
        We strive to offer an unparalleled shopping experience that's as seamless and enjoyable as using your favorite Apple device.
      </p>
    </div>
    <div class="why_us">
      <h2>Why to choose us?</h2>
      <ul>
        <li><span class="points">Authorized Apple Reseller:</span> As an authorized Apple reseller, we guarantee the authenticity and quality of all our products.
         Shop with confidence knowing that you're getting genuine Apple products backed by Apple's warranty and support.</li>
        <li><span class="points">Wide Selection:</span> From the latest iPhone models to Mac computers and accessories, we have a wide range of Apple products to suit every need and budget.
         Explore our catalog and discover the perfect device for you.</li>
        <li><span class="points">Fast Delivery:</span> We aim to please our customers with fast shipping and easy tracking system.</li>
        <li><span class="points">Best Prices:</span> We guarantee authentic products with best deals just for you.</li>
        <li><span class="points">24/7 exceptional customer support and service:</span> We are pleased to inform you that Our team of Apple enthusiasts are here to assist you in every step of the way.
             Whether you need help choosing the right product or troubleshooting technical issues with products, we're always ready to lend a helping hand.</li>
        </ul>
    </div>
    <div class="story">
      <h2>Our Story</h2>
      <p>
        At AppleHub, our story begins with a passion for innovation and a commitment to excellence. Founded in 2022, we set out on a mission to revolutionize the way people experience technology.
         From our humble beginnings in a small shop to becoming a leading provider of Apple products worldwide, our journey has been nothing short of remarkable.
         Driven by quality and innovation, we have continuously pushed the boundaries of what's possible. Our dedication to offering authentic Apple products, paired with exceptional customer service,
          has earned us the trust and loyalty of customers around the globe.
        We already have served thousands of customers and offering hundreds of products through our platform. Every product we sell inspires us to be better and better everyday.
        With a commitment to innovation and a passion for excellence, we are ready to shape the future of technology especially Apple products.
      </p>
    </div>
    <h2>Meet Our Team</h2>
    <div class="team">
      <div class="member">
        <img src="/CourseWork/image/Sujal.png"/>
        <h3>Sujal Shrestha</h3>
        <h4>Backend developer</h4>
      </div>
      <div class="member">
        <img src="/CourseWork/photos/manoj.jpg" />
        <h3>Manoj Poudel</h3>
        <h4>Database Administrator</h4>
      </div>
      <div class="member">
        <img src="/CourseWork/image/pragati.png" />
        <h3>Pragati Kunwar Chhetri</h3>
        <h4>Frontend Developer</h4>
      </div>
      <div class="member">
        <img src="/CourseWork/image/utsav.png" />
        <h3>Utsav Bajracharya</h3>
        <h4>UI/UX Designer</h4>
      </div>
      <div class="member">
        <img src="/CourseWork/image/darsan.png" />
        <h3>Darshan Mainali</h3>
        <h4>Social Media Manager</h4>
      </div>
    </div>
    <div class="contact">
        <h2>Contact Us</h2>
        <p>Have questions or need assistance? We're here to help! Reach out to our customer support team via email or give us a call. 
        We're available Sunday through Friday, 9:00 AM to 5:00 PM.</p>
        <p>Email: applehub@gmail.com</p>
        <p>Phone: 01 7845360</p>
        <p>Follow us on</p>
        <div class="social-links">
            <a href="https://www.facebook.com/manoj.poudel.58910" target="_blank"
              ><i class="fab fa-facebook"></i
            ></a>
            <a href="https://www.instagram.com/manoj_poudel01" target="_blank"
              ><i class="fab fa-instagram"></i
            ></a>
            <a href="https://twitter.com/ManojPo23806280" target="_blank"
              ><i class="fab fa-twitter"></i
            ></a>
            <a
              href="https://www.linkedin.com/in/manoj-poudel-621749259"
              target="_blank"
              ><i class="fab fa-linkedin"></i
            ></a>
            </div>
        <h2>Get in touch</h2>
        <form action="/CourseWork/ReviewServlet" method="post">
            <div class="form">
              <div class="details">
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" required />
              </div>
              <div class="details">
                <label for="email">Email Id:</label>
                <input type="email" id="email" name="email" required />
              </div>
              <div class="details">
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required />
              </div>
              <div class="details">
                <label for="message">Your Message:</label>
                <textarea
                  id="message"
                  name="message"
                  rows="6"
                  required
                ></textarea>
              </div>
              <button type="submit" name="submit">Submit</button>
              </div>
            </form>
          </div>
	</div>
	
	
	
	<jsp:include page="Footer.jsp"></jsp:include>

	
	
</body>
</html>
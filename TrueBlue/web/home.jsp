<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    // Retrieve the username from the session
    String username = (String) session.getAttribute("name");
    if (username == null || username.isEmpty()) {
        username = "Guest"; // Fallback if the user is not logged in
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue | Supplement Authentication</title>
    <style>
        /* General Styles */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #1a1a1d; /* Dark grey background */
            color: #fff;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #3330ef; /* Dark Blue */
            padding: 20px 40px;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #ffffff;
        }

        .nav-links {
            list-style-type: none;
            display: flex;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #cccccc;
        }

        /* User Greeting and Admin Button */
        .user-admin-container {
            display: flex;
            align-items: center;
        }

        .user-greeting, .admin-button {
            background-color: white; /* White background */
            color: #3330ef; /* Blue text */
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            margin-left: 10px; /* Reduced margin to bring elements closer */
            align-self: center;
            display: inline-block;
            cursor: pointer;
            border: none;
        }

        .admin-button {
            margin-left: 5px; /* Adjusted margin for the admin button */
        }

        /* Hero Section */
        .hero {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 80px 40px;
            background-color: #262626;
        }

        .hero-content {
            max-width: 600px;
        }

        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .hero-content p {
            font-size: 20px;
            margin-bottom: 30px;
            color: #cccccc;
        }

        .cta-btn {
            background-color: #3330ef;
            color: #ffffff;
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 15px;
        }

        .cta-btn:hover {
            background-color: #004080;
        }

        /* CTA Button Link */
        .cta-link {
            text-decoration: none; /* Remove underline from the link */
        }

        .cta-link .cta-btn {
            display: inline-block; /* Ensure the button aligns properly */
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
        }

        /* Supplement Section */
        .supplement-section {
            padding: 50px 40px;
            background-color: #1a1a1d;
        }

        .supplement-section h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .supplement-section p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #cccccc;
        }

        /* Certified Brands Section */
        .brands-section {
            padding: 50px 40px;
            background-color: #262626;
        }

        .brands-section h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .brands-section p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #cccccc;
        }

        /* Get Certified Section */
        .certification-section {
            padding: 50px 40px;
            background-color: #1a1a1d;
        }

        .certification-section h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .certification-section p {
            font-size: 18px;
            margin-bottom: 30px;
            color: #cccccc;
        }

        /* Footer */
        .footer {
            background-color: #3330ef;
            padding: 20px 40px;
            text-align: center;
        }

        .footer-content p {
            color: #cccccc;
        }

        .social-links {
            list-style-type: none;
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .social-links li {
            margin: 0 10px;
        }

        .social-links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: #cccccc;
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <nav class="navbar">
        <div class="logo"> 
            <h1>T<span>r</span>u<span>e</span>B<span>l</span>u<span>e</span>.<span></span></h1>
        </div>
        <ul class="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="Supplement.jsp">Supplement</a></li>
            <li><a href="Certify_Brands.jsp">Certified Brands</a></li>
            <li><a href="Vote_Your_Product.jsp">Vote Your Product</a></li>
            <li><a href="Get_Certified.jsp">Get Certified</a></li>
            <li><a href="Shop.jsp">Shop</a></li>
        </ul>
        
        <div class="user-admin-container">
            <span class="user-greeting">Hi, <%= username %></span>
            <a href="logout.jsp" class="cta-link">
                <button class="admin-button">Logout</button>
            </a>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-content">
            <h1>Authenticate Your Supplements with T<span>r</span>u<span>e</span>B<span>l</span>u<span>e</span>.<span></span></h1>
            <p>Ensuring the quality and authenticity of the supplements you trust.</p>
            <a>
                <button class="cta-btn">USE CODE: TRUEBLUE</button>
            </a>
        </div>
        <div class="hero-image">
            <img src="img/background.png" alt="Supplements Hero Image">
        </div>
    </header>

    <!-- Supplement Section -->
    <section class="supplement-section" id="start">
        <h2>Supplement Information</h2>
        <p>This page is designed to provide comprehensive information about various types of supplements. You can learn about the benefits, usage, and how each type of supplement can support your health and fitness goals. Whether you're looking for protein to build muscle, creatine to enhance performance, or vitamins to boost your immune system, this section has the details you need.</p>
        <a href="Supplement.jsp" class="cta-link">
            <button class="cta-btn">View Supplements</button>
        </a>
    </section>

    <!-- Certified Brands Section -->
    <section class="brands-section">
        <h2>Certified Brands</h2>
        <p>Brands listed here have been authorized by TrueBlue. Their products undergo rigorous testing to meet high standards, with lab reports ensuring authenticity and quality. TrueBlue ensures that certified brands adhere to strict standards for purity and sourcing, giving you confidence in the supplements you choose. When you see the TrueBlue certification, you know you're getting a product that has been verified for its quality and safety.</p>
        <a href="Certify_Brands.jsp" class="cta-link">
            <button class="cta-btn">View Certified Brands</button>
        </a>
    </section>
    
    <!-- Vote Your Product Section -->
    <section class="certification-section">
        <h2>Vote Your Product</h2>
        <p>In this section, users can vote on categories of supplements. This helps us determine which supplements should be prioritized for certification based on public demand. Your input helps shape the future of our certified products. By voting, you can influence which brands and products undergo our certification process, ensuring that the supplements you care about meet the highest standards.</p>
        <a href="Vote_Your_Product.jsp" class="cta-link">
            <button class="cta-btn">Vote Your Product</button>
        </a>
    </section>

    <!-- Get Certified Section -->
    <section class="certification-section">
        <h2>Get Certified</h2>
        <p>Manufacturers or brands can get certified by TrueBlue. We take samples from the marketplace to maintain transparency and test products in European laboratories. This process ensures that only the highest quality products receive our certification. Brands interested in certification can fill out the certification form, and our team will guide them through the process to ensure their products meet our stringent standards.</p>
        <a href="Get_Certified.jsp" class="cta-link">
            <button class="cta-btn">Get Certified</button>
        </a>
    </section>
    
    <!-- Shop Section -->
    <section class="certification-section">
        <h2>Shop Here</h2>
        <p>We don't sell products directly on this site. Instead, we provide a code (TrueBlue) that you can use to purchase products from their original websites. When you use our code, we will redirect you to the official websites of the brands we certify, ensuring you get authentic products. This approach allows us to maintain transparency and ensure that you receive the highest quality supplements directly from the source.</p>
        <a href="Shop.jsp" class="cta-link">
            <button class="cta-btn">Shop</button>
        </a>
    </section>

     <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 TrueBlue. All Rights Reserved.</p>
            <ul class="social-links">
                <li><a href="https://facebook.com">Facebook</a></li>
                <li><a href="https://twitter.com">Twitter</a></li>
                <li><a href="https://instagram.com">Instagram</a></li>
                <li><a href="https://linkedin.com">LinkedIn</a></li>
                <li><a href="https://youtube.com">YouTube</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>
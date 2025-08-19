<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue | Pass/Fail Evaluation</title>
    <style>
        /* Pass/Fail Section */
        .pass-fail-section {
            margin: 40px 0;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
        }

        .pass-fail-section h2 {
            font-size: 28px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 20px;
        }

        .product-evaluation {
            margin: 20px 0;
        }

        .product-evaluation h3 {
            font-size: 24px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 10px;
        }

        .product-evaluation p {
            font-size: 16px;
            color: #666;
            margin-bottom: 10px;
        }

        .evaluation-options {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .evaluation-options input[type="radio"] {
            margin-right: 10px;
        }

        .evaluation-options label {
            font-size: 16px;
            color: #333;
            margin-right: 20px;
        }

        .cta-btn {
            background-color: #3330ef; /* Blue shade */
            color: #ffffff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .cta-btn:hover {
            background-color: #2c2bcb;
        }

        /* General Styles */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #1a1a1d; /* Light grey background */
            color: #333;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #3330ef; /* Blue shade */
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

        .register-btn {
            background-color: #ffffff;
            color: #3330ef; /* Blue shade */
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .register-btn:hover {
            background-color: #f0f0f0;
        }

        /* Main Content */
        .main-content {
            padding: 50px 40px;
        }

        /* Intro Section */
        .intro {
            text-align: center;
            margin-bottom: 40px;
        }

        .intro h1 {
            font-size: 36px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 20px;
        }

        .intro p {
            font-size: 18px;
            color: #666;
        }

        /* Footer */
        .footer {
            background-color: #3330ef; /* Blue shade */
            padding: 20px 40px;
            text-align: center;
        }

        .footer-content {
            color: #ffffff;
        }

        .social-links {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-links li {
            font-size: 18px;
        }

        .social-links a {
            color: #ffffff;
            text-decoration: none;
        }

        .social-links a:hover {
            color: #cccccc;
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <nav class="navbar">
        <div class="logo">TrueBlue</div>
        <ul class="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="Supplement.jsp">Supplement</a></li>
            <li><a href="Certify_Brands.jsp">Certified Brands</a></li>
            <li><a href="Vote_Your_Product.jsp">Vote Your Product</a></li>
            <li><a href="Pass_Fail.jsp">Pass/Fail</a></li>
            <li><a href="Get_Certified.jsp">Get Certified</a></li>
            <li><a href="Shop.jsp">Shop</a></li>
        </ul>
        <a href="supplement.jsp" class="register-link">
            <button class="register-btn" style="font-size:medium; font-weight:bold; border-radius:10px;">Supplement</button>
        </a>
    </nav>

    <!-- Main Content Section -->
    <main class="main-content">
        <section class="intro">
            <h1>Pass/Fail Evaluation</h1>
            <p style="color:white;">Evaluate and vote on whether the following products should pass or fail based on their quality and effectiveness.</p>
        </section>

        <!-- Pass/Fail Form -->
        <section class="pass-fail-section">
            <h2>Product Evaluations</h2>
            <form id="pass-fail-form">
                <div class="product-evaluation">
                    <h3>Whey Protein</h3>
                    <p>Proteins are vital for muscle repair and growth. They come in various forms such as whey, casein, and plant-based proteins.</p>
                    <div class="evaluation-options">
                        <input type="radio" id="whey-pass" name="whey" value="pass">
                        <label for="whey-pass">Pass</label>
                        <input type="radio" id="whey-fail" name="whey" value="fail">
                        <label for="whey-fail">Fail</label>
                    </div>
                </div>
                <div class="product-evaluation">
                    <h3>Creatine</h3>
                    <p>Creatine enhances strength and performance in high-intensity workouts. Discover the different forms of creatine, including monohydrate and micronized.</p>
                    <div class="evaluation-options">
                        <input type="radio" id="creatine-pass" name="creatine" value="pass">
                        <label for="creatine-pass">Pass</label>
                        <input type="radio" id="creatine-fail" name="creatine" value="fail">
                        <label for="creatine-fail">Fail</label>
                    </div>
                </div>
                <div class="product-evaluation">
                    <h3>BCAAs</h3>
                    <p>Branched-Chain Amino Acids (BCAAs) aid in muscle recovery and reduce exercise-induced fatigue.</p>
                    <div class="evaluation-options">
                        <input type="radio" id="bcaas-pass" name="bcaas" value="pass">
                        <label for="bcaas-pass">Pass</label>
                        <input type="radio" id="bcaas-fail" name="bcaas" value="fail">
                        <label for="bcaas-fail">Fail</label>
                    </div>
                </div>
                <div class="product-evaluation">
                    <h3>Multivitamins</h3>
                    <p>Multivitamins provide essential vitamins and minerals to support overall health.</p>
                    <div class="evaluation-options">
                        <input type="radio" id="multivitamins-pass" name="multivitamins" value="pass">
                        <label for="multivitamins-pass">Pass</label>
                        <input type="radio" id="multivitamins-fail" name="multivitamins" value="fail">
                        <label for="multivitamins-fail">Fail</label>
                    </div>
                </div>
                <div class="product-evaluation">
                    <h3>Omega-3</h3>
                    <p>Omega-3s are healthy fats that are important for building brain cells and heart health.</p>
                    <div class="evaluation-options">
                        <input type="radio" id="omega3-pass" name="omega3" value="pass">
                        <label for="omega3-pass">Pass</label>
                        <input type="radio" id="omega3-fail" name="omega3" value="fail">
                        <label for="omega3-fail">Fail</label>
                    </div>
                </div>
                <button type="submit" class="cta-btn">Submit Evaluation</button>
            </form>
        </section>
    </main>

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
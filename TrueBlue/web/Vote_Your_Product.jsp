<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue | Vote for Upcoming Products</title>
    <style>
        /* General Styles */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #1a1a1d; /* Dark background */
            color: #ffffff;
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
            border-radius: 5px;
        }

        .register-btn:hover {
            background-color: #e0e0e0;
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
            color: #ffffff;
        }

        /* Vote Section */
        .vote-section {
            margin: 40px 0;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
        }

        .vote-section h2 {
            font-size: 28px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 20px;
        }

        .product-option {
            margin: 10px 0;
            text-align: left;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }

        .product-option label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        .product-option select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
        }

        .cta-btn {
            background-color: #3330ef; /* Blue shade */
            color: #ffffff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
            margin-top: 20px;
        }

        .cta-btn:hover {
            background-color: #2c2bcb;
        }

        /* Footer */
        .footer {
            background-color: #3330ef; /* Blue shade */
            padding: 20px 40px;
            text-align: center;
            margin-top: 40px;
        }

        .footer-content {
            color: #ffffff;
        }

        .social-links {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
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
            <li><a href="Get_Certified.jsp">Get Certified</a></li>
            <li><a href="Shop.jsp">Shop</a></li>
        </ul>
        <a href="#" class="register-link">
            <button class="register-btn" style="font-size:medium; font-weight:bold; border-radius:10px;">Vote Your Product</button>
        </a>
    </nav>

    <!-- Main Content Section -->
    <main class="main-content">
        <section class="intro">
            <h1>Vote for Upcoming Products</h1>
            <p>Help us decide which products should be featured next! Vote for your favorite upcoming supplement.</p>
        </section>

        <!-- Voting Form -->
        <section class="vote-section">
            <h2>Upcoming Products</h2>
            <form id="vote-form" action="submit_vote.jsp" method="post">
                <div class="product-option">
                    <label for="wheyProtein">Whey Protein</label>
                    <select id="wheyProtein" name="wheyProtein">
                        <option value="">Select which Whey Protein you want to certify</option>
                        <option value="Optimum Nutrition Gold Standard">Optimum Nutrition Gold Standard</option>
                        <option value="MuscleTech NitroTech">MuscleTech NitroTech</option>
                        <option value="Dymatize ISO 100">Dymatize ISO 100</option>
                        <option value="Cellucor COR-Performance">Cellucor COR-Performance</option>
                        <option value="Six Star Pro Nutrition">Six Star Pro Nutrition</option>
                    </select>
                </div>
                <div class="product-option">
                    <label for="creatine">Creatine</label>
                    <select id="creatine" name="creatine">
                        <option value="">Select which Creatine you want to certify</option>
                        <option value="Optimum Nutrition Creatine">Optimum Nutrition Creatine</option>
                        <option value="MuscleTech Cell-Tech">MuscleTech Cell-Tech</option>
                        <option value="Dymatize Creatine">Dymatize Creatine</option>
                        <option value="Cellucor C4">Cellucor C4</option>
                        <option value="Six Star Creatine">Six Star Creatine</option>
                    </select>
                </div>
                <div class="product-option">
                    <label for="bcaas">BCAAs</label>
                    <select id="bcaas" name="bcaas">
                        <option value="">Select which BCAAs you want to certify</option>
                        <option value="Optimum Nutrition Amino Energy">Optimum Nutrition Amino Energy</option>
                        <option value="MuscleTech Amino Build">MuscleTech Amino Build</option>
                        <option value="Dymatize BCAA Complex">Dymatize BCAA Complex</option>
                        <option value="Cellucor BCAA">Cellucor BCAA</option>
                        <option value="Six Star BCAA">Six Star BCAA</option>
                    </select>
                </div>
                <div class="product-option">
                    <label for="multivitamins">Multivitamins</label>
                    <select id="multivitamins" name="multivitamins">
                        <option value="">Select which Multivitamins you want to certify</option>
                        <option value="Optimum Nutrition Opti-Men">Optimum Nutrition Opti-Men</option>
                        <option value="MuscleTech Platinum Multi">MuscleTech Platinum Multi</option>
                        <option value="Dymatize Elite Men's">Dymatize Elite Men's</option>
                        <option value="Cellucor Multivitamin">Cellucor Multivitamin</option>
                        <option value="Six Star Multi">Six Star Multi</option>
                    </select>
                </div>
                <div class="product-option">
                    <label for="omega3">Omega-3</label>
                    <select id="omega3" name="omega3">
                        <option value="">Select which Omega-3 you want to certify</option>
                        <option value="Optimum Nutrition Omega-3">Optimum Nutrition Omega-3</option>
                        <option value="MuscleTech Omega">MuscleTech Omega</option>
                        <option value="Dymatize Omega-3">Dymatize Omega-3</option>
                        <option value="Cellucor Omega-3">Cellucor Omega-3</option>
                        <option value="Six Star Omega-3">Six Star Omega-3</option>
                    </select>
                </div>
                <button type="submit" class="cta-btn">Submit Vote</button>
            </form>
        </section>
    </main>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 TrueBlue. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
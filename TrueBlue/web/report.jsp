<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MuscleBlaze Raw Whey Protein 80% | Certification Report</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
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
            border-radius: 10px;
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

        /* Supplement Categories */
        .supplement-categories {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .category {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            flex: 1;
            max-width: 300px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .category h2 {
            font-size: 24px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 15px;
        }

        .category p {
            font-size: 16px;
            margin-bottom: 20px;
            color: #666;
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
        }

        .cta-btn:hover {
            background-color: #2c2bcb;
        }

        /* Supplement Benefits */
        .supplement-benefits {
            margin: 40px 0;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .supplement-benefits h2 {
            font-size: 28px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 20px;
        }

        .supplement-benefits ul {
            list-style-type: none;
            padding: 0;
        }

        .supplement-benefits li {
            font-size: 16px;
            margin-bottom: 10px;
            color: #666;
        }

        /* FAQs */
        .faqs {
            margin: 40px 0;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .faqs h2 {
            font-size: 28px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 20px;
        }

        .faq-container {
            display: flex;
            flex-direction: column;
        }

        .faq-item {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            width: 100%;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .faq-item h3 {
            font-size: 20px;
            color: #3330ef; /* Blue shade */
            margin-bottom: 10px;
        }

        .faq-item p {
            font-size: 16px;
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
            margin-top: 20px;
        }

        .social-links li {
            font-size: 18px;
        }

        .social-links a {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: #cccccc;
        }

        /* Custom Styles for Report */
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        header {
            background: #fff;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .header-info {
            margin-top: 20px;
        }

        .header-info h1 {
            color: #333;
        }

        .product-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-card img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .report-section {
            background: #fff;
            margin: 20px 0;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .report-section h2 {
            color: #333;
        }

        .report-content {
            margin-top: 10px;
        }

        .result {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .result img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .result p {
            margin: 0;
        }

        .passed {
            color: green;
        }

        .failed {
            color: red;
        }

        .footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: relative;
            width: 100%;
        }

        .macro-accuracy {
            display: flex;
            justify-content: space-between;
        }

        .macro-accuracy div {
            text-align: center;
            flex: 1;
        }

        .macro-item {
            background: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border:1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <div class="product-card">
            <img src="img/RawWheyProtein.PNG" alt="MuscleBlaze Raw Whey Protein 80%">
            <div class="header-info">
                <h1>MuscleBlaze Raw Whey Protein 80%</h1>
            </div>
        </div>
    </header>
    <div class="report-section">
        <h2>Product Details</h2>
        <div class="report-content">
            <p><strong>Product Name:</strong> Raw Whey Protein 80%</p>
            <p><strong>Category:</strong> Whey Protein Powder (Dairy Based)</p>
            <p><strong>Batch No. Tested:</strong> JJRWUF0015</p>
            <p><strong>Mfg Date:</strong> 21/Mar/2024</p>
            <p><strong>Exp Date:</strong> 07/Oct/2025</p>
            <p><strong>Date Published:</strong> 26 Sept 2024</p>
            <p><strong>Tested By:</strong> Eurofins</p>
            <p><strong>Testing Status:</strong> <span class="passed">Passed</span></p>
        </div>
    </div>
    <div class="report-section">
        <h2>Macro Accuracy</h2>
        <div class="macro-accuracy">
            <div class="macro-item">
                <h3>Protein</h3>
                <p>Claim: 24g | Found: 25.8g</p>
            </div>
            <div class="macro-item">
                <h3>Carbs</h3>
                <p>Claim: 2.25g | Found: 2g</p>
            </div>
            <div class="macro-item">
                <h3>Fats</h3>
                <p>Claim: 1.5g | Found: 1g</p>
            </div>
            <div class="macro-item">
                <h3>Added Sugar</h3>
                <p>Claim: 0g | Found: 0g</p>
            </div>
        </div>
    </div>
    <div class="report-section">
        <h2>Amino Acids Spiking Status</h2>
        <div class="report-content">
            <p>No Amino Acids Spiking Found</p>
            <table>
                <tr>
                    <th>Profile</th>
                    <th>Result</th>
                    <th>LOQ</th>
                    <th>Unit</th>
                </tr>
                <tr>
                    <td>Alanine</td>
                    <td>4.07</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Arginine</td>
                    <td>1.60</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Aspartic Acid</td>
                    <td>7.62</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Cysteine +Cystine</td>
                    <td>2.51</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Glutamic acid</td>
                    <td>11.9</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Glycine</td>
                    <td>1.01</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Histidine</td>
                    <td>1.64</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Isoleucine</td>
                    <td>4.555</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Leucine</td>
                    <td>7.73</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Lysine</td>
                    <td>6.80</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Methionine</td>
                    <td>1.79</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Phenylalanine</td>
                    <td>2.30</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Proline</td>
                    <td>4.60</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Serine</td>
                    <td>4.11</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Threonine</td>
                    <td>9.10</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Tyrosine</td>
                    <td>2.74</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Valine</td>
                    <td>4.28</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
                <tr>
                    <td>Tryptophan</td>
                    <td>1.43</td>
                    <td>0.01</td>
                    <td>g/100 g</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="report-section">
        <h2>Melamine Spiking Status</h2>
        <div class="report-content">
            <p>No Melamine Spiking Found</p>
            <p>Limit of Detection(LOQ) - 0.5mg/kg/100g Result : <0.1mg/kg/100g</p>
        </div>
    </div>
    <div class="report-section">
        <h2>Heavy Metals</h2>
        <div class="report-content">
            <p><strong>Arsenic:</strong> Limit: 1.1mg/kg | Found: Less Than 0.05 mg/kg</p>
            <p><strong>Cadmium:</strong> Limit: 15 mg/kg | Found: Less Than 0.02 mg/kg</p>
            <p><strong>Lead:</strong> Limit: 2.5 mg/kg | Found: Less Than 0.05 mg/kg</p>
            <p><strong>Mercury:</strong> Limit: 1 mg/kg | Found: Less Than 0.01 mg/kg</p>
        </div>
    </div>
    <div class="report-section">
        <h2>Aflatoxins (B1,B2,G1,G2,M1)</h2>
        <div class="report-content">
            <p>Limit of detection (Loq) = 0.5 μg/kg Result = <0.5 μg/kg</p>
        </div>
    </div>
    <div class="report-section">
        <h2>Pesticides</h2>
        <div class="report-content">
            <p>In tests, Pesticides are either not detected or found below limit of detection (LOQ)</p>
        </div>
    </div>
</div> 
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
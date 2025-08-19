<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="p1.Certify" %>

<%
    // Database credentials
    String jdbcURL = "jdbc:derby://localhost:1527/tru";
    String dbUser = "app";
    String dbPassword = "app";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String message = "";

    try {
        // Registering JDBC driver class
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        // Opening connection
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Check if the form has been submitted
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String companyName = request.getParameter("companyName");
        String contact = request.getParameter("contact");
        String description = request.getParameter("description");

        if (name != null && email != null && companyName != null && contact != null && description != null) {
            // Insert Operation
            String sql = "INSERT INTO certify (name, email, companyName, contact, description) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, companyName);
            pstmt.setString(4, contact);
            pstmt.setString(5, description);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                message = "Submitted successfully!";
                // Redirect to card-details.jsp
                response.sendRedirect("card-details.jsp");
                return; // Ensure the JSP page does not continue processing
            } else {
                message = "Failed to submit.";
            }
        }

    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
        message = "Error occurred: " + se.getMessage();
    } catch (Exception e) {
        // Handle other errors
        e.printStackTrace();
        message = "Error occurred: " + e.getMessage();
    } finally {
        // Finally block used to close resources
        try {
            if (rs != null) rs.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
        try {
            if (pstmt != null) pstmt.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    request.setAttribute("message", message);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue | Get Certified</title>
    <link rel="stylesheet" href="Get_Certified.css">
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
            <button class="register-btn" style="font-size:medium; font-weight:bold; border-radius:10px;">Get Certified</button>
        </a>
    </nav>

    <!-- Main Content Section -->
    <main class="main-content">
        <!-- Certification Process Container -->
        <div class="certification-process-container">
            <section class="certification-info">
                <h1 style="color:#3330ef;">Get Certified with TrueBlue</h1>
                <p style="color:#333;">At TrueBlue, we are committed to ensuring the highest quality and authenticity of the supplements in the market. If you believe your brand meets our rigorous standards and wish to get certified, follow the steps below.</p>
                
                <h2 style="color:#3330ef;">Certification Process</h2>
                <p style="color:#333;">Our certification process is designed to be thorough yet straightforward. Here’s what you need to do:</p>
                <ol>
                    <li><strong style="color:#333;">Submit Your Application:</strong> Fill out the certification application form provided below.</li>
                    <li><strong style="color:#333;">Review Process:</strong> Our team will review your application.</li>
                    <li><strong style="color:#333;">Sample Collection:</strong> We will procure the sample from a retail outlet at our expense to ensure that the product we test is representative of what consumers purchase.</li>
                    <li><strong style="color:#333;">Product Testing:</strong> The product will be sent to a European laboratory for testing.</li>
                    <li><strong style="color:#333;">Certification Decision:</strong> If your products meet our standards, we will grant certification and list your brand on our website.</li>
                </ol>

                <h2 style="color:#3330ef;">6 Level Testing</h2>
                <p style="color:#333;">To earn Trustified Certification, each product must pass all the Levels of blind testing.</p>
                <ul>
                    <li style="color:#333;">In case a product fails with a big difference at any level, further levels will not be tested, and the product will be listed under the FAIL category immediately.</li>
                    <li style="color:#333;">If the product meets expected results at all levels, it will be marked under the PASS category, and the company can request certification.</li>
                    <li style="color:#333;">For every certified product, the same blind testing process will be repeated every 6 months to ensure product integrity and complete peace of mind.</li>
                </ul>

                <h2 style="color:#3330ef;">7 Level Testing</h2>
                <p style="color:#333;">Only those products are eligible for Trustified Gold blind testing that are already Trustified certified for Accuracy and Purity.</p>
                <ul>
                    <li style="color:#333;">Trustified Gold is a revolution in the supplement industry. The presence of the Trustified Gold logo on labels demonstrates that the product has been blindly tested for 19 doping substances from the World Anti-Doping Agency (WADA) prohibited list.</li>
                    <li style="color:#333;">If the product passes the doping tests, it will be declared a Trustified Gold-certified product.</li>
                    <li style="color:#333;">For every Gold-certified product, the same blind testing process will be repeated every 12 months to ensure product integrity and complete peace of mind.</li>
                </ul>
            </section>
        </div>

        <!-- Two-Column Layout for Form and Terms -->
        <div class="two-column-layout">
            <!-- Certification Application Form Container -->
            <div class="form-container">
                <section class="certification-form">
                    <h2 style="color:#3330ef;">Certification Application Form</h2>
                    <form action="Get_Certified.jsp" method="post">
                        <label for="name">Name *</label>
                        <input type="text" id="name" name="name" required>
                        
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" required>
                        
                        <label for="companyName">Company name *</label>
                        <input type="text" id="companyName" name="companyName" required>
                        
                        <label for="contact">Contact *</label>
                        <input type="text" id="contact" name="contact" required>
                        
                        <label for="description">Kindly mention a brief description of what you would like to discuss. *</label>
                        <textarea id="description" name="description" required></textarea>
                        
                        <div class="confirmation-message" id="display">
                            <p style="color:#333;"><%= (String) request.getAttribute("message") %></p>
                        </div>
                        
                        <div class="form-buttons">
                            <button type="submit" name="submit" value="submit" class="submit-btn"><b>SEND</b></button>
                        </div>
                    </form>
                </section>
            </div>

            <!-- Terms and Conditions Container -->
            <div class="terms-container">
                <section class="terms-and-conditions">
                    <h2 style="color:#3330ef;font-size: 1.7em;">Terms and Conditions for Blind Testing</h2>
                    <p style="color:#333;">
                        1. In the event a company wants to participate in the blind testing process, the testing expenses must be covered by the company itself.<br><br>
                        2. Please take note: We only conduct 100% blind testing and never collect samples from manufacturers or companies. To maintain 100% trust and transparency for customers, we never disclose how, when, or from where we will purchase the products.<br><br>
                        3. If the company's product fails the test, the failed results will be displayed.<br><br>
                        4. This is a very ethical certification designed to keep customers in mind, ensuring they can avoid adulterated products and choose safe ones. Apply for this certification only if your products are genuine.
                    </p>

                    <br> <!-- Added space between sections -->
                    <br> <!-- Added space between sections -->

                    <h3 style="color:#3330ef; font-size: 1.7em;">Challenge Request Process</h3> <!-- Increased font size -->
                    <br> <!-- Added space between sections -->
                    <p style="color:#333;">
                        A manufacturer or company can send a challenge request against any of their failed products listed on Trustified at <a href="mailto:legal@trustified.in">legal@trustified.in</a>.<br><br> <!-- Added space within the paragraph -->
                    </p>
                </section>
            </div>
        </div>
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
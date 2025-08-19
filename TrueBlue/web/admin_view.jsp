<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Products List</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a; /* Dark background */
            color: white;
            text-align: center;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #333; /* Lighter background for content */
            box-shadow: 0px 0px 10px #555;
        }
        th, td {
            border: 2px solid #555;
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #2a2a2a; /* Slightly lighter for contrast */
            color: white;
        }
        .product-info {
            background-color: white; /* White background for product info */
            color: black;
        }
        img {
            width: 150px;
            height: 150px;
        }
        .delete-btn, .cart-btn, .report-btn, .buy-btn {
            background-color: #1e90ff; /* Blue color */
            font-family: 'Poppins', sans-serif;
            color: white;
            padding: 10px 20px; /* Increased padding for larger buttons */
            border: none;
            cursor: pointer;
            font-size: 18px; /* Increased font size */
            border-radius: 5px;
        }
        .delete-btn:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }
        .buy-btn {
            background-color: #1e90ff; /* Blue color */
            font-family: 'Poppins', sans-serif;
            color: white;
            padding: 10px 20px; /* Increased padding for larger buttons */
            border: none;
            cursor: pointer;
            font-size: 18px; /* Increased font size */
        }
        .buy-btn:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <h2 class="products-list-heading">
        <i class="fas fa-box"></i> Products List
    </h2>
    <table>
        <tr>
            <th>Product</th>
            <th>Details</th>
            <th>Shop</th>
        </tr>
        <%
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT product_id, product_name, category, pass_fail, image_data, product_url FROM products");

            boolean isAdmin = (session.getAttribute("admin") != null);

            while (rs.next()) {
                String productId = rs.getString("product_id");
                String productName = rs.getString("product_name");
                String category = rs.getString("category");
                String passFail = rs.getString("pass_fail");
                byte[] imageBytes = rs.getBytes("image_data");
                String base64Image = (imageBytes != null && imageBytes.length > 0) ? Base64.getEncoder().encodeToString(imageBytes) : "";
                String imageSrc = !base64Image.isEmpty() ? "data:image/jpeg;base64," + base64Image : "img/default.jpg";
                String productUrl = rs.getString("product_url"); // Retrieve product_url from the database

                out.println("<tr class='product-info'>");
                out.println("<td><img src='" + imageSrc + "' alt='Product Image'></td>");
                out.println("<td>");
                out.println("<b>" + productName + "</b><br>");
                out.println("Category: " + category + "<br>");
                out.println("Pass/Fail: " + passFail + "<br>");
                if (!isAdmin) {
                    out.println("<a href='report.jsp?product_id=" + productId + "'><button class='report-btn'>Report</button></a>");
                }
                out.println("</td>");
                out.println("<td>");
                if (!isAdmin) {
                    out.println("<a href='" + productUrl + "' target='_blank'><button class='buy-btn'>Buy Now</button></a>");
                }
                if (isAdmin) {
                    out.println("<a href='delete_product.jsp?product_id=" + productId + "'><button class='delete-btn'>Delete</button></a>");
                }
                out.println("</td>");
                out.println("</tr>");
            }

            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='3' style='color: red;'>Error: " + e.getMessage() + "</td></tr>");
        }
        %>
    </table>
</body>
</html>
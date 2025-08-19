<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a; /* Dark background */
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .update-form {
            width: 100%; /* Full width of the viewport */
            max-width: 600px; /* Maximum width of the form */
            background: #333; /* Lighter background for content */
            padding: 30px;
            box-shadow: 0px 0px 10px #555;
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #1e90ff; /* Blue color */
            margin-bottom: 20px;
        }

        h2 i {
            font-size: 24px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
            color: #555;
        }

        input, textarea {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #555;
            border-radius: 5px;
            background: #444;
            color: white;
        }

        textarea {
            height: 60px;
        }

        button {
            background-color: #1e90ff; /* Blue color */
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        button:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .img-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        img {
            width: 100px;
            height: 100px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<%
    String product_id = request.getParameter("id");
    String product_name = "";
    String category = "";
    String pass_fail = "";
    String product_url = ""; // Added product_url
    byte[] imageBytes = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE product_id=?");
        ps.setString(1, product_id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            product_name = rs.getString("product_name");
            category = rs.getString("category");
            pass_fail = rs.getString("pass_fail");
            product_url = rs.getString("product_url"); // Retrieve product_url
            imageBytes = rs.getBytes("image_data");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }

    String imageBase64 = (imageBytes != null) ? "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(imageBytes) : "";
%>

<div class="update-form">
    <h2><i class="fas fa-edit"></i> Update Product</h2>
    <form action="admin_product_server.jsp" method="POST">

        <div class="form-group">
            <label>Product Id:</label>
            <input type="number" name="product_id" value="<%= product_id %>" required>
        </div>

        <div class="form-group">
            <label>Product Name:</label>
            <input type="text" name="product_name" value="<%= product_name %>" required>
        </div>

        <div class="form-group">
            <label>Category:</label>
            <input type="text" name="category" value="<%= category %>" required>
        </div>

        <div class="form-group">
            <label>Pass Fail:</label>
            <input type="text" name="pass_fail" value="<%= pass_fail %>" required>
        </div>

        <div class="form-group">
            <label>Product URL:</label>
            <input type="text" name="product_url" value="<%= product_url %>" required> <!-- Added product_url field -->
        </div>

        <div class="form-group">
            <label>Product Image:</label>
            <input type="file" name="image" onchange="openFile(event)">
            <br>
            <img id="productImage" src="<%= imageBase64 %>" alt="Product Image">
        </div>

        <!-- Hidden input to send Base64 image data -->
        <input type="hidden" name="image_data" id="imageData" value="<%= imageBase64 %>">

        <button type="submit">Update Product</button>
    </form>
</div>

<script>
    var openFile = function(event) {
        var input = event.target;
        var reader = new FileReader();
        reader.onload = function() {
            var dataURL = reader.result;
            document.getElementById('productImage').src = dataURL;
            document.getElementById('imageData').value = dataURL;
        };
        reader.readAsDataURL(input.files[0]);
    };
</script>

</body>
</html>
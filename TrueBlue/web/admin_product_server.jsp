<%@page import="java.sql.*, java.util.Base64, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    out.println("Received Data:<br>");
    out.println("Product ID: " + request.getParameter("product_id") + "<br>");
    out.println("Product Name: " + request.getParameter("product_name") + "<br>");
    out.println("Category: " + request.getParameter("category") + "<br>");
    out.println("Pass Fail: " + request.getParameter("pass_fail") + "<br>");
    out.println("Image Data (first 100 chars): " + request.getParameter("image_data").substring(0, 100) + "<br>");
    out.println("Product URL: " + request.getParameter("product_url") + "<br>"); // Added product_url

    String product_id = request.getParameter("product_id");
    String product_name = request.getParameter("product_name");
    String category = request.getParameter("category");
    String pass_fail = request.getParameter("pass_fail");
    String base64Image = request.getParameter("image_data");
    String product_url = request.getParameter("product_url"); // Added product_url

    // Validation: Ensure all required fields are present
    if (product_id == null || product_name == null || category == null || pass_fail == null || base64Image == null || product_url == null ||
        product_id.isEmpty() || product_name.isEmpty() || category.isEmpty() || pass_fail.isEmpty() || base64Image.isEmpty() || product_url.isEmpty()) {
        out.println("<p style='color:red;'>❌ Error: All fields are required!</p>");
        return;
    }

    // 🔹 Remove Base64 header (data:image/jpeg;base64,)
    if (base64Image.contains(",")) {
        base64Image = base64Image.split(",")[1];  // Extract only the Base64 part
    }

    // 🔹 Convert Base64 string to byte array
    byte[] imageBytes = Base64.getDecoder().decode(base64Image);

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");

        // 🔹 Update query for BLOB insertion
        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET product_name=?, category=?, pass_fail=?, image_data=?, product_url=? WHERE product_id=?"
        );

        ps.setString(1, product_name);
        ps.setString(2, category);
        ps.setString(3, pass_fail);
        ps.setBinaryStream(4, new ByteArrayInputStream(imageBytes), imageBytes.length); // Store as BLOB
        ps.setString(5, product_url); // Set product_url
        ps.setString(6, product_id);

        int updated = ps.executeUpdate();
        if (updated > 0) {
            out.println("<script>alert('✅ Product Updated Successfully!'); window.location.assign('admin.jsp');</script>");
        } else {
            out.println("<p style='color:red;'>❌ Error: No product found with ID " + product_id + ".</p>");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Database Error: " + e.getMessage() + "</p>");
    }
%>
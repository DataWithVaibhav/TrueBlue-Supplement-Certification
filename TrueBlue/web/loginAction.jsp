<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:derby://localhost:1527/tru"; // Update with your database URL
    String user = "app"; // Update with your database username
    String passwordDB = "app"; // Update with your database password

    try {
        // Load the Derby driver
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        // Establish the connection
        conn = DriverManager.getConnection(url, user, passwordDB);

        // Prepare the SQL statement
        String sql = "SELECT * FROM Register WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);

        // Set the parameters
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        // Execute the query
        rs = pstmt.executeQuery();

        // Check if the user exists
        if (rs.next()) {
            // User found, set session attribute and redirect to home page
            session.setAttribute("name", rs.getString("name"));
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        } else {
            // User not found, redirect back to login page with error message
            response.sendRedirect("login.jsp?error=true");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vote Submission</title>
    <script>
        function showSuccessAndRedirect() {
            alert("Vote submitted successfully!");
            window.location.href = "home.jsp";
        }
    </script>
</head>
<body onload="showSuccessAndRedirect()">
<%
    String wheyProtein = request.getParameter("wheyProtein");
    String creatine = request.getParameter("creatine");
    String bcaas = request.getParameter("bcaas");
    String multivitamins = request.getParameter("multivitamins");
    String omega3 = request.getParameter("omega3");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the JDBC driver
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        // Establish the connection
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");

        // Prepare the SQL statement
        String sql = "INSERT INTO Votes (wheyProtein, creatine, bcaas, multivitamins, omega3) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Set the parameters
        pstmt.setString(1, wheyProtein);
        pstmt.setString(2, creatine);
        pstmt.setString(3, bcaas);
        pstmt.setString(4, multivitamins);
        pstmt.setString(5, omega3);

        // Execute the query
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected <= 0) {
            out.println("<p>Failed to submit vote.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close the resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>
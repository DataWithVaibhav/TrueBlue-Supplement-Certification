<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String cardNumber = request.getParameter("cardnumber");
    String cardHolder = request.getParameter("cardholder");
    String expiry = request.getParameter("expiry");
    String cvv = request.getParameter("cvv");
    String testLevel = request.getParameter("testLevel");
    String selectedPrice = request.getParameter("selectedPrice");

    if (cardNumber != null && cardHolder != null && expiry != null && cvv != null && testLevel != null && selectedPrice != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tru; user=app;password=app");

            String sql = "INSERT INTO carddetails (cardnumber, cardholder, expiry, cvv, testlevel, price) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, cardNumber);
            ps.setString(2, cardHolder);
            ps.setString(3, expiry);
            ps.setString(4, cvv);
            ps.setString(5, testLevel);
            ps.setString(6, selectedPrice);
            ps.executeUpdate();

            response.sendRedirect("order_confirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>Invalid details provided.</p>");
    }
%>

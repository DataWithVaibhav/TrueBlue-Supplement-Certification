<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
String m = request.getParameter("product_id");

if(m == null || m.trim().isEmpty()) {
    out.println("<script>alert('Error: No product ID provided.');window.location.assign('admin.jsp');</script>");
} else {
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");
        
        PreparedStatement ps = con.prepareStatement("DELETE FROM products WHERE product_id = ?");
        
        // Change to setInt if product_id is an integer
        ps.setString(1, m);
        
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>alert('Item removed successfully.');window.location.assign('admin.jsp');</script>");
        } else {
            out.println("<script>alert('Error: Item not found.');window.location.assign('admin.jsp');</script>");
        }
        
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
    }
}
%>
</body>
</html>

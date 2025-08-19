<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    // Load database driver
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sakshi", "app", "app");

    // Validate user credentials
    PreparedStatement ps = con.prepareStatement("SELECT name FROM Register WHERE email = ? AND password = ?");
    ps.setString(1, email);
    ps.setString(2, password);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // User authenticated, set session attributes
        session.setAttribute("userEmail", email);
        session.setAttribute("userName", rs.getString("name"));

        response.sendRedirect("home.jsp");
    } else {
        out.println("<script>alert('Invalid Email or Password!'); window.location='login.jsp';</script>");
    }

    rs.close();
    ps.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('Database error! Try again later.'); window.location='login.jsp';</script>");
}
%>

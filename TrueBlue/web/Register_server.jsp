<%@ page import="java.sql.*" %>

<%
    // Retrieve parameters from the request
    String name = request.getParameter("name");
    String email = request.getParameter("emid1");
    String password = request.getParameter("psw1");
    String confirmPassword = request.getParameter("psw2");
    String enteredOTP = request.getParameter("otp");
    String storedOTP = request.getParameter("hotp");

    // Validate input parameters
    if (name == null || name.trim().isEmpty()) {
        out.println("<script>alert('Name is required!'); window.location='register.jsp';</script>");
        return;
    }

    if (email == null || email.trim().isEmpty()) {
        out.println("<script>alert('Email is required!'); window.location='register.jsp';</script>");
        return;
    }

    if (password == null || password.trim().isEmpty()) {
        out.println("<script>alert('Password is required!'); window.location='register.jsp';</script>");
        return;
    }

    if (!password.equals(confirmPassword)) {
        out.println("<script>alert('Passwords do not match!'); window.location='register.jsp';</script>");
        return;
    }

    if (enteredOTP == null || enteredOTP.trim().isEmpty() || !enteredOTP.equals(storedOTP)) {
        out.println("<script>alert('OTP does not match! Please try again.'); window.location='register.jsp';</script>");
        return;
    }

    try {
        // Load database driver
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");

        // Check if email already exists
        PreparedStatement checkEmail = con.prepareStatement("SELECT COUNT(*) FROM Register WHERE email = ?");
        checkEmail.setString(1, email);
        ResultSet rs = checkEmail.executeQuery();
        rs.next();
        if (rs.getInt(1) > 0) {
            out.println("<script>alert('Email is already registered!'); window.location='register.jsp';</script>");
            return;
        }
        checkEmail.close();
        rs.close();

        // Insert user into database
        PreparedStatement ps = con.prepareStatement("INSERT INTO Register (name, email, password) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, confirmPassword);
        ps.executeUpdate();

        // Set session attributes
        session.setAttribute("name", name);
        session.setAttribute("email", email);

        session.removeAttribute("storedOTP"); // Remove OTP after successful registration

        out.println("<script> window.location='home.jsp';</script>");

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Database error! Try again later.'); window.location='register.jsp';</script>");
    }
%>
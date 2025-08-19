<%@ page import="java.sql.*" %>
<%
if (session.getAttribute("email") != null) {
    response.sendRedirect("home.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="login.css">
</head>
<body>

    <div class="form-container">
        <div class="form-title">Login</div>
        <form action="loginAction.jsp" method="post">
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">LOGIN</button>
            <a href="register.jsp">Not a member? Register here</a>
        </form>
    </div>

</body>
</html>
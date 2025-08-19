<%
String userEmail = (String) session.getAttribute("userEmail");
String userName = (String) session.getAttribute("userName");

if (userEmail == null) {
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

    <h2 align="center">Welcome, <%= userName %>!</h2>

    <p align="center">You are successfully logged in.</p>

    <div align="center">
        <a href="logout.jsp"><button>Logout</button></a>
    </div>

</body>
</html>

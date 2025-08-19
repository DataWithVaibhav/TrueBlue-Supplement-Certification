<%@ page session="true" %>
<%
    session.invalidate();
    response.sendRedirect("admin_login.jsp");
%>

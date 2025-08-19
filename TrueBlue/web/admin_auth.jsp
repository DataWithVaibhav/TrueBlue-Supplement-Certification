<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("vaibhav".equals(username) && "vaibhav".equals(password)) {
        session.setAttribute("admin", "true");
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("admin_login.jsp?error=invalid");
    }
%>


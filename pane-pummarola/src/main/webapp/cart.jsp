<%@page import="cn.eros.connection.DbCon" %>
<%@page import="cn.eros.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    Users auth = (Users) request.getSession().getAttribute("auth");
    if(auth!=null)
    		request.setAttribute("auth", auth);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<%@include file="includes/footer.jsp" %>
</body>
</html>
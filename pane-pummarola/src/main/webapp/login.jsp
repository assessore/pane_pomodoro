<%@page import="cn.eros.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
       <%
    Users auth = (Users) request.getSession().getAttribute("auth");
    if(auth!=null){
    		response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accedi</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center">Login Utente</div>
<div class="card-body">
<form action="users-login" method="post">

<div class="form-group">
<label>Indirizzo Email</label>
<input type="email" class="form-control" name="login-email" placeholder="Inserisci email" required>
</div>


<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" name="login-password" placeholder="Inserisci password" required>
</div>

<div class="text-center">
<button type="submit" class="btn btn-primary">Login</button>
</div>


</form>
</div>
</div>
</div>



<%@include file="includes/footer.jsp" %>
</body>
</html>
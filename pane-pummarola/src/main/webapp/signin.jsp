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
<title>Registrati</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center">Registrazione Utente</div>
<div class="card-body">
<form action="sign-in" method="post">


<div class="form-group">
<label>Nome</label>
<input type="text" class="form-control" name="signin-name" placeholder="Inserisci nome" required>
</div>

<div class="form-group">
<label>Indirizzo</label>
<input type="text" class="form-control" name="signin-address" placeholder="Inserisci indirizzo" required>
</div>


<div class="form-group">
<label>Indirizzo Email</label>
<input type="email" class="form-control" name="signin-email" placeholder="Inserisci email" required>
</div>


<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" name="signin-password" placeholder="Inserisci password" required>
</div>

<div class="form-group">
<label>Metodo Pagamento (Numero Carta)</label>
<input type="text" class="form-control" name="signin-card" placeholder="Inserisci carta" required>
</div>

<div class="text-center">
<button type="submit" class="btn btn-success">Registrati</button>
</div>


</form>
</div>
</div>
</div>



<%@include file="includes/footer.jsp" %>
</body>
</html>
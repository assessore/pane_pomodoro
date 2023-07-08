<%@page import="cn.eros.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
       <%
    Users auth = (Users) request.getSession().getAttribute("auth");
    if(auth==null){
    		
    	response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profilo</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center">Modifica Dati Utente</div>
<div class="card-body">
<form action="mod-profile" method="post">


<div class="form-group">
<label>Id</label>
<input type="text" class="form-control" name="signin-id" value="<%=auth.getId() %>" required readonly>
</div>

<div class="form-group">
<label>Nome</label>
<input type="text" class="form-control" name="signin-name" value="<%=auth.getName() %>" required>
</div>

<div class="form-group">
<label>Indirizzo</label>
<input type="text" class="form-control" name="signin-address" value="<%=auth.getIndirizzo() %>" required>
</div>


<div class="form-group">
<label>Indirizzo Email</label>
<input type="email" class="form-control" name="signin-email" value="<%=auth.getEmail() %>" required>
</div>


<div class="form-group">
<label>Password</label>
<input type="password" class="form-control" name="signin-password" value="<%=auth.getPassword() %>" required>
</div>

<div class="form-group">
<label>Metodo Pagamento (Numero Carta)</label>
<input type="password" class="form-control" name="signin-card" value="<%=auth.getCarta() %>" required>
</div>

<div class="text-center">
<button type="submit" class="btn btn-primary">Modifica</button>
</div>


</form>
</div>
</div>
</div>



<%@include file="includes/footer.jsp" %>
</body>
</html>
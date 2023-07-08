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
<title>Aggiungi Prodotto</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card-header text-center">Aggiungi Prodotto</div>
<div class="card-body">
<form action="new-product" method="post">


<div class="form-group">
<label>Nome</label>
<input type="text" class="form-control" name="product-name" required >
</div>

<div class="form-group">
<label>Categoria</label>
<br>
<select name="product-category" id="category">
       <option value="Panino">Panino</option>
      <option value="Bibita">Bibita</option>
  </select>
</div>

<div class="form-group">
<label>Prezzo</label>
<input type="text" class="form-control w-50" name="product-price" required>
</div>

<div class="form-group">
<label>Immagine</label>
<input type="text" class="form-control" name="product-image" required>
</div>

<br>
<div class="text-center">
<button type="submit" class="btn btn-warning">Aggiungi</button>
</div>


</form>
</div>
</div>
</div>



<%@include file="includes/footer.jsp" %>
</body>
</html>
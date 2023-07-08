<%@page import="java.util.List"%>
<%@page import="cn.eros.dao.ProductDao"%>
<%@page import="cn.eros.connection.DbCon"%>
<%@page import="cn.eros.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int amm = 0;
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null){
	if(auth.getId() == 1){
		amm = 1;
	}
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Benvenuto su Pane e Pomodoro</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">Negozio</div>
		<div class="row">
		<% 	
		if(!products.isEmpty()){
				for(Product p:products){
					if(amm != 1){%>
				
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						<img class="card-img-top" src="product-image/<%= p.getImage()%>" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title"><%= p.getName() %></h5>
							<h6 class="price">Prezzo: $<%= p.getPrice()%></h6>
							<h6 class="category">Categoria: <%=p.getCategory()%></h6>
							
							
							<div class="mt-3 d-flex justify-content-between">
								<a href="add-to-cart?id=<%= p.getId() %>" class="">Aggiungi al Carrello</a>
								<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Acquista Ora</a>
							</div>
						</div>
					</div>
				</div>
				<%} else {%>
							<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						<img class="card-img-top" src="product-image/<%= p.getImage()%>" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title"><%= p.getName() %></h5>
							<h6 class="price">Prezzo: $<%= p.getPrice()%></h6>
							<h6 class="category">Categoria: <%=p.getCategory()%></h6>
							
							
							<div class="mt-3 d-flex justify-content-between">
								<a href="modproduct.jsp?id=<%=p.getId() %>" class="">Modifica</a>
								<a href="remove-products?id=<%=p.getId() %>"class="btn btn-danger">Rimuovi</a>
							</div>
						</div>
					</div>
					
				</div>
			<% }
		}
	}
		%>
		

		</div>
		
		
	<% if(amm==1){ %>
	<br>	
	<a href="newproduct.jsp" class="btn btn-warning">Aggiungi Prodotto</a>
		<br><br>
		<%} %>
		
		
	<form id="myform" name="myform" method="post" action="indexfiltri.jsp">
  <label for="filtro">Filtra per:</label>
  <select name="filtro" id="filtro">
    <optgroup label="Categoria">
       <option value="100">Tutti</option>
      <option value="Panino">Panino</option>
      <option value="Bibita">Bibita</option>
    </optgroup>
    <optgroup label="Inferiore ai">
      <option value="20">20$</option>
      <option value="10">10$</option>
    	<option value="5">5$</option>
    </optgroup>
  </select>
  <input type="submit" value="Filtra" onclick="window.location.href='indexfiltri.jsp'" />
</form>
  	

	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>
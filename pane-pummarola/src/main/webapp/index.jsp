<%@page import="java.util.List"%>
<%@page import="cn.eros.dao.ProductDao"%>
<%@page import="cn.eros.connection.DbCon"%>
<%@page import="cn.eros.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null){
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
				for(Product p:products){%>
				
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						<img class="card-img-top" src="product-image/<%= p.getImage()%>" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title"><%= p.getName() %></h5>
							<h6 class="price">Prezzo: $<%= p.getPrice()%></h6>
							<h6 class="category">Categoria:<%=p.getCategory()%></h6>
							<div class="mt-3 d-flex justify-content-between">
								<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-primary">Aggiungi al Carrello</a>
								<a href="#" class="btn btn-primary">Acquista Ora</a>
							</div>
						</div>
					</div>
				</div>
				<%}
				
			}
	
		%>
		

		</div>



	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>
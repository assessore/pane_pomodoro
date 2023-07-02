<%@page import="cn.eros.connection.DbCon"%>
<%@page import="cn.eros.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null)
	request.setAttribute("auth", auth);
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
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="price">Prezzo: 50</h6>
						<h6 class="category">Categoria: cazzi</h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="#" class="btn btn-primary">Aggiungi al Carrello</a>
							<a href="#" class="btn btn-primary">Acquista Ora</a>
						</div>
					</div>
				</div>
			</div>

		</div>



	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>
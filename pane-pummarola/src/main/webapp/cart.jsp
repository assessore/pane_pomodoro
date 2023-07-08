<%@page import="java.util.*"%>
<%@page import="cn.eros.dao.ProductDao"%>
<%@page import="cn.eros.connection.DbCon"%>
<%@page import="cn.eros.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	double total = pDao.getTotalCartPrice(cart_list);
	cartProduct = pDao.getCartProducts(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
<%@include file="includes/header.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Totale: $ ${ (total>0)?total:0}  </h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nome</th>
					<th scope="col">Categoria</th>
					<th scope="col">Prezzo</th>
					<th scope="col">Quantità</th>
				</tr>
			</thead>
		<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=c.getPrice()%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
							    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="btn btn-sm btn-danger"></i></a>
								<input type="text" name="quantity" class="form-control w-50"  value="<%=c.getQuantity()%>"> 
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="btn btn-sm btn-danger"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Compra</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Rimuovi</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>
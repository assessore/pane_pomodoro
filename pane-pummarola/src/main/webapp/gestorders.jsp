<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.eros.dao.OrderDao"%>
<%@page import="cn.eros.connection.DbCon"%>
<%@page import="cn.eros.dao.ProductDao"%>
<%@page import="cn.eros.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	int amm = 0;
	Users auth = (Users) request.getSession().getAttribute("auth");
	if (auth != null){

		if(auth.getId() == 1){
			amm = 1;
		}
		
	}

	request.setAttribute("auth", auth);


	OrderDao od = new OrderDao(DbCon.getConnection());
	List<Order> orders = od.getAllOrders();
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/header.jsp"%>
<title>Ordini</title>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">Tutti gli Ordini</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Ordine</th>
					<th scope="col">Data</th>
					<th scope="col">Nome</th>
					<th scope="col">Categoria</th>
					<th scope="col">Quantità</th>
					<th scope="col">Prezzo</th>
					<th scope="col">Cancella</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getOrderId() %></td>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order-admin?id=<%=o.getOrderId()%>">Cancella Ordine</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>
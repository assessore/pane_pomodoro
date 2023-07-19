

<link rel="stylesheet" type="text/css" href="style\navbar.css">

<nav class="navbar">
	
		<div class="logo"><a href="index.jsp">Pane e Pomodoro</a></div>
		  <ul>
			<li><a href="index.jsp" class="btn btn-light">Home</a></li>
			
		
			<li><a href="cart.jsp" class="btn btn-light">Carrello</a></li>
		
			<% 
		   	if(auth != null){%>
		   		<li><a href="orders.jsp" class="btn btn-light">Ordini</a></li>
		
				<li><a href="log-out" class="btn btn-light">Logout</a></li> 
				<li><a href="profile.jsp?id=<%=auth.getId() %>" class="btn btn-light">Profilo</a></li> 
			<% }else{ %>
				<li><a href="login.jsp" class="btn btn-light">Login</a></li>
				<li><a href="signin.jsp" class="btn btn-light" >Registrati</a></li>
			
			<%}
			%>
			
		
		
			
		</ul>
	
	
	

</nav>

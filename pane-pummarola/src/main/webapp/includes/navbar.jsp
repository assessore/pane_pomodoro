
<link rel="stylesheet" type="text/css" href="style\navbar.css">

<nav class="navbar">
	<div class="navdiv">
		<div class="logo"><a href="index.jsp">Pane e Pomodoro</a></div>
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="cart.jsp">Carrello</a></li>
			<% 
		   	if(auth != null){ %>
		   		<li><a href="orders.jsp">Ordini</a></li>
				<li><a href="log-out">Logout</a></li> 
			<% }else{ %>
				<li><a href="login.jsp">Login</a></li>
			
			<%}
			%>
			
		
		
			
		</ul>
	
	</div>
	

</nav>

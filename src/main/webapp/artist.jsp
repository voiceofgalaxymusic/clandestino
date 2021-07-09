<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.*"%>
<%@ page import="com.eoi.modelos.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Artistas</title>
</head>
<body>
	<%@include file="header.jsp"%>
	
	<section>
		
			<% Artista a = (Artista) request.getAttribute("art"); %>
			<div class="headart">
				<img src="<%= a.getImg() %>">
				<div class="infoart">
				<h1><%= a.getNomArt() %></h1>
				<h2><%= a.getGenero() %></h2>
				</div>
		</div>
		
		<div class="bodyart">
				<%
				Connection con = Conexion.getInstance().getConnection();
				String query = "select * from t_disc where disc_idart = ?";

				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, a.getidart());
				
				ResultSet rs = pst.executeQuery();
				
				%>
				<%
				while (rs.next()) {
				%>
				
				<div class="discosart">
					<img src="<%=rs.getString("disc_img")%>">
					<h2><%=rs.getString("disc_nom")%></h2>
					<h2><%=rs.getString("disc_pre")%></h2><i class="fa fa-euro-sign"></i>
					<form action="ServletCarritoDiscos" method="post">
					<input type="hidden" value='<%=rs.getString("disc_id")%>' name="botoncarrito">
					<h3>Cantidada: </h3><input type=number value="1" name="cantidad">
					<% HttpSession sesion = request.getSession();
					if (sesion.getAttribute("login") == null) {%>
					<a href="loginprueba.jsp" > Inicia sesión para comprar</a>
					<% } else {%>
					<button class="botoncarrito"><i class="fas fa-shopping-cart"></i></button>
					<% }%>
					</form>
				</div>
				<%}
				rs.close();
				pst.close();
				con.close();%>
				
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.*"%>
<%@ page import="com.eoi.modelos.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
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
					<button class="botoncarrito"><i class="fas fa-shopping-cart"></i></button>
				</div>
				<%
				}
				%>
		</div>
	</section>
</body>
</html>
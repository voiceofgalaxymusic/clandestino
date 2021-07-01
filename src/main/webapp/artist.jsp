<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.Conexion"%>
<%@ page import="com.eoi.modelos.Artista" %>
<%@ page import="com.eoi.modelos.ArtistaDAO" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<title>Artistas</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
		Connection con = Conexion.getInstance().getConnection();
		Artista a = null;
		String sql = "select * from t_art where art_nom= ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, nomArt);
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			a.setNomArt(rs.getString("art_nom"));
		}
	%>
	<section>
	<div class="headuser">
	<% while(rs.next()){ %>
		<img src="<%= rs.getString("user_img") %>">
		<div class="nameuser">
		<h1><%= rs.getString("user_nik") %></h1>
		<h1><%= rs.getString("user_nom") %></h1>
		</div>
		<div class="lugaruser">
		<h1><%= rs.getString("user_ciu") %></h1>
		<h1><%= rs.getString("user_pai") %></h1>
		</div>
		<%} %>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet"> 
<title>Clandestino</title>
</head>
<body>
<%@include file="header.jsp" %>
<div style="margin:20px; width: 200px; height: 100px;">
<a style="color:white; display:inline-block; font-size: 20px;" href="user.jsp">Página del Usuario</a>
<a style="color:white; display:inline-block; font-size: 20px;" href="artist.jsp">Página del Artista</a>
<a style="color:white; display:inline-block; font-size: 20px;" href="loginprueba.jsp">Página del Login</a></div>

<div class="bodycatal">
	<% Connection con = Conexion.getInstance().getConnection();
	String sql = "select * from t_art ";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql); %>
	<% while(rs.next()){ %>
		<%=rs.getString("art_id") %>
		<%=rs.getString("art_nom") %>
		<%=rs.getString("art_gen") %>
		<img src="<%= rs.getString("art_img") %>">
		<a href="Controlador?opcion=art&idart=<%=rs.getString("art_id")%>">Aquí</a>
	<%}%>
</div>
	
</body>
</html>
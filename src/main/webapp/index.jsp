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
<a style="color:white; display:inline-block; font-size: 20px;" href="loginprueba.jsp">Página del Login</a>
<a style="color:white; display:inline-block; font-size: 20px;" href="/Clandestino/ServletVisitas">Servlet de Visitas</a></div>

<div class="catal">
	<% Connection con = Conexion.getInstance().getConnection();
	String sql = "select * from t_art ";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql); %>
	<% while(rs.next()){ %>
		<a class="catalogos" href="Controlador?opcion=art&idart=<%=rs.getString("art_id")%>" style="background-image: url(<%= rs.getString("art_img") %>);">
			<div>
			<h2><%=rs.getString("art_nom") %></h2>
			<h3><%=rs.getString("art_gen") %></h3>
			</div>
		</a>
	<%}%>
</div>
<div class="catal cataldisc">
	<%sql = "select * from t_disc";
	rs = st.executeQuery(sql);%>
	<%while (rs.next()) {%>
	<a class="catalogos" href="Controlador?opcion=art&idart=<%=rs.getString("disc_idart")%>" style="background-image: url(<%=rs.getString("disc_img")%>);">
		<div>
		<h2><%=rs.getString("disc_nom")%></h2>
		<h3><%=rs.getString("disc_pre")%></h3><i class="fa fa-euro-sign"></i>
		</div>
	</a>
	<%}%>
</div>
	
</body>
</html>
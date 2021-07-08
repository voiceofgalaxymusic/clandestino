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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Clandestino</title>
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="catalogo">
	<div class="catal">
	<a class="linkcatal" href="artistas.jsp">Artistas<span></span></a>
		<% Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_art ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
		<% for (int i = 0; i<10; i++){ 
		rs.next();%>
			<a class="catalogos" href="Controlador?opcion=art&idart=<%=rs.getString("art_id")%>" style="background-image: url(<%= rs.getString("art_img") %>);">
				<div>
				<h2><%=rs.getString("art_nom") %></h2>
				<h3><%=rs.getString("art_gen") %></h3>
				</div>
			</a>
		<%}%>
	</div>
	<div class="catal cataldisc">
	<a class="linkcatal" href="discos.jsp">Discos<span></span></a>
		<%sql = "select * from t_disc";
		rs = st.executeQuery(sql);
		for (int i = 0; i<10; i++) {
			rs.next();%>
		<a class="catalogos" href="Controlador?opcion=art&idart=<%=rs.getString("disc_idart")%>" style="background-image: url(<%=rs.getString("disc_img")%>);">
			<div>
			<h2><%=rs.getString("disc_nom")%></h2>
			<h3><%=rs.getString("disc_pre")%></h3><i class="fa fa-euro-sign"></i>
			</div>
		</a>
		<%}%>
	</div>
	<% rs.close();
	st.close();
	con.close();%>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
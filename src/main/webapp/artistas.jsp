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
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
<title>Artistas</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="artdisc">
		<% Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_art ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
		<% while(rs.next()){ %>
			<a class="artdisca" href="Controlador?opcion=art&idart=<%=rs.getString("art_id")%>" style="background-image: url(<%= rs.getString("art_img") %>);">
				<div>
				<h2><%=rs.getString("art_nom") %></h2>
				<h3><%=rs.getString("art_gen") %></h3>
				</div>
			</a>
		<%} rs.close();
			st.close();
			con.close();%>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
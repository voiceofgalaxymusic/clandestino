<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.Conexion"%>
<%@ page import="com.eoi.modelos.Artista"%>
<%@ page import="com.eoi.modelos.ArtistaDAO"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<title>Artistas</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<%
	Connection con = Conexion.getInstance().getConnection();
	Artista a = null;
	String sql;
	Statement st;
	ResultSet rs;
	%>
	<section>
		<div>
			<table>
				<%
				sql = "select * from t_art where art_id = 1";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				%>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Género</th>
					<th>Imagen</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("art_id")%></td>
					<td><%=rs.getString("art_nom")%></td>
					<td><%=rs.getString("art_gen")%></td>
					<td><img src="<%=rs.getString("art_img")%>"></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<div>
			<table>
				<%
				sql = "select * from t_disc where disc_idart = 1";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				%>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Disco ID</th>
					<th>Imagen</th>
					<th>Precio</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("disc_id")%></td>
					<td><%=rs.getString("disc_nom")%></td>
					<td><%=rs.getString("disc_idart")%></td>
					<td><img src="<%=rs.getString("disc_img")%>"></td>
					<td><%=rs.getString("disc_pre")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</section>
</body>
</html>
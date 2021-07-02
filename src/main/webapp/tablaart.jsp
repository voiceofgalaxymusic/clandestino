<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.Conexion"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script>
	function inFormModiart() {
	  document.getElementById("fomrmodiart").style.left = "0";
	}function outFormModiart() {
	  document.getElementById("fomrmodiart").style.left = "-900px";
	}
</script>
<table>
<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_art ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Género</th>
			<th>Avatar</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("art_id") %></td>
			<td><%=rs.getString("art_nom") %></td>
			<td><%=rs.getString("art_gen") %></td>
			<td><img src="<%= rs.getString("art_img") %>"></td>
			<td><button onclick="inFormModiart()"><i class="fa fa-edit"></i></button><button><i class="fa fa-trash"></i></button></td>
		</tr><%} %>
	</table>
	
	<div id="formuser1"><div id="formuser2">
	<div id="fomrmodiart"><button class="botoncerrar" onclick="outFormModiart()"><i class="fa fa-times-circle"></i></button><%@include file="formmodiart.jsp" %></div>
	</div></div>
</html>
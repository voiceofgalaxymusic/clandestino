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
<title>Usuario</title>
</head>
<script>
<!-- +++++++++++++++++++++++++++++++++++++ user ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "200px";
	}function outFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "-800px";
	}
	
	function inFormModiuser() {
	  document.getElementById("fomrmodiuser").style.left = "200px";
	}function outFormModiuser() {
	  document.getElementById("fomrmodiuser").style.left = "-800px";
	}
	<!-- ++++++++++++++++++++++++++++++ artista ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearart() {
	  document.getElementById("formcrearart").style.left = "200px";
	}function outFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-800px";
	}
	
	function inFormModiart() {
	  document.getElementById("fomrmodiart").style.left = "200px";
	}function outFormModiart() {
	  document.getElementById("fomrmodiart").style.left = "-800px";
	}
</script>
<body>
<%@include file="header.jsp" %>
	<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_user where user_id='1'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
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
	<!--  +++++++++++++++++++++++++++++++++++  tabla de usuarios +++++++++++++++++++++++++++++++++++++ -->
	<button class="botoncrear" onclick="inFormCrearuser()"><i class="fa fa-user-plus"></i></button>
	<table>
	<%  sql = "select * from t_user";
		st = con.createStatement();
		rs = st.executeQuery(sql); %>
		<caption><b>Usuarios</b></caption>
		<tr>
			<th>ID</th>
			<th>Roll</th>
			<th>Nick</th>
			<th>Nombre</th>
			<th>Pais</th>
			<th>Ciudad</th>
			<th>Avatar</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("user_id") %></td>
			<td><%= rs.getString("user_rol") %></td>
			<td><%= rs.getString("user_nik") %></td>
			<td><%= rs.getString("user_nom") %></td>
			<td><%= rs.getString("user_pai") %></td>
			<td><%= rs.getString("user_ciu") %></td>
			<td><img src="<%= rs.getString("user_img") %>"></td>
			<td><button onclick="inFormModiuser()"><i class="fa fa-edit"></i></button><button><i class="fa fa-trash"></i></button></td>
		</tr><%} %>
	</table>
	<div id="formuser1"><div id="formuser2">
	<div id="formcreauser"><button class="botoncerrar" onclick="outFormCrearuser()"><i class="fa fa-times-circle"></i></button><%@include file="formcreauser.jsp" %></div>
	<div id="fomrmodiuser"><button class="botoncerrar" onclick="outFormModiuser()"><i class="fa fa-times-circle"></i></button><%@include file="formmodiuser.jsp" %></div></div></div>
	
	<!--  +++++++++++++++++++++++++++++++++++  tabla de artistas +++++++++++++++++++++++++++++++++++++ -->
	<button class="botoncrear" onclick="inFormCrearart()"><i class="fa fa-user-plus"></i></button>
	<table>
	<%
		sql = "select * from t_art ";
		st = con.createStatement();
		rs = st.executeQuery(sql);
	%>
		<caption><b>Artistas</b></caption>
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
	<div id="formcrearart"><button class="botoncerrar" onclick="outFormCrearart()"><i class="fa fa-times-circle"></i></button><%@include file="formcrearart.jsp" %></div>
	</div></div>
	
	</section>
</body>
</html>
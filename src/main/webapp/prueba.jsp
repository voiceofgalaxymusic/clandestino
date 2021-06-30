<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.Conexion"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet"> 
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
	<%
		Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_user";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
	%>
	<table>
		<caption><b>Usuarios</b></caption>
		<tr>
			<th>ID</th>
			<th>Roll</th>
			<th>Nick</th>
			<th>Password</th>
			<th>Nombre</th>
			<th>Pais</th>
			<th>Ciudad</th>
			<th>Avatar</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("user_id") %></td>
			<td><%= rs.getString("user_rol") %></td>
			<td><%= rs.getString("user_nik") %></td>
			<td><%= rs.getString("user_pass") %></td>
			<td><%= rs.getString("user_nom") %></td>
			<td><%= rs.getString("user_pai") %></td>
			<td><%= rs.getString("user_ciu") %></td>
			<td><img src="<%= rs.getString("user_img") %>" style="width:50px;"></td>
			
		</tr><%} %>
		
	</table>
	<form action="Controlador" method="post" style="display: inline-blocK;">
		<h1>Crear nuevo usuario</h1>
		<label for="rollUser">Roll</label>
		<input type="text" class="input" name="rollUser"  value="" >*<br>
		<label for="nick">Nick</label>
		<input type="text" class="input" name="nick"  value="" >*<br>
		<label for="pass">Password</label>
		<input type="password" class="input" name="pass"  value="" >*<br>
		<label for="nomUser">Nombre</label>
		<input type="text" class="input" name="nomUser"  value="" >*<br>
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="" >*<br>
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="" >*<br>
		<label for="imguser">URL Avatar</label>
		<input type="text" class="input" name="imguser"  value="" >*<br>
		<input type="hidden" name="opcion" value="altaUser">
		<input type="submit" value="Crear Usuario">
	</form>
	<form action="Controlador" method="post" style="display: inline-blocK;">
		<h1>Modificar usuario</h1>
		<label for="iduser">ID del Usuario</label>
		<input type="text" class="input" name="iduser"  value="" >*<br>
		<label for="rollUser">Roll</label>
		<input type="text" class="input" name="rollUser"  value="" >*<br>
		<label for="nick">Nick</label>
		<input type="text" class="input" name="nick"  value="" >*<br>
		<label for="pass">Password</label>
		<input type="password" class="input" name="pass"  value="" >*<br>
		<label for="nomUser">Nombre</label>
		<input type="text" class="input" name="nomUser"  value="" >*<br>
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="" >*<br>
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="" >*<br>
		<label for="imguser">URL Avatar</label>
		<input type="hidden" name="opcion" value="modiUser">
		<input type="text" class="input" name="imguser"  value="" >*<br>
		<input type="submit" value="Modificar Usuario">
	</form>
</body>
</html>
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
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
<title>Formulario modificar Usuario</title>
</head>
<body>
	<% Usuario user = (Usuario) request.getAttribute("user"); %>
	<form class="formmodi formmodiuser" action="Controlador" method="post">
	<input type="hidden" name="iduser" value="<%= user.getId() %>">
	<h1>Modificar Usuario</h1> 
	<div class="tablaform1">
		<div class="imgform" style="background-image: url(<%= user.getImg() %>)" ></div>
		<div>
			<h2>ID Usuario: <%= user.getId() %></h2>
			<table class="tablaform2">
				<tr>
					<td>Roll</td>
					<td><input type="text" name="rollUser"  value="<%= user.getRol() %>" ></td>
					<td>Nombre</td>
					<td><input type="text" name="nomUser"  value="<%= user.getNom() %>"></td>
				</tr>
				<tr>
					<td>Nickname</td>
					<td><input type="text"  name="nik"  value="<%= user.getNik() %>"></td>
					<td>Password</td>
					<td><input type="text" name="pass"  value="<%= user.getPass() %>"></td>
				</tr>
				<tr>
					<td>Pais</td>
					<td><input type="text" name="pais"  value="<%= user.getPai() %>"></td>
					<td>Ciudad</td>
					<td><input type="text" name="ciudad"  value="<%= user.getCiu() %>" ></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="urlavatar">
		<label for="imguser">URL Avatar</label>
		<input type="text" class="imginput" name="imguser"  value="<%= user.getImg() %>" >
	</div>
	<input type="hidden" name="opcion" value="modiUser">
	<input class="botmodi" type="submit" class="botonform2" value="Modificar">
	</form>

</body>
</html>
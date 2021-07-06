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
<title>Formulario modificar Usuario</title>
</head>
<body>
	<% Usuario user = (Usuario) request.getAttribute("user"); %>
	<form id="formiframeuser" action="Controlador" method="post">
		<h1>Modificar Usuario</h1>
		<label for="iduser">ID del Usuario</label>
		<input id="idvalue" type="text" class="input" name="iduser" readonly value="<%= user.getId() %>" >
		<label for="rollUser">Roll*</label>
		<input id="rollvalue" type="text" class="input" name="rollUser"  value="<%= user.getRol() %>" ><br>
		<label for="nick">Nick*</label>
		<input type="text" class="input" name="nick"  value="<%= user.getNik() %>">
		<label for="pass">Password*</label>
		<input type="text" class="input" name="pass"  value="<%= user.getPass() %>"><br>
		<label for="nombre">Nombre</label>
		<input type="text" class="input" name="nomUser"  value="<%= user.getNom() %>">
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="<%= user.getPai() %>">
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="<%= user.getCiu() %>" ><br>
		<label for="imguser">URL Avatar</label>
		<input type="text" class="input" name="imguser"  value="<%= user.getImg() %>" ><br>
		<input type="hidden" name="opcion" value="modiUser">
		<input type="submit" class="botonform2" value="Modificar">
	</form>
</body>
</html>
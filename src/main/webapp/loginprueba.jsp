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
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<title>Login o Crear Usuario</title>
</head>
<body>
<%@include file="header.jsp" %>

	<div class="bodysection" style="margin-top:50px;">
	<form action="Controlador" method="post" style="display:inline-block;background-color:#a8199f; text-align: right;padding: 50px;position:relative;">
		<h1 style="margin-bottom:50px; color:white;">Regístrese como usuario</h1>
		<input type="hidden" class="input" name="rollUser" value="client">
		<label for="nik">Nickname *</label>
		<input type="text" class="input" name="nik" value="">
		<label for="pass">Contraseña *</label>
		<input type="password" class="input" name="pass" value=""><br>
		<label for="nom">Nombre</label>
		<input type="text" class="input" name="nomUser" value="" style="width:300px"><br>
		<label for="pai">País</label>
		<input type="text" class="input" name="pais" value="">
		<label for="ciu">Ciudad</label>
		<input type="text" class="input" name="ciudad" value=""><br>
		<label for="urlava">URL Avatar</label>
		<input type="text" class="input" name="imguser" value="" style="width:300px"><br>
		<input class="botonform" type="submit" value="Crear usuario">
	</form>

	<form action="Login" method="post" style="display: inline-block;background-color:#a8199f; text-align: right;padding: 50px;position:relative;">
		<h1 style="margin-bottom: 50px; color:white;">Iniciar sesión</h1>
		<label for="nik">Nickname</label>
		<input type="text" class="input" name="nik" value="">*<br>
		<label for="pass">Contraseña</label>
		<input type="password" class="input" name="pass" value="">*<br>
		<input class="botonform" type="submit" value="Login">
		<span style="color: red"><%=(request.getAttribute("msgerr") == null) ? "" : request.getAttribute("msgerr")%></span>
	</form></div>
</body>
</html>
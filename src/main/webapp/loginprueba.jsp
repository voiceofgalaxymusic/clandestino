<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
<title>Login o Crear Usuario</title>
</head>
<body>
<%@include file="header.jsp" %>

	<div class="bodysection" style="margin: 50px auto 200px;">
	<form class="formlogin" action="Controlador" method="post">
		<h1 style="margin-bottom:50px; color:white;">Regístrese como usuario</h1>
		<input type="hidden" name="rollUser" value="client">
		<h2>Nickname *</h2>
		<input type="text"  name="nik" value="">
		<h2>Contraseña *</h2>
		<input type="password" name="pass" value=""><br>
		<h2>Nombre *</h2>
		<input type="text" name="nomUser" value="" style="width:300px"><br>
		<h2>País *</h2>
		<input type="text"  name="pais" value="">
		<h2>Ciudad *</h2>
		<input type="text"  name="ciudad" value=""><br>
		<h2>URL Avatar</h2>
		<input type="text" name="imguser"  value="" style="width:300px"><br>
		<input type="hidden" name="opcion" value="altaUser">
		<input class="botonlogin" type="submit" value="Crear usuario">
	</form>

	<form class="formlogin" action="Login" method="post">
		<h1 style="margin-bottom: 50px; color:white;">Iniciar sesión</h1>
		<h2>Nickname</h2>
		<input type="text" name="nik" value=""><br>
		<h2>Contraseña</h2>
		<input type="password"  name="pass" value=""><br>
		<span class="msgerr"><%=(request.getAttribute("msgerr") == null) ? "" : request.getAttribute("msgerr")%></span>
		<input class="botonlogin" type="submit" value="Login">
		
	</form></div>
	<%@include file="footer.jsp" %>
</body>
</html>
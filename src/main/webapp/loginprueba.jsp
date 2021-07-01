<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form action="" method="post">
		<h1>Regístrese como usuario</h1>
		<label for="roll">Roll</label>
		<input type="text" class="input" name="roll" value="">*<br>
		<label for="nick">Nickname</label>
		<input type="text" class="input" name="nick" value="">*<br>
		<label for="nom">Nombre</label>
		<input type="text" class="input" name="nomuser" value="">*<br>
		<label for="pass">Contraseña</label>
		<input type="password" class="input" name="pass" value="">*<br>
		<label for="pai">País</label>
		<input type="text" class="input" name="pai" value=""><br>
		<label for="ciu">Ciudad</label>
		<input type="text" class="input" name="ciu" value=""><br>
		<label for="urlava">URL Avatar</label>
		<input type="text" class="input" name="urlava" value=""><br>
		<input type="submit" value="Crear usuario">
	</form>
	<form action="" method="post">
		<h1>Login usuario</h1>
		<label for="nick">Nickname</label>
		<input type="text" class="input" name="nick" value="">*<br>
		<label for="pass">Contraseña</label>
		<input type="password" class="input" name="pass" value="">*<br>
		<input type="submit" value="Login">
	</form>
</body>
</html>
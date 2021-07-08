<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet"> 
<title>Clandestino</title>
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
</head>
<form id="form" action="Controlador" method="post" style="display: inline-blocK;">
		<label for="rollUser">Roll</label>
		<input type="text" class="input" name="rollUser" required value="" >*<br>
		<label for="nik">Nick</label>
		<input type="text" class="input" name="nik" required value="" >*<br>
		<label for="pass">Password</label>
		<input type="text" class="input" name="pass" required value="" >*<br>
		<label for="nomUser">Nombre</label>
		<input type="text" class="input" name="nomUser" required value="" >*<br>
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="" >*<br>
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="" >*<br>
		<label for="imguser">URL Avatar</label>
		<input type="text" class="input" name="imguser"  value="" >*<br>
		<input type="hidden" name="opcion" value="altaUserAdmin">
		<input class="botonform2" type="submit" value="Crear">
	</form>
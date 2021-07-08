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
		<label for="nomart">Nombre</label>
		<input type="text" class="input" name="nomart" required  value="" >*<br>
		<label for="geneart">Género</label>
		<input type="text" class="input" name="geneart" required value="" >*<br>
		<label for="imgart">Imagen</label>
		<input type="text" class="input" name="imgart" required  value="" >*<br>
		<input type="hidden" name="opcion" value="altaArt">
		<input class="botonform2" type="submit" value="Crear">
	</form>
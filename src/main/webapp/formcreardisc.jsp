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
		<label for="nomdisc">Nombre</label>
		<input type="text" class="input" name="nomdisc" required value="" >*<br>
		<label for="idartdisc">Id Artista</label>
		<input type="text" class="input" name="idartdisc" required value="" >*<br>
		<label for="imgdisc">Cover</label>
		<input type="text" class="input" name="imgdisc" required value="" >*<br>
		<label for="predisc">Precio</label>
		<input type="text" class="input" name="predisc" required value="" >*<br>
		<input type="hidden" name="opcion" value="altaDisc">
		<input class="botonform2" type="submit" value="Crear">
	</form>
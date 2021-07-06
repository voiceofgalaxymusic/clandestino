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
<title>Formulario modificar Artista</title>
</head>
<body>
<% Artista art = (Artista) request.getAttribute("art"); %>
	<form id="formiframeuser" action="Controlador" method="post">
		<h1>Modificar Artista</h1>
		<label for="idart">Id Artista*</label>
		<input id="idvalue" type="text" class="input" name="idart" readonly value="<%= art.getidart() %>" ><br>
		<label for="nomart">Nombre*</label>
		<input type="text" class="input" name="nomart"  value="<%= art.getNomArt() %>" ><br>
		<label for="geneart">Género</label>
		<input type="text" class="input" name="geneart"  value="<%= art.getGenero() %>" ><br>
		<label for="imgart">Imagen</label>
		<input type="text" class="input" name="imgart"  value="<%= art.getImg() %>" ><br>
		<input type="hidden" name="opcion" value="modiArt">
		<input type="submit" class="botonform2" value="Modificar">
	</form>
</body>
</html>
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
<title>Formulario modificar Disco</title>
</head>
<body>
<% Disco disc = (Disco) request.getAttribute("disc"); %>
	<form id="formiframeuser" action="Controlador" method="post">
		<label for="iddisc">ID del Disco</label>
		<input id="idvalue" type="text" class="input" name="iddisc" readonly value="<%= disc.getDisc_id() %>">
		<label for="nomdisc">Nombre</label>
		<input type="text" class="input" name="nomdisc"  value="<%= disc.getDisc_nom() %>" ><br>
		<label for="idartdisc">ID Artista</label>
		<input type="text" class="input" name="idartdisc"  value="<%= disc.getDisc_idart() %>">
		<label for="imgdisc">URL Cover</label>
		<input type="text" class="input" name="imgdisc"  value="<%= disc.getDisc_img() %>"><br>
		<label for="predisc">Precio</label>
		<input type="text" class="input" name="predisc"  value="<%= disc.getDisc_pre() %>">
		<input type="hidden" name="opcion" value="modiDisc">
		<input type="submit" class="botonform2" value="Modificar">
	</form>
</body>
</html>
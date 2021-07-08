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
<title>Formulario modificar Disco</title>
</head>
<body>
<% Disco disc = (Disco) request.getAttribute("disc"); %>
	<form class="formmodi formmodidisc" action="Controlador" method="post">
	<input type="hidden" name="iddisc" value="<%= disc.getDisc_id() %>">
	<h1>Modificar Disco</h1>
	<div class="tablaform1">
		<div class="imgform" style="background-image: url(<%= disc.getDisc_img() %>)" ></div>
		<div>
			<h2>ID Disco: <%= disc.getDisc_id() %></h2>
			<table class="tablaform2">
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nomdisc"  value="<%= disc.getDisc_nom() %>"></td>
					<td>ID del Artista</td>
					<td><input type="text" class="input" name="idartdisc"  value="<%= disc.getDisc_idart() %>"></td>
				</tr>
				<tr>
					<td>Precio</td>
					<td><input type="text" class="input" name="predisc"  value="<%= disc.getDisc_pre() %>"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="urlavatar">
		<label for="imgdisc">URL Cover</label>
		<input type="text" class="imginput" name="imgdisc"  value="<%= disc.getDisc_img() %>">
	</div>
	<input type="hidden" name="opcion" value="modiDisc">
	<input class="botmodi" type="submit" class="botonform2" value="Modificar">
	</form>
</body>
</html>
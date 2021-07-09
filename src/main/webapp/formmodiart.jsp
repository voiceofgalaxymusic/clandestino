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
<title>Formulario modificar Artista</title>
</head>
<body>
<% Artista art = (Artista) request.getAttribute("art"); %>
	<form class="formmodi formmodiart" action="Controlador" method="post">
	<input type="hidden" name="idart" value="<%= art.getidart() %>">
	<h1>Modificar Artista</h1>
		<div class="tablaform1">
		<div class="imgform" style="background-image: url(<%= art.getImg() %>)" ></div>
		<div>
			<h2>Id Artista: <%= art.getidart() %></h2>
			<table class="tablaform2">
				<tr>
					<td>Nombre</td>
					<td><input type="text" class="input" name="nomart"  value="<%= art.getNomArt() %>" ></td>
					<td>Género</td>
					<td><input type="text" class="input" name="geneart"  value="<%= art.getGenero() %>"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="urlavatar">
		<label for="imguser">URL Avatar</label>
		<input type="text" class="imginput" name="imgart"  value="<%= art.getImg() %>" >
	</div>
	<input type="hidden" name="opcion" value="modiArt">
	<input class="botmodi" type="submit" class="botonform2" value="Modificar">
	</form>
</body>
</html>
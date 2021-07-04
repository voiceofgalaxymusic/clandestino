<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<form id="form" action="Controlador" method="post" style="display: inline-blocK;">
		<label for="nomdisc">Nombre</label>
		<input type="text" class="input" name="nomdisc"  value="" >*<br>
		<label for="artid">Id Artista</label>
		<input type="text" class="input" name="artid"  value="" >*<br>
		<label for="imgdisc">Cover</label>
		<input type="text" class="input" name="imgdisc"  value="" >*<br>
		<label for="precio">Precio</label>
		<input type="text" class="input" name="precio"  value="" >*<br>
		<input type="hidden" name="opcion" value="crearDisc">
		<input class="botonform2" type="submit" value="Crear">
	</form>
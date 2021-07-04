<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<form id="form" action="Controlador" method="post" style="display: inline-blocK;">
		<label for="nomart">Nombre</label>
		<input type="text" class="input" name="nomart"  value="" >*<br>
		<label for="geneart">Género</label>
		<input type="text" class="input" name="geneart"  value="" >*<br>
		<label for="imgart">Imagen</label>
		<input type="text" class="input" name="imgart"  value="" >*<br>
		<input type="hidden" name="opcion" value="altaArt">
		<input class="botonform2" type="submit" value="Crear">
	</form>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<form id="form" action="Controlador" method="post" style="display: inline-blocK;">
		<label for="rollUser">Roll</label>
		<input type="text" class="input" name="rollUser"  value="" >*<br>
		<label for="nick">Nick</label>
		<input type="text" class="input" name="nick"  value="" >*<br>
		<label for="pass">Password</label>
		<input type="text" class="input" name="pass"  value="" >*<br>
		<label for="nomuser">Nombre</label>
		<input type="text" class="input" name="nomuser"  value="" >*<br>
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="" >*<br>
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="" >*<br>
		<label for="imguser">URL Avatar</label>
		<input type="text" class="input" name="imguser"  value="" >*<br>
		<input type="hidden" name="opcion" value="altaUser">
		<input class="botonform2" type="submit" value="Crear">
	</form>
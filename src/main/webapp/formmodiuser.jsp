<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <form action="Controlador" method="post" style="display: inline-blocK;">
		<h1>Modificar usuario</h1>
		<label for="iduser">ID del Usuario</label>
		<input type="text" class="input" name="iduser"  value="" >*<br>
		<label for="rollUser">Roll</label>
		<input type="text" class="input" name="rollUser"  value="" >*<br>
		<label for="nick">Nick</label>
		<input type="text" class="input" name="nick"  value="" >*<br>
		<label for="pass">Password</label>
		<input type="text" class="input" name="pass"  value="" >*<br>
		<label for="nombre">Nombre</label>
		<input type="text" class="input" name="nomUser"  value="" >*<br>
		<label for="pais">Pais</label>
		<input type="text" class="input" name="pais"  value="" >*<br>
		<label for="ciudad">Ciudad</label>
		<input type="text" class="input" name="ciudad"  value="" >*<br>
		<label for="imguser">URL Avatar</label>
		<input type="text" class="input" name="imguser"  value="" >*<br>
		<input type="hidden" name="opcion" value="modiUser">
		<input type="submit" value="Modificar">
	</form>
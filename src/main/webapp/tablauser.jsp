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
<title>Insert title here</title>
</head>
<script>
	function inFormModiuser(id) {
	  document.getElementById("fomrmodiuser").style.left = "0px";
	  document.getElementById("idvalue").value = id;
	}
	function outFormModiuser() {
	  document.getElementById("fomrmodiuser").style.left = "-1300px";
	}</script>
<table>
<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_user";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		Usuario u;%>
		<tr>
			<th>ID</th>
			<th>Roll</th>
			<th>Nick</th>
			<th>Nombre</th>
			<th>Pais</th>
			<th>Ciudad</th>
			<th>Avatar</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("user_id") %></td>
			<td><%= rs.getString("user_rol") %></td>
			<td><%= rs.getString("user_nik") %></td>
			<td><%= rs.getString("user_nom") %></td>
			<td><%= rs.getString("user_pai") %></td>
			<td><%= rs.getString("user_ciu") %></td>
			<td><div style="background-image:url(<%= rs.getString("user_img") %>)"></div></td>
			<td>
				<button onclick="inFormModiuser(<%= rs.getString("user_id")%>)"><i class="fa fa-edit"></i></button>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fa fa-trash"></i></button>
					<input type="hidden" name="iduser" value="<%= rs.getString("user_id")%>">
					<input type="hidden" name="opcion" value="borrarUser">
				</form>
			</td>
		</tr><%} %>
	</table>
	
	<div id="formuser1">
	<div id="fomrmodiuser"><button class="botoncerrar cerr2" onclick="outFormModiuser()"><i class="fa fa-times-circle"></i></button>
		<form id="formiframeuser" action="Controlador" method="post" style="display: inline-blocK;">
			<label for="iduser">ID del Usuario</label>
			<input id="idvalue" type="text" class="input" name="iduser" readonly value="" style="width:50px;margin-right:318px;">
			<label for="rollUser">Roll*</label>
			<input id="rollvalue" type="text" class="input" name="rollUser"  value="" ><br>
			<label for="nick">Nick*</label>
			<input type="text" class="input" name="nick"  value="" style="margin-right:250px;">
			<label for="pass">Password*</label>
			<input type="text" class="input" name="pass"  value=""><br>
			<label for="nombre">Nombre</label>
			<input type="text" class="input" name="nomUser"  value="" style="margin-right:48px;">
			<label for="pais">Pais</label>
			<input type="text" class="input" name="pais"  value="" style="margin-right:45px";>
			<label for="ciudad">Ciudad</label>
			<input type="text" class="input" name="ciudad"  value="" ><br>
			<label for="imguser">URL Avatar</label>
			<input type="text" class="input" name="imguser"  value="" ><br>
			<input type="hidden" name="opcion" value="modiUser">
			<input type="submit" class="botonform2" value="Modificar">
		</form></div></div>
	
</html>
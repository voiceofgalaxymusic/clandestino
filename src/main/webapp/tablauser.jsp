<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.Conexion"%>
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
function inFormModiuser() {
	  document.getElementById("fomrmodiuser").style.left = "0px";
	}
	function outFormModiuser() {
	  document.getElementById("fomrmodiuser").style.left = "-1300px";
	}</script>
<table>
<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_user";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
		<tr>
			<th>ID</th>
			<th>Roll</th>
			<th>Nick</th>
			<th>Nombre</th>
			<th>Pais</th>
			<th>Ciudad</th>
			<th>Avatar</th>
			<th>Acci�n</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("user_id") %></td>
			<td><%= rs.getString("user_rol") %></td>
			<td><%= rs.getString("user_nik") %></td>
			<td><%= rs.getString("user_nom") %></td>
			<td><%= rs.getString("user_pai") %></td>
			<td><%= rs.getString("user_ciu") %></td>
			<td><img src="<%= rs.getString("user_img") %>"></td>
			<td><button onclick="inFormModiuser()"><i class="fa fa-edit"></i></button><button><i class="fa fa-trash"></i></button></td>
		</tr><%} %>
	</table>
	
	<div id="formuser1"><div id="formuser2">
	<div id="fomrmodiuser"><button class="botoncerrar" onclick="outFormModiuser()"><i class="fa fa-times-circle"></i></button>
		<div style="position:absolute;padding: 20px;">
			<%String sql2 = "select * from t_user where user_id='1'";
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(sql2); 
			while(rs2.next()){ %>
				<img src="<%= rs2.getString("user_img") %>" style="width:200px;">
			<%} %></div>
		<form id="formiframeuser" action="Controlador" method="post" style="display: inline-blocK;">
			<label for="iduser">ID del Usuario*</label>
			<input type="text" class="input" name="iduser"  value="" style="width:50px;margin-right:318px;">
			<label for="rollUser">Roll*</label>
			<input type="text" class="input" name="rollUser"  value="" ><br>
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
			<input type="submit" value="Modificar">
		</form></div></div></div>
	
</html>
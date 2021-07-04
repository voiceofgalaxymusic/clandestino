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
		String sql = "select * from t_disc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		Usuario u;%>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>ID de Artista</th>
			<th>Cover</th>
			<th>Precio</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("disc_id") %></td>
			<td><%= rs.getString("disc_nom") %></td>
			<td><%= rs.getString("disc_idart") %></td>
			<td><div style="background-image:url(<%= rs.getString("disc_img") %>)"></div></td>
			<td><%= rs.getString("disc_pre") %></td>
			<td>
			<button onclick="inFormModiuser(<%= rs.getString("disc_id")%>)"><i class="fa fa-edit"></i></button>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fa fa-trash"></i></button>
					<input type="hidden" name="iddisc" value="<%= rs.getString("disc_id")%>">
					<input type="hidden" name="opcion" value="borrarDisc">
				</form>
			</td>
		</tr><%} %>
	</table>
	
	<div id="formuser1"><div id="formuser2">
	<div id="fomrmodiuser"><button class="botoncerrar cerr2" onclick="outFormModiuser()"><i class="fa fa-times-circle"></i></button>
		<form id="formiframeuser" action="Controlador" method="post" style="display: inline-blocK;">
			<label for="iddisc">ID del Disco</label>
			<input id="idvalue" type="text" class="input" name="iddisc" readonly value="">
			<label for="nomdisc">Nombre</label>
			<input type="text" class="input" name="nomdisc"  value="" ><br>
			<label for="idartdisc">ID Artista</label>
			<input type="text" class="input" name="idartdisc"  value="">
			<label for="imgdisc">URL Cover</label>
			<input type="text" class="input" name="imgdisc"  value=""><br>
			<label for="predisc">Precio</label>
			<input type="text" class="input" name="predisc"  value="">
			<input type="hidden" name="opcion" value="modiDisc">
			<input type="submit" class="botonform2" value="Modificar">
		</form></div></div></div>
</html>
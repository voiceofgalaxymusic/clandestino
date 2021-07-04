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
	function inFormModiart(id) {
	  document.getElementById("fomrmodiart").style.left = "0";
	  document.getElementById("idvalue").value = id;
	}
	function outFormModiart() {
	  document.getElementById("fomrmodiart").style.left = "-900px";
	}
</script>
<table>
<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_art ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Género</th>
			<th>Avatar</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("art_id") %></td>
			<td><%=rs.getString("art_nom") %></td>
			<td><%=rs.getString("art_gen") %></td>
			<td><div style="background-image:url(<%= rs.getString("art_img") %>)"></div></td>
			<td>
				<button onclick="inFormModiart(<%=rs.getString("art_id") %>)"><i class="fa fa-edit"></i></button>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fa fa-trash"></i></button>
					<input type="hidden" name="idart" value="<%= rs.getString("art_id")%>">
					<input type="hidden" name="opcion" value="borrarArt">
				</form>
			</td>
		</tr><%} %>
	</table>
	
	<div id="formuser1">
		<div id="fomrmodiart">
			<button class="botoncerrar cerr2" onclick="outFormModiart()"><i class="fa fa-times-circle"></i></button>
			<form id="formiframeart" action="Controlador" method="post" style="display: inline-blocK;">
				<label for="idart">Id Artista*</label>
				<input id="idvalue" type="text" class="input" name="idart" readonly value="" ><br>
				<label for="nomart">Nombre*</label>
				<input type="text" class="input" name="nomart"  value="" ><br>
				<label for="geneart">Género</label>
				<input type="text" class="input" name="geneart"  value="" ><br>
				<label for="imgart">Imagen</label>
				<input type="text" class="input" name="imgart"  value="" ><br>
				<input type="hidden" name="opcion" value="modiArt">
				<input type="submit" class="botonform2" value="Modificar">
			</form>
		</div>
	</div>
</html>
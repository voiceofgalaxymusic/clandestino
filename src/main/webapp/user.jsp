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
<title>Usuario</title>
</head>
<script>
<!-- +++++++++++++++++++++++++++++++++++++ user ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "200px";
	}
	function outFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "-800px";
	}
	
	<!-- ++++++++++++++++++++++++++++++ artista ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearart() {
	  document.getElementById("formcrearart").style.left = "200px";
	}
	function outFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-800px";
	}
</script>
<body>
<%@include file="header.jsp" %>
	<%  Connection con = Conexion.getInstance().getConnection();
		String sql = "select * from t_user where user_id='1'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql); %>
	<section>
	<div class="headuser">
	<% while(rs.next()){ %>
		<img src="<%= rs.getString("user_img") %>">
		<div class="nameuser">
		<h1><%= rs.getString("user_nik") %></h1>
		<h2><%= rs.getString("user_nom") %></h2>
		</div>
		<div class="lugaruser">
		<h1><%= rs.getString("user_ciu") %></h1>
		<h2><%= rs.getString("user_pai") %></h2>
		</div>
		<%} %>
	</div>
	<div class="bodysection">
	<!--  +++++++++++++++++++++++++++++++++++  tabla de usuarios +++++++++++++++++++++++++++++++++++++ -->
	<h2>Usuarios</h2>
	<button class="botoncrear" onclick="inFormCrearuser()"><i class="fa fa-user-plus"></i></button>
	<iframe id="iframeuser" src="tablauser.jsp" ></iframe>
	
	<!--  +++++++++++++++++++++++++++++++++++  tabla de artistas +++++++++++++++++++++++++++++++++++++ -->
	<h2>Artistas</h2>
	<button class="botoncrear" onclick="inFormCrearart()"><i class="fa fa-user-plus"></i></button>
	<iframe id="iframeart" src="tablaart.jsp" ></iframe>
	
	<!--  +++++++++++++++++++++++++++++++++++  formularios  +++++++++++++++++++++++++++++++++++++ -->
	
	<div id="formuser1"><div id="formuser2">
	<div id="formcreauser"><button class="botoncerrar" onclick="outFormCrearuser()"><i class="fa fa-times-circle"></i></button><%@include file="formcreauser.jsp" %></div>
	</div></div>
	
	<div id="formuser1"><div id="formuser2">
	<div id="formcrearart"><button class="botoncerrar" onclick="outFormCrearart()"><i class="fa fa-times-circle"></i></button><%@include file="formcrearart.jsp" %></div>
	</div></div>
	</div>
	</section>
</body>
</html>
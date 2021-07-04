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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Usuario</title>
</head>
<script>
<!-- +++++++++++++++++++++++++++++++++++++ user ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "-7.5vw";
	}
	function outFormCrearuser() {
	  document.getElementById("formcreauser").style.left = "-110vw";
	}
	
	<!-- ++++++++++++++++++++++++++++++ artista ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-7.5vw";
	}
	function outFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-110vw";
	}
	
	<!-- ++++++++++++++++++++++++++++++ disco ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCreardisc() {
	  document.getElementById("formcreardisc").style.left = "-7.5vw";
	}
	function outFormCreardisc() {
	  document.getElementById("formcreardisc").style.left = "-110vw";
	}
</script>
<body>
<%@include file="header.jsp" %>
	<section>
	<div class="headuser">
	<% Usuario user = (Usuario) request.getAttribute("user"); %>
		<div class="imguser" style="background-image:url(<%= user.getImg() %>)"></div>
		<div class="nameuser">
		
		<h1><%= user.getNik() %></h1>
		<h2><%= user.getNom() %></h2>
		</div>
		<div class="lugaruser">
		<h1><%= user.getCiu() %></h1>
		<h2><%= user.getPai() %></h2>
		</div>
	</div>
	<%if(user.getRol().equals("admin")){ %>
	<div class="bodysection">
	<!--  +++++++++++++++++++++++++++++++++++  tabla de usuarios +++++++++++++++++++++++++++++++++++++ -->
		<h2>Usuarios</h2>
		<button class="botoncrear" onclick="inFormCrearuser()"><i class="fa fa-user-plus"></i></button>
		<iframe id="iframeuser" src="tablauser.jsp" ></iframe>
		
	<!--  +++++++++++++++++++++++++++++++++++  tabla de artistas ++++l+++++++++++++++++++++++++++++++++ -->
		<h2>Artistas</h2>
		<button class="botoncrear" onclick="inFormCrearart()"><i class="fa fa-user-plus"></i></button>
		<iframe id="iframeart" src="tablaart.jsp" ></iframe>
		
	<!--  +++++++++++++++++++++++++++++++++++  tabla de discos +++++++++++++++++++++++++++++++++++++ -->
		<h2>Discos</h2>
		<button class="botoncrear" onclick="inFormCreardisc()"><i class="fa fa-user-plus"></i></button>
		<iframe id="iframeart" src="tabladisc.jsp" ></iframe>
	</div>
	<!--  +++++++++++++++++++++++++++++++++++  formularios  +++++++++++++++++++++++++++++++++++++ -->
	
	<div id="formuser1"><div id="formcreauser">
		<div class="backform"></div>
		<button class="cerr1" onclick="outFormCrearuser()"><i class="fa fa-times-circle"></i></button>
		<%@include file="formcreauser.jsp" %>
	</div></div>
	<div id="formuser1"><div id="formcrearart">
		<div class="backform"></div>
		<button class=cerr1 onclick="outFormCrearart()"><i class="fa fa-times-circle"></i></button>
		<%@include file="formcrearart.jsp" %>
	</div></div>
	<div id="formuser1"><div id="formcreardisc">
		<div class="backform"></div>
		<button class=cerr1 onclick="outFormCreardisc()"><i class="fa fa-times-circle"></i></button>
		<%@include file="formcreardisc.jsp" %>
	</div></div>
	
	<form action="Logout" method="post" class="logout">
		<button class="botonlogout">Logout <i class="fa fa-sign-out-alt"></i></button>
	</form>
	
	<%} else{%>
	<% Connection con = Conexion.getInstance().getConnection();
	String sql = "select * from t_compra  where comp_idclien="+user.getId();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql); 
	rs = st.executeQuery(sql);%>
	
	<div class="disccomp">
	<%while (rs.next()) {%>
	<a class="catalogos" href="Controlador?opcion=art&idart=<%=rs.getString("disc_idart")%>" style="background-image: url(<%=rs.getString("disc_img")%>);">
		<div>
		<h2><%=rs.getString("disc_nom")%></h2>
		<h3><%=rs.getString("disc_pre")%></h3><i class="fa fa-euro-sign"></i>
		</div>
	</a>
	<%}%>
	</div>
	<div class="carrito"></div>
	<form action="Logout" method="post" class="logout">
		<button class="botonlogout">Logout <i class="fa fa-sign-out-alt"></i></button>
	</form>
	
	<%}%>
	</section>
</body>
</html>
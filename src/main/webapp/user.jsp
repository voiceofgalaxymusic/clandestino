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
	<%Connection con = Conexion.getInstance().getConnection();
	String sql;
	Statement st;
	ResultSet rs;%>
	
	<%HttpSession sesion = request.getSession();
	String nik = "" + sesion.getAttribute("nik");
	String psql = "select * from t_user where user_nik = ?";
	PreparedStatement pst = con.prepareStatement(psql);
	pst.setString(1, nik);
	rs = pst.executeQuery();
	Usuario user = new Usuario();
	
	 if (rs.next()) {
		user.setId(rs.getString("user_id"));
		user.setRol(rs.getString("user_rol"));
		user.setNik(rs.getString("user_nik"));
		user.setPass(rs.getString("user_pass"));
		user.setNom(rs.getString("user_nom"));
		user.setPai(rs.getString("user_pai"));
		user.setCiu(rs.getString("user_ciu"));
		user.setImg(rs.getString("user_img"));
	}%>
	
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
	<% sql = "select * from t_user";
	 st = con.createStatement();
	 rs = st.executeQuery(sql);
	 if(user.getRol().equals("admin")){ %>
	<div class="bodysection">
	<!--  +++++++++++++++++++++++++++++++++++  tabla de usuarios +++++++++++++++++++++++++++++++++++++ -->
		<h2>Usuarios</h2>
		
		<button class="botoncrear" onclick="inFormCrearuser()"><i class="fa fa-user-plus"></i></button>
		<div class="tablas">
		<table>
		<tr>
			<th>ID</th><th>Roll</th><th>Nick</th><th>Nombre</th><th>Pais</th><th>Ciudad</th><th>Avatar</th><th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("user_id") %></td><td><%= rs.getString("user_rol") %></td><td><%= rs.getString("user_nik") %></td>
			<td><%= rs.getString("user_nom") %></td><td><%= rs.getString("user_pai") %></td>
			<td><%= rs.getString("user_ciu") %></td>
			<td><div style="background-image:url(<%= rs.getString("user_img") %>)"></div></td>
			<td>
				<a href="Controlador?opcion=formmodiuser&iduser=<%=rs.getString("user_id")%>" ><i class="fa fa-edit"></i></a>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fas fa-trash-alt"></i></button>
					<input type="hidden" name="iduser" value="<%= rs.getString("user_id")%>">
					<input type="hidden" name="opcion" value="borrarUser">
				</form>
			</td>
		</tr>
		<%}	%>
	</table>
	</div>
		
	<!--  +++++++++++++++++++++++++++++++++++  tabla de artistas ++++l+++++++++++++++++++++++++++++++++ -->
		<h2>Artistas</h2>
		<button class="botoncrear" onclick="inFormCrearart()"><i class="fa fa-user-plus"></i></button>
		<div class="tablas">
		<table>
		<%  sql = "select * from t_art ";
			st = con.createStatement();
			rs = st.executeQuery(sql); %>
		<tr>
			<th>ID</th><th>Nombre</th><th>Género</th><th>Avatar</th><th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("art_id") %></td><td><%=rs.getString("art_nom") %></td>
			<td><%=rs.getString("art_gen") %></td>
			<td><div style="background-image:url(<%= rs.getString("art_img") %>)"></div></td>
			<td>
				<a href="Controlador?opcion=formmodiart&idart=<%=rs.getString("art_id")%>" ><i class="fa fa-edit"></i></a>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fas fa-trash-alt"></i></button>
					<input type="hidden" name="idart" value="<%= rs.getString("art_id")%>">
					<input type="hidden" name="opcion" value="borrarArt">
				</form>
			</td>
		</tr><%}%>
	</table></div>
		
	<!--  +++++++++++++++++++++++++++++++++++  tabla de discos +++++++++++++++++++++++++++++++++++++ -->
		<h2>Discos</h2>
		<button class="botoncrear" onclick="inFormCreardisc()"><i class="fa fa-user-plus"></i></button>
		<div class="tablas">
		<table>
		<%   sql = "select * from t_disc";
			 st = con.createStatement();
			 rs = st.executeQuery(sql);%>
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
				<a href="Controlador?opcion=formmodidisc&iddisc=<%=rs.getString("disc_id")%>" ><i class="fa fa-edit"></i></a>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fas fa-trash-alt"></i></button>
					<input type="hidden" name="iddisc" value="<%= rs.getString("disc_id")%>">
					<input type="hidden" name="opcion" value="borrarDisc">
				</form>
			</td>
		</tr>
		<%}	%>
	</table></div>
	
	<!--  +++++++++++++++++++++++++++++++++++  compras  +++++++++++++++++++++++++++++++++++++ -->
	<div class="tablas">
		<table>
		<%   sql = "select * from t_compra";
			 st = con.createStatement();
			 rs = st.executeQuery(sql);%>
		<tr>
			<th>ID de Compra</th>
			<th>ID del Cliente</th>
			<th>ID del Disco</th>
			<th>Cantidad</th>
			<th>Acción</th>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%= rs.getString("comp_id ") %></td>
			<td><%= rs.getString("comp_idclien ") %></td>
			<td><%= rs.getString("comp_iddisc ") %></td>
			<td><%= rs.getString("comp_cant  ") %></td>
			<td>
				<form class="formborrar"action="Controlador" method="get">
					<button><i class="fas fa-trash-alt"></i></button>
					<input type="hidden" name="iddisc" value="<%= rs.getString("comp_id")%>">
					<input type="hidden" name="opcion" value="borrarDisc">
				</form>
			</td>
		</tr>
		<%}	%>
	</table></div>
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
	
	<%} else {%>
	<%  sql = "select * from t_compra where comp_idclien="+user.getId();
	 st = con.createStatement();
	 rs = st.executeQuery(sql); %>
	
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
	
	<%rs.close();
	st.close();
	con.close();%>
	<%}%>
	</section>
</body>
</html>
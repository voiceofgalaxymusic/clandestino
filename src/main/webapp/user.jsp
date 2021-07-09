<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.controladores.*"%>
<%@ page import="com.eoi.modelos.*"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://pagecdn.io/lib/easyfonts/fonts.css" rel="stylesheet">
<link rel="shortcut icon" href="http://arigar.com/wp-content/uploads/2017/06/favicon-music.png">
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
	function DesplegarTabUser() {
		document.getElementById("tabuser").style.height = "500px";
		document.getElementById("botondesplegar1").style.rotate = "180deg";
		document.getElementById("botonplegar1").style.display = "inline-block";
		
	}
	function PlegarTabUser() {
		document.getElementById("tabuser").style.height = "0px";
		document.getElementById("botonplegar1").style.display = "none";
		document.getElementById("botondesplegar1").style.rotate = "0deg";
	}
	
	<!-- ++++++++++++++++++++++++++++++ artista ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-7.5vw";
	}
	function outFormCrearart() {
	  document.getElementById("formcrearart").style.left = "-110vw";
	}
	function DesplegarTabArt() {
		document.getElementById("tabart").style.height = "500px";
		document.getElementById("botondesplegar2").style.rotate = "180deg";
		document.getElementById("botonplegar2").style.display = "inline-block";
		
	}
	function PlegarTabArt() {
		document.getElementById("tabart").style.height = "0px";
		document.getElementById("botonplegar2").style.display = "none";
		document.getElementById("botondesplegar2").style.rotate = "0deg";
	}
	<!-- ++++++++++++++++++++++++++++++ disco ++++++++++++++++++++++++++++++++++++++ -->
	function inFormCreardisc() {
	  document.getElementById("formcreardisc").style.left = "-7.5vw";
	}
	function outFormCreardisc() {
	  document.getElementById("formcreardisc").style.left = "-110vw";
	}
	function DesplegarTabDisc() {
		document.getElementById("tabdisc").style.height = "500px";
		document.getElementById("botondesplegar3").style.rotate = "180deg";
		document.getElementById("botonplegar3").style.display = "inline-block";
	}
	function PlegarTabDisc() {
		document.getElementById("tabdisc").style.height = "0px";
		document.getElementById("botonplegar3").style.display = "none";
		document.getElementById("botondesplegar3").style.rotate = "0deg";
	}
	<!-- ++++++++++++++++++++++++ ventana del carrito ++++++++++++++++++++++++++++++ -->
	function incarritoventana() {
	  document.getElementById("carritoventana").style.display = "block";
	}
	function outcarritoventana() {
	  document.getElementById("carritoventana").style.display = "none";
	}
	function DesplegarTabComp() {
		document.getElementById("tabcomp").style.height = "500px";
		document.getElementById("botondesplegar4").style.rotate = "180deg";
		document.getElementById("botonplegar4").style.display = "inline-block";
	}
	function PlegarTabComp() {
		document.getElementById("tabcomp").style.height = "0px";
		document.getElementById("botonplegar4").style.display = "none";
		document.getElementById("botondesplegar4").style.rotate = "0deg";
	}
</script>
<body>
	<%@include file="header.jsp"%>
	<section>
		<div class="headuser">
			<%
			Connection con = Conexion.getInstance().getConnection();
			String sql;
			Statement st;
			ResultSet rs;
			%>

			<%
			HttpSession sesion = request.getSession();
			Usuario user = new Usuario();
			user.setId((String) sesion.getAttribute("id"));
			user.setRol((String) sesion.getAttribute("rol"));
			user.setNik((String) sesion.getAttribute("nik"));
			user.setNom((String) sesion.getAttribute("nom"));
			user.setPass((String) sesion.getAttribute("pass"));
			user.setPai((String) sesion.getAttribute("pai"));
			user.setCiu((String) sesion.getAttribute("ciu"));
			user.setImg((String) sesion.getAttribute("img"));
			%>

			<div class="imguser"
				style="background-image:url(<%=user.getImg()%>)"></div>
			<div class="nameuser">

				<h1><%=user.getNik()%></h1>
				<h2><%=user.getNom()%></h2>
			</div>
			<div class="lugaruser">
				<h1><%=user.getCiu()%></h1>
				<h2><%=user.getPai()%></h2>
			</div>
			
		<form action="Logout" method="get" class="logout">
			<button class="botonlogout">
				Logout <i class="fa fa-sign-out-alt"></i>
			</button>
		</form>
		</div>
		<% sql = "select * from t_user";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		if (user.getRol().equals("admin")) {%>
		<div class="bodysection">
			<!--  +++++++++++++++++++++++++++++++++++  tabla de usuarios +++++++++++++++++++++++++++++++++++++ -->
			<h2>Usuarios
				<button class="botoncrear" onclick="inFormCrearuser()">
					<i class="fa fa-user-plus"></i>
				</button>
				<button id="botondesplegar1" class="botondesplegar" onclick="DesplegarTabUser()">
					<i class="fas fa-chevron-down"></i>
				</button>
				<button id="botonplegar1" class="botonplegar" onclick="PlegarTabUser()">
				</button>
			</h2>
			
			<div class="tablas" id="tabuser">
				<table class="tablacrear">
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
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("user_id")%></td>
						<td><%=rs.getString("user_rol")%></td>
						<td><%=rs.getString("user_nik")%></td>
						<td><%=rs.getString("user_nom")%></td>
						<td><%=rs.getString("user_pai")%></td>
						<td><%=rs.getString("user_ciu")%></td>
						<td><div
								style="background-image:url(<%=rs.getString("user_img")%>)"></div></td>
						<td>
							<a href="Controlador?opcion=formmodiuser&iduser=<%=rs.getString("user_id")%>"><i class="fa fa-edit"></i></a>
							<form class="formborrar" action="Controlador" method="get">
								<button>
									<i class="fas fa-trash-alt"></i>
								</button>
								<input type="hidden" name="iduser" value="<%=rs.getString("user_id")%>">
								<input type="hidden" name="opcion" value="borrarUser">
							</form></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>

			<!--  +++++++++++++++++++++++++++++++++++  tabla de artistas ++++l+++++++++++++++++++++++++++++++++ -->
			<h2>Artistas
			<button class="botoncrear" onclick="inFormCrearart()">
				<i class="fa fa-user-plus"></i>
			</button>
			<button id="botondesplegar2" class="botondesplegar" onclick="DesplegarTabArt()">
				<i class="fas fa-chevron-down"></i>
			</button>
			<button id="botonplegar2" class="botonplegar" onclick="PlegarTabArt()">
			</button></h2>
			<div class="tablas" id="tabart">
				<table class="tablacrear">
					<%
					sql = "select * from t_art ";
					st = con.createStatement();
					rs = st.executeQuery(sql);
					%>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Género</th>
						<th>Avatar</th>
						<th>Acción</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("art_id")%></td>
						<td><%=rs.getString("art_nom")%></td>
						<td><%=rs.getString("art_gen")%></td>
						<td><div
								style="background-image:url(<%=rs.getString("art_img")%>)"></div></td>
						<td>
							<a href="Controlador?opcion=formmodiart&idart=<%=rs.getString("art_id")%>"><i class="fa fa-edit"></i></a>
							<form class="formborrar" action="Controlador" method="get">
								<button><i class="fas fa-trash-alt"></i></button>
								<input type="hidden" name="idart" value="<%=rs.getString("art_id")%>">
								<input type="hidden" name="opcion" value="borrarArt">
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>

			<!--  +++++++++++++++++++++++++++++++++++  tabla de discos +++++++++++++++++++++++++++++++++++++ -->
			<h2>Discos
			<button class="botoncrear" onclick="inFormCreardisc()">
				<i class="fa fa-user-plus"></i>
			</button>
			<button id="botondesplegar3" class="botondesplegar" onclick="DesplegarTabDisc()">
				<i class="fas fa-chevron-down"></i>
			</button>
			<button id="botonplegar3" class="botonplegar" onclick="PlegarTabDisc()">
			</button></h2>
			<div class="tablas" id="tabdisc">
				<table class="tablacrear">
					<%
					sql = "select * from t_disc";
					st = con.createStatement();
					rs = st.executeQuery(sql);
					%>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>ID de Artista</th>
						<th>Cover</th>
						<th>Precio</th>
						<th>Acción</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("disc_id")%></td>
						<td><%=rs.getString("disc_nom")%></td>
						<td><%=rs.getString("disc_idart")%></td>
						<td><div style="background-image:url(<%=rs.getString("disc_img")%>)"></div></td>
						<td><%=rs.getString("disc_pre")%></td>
						<td>
							<a href="Controlador?opcion=formmodidisc&iddisc=<%=rs.getString("disc_id")%>"><i class="fa fa-edit"></i></a>
							<form class="formborrar" action="Controlador" method="get">
								<button>
									<i class="fas fa-trash-alt"></i>
								</button>
								<input type="hidden" name="iddisc" value="<%=rs.getString("disc_id")%>">
								<input type="hidden" name="opcion" value="borrarDisc">
							</form>
						</td>
					</tr>
					<% } %>
				</table>
			</div>

			<!--  +++++++++++++++++++++++++++++++++++  compras  +++++++++++++++++++++++++++++++++++++ -->
			<h2>Compras
			<button id="botondesplegar4" class="botondesplegar" onclick="DesplegarTabComp()">
				<i class="fas fa-chevron-down"></i>
			</button>
			<button id="botonplegar4" class="botonplegar" onclick="PlegarTabComp()">
			</button></h2>
			<div class="tablas" id="tabcomp">
				<table class="tablacrear">
					<%sql = "select * from t_compra";
					st = con.createStatement();
					rs = st.executeQuery(sql);%>
					<tr>
						<th>ID de Compra</th>
						<th>ID del Cliente</th>
						<th>ID del Disco</th>
						<th>Cantidad</th>
						<th>Acción</th>
					</tr>
					<%while (rs.next()) {%>
					<tr>
						<td><%=rs.getString("comp_id")%></td>
						<td><%=rs.getString("comp_idclien")%></td>
						<td><%=rs.getString("comp_iddisc")%></td>
						<td><%=rs.getString("comp_cant")%></td>
						<td>
							<form class="formborrar" action="Controlador" method="get">
								<button>
									<i class="fas fa-trash-alt"></i>
								</button>
								<input type="hidden" name="idcomp" value="<%=rs.getString("comp_id")%>">
								<input type="hidden" name="opcion" value="borrarComp">
							</form>
						</td>
					</tr>
					<%}%>
				</table>
			</div>
		</div>
		<!--  +++++++++++++++++++++++++++++++++++  formularios  +++++++++++++++++++++++++++++++++++++ -->

		<div id="formuser1">
			<div id="formcreauser">
				<div class="backform"></div>
				<button class="cerr1" onclick="outFormCrearuser()">
					<i class="fa fa-times-circle"></i>
				</button>
				<%@include file="formcreauser.jsp"%>
			</div>
		</div>
		<div id="formuser1">
			<div id="formcrearart">
				<div class="backform"></div>
				<button class=cerr1 onclick="outFormCrearart()">
					<i class="fa fa-times-circle"></i>
				</button>
				<%@include file="formcrearart.jsp"%>
			</div>
		</div>
		<div id="formuser1">
			<div id="formcreardisc">
				<div class="backform"></div>
				<button class=cerr1 onclick="outFormCreardisc()">
					<i class="fa fa-times-circle"></i>
				</button>
				<%@include file="formcreardisc.jsp"%>
			</div>
		</div>

		<%} else {%>
		
		
		<!-- +++++++++++++++++++++++++++++++++++ CLIENTE +++++++++++++++++++++++++++++++++++++++++++++++++ -->
		<% sql = "select * from t_compra where comp_idclien=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,user.getId());
		rs = pst.executeQuery();
		ResultSet rsc= null; %>
		<div id="botonesart">
			<a href="artistas.jsp"><i class="fas fa-microphone-alt"></i></a>
			<a href="discos.jsp"><i class="fas fa-compact-disc"></i></a>
			<a href="Controlador?opcion=formmodiuserclient&iduser=<%=user.getId()%>"><i class="fa fa-edit"></i></a></div>
		
		<div class="disccomp">
		<h1>Tus Compras</h1>
			<%while (rs.next()) {
				sql = "SELECT * FROM t_disc WHERE disc_id = ?";
				pst = con.prepareStatement(sql);
				pst.setString(1, rs.getString("comp_iddisc"));
				rsc = pst.executeQuery();
				
				while(rsc.next()){%>
					<a href="Controlador?opcion=art&idart=<%=rsc.getString("disc_idart")%>" class="discoscomp">
						<img src="<%=rsc.getString("disc_img")%>">
						<h3><%=rsc.getString("disc_nom")%></h3>
						<h3><%=rsc.getString("disc_pre")%><i class="fa fa-euro-sign"></i></h3>
						<h3>Cantidad: <%=rs.getString("comp_cant")%></h3>
					</a>
				<%}}%>
		</div>
		<div class="carrito">
			<h1>Lista de la compra</h1>
			<%
			List<String> discosList = null;
			List<String> discosCant = null;
			String idDisc = null;
			String discCant = null;
			double preDisc = 0;
			double totalCompra = 0;
			if(sesion.getAttribute("discosList") != null){
				discosList =(List<String>) sesion.getAttribute("discosList");
				discosCant = (List<String>) sesion.getAttribute("discosCant");
				for (int i=0;i<discosList.size();i++){
					idDisc = discosList.get(i);
					discCant = discosCant.get(i);
					sql = "SELECT * FROM t_disc WHERE disc_id = ?";
					pst = con.prepareStatement(sql);
					pst.setString(1, idDisc);
					rsc = pst.executeQuery();
					while(rsc.next()){
						preDisc = Double.parseDouble(rsc.getString("disc_pre"));
						totalCompra = totalCompra + (preDisc * Double.parseDouble(discCant));
						%><a href="Controlador?opcion=art&idart=<%=rsc.getString("disc_idart")%>" class="discoscomp">
						<img src="<%=rsc.getString("disc_img")%>">
						<h3><%= rsc.getString("disc_nom") %></h3>
						<h3><%= rsc.getString("disc_pre") %><i class="fa fa-euro-sign"></i></h3>
						<h3>Cantidad: <%= discCant %></h3>
						</a><%
					}
				}
				%> <h2>Precio total: <%= totalCompra %></h2>
				<botton class="botonventcarrito" onclick="incarritoventana()"><h2>Comprar</h2></botton>
					<div  id="carritoventana">
					<button class="outventanacarrito" onclick="outcarritoventana()">
							<i class="fa fa-times-circle"></i>
						</button>
						<form class="formcarritoboton" action="Controlador" method="post">
						
						<%totalCompra = 0;
						for (int i=0;i<discosList.size();i++){
							idDisc = discosList.get(i);
							discCant = discosCant.get(i);
							sql = "SELECT * FROM t_disc WHERE disc_id = ?";
							pst = con.prepareStatement(sql);
							pst.setString(1, idDisc);
							rsc = pst.executeQuery();
							while(rsc.next()){
								preDisc = Double.parseDouble(rsc.getString("disc_pre"));
								totalCompra = totalCompra + (preDisc * Double.parseDouble(discCant));
								%><div class="discoscaritoventana">
								<img src="<%=rsc.getString("disc_img")%>">
								<h3><%= rsc.getString("disc_nom") %></h3>
								<h3><%= rsc.getString("disc_pre") %><i class="fa fa-euro-sign"></i></h3>
								<h3>Cantidad: <%= discCant %></h3>
								</div><%
							}
						} %>
							<h2>Precio total: <%= totalCompra %><i class="fa fa-euro-sign"></i></h2>
							<input type="hidden" name="iduser" value="<%= sesion.getAttribute("id") %>">
							<input type="hidden" name="opcion" value="comp">
							<button><h2>Comprar</h2></button>
						</form>
					</div>
			<%}else{%>  
				<a href="artistas.jsp" class="imgcarrito"></a>
				<h3>No hay nada</h3>
				<%}}%>

		</div>
		<%rs.close();
		st.close();
		con.close();%>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>
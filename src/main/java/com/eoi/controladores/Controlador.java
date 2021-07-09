package com.eoi.controladores;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eoi.modelos.*;

@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// CON EL METODO DOGET UTILIZAMOS PARA ELIMINAR USUARIOS, ARTISTAS O DISCOS

		String opcion = request.getParameter("opcion");
		String iduser = request.getParameter("iduser");
		String idart = request.getParameter("idart");
		String iddisc = request.getParameter("iddisc");
		String idcomp = request.getParameter("idcomp");
		Artista art = null;
		Usuario user = null;
		Disco disc = null;

		UsuarioDAO udao = new UsuarioDAO();
		ArtistaDAO adao = new ArtistaDAO();
		DiscoDAO ddao = new DiscoDAO();
		CompraDAO cdao = new CompraDAO();

		String destPage = "user.jsp";

		switch (opcion) {
		case "sesion":
			HttpSession sesion = request.getSession();
			if (sesion.getAttribute("login") == null) {
				destPage = "loginprueba.jsp";
			} else {
				if (sesion.getAttribute("login").equals("on")) {
					destPage = "user.jsp";
				} else {
					destPage = "loginprueba.jsp";
				}
			}
			break;
		case "formmodiuserclient":
			destPage = "formmodiuserclient.jsp";
			try {
				user = udao.getUser(iduser);
				request.setAttribute("user", user);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "formmodiuser":
			destPage = "formmodiuser.jsp";
			try {
				user = udao.getUser(iduser);
				request.setAttribute("user", user);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "formmodiart":
			destPage = "formmodiart.jsp";
			try {
				art = adao.getArtista(idart);
				request.setAttribute("art", art);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "formmodidisc":
			destPage = "formmodidisc.jsp";
			try {
				disc = ddao.getDisc(iddisc);
				request.setAttribute("disc", disc);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "art":
			destPage = "artist.jsp";
			try {
				art = adao.getArtista(idart);
				request.setAttribute("art", art);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "borrarUser":
			try {
				udao.borrarUser(iduser);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "borrarArt":
			try {
				adao.borrarArtista(idart);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "borrarDisc":
			try {
				ddao.borrarDisc(iddisc);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "borrarComp":
			System.out.println("id compra: "+idcomp);
			try {
				cdao.borrarCompra(idcomp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// CON EL MÉTODO DOPOST LO UTILIZAMOS PARA COMPLETAR LOS DATOS DE FORMULARIOS

		// SERÍA LA MISMA VARIABLE PARA TODOS LOS FORMS
		String opcion = request.getParameter("opcion");

		// DATOS DEL USUARIO
		String iduser = request.getParameter("iduser");
		String rollUser = request.getParameter("rollUser");
		String nik = request.getParameter("nik");
		String pass = request.getParameter("pass");
		String nomUser = request.getParameter("nomUser");
		String pais = request.getParameter("pais");
		String ciudad = request.getParameter("ciudad");
		String imgUser = request.getParameter("imguser");

		Usuario u = new Usuario(rollUser, nik, nomUser, pass, pais, ciudad, imgUser);
		Usuario u2 = new Usuario(iduser, rollUser, nik, nomUser, pass, pais, ciudad, imgUser);
		UsuarioDAO udao = new UsuarioDAO();

		// DATOS DEL ARTISTA
		String idart = request.getParameter("idart");
		String nomArt = request.getParameter("nomart");
		String geneArt = request.getParameter("geneart");
		String imgArt = request.getParameter("imgart");

		Artista a = new Artista(nomArt, geneArt, imgArt);
		Artista a2 = new Artista(idart, nomArt, geneArt, imgArt);
		ArtistaDAO adao = new ArtistaDAO();

		// DATOS DEL DISCO
		String idDisc = request.getParameter("iddisc");
		String nomDisc = request.getParameter("nomdisc");
		String idArtDisc = request.getParameter("idartdisc");
		String imgDisc = request.getParameter("imgdisc");
		String preDisc = request.getParameter("predisc");

		Disco d = new Disco(nomDisc, idArtDisc, imgDisc, preDisc);
		Disco d2 = new Disco(idDisc, nomDisc, idArtDisc, imgDisc, preDisc);
		DiscoDAO ddao = new DiscoDAO();

		// DATOS COMPRA
		CompraDAO cdao = new CompraDAO();
		
		String destPage = "user.jsp";
		switch (opcion) {
		case "comp":
				System.out.println(iduser);
			try {
				cdao.altaCompra(iduser, request, response);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "modiUser":
			System.out.println(u2.getNik());
			System.out.println(iduser);
			try {
				HttpSession sesion = request.getSession();

				sesion.setAttribute("id", u.getId());
				sesion.setAttribute("rol", u.getRol());
				sesion.setAttribute("nik", u.getNik());
				sesion.setAttribute("nom", u.getNom());
				sesion.setAttribute("pass", u.getPass());
				sesion.setAttribute("pai", u.getPai());
				sesion.setAttribute("ciu", u.getCiu());
				sesion.setAttribute("img", u.getImg());

				sesion.setAttribute("login", "on");
				udao.modificarUser(u2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "altaUserAdmin":
			try {
				if(udao.altaUser(u) == true) {
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "altaUser":
			System.out.println(u.toString());
			try {
				if(udao.altaUser(u) == true) {
					destPage = "loginprueba.jsp";
				}else {
					HttpSession sesion = request.getSession();

					// PREGUNTAR JESUS, SI ESTÁ UTILIZANDO ESTO?
					// PUES CREO QUE PARA MANTENER SESIÓN ABIERTA, DEBEMOS UTILIZAR:
					sesion.setAttribute("id", u.getId());
					sesion.setAttribute("rol", u.getRol());
					sesion.setAttribute("nik", u.getNik());
					sesion.setAttribute("nom", u.getNom());
					sesion.setAttribute("pass", u.getPass());
					sesion.setAttribute("pai", u.getPai());
					sesion.setAttribute("ciu", u.getCiu());
					sesion.setAttribute("img", u.getImg());

					// ADEMÁS SE PODRÍAN UTILIZAR PARA COMPLETAR LA PÁGINA DE USUARIO CON EL NOM...
					// CREO RECORDAR.
					sesion.setAttribute("login", "on");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "modiArt":
			System.out.println(a2.toString());
			try {
				adao.modificarArtista(a2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "altaArt":
			try {
				adao.altaArtista(a);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "modiDisc":
			try {
				ddao.modificarDisc(d2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "altaDisc":
			try {
				ddao.altaDisc(d);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		}
		
		response.sendRedirect(destPage);  
		
		/*RequestDispatcher rd = request.getRequestDispatcher(destPage);
		rd.forward(request, response);*/
	}
}
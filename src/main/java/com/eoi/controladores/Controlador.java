package com.eoi.controladores;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eoi.modelos.*;

@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String iduser = request.getParameter("iduser"); UsuarioDAO udao = new
		 * UsuarioDAO();
		 * 
		 * Usuario u = null; String destPage = "prueba.jsp"; try { u =
		 * udao.getUser(iduser); request.setAttribute("user",u); } catch (SQLException
		 * e) { e.printStackTrace(); } RequestDispatcher rd =
		 * request.getRequestDispatcher(destPage); rd.forward(request, response);
		 */

		//CON EL METODO DOGET UTILIZAMOS PARA ELIMINAR USUARIOS, ARTISTAS O DISCOS
		
		String opcion = request.getParameter("opcion");
		String iduser = request.getParameter("iduser");
		String idart = request.getParameter("idart");
		String iddisc = request.getParameter("iddisc");

		UsuarioDAO udao = new UsuarioDAO();
		ArtistaDAO adao = new ArtistaDAO();
		DiscoDAO ddao = new DiscoDAO();
		
		String destPage = "prueba.jsp";

		switch (opcion) {
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
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//CON EL MÉTODO DOPOST LO UTILIZAMOS PARA COMPLETAR LOS DATOS DE FORMULARIOS
		
		// SERÍA LA MISMA VARIABLE PARA TODOS LOS FORMS
		String opcion = request.getParameter("opcion");

		// DATOS DEL USUARIO
		String iduser = request.getParameter("iduser");
		String rollUser = request.getParameter("rollUser");
		String nick = request.getParameter("nick");
		String pass = request.getParameter("pass");
		String nomUser = request.getParameter("nomUser");
		String pais = request.getParameter("pais");
		String ciudad = request.getParameter("ciudad");
		String imgUser = request.getParameter("imguser");

		Usuario u = new Usuario(rollUser, nick, nomUser, pass, pais, ciudad, imgUser);
		Usuario u2 = new Usuario(iduser, rollUser, nick, nomUser, pass, pais, ciudad, imgUser);
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

		String destPage = "prueba.jsp";
		switch (opcion) {
		case "modiUser":
			try {
				udao.modificarUser(u2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "altaUser":
			try {
				udao.altaUser(u);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "modiArt":
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
				// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

		RequestDispatcher rd = request.getRequestDispatcher(destPage);
		rd.forward(request, response);
	}

}
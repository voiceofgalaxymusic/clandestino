package com.eoi.controladores;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eoi.modelos.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nik = request.getParameter("nik");
		String pass = request.getParameter("pass");

		System.out.println("DATOS EN FORM: " + nik + " " + pass);

		UsuarioDAO udao = new UsuarioDAO();
		Usuario user;
		String pagDest = "index.jsp";
		user = udao.login(nik, pass);
		System.out.println("USUARIO A VERIFICAR LOGIN" + user);

		if (user == null) {

			pagDest = "loginprueba.jsp";

			String msgerr = "Contraseña y/o Nickname incorrecto. Por favor, inténtelo de nuevo.";
			request.setAttribute("msgerr", msgerr);

			System.out.println(request.getParameter(msgerr));

		} else {
			pagDest = "user.jsp";

			HttpSession sesion = request.getSession();

			// PREGUNTAR JESUS, SI ESTÁ UTILIZANDO ESTO?
			// PUES CREO QUE PARA MANTENER SESIÓN ABIERTA, DEBEMOS UTILIZAR:
			sesion.setAttribute("id", user.getId());
			sesion.setAttribute("rol", user.getRol());
			sesion.setAttribute("nik", user.getNik());
			sesion.setAttribute("nom", user.getNom());
			sesion.setAttribute("pass", user.getPass());
			sesion.setAttribute("pai", user.getPai());
			sesion.setAttribute("ciu", user.getCiu());
			sesion.setAttribute("img", user.getImg());
			System.out.println(sesion.getAttribute("id")); 

			// ADEMÁS SE PODRÍAN UTILIZAR PARA COMPLETAR LA PÁGINA DE USUARIO CON EL NOM...
			// CREO RECORDAR.
			sesion.setAttribute("login", "on");

			int contador = 0;
			String contTest = null;
			boolean cookie = true;
			Cookie[] cookies = request.getCookies();
			sesion.setAttribute("login", "on");
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("contadorVisitas")) {
						contTest = c.getValue();
						contador = Integer.parseInt(contTest);
						contador++;
						contTest = String.valueOf(contador);
						cookie = false;
					}

				}
				Cookie contVisitas = new Cookie("contadorVisitas", contTest);
				response.addCookie(contVisitas);

			}
			if (cookie == true) {
				contador++;
				contTest = String.valueOf(contador);
				Cookie contVisitas = new Cookie("contadorVisitas", contTest);
				response.addCookie(contVisitas);
			}

		}

		RequestDispatcher rd = request.getRequestDispatcher(pagDest);
		rd.forward(request, response);

	}
}
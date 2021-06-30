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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iduser = request.getParameter("iduser");
		UsuarioDAO udao = new UsuarioDAO();
		
		Usuario u = null;
		String destPage = "index.jsp";
		try {
			u = udao.getUser(iduser);
			request.setAttribute("user",u);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(destPage);
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("opcion");
		String iduser = request.getParameter("iduser");
		String roll = request.getParameter("roll");
		String nick = request.getParameter("nick");
		String pass = request.getParameter("pass");
		String nombre = request.getParameter("nombre");
		String pais = request.getParameter("pais");
		String ciudad = request.getParameter("ciudad");
		String img = request.getParameter("img");

		Usuario u = new Usuario(roll, nick, nombre, pass, pais, ciudad, img);
		Usuario u2 = new Usuario(iduser, roll, nick, nombre, pass, pais, ciudad, img);
		UsuarioDAO udao = new UsuarioDAO();

		String destPage = "index.jsp";
		switch(opcion) {
		case "m":
			try {
				udao.modificarUser(u2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		break;
		case "a":
			try {
				udao.altaUser(u);
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
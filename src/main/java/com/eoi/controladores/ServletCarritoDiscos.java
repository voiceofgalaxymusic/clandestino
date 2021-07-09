package com.eoi.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletCarritoDiscos")
public class ServletCarritoDiscos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletCarritoDiscos() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// Recuperamos la sesión del cliente
		HttpSession sesion = request.getSession();
		// Creación de la lista de artículos
		List<String> discosList = (List<String>) sesion.getAttribute("discosList");
		List<String> discosCant = (List<String>) sesion.getAttribute("discosCant");
		// Verificar si la lista existe y la crea
		if (discosList == null) {
			discosList = new ArrayList<>();
			discosCant = new ArrayList<>();
			sesion.setAttribute("discosList", discosList);
			sesion.setAttribute("discosCant", discosCant);
		}

		String discoNuevo = null;
		String discoCant = null;
		discoNuevo = request.getParameter("botoncarrito");
		discoCant = request.getParameter("cantidad");
		if (discosList != null) {
			discosList.add(discoNuevo);
			discosCant.add(discoCant);
		}
		response.sendRedirect("user.jsp");  
		
		/*RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
		dispatcher.forward(request, response);*/

	}

}

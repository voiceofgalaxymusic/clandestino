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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//Recuperamos la sesión del cliente
		HttpSession sesion = request.getSession();
		//Creación de la lista de artículos
		List<String>discosList = (List<String>) sesion.getAttribute("discosList");
		//Verificar si la lista existe y la crea
		if(discosList == null) {
			discosList = new ArrayList<>();
			sesion.setAttribute("discosList", discosList);
		}
		
		String discoNuevo = null;
		discoNuevo = request.getParameter("botoncarrito");
		if(discosList != null) {
			discosList.add(discoNuevo);
		}
		
		PrintWriter out = response.getWriter();
		out.print("<h1>Lista de Discos en el carrito<h1>");
		out.print("<br>");
		//Imprimir todos los discos de la lista
		for (String discos: discosList) {
			out.print("<li>"+ discos + "</li>");
		}
		
		//Link para regresar a la página del artista
		 out.print("<br>");

		    out.print("<a href='index.jsp'>Regresar a la página del artista</a>");
	}
//<input type="hidden" value='<%=rs.getString("disc_id")%>'>
}

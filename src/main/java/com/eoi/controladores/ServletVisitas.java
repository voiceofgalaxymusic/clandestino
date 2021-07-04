package com.eoi.controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletVisitas")
public class ServletVisitas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Variable contador
		int contador = 0;
		HttpSession sesion = null;
		// Comprobar si existe la cookie del contador
		Cookie[] cookies = request.getCookies();
		// Comprobar si existen cookies
		if (cookies != null && sesion.isNew()) {
			// Recorre el array de cookies
			for (Cookie c : cookies) {
				// Valida si la cookie tiene el nombre de contadorVisitas
				if (c.getName().equals("contadorVisitas")) {
					// Si la encuentra, asigna el valor a contadorVisitas
					contador = Integer.parseInt(c.getValue());
				}
			}
		}
		// Incrementar el contador
		contador++;

		if (sesion.isNew()) {
			// Agregar la respuesta al navegador, crear la cookie contadorVisitas
			Cookie c = new Cookie("contadorVisitas", Integer.toString(contador));
			response.addCookie(c);
			// Mandar el mensaje al navegador
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("Contador de visitas de cada cliente: " + contador);
		}
	}

}

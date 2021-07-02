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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String nik = request.getParameter("nik");
		String pass = request.getParameter("pass");
		
		UsuarioDAO udao = new UsuarioDAO();
		Usuario user;
		String pagDest = "index.jsp";
		
		try {
			user = udao.login(nik, pass);
			
			if (user != null) {
				
				pagDest = "user.jsp";
				
				HttpSession sesion = request.getSession();
				sesion.setAttribute("user_nik", user.getNom());
				request.setAttribute("user", user);
				sesion.setAttribute("user_rol", user.getRol());	
			} else {
				user = null; 
				String msgerr = "Contraseña y/o Nickname incorrecto. Por favor, inténtelo de nuevo.";
				request.setAttribute("msgerr", msgerr);
				
				System.out.println(request.getParameter(msgerr));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
		RequestDispatcher rd = request.getRequestDispatcher(pagDest);
		rd.forward(request, response);
		
	}

}

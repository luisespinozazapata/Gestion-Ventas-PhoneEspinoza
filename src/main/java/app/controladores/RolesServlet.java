package app.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import app.modelos.Usuario;

/**
 * Servlet implementation class RolesServlet
 */
@WebServlet("/Roles")
public class RolesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Usuario usuario = (Usuario) request.getSession(false).getAttribute("usuario");
		request.setAttribute("usuario", request.getSession(false).getAttribute("usuario"));
		//request.setAttribute("roles", usuario.getRoles());
		request.getRequestDispatcher("/celular/roles.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

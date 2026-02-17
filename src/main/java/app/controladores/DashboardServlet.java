package app.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.modelos.Rol;
import app.modelos.Usuario;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/Portal/Inicio")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(false);
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");
		Rol rolSelect = (Rol) sesion.getAttribute("usuarioRolSelect");
		request.setAttribute("usuario", usuario);
		request.setAttribute("usuarioRolSelect", rolSelect);
		
		request.getRequestDispatcher("/celular/dashboard.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rolIdSelect = Integer.parseInt(request.getParameter("rolId"));
		
		HttpSession sesion = request.getSession(false);
		Usuario usuario = (Usuario) sesion.getAttribute("usuario");
		
		Rol rolSelect = usuario.getRoles().stream().filter(rol -> rol.getId() == rolIdSelect).findFirst().get();
		
		sesion.setAttribute("usuarioRolSelect", rolSelect);
		
		request.setAttribute("usuario", usuario);
		request.setAttribute("usuarioRolSelect", rolSelect);
		
		request.getRequestDispatcher("/celular/dashboard.jsp").forward(request, response);
	}
}

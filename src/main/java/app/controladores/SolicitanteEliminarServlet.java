package app.controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import app.data.SolicitanteDAO;

/**
 * Servlet implementation class ProductoEliminarServlet
 */
@WebServlet("/Solicitante/Eliminar")
public class SolicitanteEliminarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idP = Integer.parseInt(request.getParameter("id"));
	 SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
		boolean ok = solicitanteDAO.eliminar(idP);
		request.setAttribute("ok", ok);	// Se elimina al hacer redirect
		response.sendRedirect(request.getContextPath() + "/Solicitante/Buscar?ok=" + ok);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

package app.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import app.data.SolicitanteDAO;

import app.modelos.Solicitante;

/**
 * Servlet implementation class ProductoBuscarServlet
 */
@WebServlet("/Solicitante/Buscar")
public class SolicitanteBuscarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//boolean ok = (boolean) request.getAttribute("ok");
		request.setAttribute("ok", request.getParameter("ok"));
		request.setAttribute("atrNombre", "");
		request.setAttribute("atrCategoria", "");
		request.setAttribute("atrSolicitantes", new ArrayList<Solicitante>());
		request.getRequestDispatcher("/celular/buscarSolicitante.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recibir la descripcion de los productos a buscar
		String nombre = request.getParameter("txtNombre");
		String categoria = request.getParameter("txtCategoria");
		// Definir variable con el array para enviar a la vista
		SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
		request.setAttribute("atrSolicitantes", solicitanteDAO.buscarPorNombre(nombre));
		request.setAttribute("atrNombre", nombre);
		request.setAttribute("atrCategoria", categoria);
		// Cargar la vista
		request.getRequestDispatcher("/celular/buscarSolicitante.jsp").forward(request, response);
	
	}	
}

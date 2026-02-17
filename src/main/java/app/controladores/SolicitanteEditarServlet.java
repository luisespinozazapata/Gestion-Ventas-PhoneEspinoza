package app.controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import app.data.SolicitanteDAO;

import app.modelos.Modelo;
import app.modelos.Solicitante;

/**
 * Servlet implementation class ProductoEditarServlet
 */
@WebServlet("/Solicitante/Editar")
public class SolicitanteEditarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtenemos el ID a buscar
		int idP = Integer.parseInt(request.getParameter("id"));
		// Buscar el producto y enviarl a la vista
		request.setAttribute("solicitante", solicitanteDAO.buscarPorId(idP));
		// Cargar la página para editar o actualizar
		request.getRequestDispatcher("/celular/actualizarSolicitante.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idP = Integer.parseInt(request.getParameter("numId"));
		String nombre = request.getParameter("txtNombre");
		int modeloId = Integer.parseInt(request.getParameter("cmbModelo"));
		double pagos = Double.parseDouble(request.getParameter("numPagos"));
		double pendiente = Double.parseDouble(request.getParameter("numPendiente"));

		
		Solicitante solicitante = new Solicitante(idP, nombre, new Modelo(modeloId, ""), pagos, pendiente);
		
		boolean ok = solicitanteDAO.actualizar(solicitante);
		
		request.setAttribute("solicitante", solicitante);
		
		request.setAttribute("ok", ok);
		request.setAttribute("titulo", ok ? "Cliente Actualizado!" : "Error al actualizar!");
		request.setAttribute("mensaje", ok ? "El cliente con ID " + solicitante.getId() + " se actualizo corretamente." : "Codigo de error: 103");
		request.getRequestDispatcher("/celular/actualizarSolicitante.jsp").forward(request, response);
	}
}

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
 * Servlet implementation class ProductoRegistrarServlet
 */
@WebServlet("/Solicitante/Registrar")
public class SolicitanteRegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/celular/registrarSolicitante.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recibir datos del formulario
		String nombre = request.getParameter("txtNombre");
		int modeloId = Integer.parseInt(request.getParameter("cmbModelo"));
		double pagos = Double.parseDouble(request.getParameter("numPagos"));
		double pendiente = Double.parseDouble(request.getParameter("numPendiente"));
	
		
		// Registro del producto en la base de datos
		Solicitante solicitante = new Solicitante(-1, nombre, new Modelo(modeloId, ""), pagos, pendiente);
		SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
		solicitante.setId(solicitanteDAO.registrar(solicitante));
		// Enviar ID generado hacia la vista
		request.setAttribute("atrId", solicitante.getId());
		// Despachar hacia la vista
		request.getRequestDispatcher("/celular/registrarSolicitante.jsp").forward(request, response);
	}
}

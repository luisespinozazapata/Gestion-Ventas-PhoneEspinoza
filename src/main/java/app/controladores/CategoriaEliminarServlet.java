package app.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.data.CategoriaDAO;
import app.data.interfaces.ICategoria;

/**
 * Servlet implementation class CategoriaEliminarServlet
 */
@WebServlet("/CategoriaEliminar")
public class CategoriaEliminarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ICategoria dao = new CategoriaDAO();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		 if (idStr != null) {
	            dao.eliminar(Integer.parseInt(idStr));
	        }
	        response.sendRedirect("CategoriaPrincipal?accion=listar");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

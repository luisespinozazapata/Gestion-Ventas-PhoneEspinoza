package app.controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.data.CategoriaDAO;
import app.data.interfaces.ICategoria;

@WebServlet("/CategoriaPrincipal")
public class CategoriaPrincipalServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		ICategoria dao = new CategoriaDAO();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String accion = request.getParameter("accion");
	        
	        if (accion == null) {
	            request.getRequestDispatcher("/celular/categoriaPrincipal.jsp").forward(request, response);
	            return;
	        }

	        if ("listar".equals(accion)) {
	            request.setAttribute("listaCategorias", dao.listar());
	            request.getRequestDispatcher("/celular/categoriaPrincipal.jsp").forward(request, response);
	        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

package app.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.data.CategoriaDAO;
import app.data.interfaces.ICategoria;
import app.modelos.Categoria;


@WebServlet("/CategoriaRegistrar")
public class CategoriaRegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ICategoria dao = new CategoriaDAO();   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
        
        if (accion == null) {
            request.getRequestDispatcher("/celular/categoriaRegistrar.jsp").forward(request, response);
            return;
        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String accion = request.getParameter("accion");

	        if ("guardar".equals(accion)) {
	            Categoria c = new Categoria(
	                request.getParameter("nombre"),
	                request.getParameter("descripcion")
	            );
	            dao.agregar(c);
	            request.getSession().setAttribute("msg", "registrado");
	            response.sendRedirect("CategoriaPrincipal?accion=listar");
	            
	        }
		
	}

}

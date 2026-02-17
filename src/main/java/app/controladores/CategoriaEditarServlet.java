package app.controladores;

import app.data.interfaces.ICategoria;
import app.modelos.Categoria;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import app.data.CategoriaDAO;

import javax.servlet.annotation.WebServlet;

@WebServlet("/CategoriaEditar")
public class CategoriaEditarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICategoria dao = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID de la categoría desde la lista
        String idStr = request.getParameter("id");
        if (idStr == null) {
        	response.sendRedirect("CategoriaPrincipal?accion=listar");
        	return;
        }
            int id = Integer.parseInt(idStr);
            Categoria categoria = dao.obtenerPorId(id);
        if (categoria ==null) {
        	response.sendRedirect("CategoriaPrincipal?accion=listar");
        	return; 
        }
            request.setAttribute("categoria", categoria);
            request.setAttribute("listaCategorias", dao.listar());
            request.getRequestDispatcher("/celular/categoriaEditar.jsp").forward(request, response);
 
      }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibir datos editados desde el formulario
  

        Categoria categoria = new Categoria();
        categoria.setIdCategoria(Integer.parseInt(request.getParameter("id")));
        categoria.setNombre(request.getParameter("nombre"));
        categoria.setDescripcion(request.getParameter("descripcion"));

        dao.actualizar(categoria); // Actualizar en la base de datos

        // Redirigir al listado para ver los cambios
        request.getSession().setAttribute("msg", "actualizado");
        response.sendRedirect("CategoriaPrincipal?accion=listar");
    }
}

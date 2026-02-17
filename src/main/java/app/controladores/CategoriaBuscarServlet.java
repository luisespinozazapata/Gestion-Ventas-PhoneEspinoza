package app.controladores;

import app.data.interfaces.ICategoria;
import app.modelos.Categoria;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import app.data.CategoriaDAO;

import javax.servlet.annotation.WebServlet;

@WebServlet("/CategoriaBuscar")
public class CategoriaBuscarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICategoria dao = new CategoriaDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el nombre a buscar
        String nombreBuscar = request.getParameter("nombre");

        // Llamar al DAO para buscar categorías por nombre
        List<Categoria> listaCategorias = dao.buscarPorNombre(nombreBuscar);

        // Enviar el resultado al JSP
        request.setAttribute("listaCategorias", listaCategorias);
        request.setAttribute("busqueda", nombreBuscar); // opcional, para mostrar el término buscado
        request.getRequestDispatcher("/celular/categoriaBuscar.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/celular/categoriaBuscar.jsp").forward(request, response);
    }
}

package app.controladores;

import app.data.CelularDAO;
import app.data.CategoriaDAO;
import app.data.interfaces.ICelular;
import app.data.interfaces.ICategoria;
import app.modelos.Celular;
import app.modelos.Categoria;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CelularBuscar")
public class CelularBuscarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ICelular dao = new CelularDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }
        if ("listar".equals(accion)) {
            String marca = request.getParameter("marca");
            String idCatParam = request.getParameter("categoria");
            
            List<Celular> lista = null;
            if (marca != null && !marca.trim().isEmpty()) {
                lista = dao.buscarPorMarca(marca);

            } else if (idCatParam != null && !idCatParam.equals("0")) {
                int idCat = Integer.parseInt(idCatParam);
                lista = dao.buscarPorCategoria(idCat);
            }

            ICategoria daoCat = new CategoriaDAO();
            List<Categoria> listaCat = daoCat.listar();

            request.setAttribute("listaCelulares", lista);
            request.setAttribute("listaCategorias", listaCat);
            request.getRequestDispatcher("/celular/celularBuscar.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }
}

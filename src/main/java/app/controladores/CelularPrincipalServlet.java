package app.controladores;

import app.data.CelularDAO;
import app.data.CategoriaDAO;
import app.data.interfaces.ICategoria;
import app.data.interfaces.ICelular;
import app.modelos.Categoria;
import app.modelos.Celular;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CelularPrincipal")
public class CelularPrincipalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ICelular dao = new CelularDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/celular/celularPrincipal.jsp").forward(request, response);
            return;
        }
        if ("listar".equals(accion)) {
        	
            List<Celular> lista = dao.listar();
            ICategoria daoCat = new CategoriaDAO();
            
            List<Categoria> listaCat = daoCat.listar();
            request.setAttribute("listaCelulares", lista);
            request.setAttribute("listaCategorias", listaCat);
            request.getRequestDispatcher("/celular/celularPrincipal.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }
}

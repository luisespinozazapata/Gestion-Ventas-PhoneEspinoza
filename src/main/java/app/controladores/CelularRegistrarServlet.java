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

@WebServlet("/CelularRegistrar")
public class CelularRegistrarServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    ICelular dao = new CelularDAO();
    ICategoria daoCat = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        List<Categoria> listaCat = daoCat.listar();
        request.setAttribute("listaCategorias", listaCat);
        request.getRequestDispatcher("/celular/celularRegistrar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if ("guardar".equals(accion)) {
            Celular c = new Celular(
                    request.getParameter("modelo"),
                    request.getParameter("marca"),
                    Double.parseDouble(request.getParameter("precio")),
                    Integer.parseInt(request.getParameter("stock")),
                    Integer.parseInt(request.getParameter("categoria"))
            );
            dao.agregar(c);
            request.getSession().setAttribute("msg", "registrado");
            response.sendRedirect("CelularPrincipal?accion=listar");
        }
    }
}

package app.controladores;

import app.data.CelularDAO;
import app.data.interfaces.ICelular;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CelularEliminar")
public class CelularEliminarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ICelular dao = new CelularDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            dao.eliminar(Integer.parseInt(idParam));
        }
        response.sendRedirect("CelularPrincipal?accion=listar");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    }
}


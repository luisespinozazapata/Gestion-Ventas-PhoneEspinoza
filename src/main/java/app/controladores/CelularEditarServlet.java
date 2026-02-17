package app.controladores;

import app.data.CelularDAO;
import app.data.CategoriaDAO;
import app.data.interfaces.ICelular;
import app.data.interfaces.ICategoria;
import app.modelos.Celular;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;


import javax.servlet.annotation.WebServlet;

@WebServlet("/CelularEditar")
public class CelularEditarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ICelular dao = new CelularDAO();
    private ICategoria daoCat = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("CelularPrincipal?accion=listar");
            return;
        }
        int id = Integer.parseInt(idParam);
        Celular cel = dao.obtenerPorId(id);
        if (cel == null) {
            response.sendRedirect("CelularPrincipal?accion=listar");
            return;
        }
        request.setAttribute("celular", cel);
        request.setAttribute("listaCategorias", daoCat.listar());
        request.getRequestDispatcher("/celular/celularEditar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        Celular c = new Celular();
        c.setIdCelular(Integer.parseInt(request.getParameter("id")));
        c.setModelo(request.getParameter("modelo"));
        c.setMarca(request.getParameter("marca"));
        c.setPrecio(Double.parseDouble(request.getParameter("precio")));
        c.setStock(Integer.parseInt(request.getParameter("stock")));
        c.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
        dao.actualizar(c);
        
        request.getSession().setAttribute("msg", "actualizado");

        response.sendRedirect("CelularPrincipal?accion=listar");
    }
}

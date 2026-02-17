package app.controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.data.UsuarioDAO;
import app.modelos.Usuario;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/celular/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recibir las credenciales del usuario
		String usuarioNombre = request.getParameter("txtNombre");
		String usuarioClave = request.getParameter("txtClave");
		
		// Validar credenciales
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = usuarioDAO.validar(usuarioNombre, usuarioClave);
		// Verificar si existe el usuario
		if (usuario != null) {
			// Crear la sesión
			HttpSession sesion = request.getSession(true);
			// Cargar datos en la sesión
			sesion.setAttribute("usuario", usuario);
			// Redirigir a la siguiente página
			response.sendRedirect(request.getContextPath() + "/Roles");
			return;
		}
		// En caso no exista, retornamos al Login desencadenando una alerta
		request.setAttribute("ok", false);
		request.setAttribute("titulo", "Crendenciales invalidas!");
		request.setAttribute("mensaje", "Vuelva a intentarlo...");
		request.getRequestDispatcher("/celular/login.jsp").forward(request, response);
	}
}

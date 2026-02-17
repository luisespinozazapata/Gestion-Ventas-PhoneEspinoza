package app.controladores;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.modelos.Ventas;

import app.utils.Database;

/**
 * Servlet implementation class ReservaListadoServlet
 */
@WebServlet("/Ventas/Listar")
public class VentasListadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ventas> ventas = new ArrayList<>();
		String sql = "SELECT * FROM ventas";
		try {
        	Connection cnx = Database.getConexion();
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ventas p = new Ventas(
				    rs.getInt("codigo"),
				    rs.getString("solicitante"),
				    rs.getDate("fecha").toLocalDate(),
				    rs.getTime("hora").toLocalTime(),
				    rs.getInt("cantidad_equipos"),
				    rs.getString("categoria"),
				    rs.getString("modelo"),
				    rs.getString("marca")
				);
				ventas.add(p);
			}
			rs.close(); ps.close(); cnx.close();
		}
        catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("atrVentas", ventas);
		request.getRequestDispatcher("/celular/listarVenta.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

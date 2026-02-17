package app.controladores;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.modelos.Ventas;

import app.utils.Database;

/**
 * Servlet implementation class ReservaRegistrarServlet
 */
@WebServlet("/Ventas/Registrar")
public class VentasRegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/celular/registrarVenta.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String solicitante = request.getParameter("solicitante");
        LocalDate fecha = Date.valueOf(request.getParameter("fecha")).toLocalDate();
        LocalTime hora = LocalTime.parse(request.getParameter("hora"));
        int cantidadEquipos = Integer.parseInt(request.getParameter("cantidad_equipos"));
        String categoria = request.getParameter("categoria");
        String modelo = request.getParameter("modelo");
        String marca = request.getParameter("marca");
		
        Ventas ventas = new Ventas(-1, solicitante, fecha, hora, cantidadEquipos,categoria,modelo,marca);
        int idG = -2;
		String sql = "INSERT INTO ventas (solicitante, fecha, hora, cantidad_equipos,categoria,modelo,marca) VALUES (?, ?, ?, ?,?,?,?)";
        try {
        	Connection cnx = Database.getConexion();
			PreparedStatement ps = cnx.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, ventas.getSolicitante());
			ps.setDate(2, Date.valueOf(ventas.getFecha()));
			ps.setTime(3, Time.valueOf(ventas.getHora()));
			ps.setInt(4, ventas.getCantidadEquipos());
			ps.setString(5,ventas.getCategoria());
			ps.setString(6,ventas.getModelo());
			ps.setString(7,ventas.getMarca());
			
			
			int filasAfectadas = ps.executeUpdate();
			
			if (filasAfectadas > 0) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					idG = rs.getInt(1);
				}
				rs.close();
			}
			
			ps.close(); cnx.close();
		}
        catch (SQLException e) {
			e.printStackTrace();
		}
        request.setAttribute("atrIdGenerado", idG);
		request.getRequestDispatcher("/celular/registrarVenta.jsp").forward(request, response);
	}
}

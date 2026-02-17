package app.data;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import app.data.interfaces.ICelular;
import app.data.interfaces.ISolicitante;
import app.modelos.Categoria;
import app.modelos.Celular;
import app.modelos.Modelo;
import app.modelos.Solicitante;
import app.utils.Database;

public class SolicitanteDAO implements ISolicitante {

	@Override
	public int registrar(Solicitante solicitante) {
		String sql = "INSERT INTO Solicitante (Nombre, ModeloID, Pagos, Pendiente) VALUES (?, ?, ?, ?)";
		try {
			Connection cnx = Database.getConexion();
			PreparedStatement ps = cnx.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, solicitante.getNombre());
			ps.setInt(2, solicitante.getModelo().getId());
			ps.setDouble(3, solicitante.getPagos());
			ps.setDouble(4, solicitante.getPendiente());
			int filasAfectadas = ps.executeUpdate();
			if (filasAfectadas > 0) {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					solicitante.setId(rs.getInt(1));
				}
				rs.close();
			}
			ps.close(); cnx.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return solicitante.getId();
	}

	@Override
	public Solicitante buscarPorId(int id) {
		Solicitante solibuscado = new Solicitante(102, "Solicitante NO encontrado!",new Modelo(), 0.00, 0.00);
		String sql = "{ CALL SP_BuscarSolicitantePorID(?) }";
		try {
			Connection cnx = Database.getConexion();
			CallableStatement ps = cnx.prepareCall(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				solibuscado = new Solicitante(
					rs.getInt("ID"),
					rs.getString("Nombre"),
					new Modelo(
					    rs.getInt("ModeloID"),
					    rs.getString("ModeloNombre")
					),
					rs.getDouble("Pagos"),
					rs.getDouble("Pendiente")
				);
			}
			rs.close(); ps.close(); cnx.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return solibuscado;
	}

	@Override
	public boolean actualizar(Solicitante solicitante) {
		boolean ok = false;
		String sql = "UPDATE Solicitante SET Nombre = ?,ModeloID = ?, Pagos = ?, Pendiente = ? WHERE ID = ?";
		try {
			Connection cnx = Database.getConexion();
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, solicitante.getNombre());
			ps.setInt(2, solicitante.getModelo().getId());
			ps.setDouble(3, solicitante.getPagos());
			ps.setDouble(4, solicitante.getPendiente());
			ps.setInt(5, solicitante.getId());
			int filasAfectadas = ps.executeUpdate();
			ps.close(); cnx.close();
			ok = filasAfectadas > 0;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return ok;
	}

	@Override
	public boolean eliminar(int id) {
		boolean ok = false;
		String sql = "DELETE FROM Solicitante WHERE ID = ?";
		try {
			Connection cnx = Database.getConexion();
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setInt(1, id);
			int filasAfectadas = ps.executeUpdate();
			ps.close(); cnx.close();
			ok = filasAfectadas > 0;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return ok;
	}


	@Override
	public List<Solicitante> buscarPorNombre(String nombre) {
		// Preparar array para enviar resultados a la vista
		List<Solicitante> solicitantesBuscados = new ArrayList<>();
		// Procesar búsqueda con la base de datos
		String sql = "{ CALL BuscarSolicitantePorNombre(?) }";
		try {
			Connection cnx = Database.getConexion();
			CallableStatement ps = cnx.prepareCall(sql);
			ps.setString(1, nombre);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Solicitante solicitante = new Solicitante(
						rs.getInt("ID"),
						rs.getString("Nombre"),
						new Modelo(
						    rs.getInt("ModeloID"),
						    rs.getString("ModeloNombre")
						),
						rs.getDouble("Pagos"),
						rs.getDouble("Pendiente")
				);
				solicitantesBuscados.add(solicitante);
			}
			rs.close(); ps.close(); cnx.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return solicitantesBuscados;
	}
	

}

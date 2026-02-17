package app.data;

import app.utils.*;
import app.data.interfaces.ICelular;
import app.modelos.Celular;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CelularDAO implements ICelular{
	
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public List<Celular> listar() {
        List<Celular> lista = new ArrayList<>();
        try {
            con = new Database().getConexion();
            String sql = "SELECT c.*, cat.nombre AS categoria "
                       + "FROM celular c "
                       + "INNER JOIN categoria cat ON c.id_categoria = cat.id_categoria";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Celular cel = new Celular(
                        rs.getInt("id_celular"),
                        rs.getString("modelo"),
                        rs.getString("marca"),
                        rs.getDouble("precio"),
                        rs.getInt("stock"),
                        rs.getInt("id_categoria")
                );

                lista.add(cel);
            }

        } catch (Exception e) {
            System.out.println("Error listar celulares: " + e.getMessage());
        }

        return lista;
    }

    @Override
    public boolean agregar(Celular c) {
        try {
            con = new Database().getConexion();
            String sql = "INSERT INTO celular (modelo, marca, precio, stock, id_categoria) VALUES (?,?,?,?,?)";

            ps = con.prepareStatement(sql);
            ps.setString(1, c.getModelo());
            ps.setString(2, c.getMarca());
            ps.setDouble(3, c.getPrecio());
            ps.setInt(4, c.getStock());
            ps.setInt(5, c.getIdCategoria());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error agregar celular: " + e.getMessage());
            return false;
        }
    }

    @Override
    public Celular obtenerPorId(int id) {
        Celular cel = null;
        try {
            con = new Database().getConexion();
            String sql = "SELECT * FROM celular WHERE id_celular=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                cel = new Celular(
                    rs.getInt("id_celular"),
                    rs.getString("modelo"),
                    rs.getString("marca"),
                    rs.getDouble("precio"),
                    rs.getInt("stock"),
                    rs.getInt("id_categoria")
                );
            }

        } catch (Exception e) {
            System.out.println("Error obtener celular: " + e.getMessage());
        }

        return cel;
    }

    @Override
    public boolean actualizar(Celular c) {
        try {
            con = new Database().getConexion();
            String sql = "UPDATE celular SET modelo=?, marca=?, precio=?, stock=?, id_categoria=? WHERE id_celular=?";

            ps = con.prepareStatement(sql);
            ps.setString(1, c.getModelo());
            ps.setString(2, c.getMarca());
            ps.setDouble(3, c.getPrecio());
            ps.setInt(4, c.getStock());
            ps.setInt(5, c.getIdCategoria());
            ps.setInt(6, c.getIdCelular());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error actualizar celular: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        try {
            con = new Database().getConexion();
            String sql = "DELETE FROM celular WHERE id_celular=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error eliminar celular: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<Celular> buscarPorMarca(String marca) {
        List<Celular> lista = new ArrayList<>();

        try {
            con = new Database().getConexion();
            CallableStatement cs = con.prepareCall("{CALL BuscarCelularPorMarca(?)}");
            cs.setString(1, marca);
            rs = cs.executeQuery();

            while (rs.next()) {
                Celular c = new Celular();
                c.setIdCelular(rs.getInt("id_celular"));
                c.setModelo(rs.getString("modelo"));
                c.setMarca(rs.getString("marca"));
                c.setPrecio(rs.getDouble("precio"));
                c.setStock(rs.getInt("stock"));
                c.setIdCategoria(rs.getInt("id_categoria"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error buscar marca: " + e.getMessage());
        }

        return lista;
    }

    @Override
    public List<Celular> buscarPorCategoria(int idCategoria) {
        List<Celular> lista = new ArrayList<>();

        try {
            con = new Database().getConexion();
            CallableStatement cs = con.prepareCall("{CALL BuscarCelularPorCategoria(?)}");
            cs.setInt(1, idCategoria);
            rs = cs.executeQuery();

            while (rs.next()) {
                Celular c = new Celular();
                c.setIdCelular(rs.getInt("id_celular"));
                c.setModelo(rs.getString("modelo"));
                c.setMarca(rs.getString("marca"));
                c.setPrecio(rs.getDouble("precio"));
                c.setStock(rs.getInt("stock"));
                c.setIdCategoria(idCategoria);
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error buscar categoria: " + e.getMessage());
        }
        return lista;
    }

}

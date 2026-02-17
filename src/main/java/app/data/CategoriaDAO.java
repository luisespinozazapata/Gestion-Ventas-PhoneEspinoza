package app.data;


import app.data.interfaces.ICategoria;
import app.modelos.Categoria;
import app.utils.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO implements ICategoria{

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // LISTAR
    public List<Categoria> listar() {
        List<Categoria> lista = new ArrayList<>();

        try {
            con = new Database().getConexion();
            String sql = "SELECT * FROM categoria";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("id_categoria"));
                c.setNombre(rs.getString("nombre"));
                c.setDescripcion(rs.getString("descripcion"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error listar categorias: " + e.getMessage());
        }
        return lista;
    }

    // AGREGAR
    public boolean agregar(Categoria c) {
        try {
            con = new Database().getConexion();
            String sql = "INSERT INTO categoria(nombre, descripcion) VALUES (?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getDescripcion());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error agregar categoria: " + e.getMessage());
            return false;
        }
    }

    // OBTENER POR ID
    public Categoria obtenerPorId(int id) {
        Categoria c = new Categoria();

        try {
            con = new Database().getConexion();
            String sql = "SELECT * FROM categoria WHERE id_categoria = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                c.setIdCategoria(rs.getInt("id_categoria"));
                c.setNombre(rs.getString("nombre"));
                c.setDescripcion(rs.getString("descripcion"));
            }

        } catch (Exception e) {
            System.out.println("Error obtener categoria: " + e.getMessage());
        }
        return c;
    }

    // ACTUALIZAR
    public boolean actualizar(Categoria c) {
        try {
            con = new Database().getConexion();
            String sql = "UPDATE categoria SET nombre=?, descripcion=? WHERE id_categoria=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getDescripcion());
            ps.setInt(3, c.getIdCategoria());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error actualizar categoria: " + e.getMessage());
            return false;
        }
    }

    // ELIMINAR
    public boolean eliminar(int id) {
        try {
            con = new Database().getConexion();
            String sql = "DELETE FROM categoria WHERE id_categoria=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error eliminar categoria: " + e.getMessage());
            return false;
        }
    }
    
    public List<Categoria> buscarPorNombre(String nombre) {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM categoria WHERE nombre LIKE ?";
        try {
            con = new Database().getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("id_categoria"));
                c.setNombre(rs.getString("nombre"));
                c.setDescripcion(rs.getString("descripcion"));
                lista.add(c);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }


}

package app.data.interfaces;

import java.util.List;

import app.modelos.Categoria;

public interface ICategoria extends ICRUD1<Categoria> {

    Categoria obtenerPorId(int id);
    List<Categoria> buscarPorNombre(String nombre);

}

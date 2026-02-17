package app.data.interfaces;

import java.util.List;
import app.modelos.Celular;

public interface ICelular extends ICRUD1<Celular> {

    Celular obtenerPorId(int id);
    List<Celular> buscarPorMarca(String marca);
    List<Celular> buscarPorCategoria(int idCategoria);
}

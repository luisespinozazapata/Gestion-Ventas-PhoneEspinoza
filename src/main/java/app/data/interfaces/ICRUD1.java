package app.data.interfaces;

import java.util.List;

public interface ICRUD1<T> {

    List<T> listar(); 			// Mostrar todo
    boolean agregar(T obj);		// C - Create
    T obtenerPorId(int id);		// R - Read
    boolean actualizar(T obj);	// U - Update
    boolean eliminar(int id);	// D - Delete

}

package app.data.interfaces;

import java.util.List;


import app.modelos.Solicitante;

public interface ISolicitante {
	int registrar(Solicitante solicitante);		// C - Create
	Solicitante buscarPorId(int id);			// R - Read
	boolean actualizar(Solicitante solicitante);	// U - Update
	boolean eliminar(int id);				// D - Delete
	List<Solicitante> buscarPorNombre(String nombre);
}

package app.modelos;

import java.time.LocalDate;
import java.time.LocalTime;

public class Ventas {
	private int codigo;
    private String solicitante;
    private LocalDate fecha;
    private LocalTime hora;
    private int cantidadEquipos;
    private String categoria;
    private String modelo;
    private String marca;
    
    
    public Ventas() {
    	this.codigo = 0;
		this.solicitante = "";
		this.fecha = LocalDate.now();
		this.hora = LocalTime.now();
		this.cantidadEquipos = 0;
		this.categoria = "";
		this.modelo = "";
		this.marca = "";
    }
    
	public Ventas(int codigo, String cliente, LocalDate fecha, LocalTime hora, int cantidadEquipos, String categoria, String modelo, String marca) {
		this.codigo = codigo;
		this.solicitante = cliente;
		this.fecha = fecha;
		this.hora = hora;
		this.cantidadEquipos = cantidadEquipos;
		this.categoria = categoria;
		this.modelo = modelo;
		this.marca = marca;
	}

	



	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(String solicitante) {
		this.solicitante = solicitante;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public LocalTime getHora() {
		return hora;
	}

	public void setHora(LocalTime hora) {
		this.hora = hora;
	}

	public int getCantidadEquipos() {
		return cantidadEquipos;
	}

	public void setCantidadEquipos(int cantidadEquipos) {
		this.cantidadEquipos = cantidadEquipos;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	@Override
	public String toString() {
		return "Reserva [codigo=" + codigo + ", cliente=" + solicitante + ", fecha=" + fecha + ", hora=" + hora
				+ ", cantidadDeEquipos=" + cantidadEquipos + ", categoria=" + categoria + ", modelo=" + modelo +", marca=" + marca +"]";
	}
}

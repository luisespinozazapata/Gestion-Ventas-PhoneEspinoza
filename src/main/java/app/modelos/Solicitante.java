package app.modelos;

public class Solicitante {
	private int id;
	private String nombre;
	private Modelo modelo;
	private double pagos; // BigDecimal
	private double pendiente;
	
	public Solicitante() {
		id = 0;
		nombre = "";
		modelo = new Modelo();
		pagos = 0.00;
	    pendiente = 0.00;
	}

	public Solicitante(int id, String nombre,Modelo modelo, double pagos, double pendiente) {
		this.id = id;
		this.nombre = nombre;
		this.modelo = modelo;
		this.pagos = pagos;
		this.pendiente = pendiente;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public double getPagos() {
		return pagos;
	}

	public void setPagos(double pagos) {
		this.pagos = pagos;
	}

	public double getPendiente() {
		return pendiente;
	}

	public void setPendiente(double pendiente) {
		this.pendiente = pendiente;
	}

	@Override
	public String toString() {
		return "Solicitante[id=" + id + ", nombre=" + nombre +", modelo=" + modelo + ", pagos=" + pagos
				+ ", pendiente=" + pendiente + "]";
	}
}

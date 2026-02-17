package app.modelos;

public class Celular {
	
	//Atributos de la clase 
	
    private int idCelular;
    private String modelo;
    private String marca;
    private double precio;
    private int stock;
    private int idCategoria;

    // Constructor vacío e inicializador
    public Celular() {
    	idCelular= 0;
    	modelo = "";
    	marca = "";
    	precio = 0.0;
    	stock = 0;
    	idCategoria = 0;
    }

    // Constructor con paramentros y sin idCelular
    public Celular(String modelo, String marca, double precio, int stock, int idCategoria) {
    	
        this.modelo = modelo;
        this.marca = marca;
        this.precio = precio;
        this.stock = stock;
        this.idCategoria = idCategoria;
    }

    // Constructor con parametro y con idCelular
    public Celular(int idCelular, String modelo, String marca, double precio, int stock, int idCategoria) {
        this.idCelular = idCelular;
        this.modelo = modelo;
        this.marca = marca;
        this.precio = precio;
        this.stock = stock;
        this.idCategoria = idCategoria;
    }

    // Getters y Setters
    public int getIdCelular() {
        return idCelular;
    }
    public void setIdCelular(int idCelular) {
        this.idCelular = idCelular;
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

    public double getPrecio() {
        return precio;
    }
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getIdCategoria() {
        return idCategoria;
    }
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    // Representación en texto del objeto CElular para depuración
    @Override
    public String toString() {
        return "Celular [idCelular=" + idCelular + ", modelo=" + modelo + ", marca=" + marca + ", precio=" + precio
        		+ ", stock=" + stock + ", idCategoria=" + idCategoria + "]";
    }

}

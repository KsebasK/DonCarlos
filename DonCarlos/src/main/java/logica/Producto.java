package logica;

import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "productos")
public class Producto {

    @Id
    @Column(name = "id_producto")
    private int idProducto;

    private String nombre;
    private String descripcion;
    private double precio;

    @OneToMany(mappedBy = "producto")
    private List<DetalleCredito> detalles;

    public Producto() {}
    // Constructor completo, getters y setters

    public int getIdProducto() { return idProducto; }
    public void setIdProducto(int idProducto) { this.idProducto = idProducto; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
}

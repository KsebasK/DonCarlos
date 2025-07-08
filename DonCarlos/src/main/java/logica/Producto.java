package logica;

import java.math.BigDecimal;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_producto")
    private int idProducto;

    private String nombre;
    private String descripcion;

    private String marca;
    private String gama;

    @Column(name = "precio")
    private BigDecimal precio;

    @OneToMany(mappedBy = "producto")
    private List<DetalleCredito> detalles;

    public Producto() {}

    // Getters y setters

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getGama() {
        return gama;
    }

    public void setGama(String gama) {
        this.gama = gama;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public List<DetalleCredito> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetalleCredito> detalles) {
        this.detalles = detalles;
    }
}
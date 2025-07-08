package logica;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "detalle_credito")
public class DetalleCredito implements Serializable {

    @Id
    @Column(name = "id_detalle")
    private int idDetalle;

    @ManyToOne
    @JoinColumn(name = "credito_id")
    private Credito credito;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;

    private int cantidad;

    @Column(name = "precio_unitario")
    private BigDecimal precioUnitario;

    public DetalleCredito() {}

    public DetalleCredito(int idDetalle, Credito credito, Producto producto, int cantidad, BigDecimal precioUnitario) {
        this.idDetalle = idDetalle;
        this.credito = credito;
        this.producto = producto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
    }

    // Getters y Setters

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public Credito getCredito() {
        return credito;
    }

    public void setCredito(Credito credito) {
        this.credito = credito;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(BigDecimal precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
}

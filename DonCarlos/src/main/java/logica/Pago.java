package logica;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "pagos")
public class Pago implements Serializable {

    @Id
    @Column(name = "id_pago")
    private int idPago;

    @ManyToOne
    @JoinColumn(name = "credito_id")
    private Credito credito;

    private double monto;

    @Column(name = "fecha_pago")
    @Temporal(TemporalType.DATE)
    private Date fechaPago;

    @Column(name = "tipo_pago")
    private String tipoPago;

    public Pago() {}

    public Pago(int idPago, Credito credito, double monto, Date fechaPago, String tipoPago) {
        this.idPago = idPago;
        this.credito = credito;
        this.monto = monto;
        this.fechaPago = fechaPago;
        this.tipoPago = tipoPago;
    }

    // Getters y Setters

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public Credito getCredito() {
        return credito;
    }

    public void setCredito(Credito credito) {
        this.credito = credito;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }
}

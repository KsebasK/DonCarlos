
package logica;

import java.util.Date;

public class Pago {
    private int idPago;
    private int creditoId;
    private double monto;
    private Date fechaPago;
    private String tipoPago;

    public Pago() {}

    public Pago(int idPago, int creditoId, double monto, Date fechaPago, String tipoPago) {
        this.idPago = idPago;
        this.creditoId = creditoId;
        this.monto = monto;
        this.fechaPago = fechaPago;
        this.tipoPago = tipoPago;
    }

    public int getIdPago() { return idPago; }
    public void setIdPago(int idPago) { this.idPago = idPago; }

    public int getCreditoId() { return creditoId; }
    public void setCreditoId(int creditoId) { this.creditoId = creditoId; }

    public double getMonto() { return monto; }
    public void setMonto(double monto) { this.monto = monto; }

    public Date getFechaPago() { return fechaPago; }
    public void setFechaPago(Date fechaPago) { this.fechaPago = fechaPago; }

    public String getTipoPago() { return tipoPago; }
    public void setTipoPago(String tipoPago) { this.tipoPago = tipoPago; }
}

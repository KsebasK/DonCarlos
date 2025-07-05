package logica;

import java.util.Date;

public class Credito {
    private int idCredito;
    private int clienteId;
    private int idUsu;
    private Date fechaEmision;
    private Date fechaVencimiento;
    private double montoTotal;
    private String estado; // "PENDIENTE", "PAGADO", "VENCIDO"

    public Credito() {}

    public Credito(int idCredito, int clienteId, int idUsu, Date fechaEmision, Date fechaVencimiento, double montoTotal, String estado) {
        this.idCredito = idCredito;
        this.clienteId = clienteId;
        this.idUsu = idUsu;
        this.fechaEmision = fechaEmision;
        this.fechaVencimiento = fechaVencimiento;
        this.montoTotal = montoTotal;
        this.estado = estado;
    }

    public int getIdCredito() { return idCredito; }
    public void setIdCredito(int idCredito) { this.idCredito = idCredito; }

    public int getClienteId() { return clienteId; }
    public void setClienteId(int clienteId) { this.clienteId = clienteId; }

    public int getIdUsu() { return idUsu; }
    public void setIdUsu(int idUsu) { this.idUsu = idUsu; }

    public Date getFechaEmision() { return fechaEmision; }
    public void setFechaEmision(Date fechaEmision) { this.fechaEmision = fechaEmision; }

    public Date getFechaVencimiento() { return fechaVencimiento; }
    public void setFechaVencimiento(Date fechaVencimiento) { this.fechaVencimiento = fechaVencimiento; }

    public double getMontoTotal() { return montoTotal; }
    public void setMontoTotal(double montoTotal) { this.montoTotal = montoTotal; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}

package logica;

public class DetalleCredito {
    private int idDetalle;
    private int creditoId;
    private int productoId;
    private int cantidad;
    private double precioUnitario;

    public DetalleCredito() {}

    public DetalleCredito(int idDetalle, int creditoId, int productoId, int cantidad, double precioUnitario) {
        this.idDetalle = idDetalle;
        this.creditoId = creditoId;
        this.productoId = productoId;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
    }

    public int getIdDetalle() { return idDetalle; }
    public void setIdDetalle(int idDetalle) { this.idDetalle = idDetalle; }

    public int getCreditoId() { return creditoId; }
    public void setCreditoId(int creditoId) { this.creditoId = creditoId; }

    public int getProductoId() { return productoId; }
    public void setProductoId(int productoId) { this.productoId = productoId; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecioUnitario() { return precioUnitario; }
    public void setPrecioUnitario(double precioUnitario) { this.precioUnitario = precioUnitario; }
}


package logica;

import java.util.Date;


public class Cliente {
    private int idCliente;
    private String nombre;
    private String telefono;
    private String email;
    private String documentoIdentidad;
    private double limiteCredito;
    private Date fechaRegistro;

    public Cliente() {}

    public Cliente(int idCliente, String nombre, String telefono, String email, String documentoIdentidad, double limiteCredito, Date fechaRegistro) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.documentoIdentidad = documentoIdentidad;
        this.limiteCredito = limiteCredito;
        this.fechaRegistro = fechaRegistro;
    }

    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int idCliente) { this.idCliente = idCliente; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDocumentoIdentidad() { return documentoIdentidad; }
    public void setDocumentoIdentidad(String documentoIdentidad) { this.documentoIdentidad = documentoIdentidad; }

    public double getLimiteCredito() { return limiteCredito; }
    public void setLimiteCredito(double limiteCredito) { this.limiteCredito = limiteCredito; }

    public Date getFechaRegistro() { return fechaRegistro; }
    public void setFechaRegistro(Date fechaRegistro) { this.fechaRegistro = fechaRegistro; }
}

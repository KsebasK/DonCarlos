package logica;

public class Usuario {
    private int idUsu;
    private String nombre;
    private String contrasena;
    private String email;
    private boolean activo;

    public Usuario() {}

    public Usuario(int idUsu, String nombre, String contrasena, String email, boolean activo) {
        this.idUsu = idUsu;
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.email = email;
        this.activo = activo;
    }

    public int getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(int idUsu) {
        this.idUsu = idUsu;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
}

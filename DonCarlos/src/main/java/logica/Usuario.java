package logica;

import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Usa esta estrategia si usas MySQL con auto_increment
    @Column(name = "id_usu")
    private int idUsu;

    private String nombre;
    private String contrasena;
    private String email;
    private boolean activo;

    @OneToMany(mappedBy = "usuario")
    private List<Credito> creditos;

    public Usuario() {}
    // Constructor completo, getters y setters

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

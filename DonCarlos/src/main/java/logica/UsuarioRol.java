package logica;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "usuario_rol")
public class UsuarioRol implements Serializable {

    @Id
    @Column(name = "id_usuario_rol")
    private int idUsuarioRol;

    @ManyToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "rol_id")
    private Rol rol;

    public UsuarioRol() {}

    public UsuarioRol(int idUsuarioRol, Usuario usuario, Rol rol) {
        this.idUsuarioRol = idUsuarioRol;
        this.usuario = usuario;
        this.rol = rol;
    }

    // Getters y Setters

    public int getIdUsuarioRol() {
        return idUsuarioRol;
    }

    public void setIdUsuarioRol(int idUsuarioRol) {
        this.idUsuarioRol = idUsuarioRol;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}

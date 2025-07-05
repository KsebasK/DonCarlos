package logica;

import javax.persistence.*;

@Entity
@Table(name = "usuario_rol")
public class UsuarioRol {

    @Id
    @Column(name = "id_usuario_rol")
    private int idUsuarioRol;

    @Column(name = "usuario_id")
    private int usuarioId;

    @Column(name = "rol_id")
    private int rolId;

    public UsuarioRol() {}

    public UsuarioRol(int idUsuarioRol, int usuarioId, int rolId) {
        this.idUsuarioRol = idUsuarioRol;
        this.usuarioId = usuarioId;
        this.rolId = rolId;
    }

    public int getIdUsuarioRol() { return idUsuarioRol; }
    public void setIdUsuarioRol(int idUsuarioRol) { this.idUsuarioRol = idUsuarioRol; }

    public int getUsuarioId() { return usuarioId; }
    public void setUsuarioId(int usuarioId) { this.usuarioId = usuarioId; }

    public int getRolId() { return rolId; }
    public void setRolId(int rolId) { this.rolId = rolId; }
}

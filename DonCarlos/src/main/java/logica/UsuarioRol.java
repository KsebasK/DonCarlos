public class UsuarioRol {
    private int idUsuarioRol;
    private int usuarioId;
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

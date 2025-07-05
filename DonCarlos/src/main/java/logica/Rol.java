package logica;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "roles")
public class Rol implements Serializable {

    @Id
    @Column(name = "id_rol")
    private int idRol;

    private String nombre;

    private String descripcion;

    @OneToMany(mappedBy = "rol")
    private List<UsuarioRol> usuariosRol;

    public Rol() {}

    public Rol(int idRol, String nombre, String descripcion) {
        this.idRol = idRol;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    // Getters y Setters

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<UsuarioRol> getUsuariosRol() {
        return usuariosRol;
    }

    public void setUsuariosRol(List<UsuarioRol> usuariosRol) {
        this.usuariosRol = usuariosRol;
    }
}

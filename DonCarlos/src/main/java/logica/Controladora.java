package logica;

import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import persistencia.ClienteJpaController;
import logica.exceptions.NonexistentEntityException;

public class Controladora {

    private ClienteJpaController clienteJPA;
    private EntityManagerFactory emf;

    public Controladora() {
        emf = Persistence.createEntityManagerFactory("tiendaPU");
        clienteJPA = new ClienteJpaController(emf);
    }

    public void crearCliente(Cliente cliente) {
        try {
            clienteJPA.create(cliente);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Cliente> obtenerClientes() {
        return clienteJPA.findClienteEntities();
    }

    public Cliente buscarClientePorId(int id) {
        return clienteJPA.findCliente(id);
    }

    public void editarCliente(Cliente cliente) {
        try {
            clienteJPA.edit(cliente);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarCliente(int idCliente) throws Exception {
        try {
            clienteJPA.destroy(idCliente);
        } catch (NonexistentEntityException e) {
            e.printStackTrace();
        }
    }
    
}

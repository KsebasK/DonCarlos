package persistencia;

import logica.Producto;
import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

public class ProductoJpaController implements Serializable {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tiendaPU");

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Producto producto) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(producto);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void edit(Producto producto) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(producto);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Producto findProducto(int id) {
        return getEntityManager().find(Producto.class, id);
    }

    public List<Producto> findProductoEntities() {
        return getEntityManager().createQuery("SELECT p FROM Producto p", Producto.class).getResultList();
    }
}

package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import logica.Credito;

public class CreditoJpaController implements Serializable {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tiendaPU");

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Credito credito) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(credito);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Credito credito) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            credito = em.merge(credito);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw new Exception("Error al editar el crédito: " + ex.getMessage());
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Credito credito = em.find(Credito.class, id);
            if (credito != null) {
                em.remove(credito);
                em.getTransaction().commit();
            }
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public Credito findCredito(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Credito.class, id);
        } finally {
            em.close();
        }
    }

    public List<Credito> findCreditoEntities() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Credito> query = em.createQuery("SELECT c FROM Credito c", Credito.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public int getCreditoCount() {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT COUNT(c) FROM Credito c");
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente;
import logica.Credito;
import logica.DetalleCredito;
import logica.Producto;
import logica.Usuario;


@WebServlet("/SvVentas")
public class SvVentas extends HttpServlet {
    @PersistenceUnit(unitName = "tiendaPU")
    private EntityManagerFactory emf;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        try {
            String nombreCliente = request.getParameter("clienteVenta");
            String marca = request.getParameter("marcaCelular");
            String gama = request.getParameter("gamaCelular");
            String modelo = request.getParameter("modeloCelular");
            BigDecimal precio = new BigDecimal(request.getParameter("precioVenta"));
            int cuotas = Integer.parseInt(request.getParameter("cuotas"));

            // 1. Buscar cliente
            TypedQuery<Cliente> q = em.createQuery("SELECT c FROM Cliente c WHERE c.nombre = :nombre", Cliente.class);
            q.setParameter("nombre", nombreCliente);
            Cliente cliente = q.getResultList().isEmpty() ? null : q.getSingleResult();

            if (cliente == null) {
                response.sendRedirect("admin.jsp?error=clienteNoExiste");
                return;
            }

            // 2. Insertar producto
            Producto producto = new Producto();
            producto.setNombre(modelo);
            producto.setDescripcion("Marca: " + marca + " / Gama: " + gama);
            producto.setPrecio(precio);

            // 3. Insertar crédito
            Credito credito = new Credito();
            credito.setCliente(cliente);
            credito.setFechaEmision(new Date());
            credito.setFechaVencimiento(sumarMeses(new Date(), cuotas));
            credito.setMontoTotal(precio);
            credito.setEstado("vigente");

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            credito.setUsuario(usuario);

            // 4. Detalle crédito
            DetalleCredito detalle = new DetalleCredito();
            detalle.setCantidad(1);
            detalle.setPrecioUnitario(precio);
            detalle.setProducto(producto);
            detalle.setCredito(credito);

            em.getTransaction().begin();
            em.persist(producto);
            em.persist(credito);
            em.persist(detalle);
            em.getTransaction().commit();

            response.sendRedirect("admin.jsp?exito=ventaRegistrada");

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=excepcion");
        } finally {
            em.close();
        }
        
        response.sendRedirect("SvCreditos");
    }

    private Date sumarMeses(Date fecha, int meses) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        cal.add(Calendar.MONTH, meses);
        return cal.getTime();
    }
    
}
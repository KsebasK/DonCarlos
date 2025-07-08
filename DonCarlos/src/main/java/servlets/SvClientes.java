package servlets;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.Cliente;
import logica.Controladora;

@WebServlet(name = "SvClientes", urlPatterns = {"/SvClientes"})
public class SvClientes extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                control.eliminarCliente(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("admin.jsp#clientes");
            return;
        }

        if ("actualizar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Cliente cliente = control.buscarClientePorId(id);
            if (cliente != null) {
                cliente.setNombre(request.getParameter("nombre"));
                cliente.setApellido(request.getParameter("apellido"));
                cliente.setTelefono(request.getParameter("telefono"));
                cliente.setEmail(request.getParameter("email"));
                cliente.setDocumentoIdentidad(request.getParameter("cedula"));
                cliente.setLimiteCredito(Double.parseDouble(request.getParameter("limiteCredito")));
                control.editarCliente(cliente);
            }
            response.sendRedirect("admin.jsp#clientes");
            return;
        }

        // Acción por defecto: crear nuevo cliente
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String documentoIdentidad = request.getParameter("cedula");
        double limiteCredito = Double.parseDouble(request.getParameter("limiteCredito"));
        Date fechaRegistro = new Date();

        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setTelefono(telefono);
        cliente.setEmail(email);
        cliente.setDocumentoIdentidad(documentoIdentidad);
        cliente.setLimiteCredito(limiteCredito);
        cliente.setFechaRegistro(fechaRegistro);

        control.crearCliente(cliente);
        response.sendRedirect("admin.jsp#clientes");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("editar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Cliente cliente = control.buscarClientePorId(id);
            HttpSession session = request.getSession();
            session.setAttribute("clienteEditar", cliente);
            response.sendRedirect("editarCliente.jsp");
        } else {
            response.sendRedirect("registrarCliente.jsp");
        }
    }
}

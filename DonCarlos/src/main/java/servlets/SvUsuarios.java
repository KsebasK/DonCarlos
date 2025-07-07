package servlets;

import java.io.IOException;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.Usuario;
import persistencia.UsuarioJpaController;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("tiendaPU");
    UsuarioJpaController usuarioController = new UsuarioJpaController(emf);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos"); // aún no usado
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Crear usuario
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNombre(nombres); // Si tienes nombre y apellido separados, puedes concatenarlos
        nuevoUsuario.setEmail(correo);
        nuevoUsuario.setContrasena(password);
        nuevoUsuario.setActivo(true); // Por defecto activo

        try {
            usuarioController.create(nuevoUsuario);
            // Redirigir al login tras registro exitoso
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // crea esta vista si deseas mostrar errores
        }
    }
}

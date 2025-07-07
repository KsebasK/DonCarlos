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
    UsuarioJpaController usuarioJPA = new UsuarioJpaController(emf);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        try {
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(nombres + " " + apellidos);
            nuevoUsuario.setEmail(email);
            nuevoUsuario.setContrasena(contrasena);
            nuevoUsuario.setActivo(true);

            usuarioJPA.create(nuevoUsuario);

            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error registrando usuario: " + e.getMessage());
        }
    }
}
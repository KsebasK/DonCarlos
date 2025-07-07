package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Usuario;
import persistencia.UsuarioJpaController;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("tiendaPU");
    UsuarioJpaController usuarioController = new UsuarioJpaController(emf);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        try {
            Usuario usuario = usuarioController.buscarPorEmail(email);

            if (usuario != null && usuario.getContrasena().equals(contrasena) && usuario.isActivo()) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("error", "Correo o contraseña incorrectos, o cuenta inactiva.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error al iniciar sesión.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

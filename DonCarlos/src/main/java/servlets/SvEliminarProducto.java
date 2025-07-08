package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import persistencia.ProductoJpaController;

@WebServlet(name = "SvEliminarProducto", urlPatterns = {"/SvEliminarProducto"})
public class SvEliminarProducto extends HttpServlet {

    ProductoJpaController productoCtrl = new ProductoJpaController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            productoCtrl.destroy(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("SvProductos");
    }
}

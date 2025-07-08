package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Producto;
import persistencia.ProductoJpaController;

@WebServlet(name = "SvProductos", urlPatterns = {"/SvProductos"})
public class SvProductos extends HttpServlet {

    ProductoJpaController productoCtrl = new ProductoJpaController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            // Modo edición: cargar producto y redirigir a editar.jsp
            try {
                int id = Integer.parseInt(idParam);
                Producto producto = productoCtrl.findProducto(id);
                request.setAttribute("productoEditar", producto);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                return; // Evita continuar hacia admin.jsp
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Modo normal: mostrar todos los productos
        List<Producto> lista = productoCtrl.findProductoEntities();
        request.setAttribute("listaProductos", lista);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProducto = request.getParameter("idProducto").isEmpty() ? 0 : Integer.parseInt(request.getParameter("idProducto"));

        String modelo = request.getParameter("modeloCelular");
        String marca = request.getParameter("marcaCelular");
        String gama = request.getParameter("gamaCelular");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precioVenta"));

        try {
            Producto producto;
            if (idProducto > 0) {
                // Editar producto existente
                producto = productoCtrl.findProducto(idProducto);
            } else {
                // Nuevo producto
                producto = new Producto();
            }

            producto.setNombre(modelo);
            producto.setMarca(marca);
            producto.setGama(gama);
            producto.setPrecio(BigDecimal.valueOf(precio));
            producto.setDescripcion(descripcion == null ? "Sin descripción" : descripcion);

            if (idProducto > 0) {
                productoCtrl.edit(producto);
            } else {
                productoCtrl.create(producto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirige de nuevo a la lista
        response.sendRedirect("SvProductos");
    }
}

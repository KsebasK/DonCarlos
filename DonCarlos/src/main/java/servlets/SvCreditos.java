package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Credito;
import persistencia.CreditoJpaController;

@WebServlet(name = "SvCreditos", urlPatterns = {"/SvCreditos"})
public class SvCreditos extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CreditoJpaController creditoJPA = new CreditoJpaController();
        List<Credito> listaCreditos = creditoJPA.findCreditoEntities();

        request.setAttribute("listaCreditos", listaCreditos);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
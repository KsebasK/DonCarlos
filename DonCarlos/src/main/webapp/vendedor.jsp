<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="logica.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Panel Vendedor - Don Carlos Celulares</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="css/styleVendedor.css" />
</head>
<body>
    <div class="app-container">
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Don Carlos Celulares</h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li><a href="#" class="active" data-page="ventas"><i class="fas fa-cash-register"></i> <span>Registrar Venta</span></a></li>
                    <li><a href="#" data-page="creditos"><i class="fas fa-credit-card"></i> <span>Créditos</span></a></li>
                    <li><a href="#" data-page="pagos"><i class="fas fa-money-bill-wave"></i> <span>Registrar Pago</span></a></li>
                </ul>
            </div>
            <div class="sidebar-footer">
                <a href="logout.jsp" id="logoutBtn"><i class="fas fa-sign-out-alt"></i> <span>Cerrar Sesión</span></a>
            </div>
        </div>

        <div class="main-content">
            <div class="top-bar">
                <h1>Panel Vendedor</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=<%=usuario.getNombre()%>&background=00f2ff&color=000" alt="<%=usuario.getNombre()%>" />
                    <div>
                        <p><%=usuario.getNombre()%></p>
                        <small>Don Carlos Celulares</small>
                    </div>
                </div>
            </div>

            <jsp:include page="secciones/ventas.jsp" />
            <jsp:include page="secciones/creditos.jsp" />
            <jsp:include page="secciones/pagos.jsp" />
        </div>
    </div>

    <script src="js/panel.js"></script>
</body>
</html>

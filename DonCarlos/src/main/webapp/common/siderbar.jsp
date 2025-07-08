<%
    String currentPage = request.getRequestURI();
%>
<div class="sidebar">
    <div class="sidebar-header">
        <h2>Don Carlos Celulares</h2>
    </div>

    <div class="sidebar-menu">
        <h3>Gestión</h3>
        <ul>
            <li>
                <a href="<%=request.getContextPath()%>/SvClientes" class="<%= currentPage.contains("registrarCliente.jsp") ? "active" : "" %>">
                    <i class="fas fa-user-plus"></i><span>Registrar Cliente</span>
                </a>
            </li>
            
            <li>
                <a href="<%=request.getContextPath()%>/listarClientes.jsp" class="<%= currentPage.contains("listarClientes.jsp") ? "active" : "" %>">
                    <i class="fas fa-users"></i><span>Listar Clientes</span>
                </a>
            </li>
            
            <li>
                <a href="<%=request.getContextPath()%>/SvProductos" class="<%= currentPage.contains("admin.jsp") ? "active" : "" %>">
                     <i class="fas fa-cash-register"></i><span>Registrar Producto</span>
                </a>
            </li>
           <li>
    <a href="construccion.jsp" class="<%= currentPage.contains("creditos") ? "active" : "" %>">
        <i class="fas fa-credit-card"></i><span>Créditos</span>
    </a>
</li>
<li>
    <a href="construccion.jsp" class="<%= currentPage.contains("pagos") ? "active" : "" %>">
        <i class="fas fa-money-bill-wave"></i><span>Registrar Pago</span>
    </a>
</li>
            
         
        </ul>
    </div>

    <div class="sidebar-footer">
        <a href="login.jsp" class="<%= currentPage.contains("login.jsp") ? "active" : "" %>">
            <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span>
        </a>
    </div>
</div>

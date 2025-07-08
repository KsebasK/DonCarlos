<%@ page import="logica.Cliente" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<%
    Cliente cliente = (Cliente) session.getAttribute("clienteEditar");
    if (cliente == null) {
        response.sendRedirect("admin.jsp#clientes");
        return;
    }
%>

<div class="main-content">
    <div class="top-bar">
        <h1>Editar Cliente</h1>
    </div>

    <section>
        <div class="card">
            <div class="card-header">
                <h2>Modificar Datos del Cliente</h2>
            </div>
            <div class="card-body">
                <form action="SvClientes" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">

                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" name="nombre" id="nombre" value="<%= cliente.getNombre() %>" class="controles" required>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" name="apellido" id="apellido" value="<%= cliente.getApellido() %>" class="controles" required>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" name="telefono" id="telefono" value="<%= cliente.getTelefono() %>" class="controles" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Correo electrónico:</label>
                        <input type="email" name="email" id="email" value="<%= cliente.getEmail() %>" class="controles" required>
                    </div>

                    <div class="form-group">
                        <label for="cedula">Documento de Identidad:</label>
                        <input type="text" name="cedula" id="cedula" value="<%= cliente.getDocumentoIdentidad() %>" class="controles" required>
                    </div>

                    <div class="form-group">
                        <label for="limiteCredito">Límite de Crédito ($):</label>
                        <input type="number" step="0.01" name="limiteCredito" id="limiteCredito" value="<%= cliente.getLimiteCredito() %>" class="controles" required>
                    </div>

                    <button type="submit" class="boton">
                        <i class="fas fa-save"></i> Guardar Cambios
                    </button>
                </form>
            </div>
        </div>
    </section>
</div>

<jsp:include page="common/footer.jsp" />

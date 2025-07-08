<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="logica.Cliente" %>
<%@ page import="logica.Controladora" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page session="true" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<%
    Controladora control = new Controladora();
    List<Cliente> listaClientes = control.obtenerClientes();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
%>

<div class="main-content">
    <div class="top-bar">
        <h1>Lista de Clientes</h1>
    </div>

    <section>
        <div class="card">
            <div class="card-header">
                <h2>Clientes Registrados</h2>
            </div>
            <div class="card-body">
                <table class="tabla">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                            <th>Documento</th>
                            <th>Límite</th>
                            <th>Registro</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Cliente cliente : listaClientes) {
                        %>
                        <tr>
                            <td><%= cliente.getIdCliente() %></td>
                            <td><%= cliente.getNombre() %></td>
                            <td><%= cliente.getApellido() %></td>
                            <td><%= cliente.getTelefono() %></td>
                            <td><%= cliente.getEmail() %></td>
                            <td><%= cliente.getDocumentoIdentidad() %></td>
                            <td>$<%= cliente.getLimiteCredito() %></td>
                            <td><%= formatoFecha.format(cliente.getFechaRegistro()) %></td>
                            <td>
                                <form action="SvClientes" method="get" style="display:inline;">
                                    <input type="hidden" name="accion" value="editar">
                                    <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">
                                    <button class="boton btn-edit" type="submit">
                                        <i class="fas fa-edit"></i> Editar
                                    </button>
                                </form>
                                <form action="SvClientes" method="post" style="display:inline;">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">
                                    <button class="boton btn-delete" type="submit" onclick="return confirm('¿Seguro de eliminar este cliente?')">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>

<jsp:include page="common/footer.jsp" />

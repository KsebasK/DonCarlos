<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="logica.Cliente" %>
<%@ page import="logica.Controladora" %>
<%@ page session="true" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<%
    Controladora control = new Controladora();
    List<Cliente> listaClientes = control.obtenerClientes();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="styles/admin.css">
    <style>
        .content {
            margin-left: 250px;
            padding: 30px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .btn {
            padding: 6px 12px;
            margin: 2px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .btn-edit {
            background-color: #f39c12;
            color: white;
        }

        .btn-edit:hover {
            background-color: #d78e0c;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

                .tabla-clientes {
            width: 100%;
            border-collapse: collapse;
            color: black; /* <- TEXTO NEGRO */
        }

        .tabla-clientes th,
        .tabla-clientes td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
            color: black; /* <- TEXTO NEGRO */
        }

    </style>
</head>
<body>

<div class="content">
    <h2>Lista de Clientes</h2>

    <table class="tabla-clientes">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Documento</th>
                <th>Límite</th>
                <th>Fecha Registro</th>
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
                <td><%= cliente.getFechaRegistro() %></td>
                <td>
                    <form action="SvClientes" method="get" style="display:inline;">
                        <input type="hidden" name="accion" value="editar">
                        <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">
                        <button class="btn btn-edit" type="submit">Editar</button>
                    </form>
                    <form action="SvClientes" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">
                        <button class="btn btn-delete" type="submit" onclick="return confirm('¿Seguro de eliminar este cliente?')">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>

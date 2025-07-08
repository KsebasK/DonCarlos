<%@page import="logica.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" /> <!-- corregido aquí -->

<%
    Cliente cliente = (Cliente) session.getAttribute("clienteEditar");
    if (cliente == null) {
        response.sendRedirect("admin.jsp#clientes");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
    <link rel="stylesheet" href="css/styleAdmin.css">
    <style>
        .content {
            margin-left: 250px;
            padding: 30px;
        }

        form {
            max-width: 600px;
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="content">
    <h2>Editar Cliente</h2>
    <form action="SvClientes" method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">

        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" value="<%= cliente.getNombre() %>" required>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" id="apellido" value="<%= cliente.getApellido() %>" required>

        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" id="telefono" value="<%= cliente.getTelefono() %>" required>

        <label for="email">Correo electrónico:</label>
        <input type="email" name="email" id="email" value="<%= cliente.getEmail() %>" required>

        <label for="cedula">Documento Identidad:</label>
        <input type="text" name="cedula" id="cedula" value="<%= cliente.getDocumentoIdentidad() %>" required>

        <label for="limiteCredito">Límite de Crédito:</label>
        <input type="number" step="0.01" name="limiteCredito" id="limiteCredito" value="<%= cliente.getLimiteCredito() %>" required>

        <button type="submit" class="btn-submit">Guardar Cambios</button>
    </form>
</div>

</body>
</html>

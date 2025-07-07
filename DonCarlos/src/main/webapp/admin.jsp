<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Panel Vendedor - Don Carlos Celulares</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="css/styleAdmin.css" />
</head>
<body>
    <div class="app-container">
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Don Carlos Celulares</h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="#" class="active" data-page="ventas">
                            <i class="fas fa-cash-register"></i> <span>Registrar Venta</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-page="creditos">
                            <i class="fas fa-credit-card"></i> <span>Créditos</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-page="pagos">
                            <i class="fas fa-money-bill-wave"></i> <span>Registrar Pago</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-footer">
                <a href="logout.jsp">
                    <i class="fas fa-sign-out-alt"></i> <span>Cerrar Sesión</span>
                </a>
            </div>
        </div>

        <div class="main-content">
            <div class="top-bar">
                <h1>Panel Vendedor</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=${usuario.nombre}&background=00f2ff&color=000" alt="Usuario">
                    <div>
                        <p>${usuario.nombre}</p>
                        <small>Don Carlos Celulares</small>
                    </div>
                </div>
            </div>

            <div class="content">
                <!-- Sección Registrar Venta -->
                <section id="seccionVentas" class="seccion-activa">
                    <div class="card">
                        <div class="card-header">
                            <h2>Registrar Venta de Celular a Crédito</h2>
                        </div>
                        <div class="card-body">
                            <form id="formVenta" class="formulario" action="SvVentas" method="POST">
                                <div>
                                    <label for="clienteVenta">Nombre del Cliente:</label>
                                    <input type="text" id="clienteVenta" name="clienteVenta" class="controles" required />
                                </div>

                                <div>
                                    <label for="marcaCelular">Marca:</label>
                                    <select id="marcaCelular" name="marcaCelular" class="controles">
                                        <option value="">Seleccione una marca</option>
                                        <option>Samsung</option>
                                        <option>Apple</option>
                                        <option>Xiaomi</option>
                                        <option>Motorola</option>
                                        <option>Huawei</option>
                                        <option>Tecno</option>
                                        <option>Honor</option>
                                    </select>
                                </div>

                                <div>
                                    <label for="gamaCelular">Gama:</label>
                                    <select id="gamaCelular" name="gamaCelular" class="controles">
                                        <option value="">Seleccione una gama</option>
                                        <option>Alta</option>
                                        <option>Media</option>
                                        <option>Baja</option>
                                    </select>
                                </div>

                                <div>

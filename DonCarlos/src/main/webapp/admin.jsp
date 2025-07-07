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
                    <li><a href="#" class="active" data-page="ventas"><i class="fas fa-cash-register"></i> <span>Registrar Venta</span></a></li>
                    <li><a href="#" data-page="creditos"><i class="fas fa-credit-card"></i> <span>Créditos</span></a></li>
                    <li><a href="#" data-page="pagos"><i class="fas fa-money-bill-wave"></i> <span>Registrar Pago</span></a></li>
                </ul>
            </div>
            <div class="sidebar-footer">
                <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> <span>Cerrar Sesión</span></a>
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
                                        <option>Samsung</option><option>Apple</option><option>Xiaomi</option>
                                        <option>Motorola</option><option>Huawei</option><option>Tecno</option><option>Honor</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="gamaCelular">Gama:</label>
                                    <select id="gamaCelular" name="gamaCelular" class="controles">
                                        <option value="">Seleccione una gama</option>
                                        <option>Alta</option><option>Media</option><option>Baja</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="modeloCelular">Modelo:</label>
                                    <input type="text" id="modeloCelular" name="modeloCelular" class="controles" required />
                                </div>
                                <div>
                                    <label for="precioVenta">Precio Total ($):</label>
                                    <input type="number" id="precioVenta" name="precioVenta" class="controles" step="0.01" required />
                                </div>
                                <div>
                                    <label for="cuotas">N° de Cuotas:</label>
                                    <input type="number" id="cuotas" name="cuotas" class="controles" min="1" max="36" required />
                                </div>
                                <button type="submit" class="boton"><i class="fas fa-save"></i> Registrar Venta</button>
                            </form>
                        </div>
                    </div>
                </section>

                <!-- Sección Créditos -->
                <section id="seccionCreditos" class="seccion-oculta">
                    <div class="card">
                        <div class="card-header">
                            <h2>Gestión de Créditos</h2>
                        </div>
                        <div class="card-body">
                            <div style="overflow-x: auto;">
                                <table class="tabla">
                                    <thead>
                                        <tr>
                                            <th>Cliente</th>
                                            <th>Modelo</th>
                                            <th>Precio</th>
                                            <th>Cuotas</th>
                                            <th>Saldo</th>
                                            <th>Vencimiento</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Ejemplo dinámico con JSTL -->
                                        <c:forEach var="credito" items="${listaCreditos}">
                                            <tr>
                                                <td>${credito.cliente.nombre}</td>
                                                <td>${credito.modelo}</td>
                                                <td>$${credito.precio}</td>
                                                <td>${credito.cuotas}</td>
                                                <td>$${credito.saldo}</td>
                                                <td>${credito.fechaVencimiento}</td>
                                                <td><span class="badge badge-success">${credito.estado}</span></td>
                                            </tr>
                                        </c:forEach>
                                        <!-- Fin del c:forEach -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Sección Registrar Pago -->
                <section id="seccionPagos" class="seccion-oculta">
                    <div class="card">
                        <div class="card-header">
                            <h2>Registrar Pago</h2>
                        </div>
                        <div class="card-body">
                            <form id="formPago" class="formulario" action="SvPagos" method="POST">
                                <div>
                                    <label for="clientePago">Cliente:</label>
                                    <input type="text" id="clientePago" name="clientePago" class="controles" required />
                                </div>
                                <div>
                                    <label for="montoPago">Monto ($):</label>
                                    <input type="number" id="montoPago" name="montoPago" class="controles" required />
                                </div>
                                <div>
                                    <label for="fechaPago">Fecha:</label>
                                    <input type="date" id="fechaPago" name="fechaPago" class="controles" required />
                                </div>
                                <div>
                                    <label for="descripcionPago">Descripción:</label>
                                    <textarea id="descripcionPago" name="descripcionPago" class="controles"></textarea>
                                </div>
                                <button type="submit" class="boton">
                                    <i class="fas fa-money-bill-wave"></i> Registrar Pago
                                </button>
                            </form>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const menuLinks = document.querySelectorAll('.sidebar-menu a');
            const sections = {
                ventas: document.getElementById('seccionVentas'),
                creditos: document.getElementById('seccionCreditos'),
                pagos: document.getElementById('seccionPagos')
            };
            function showSection(sectionId) {
                Object.values(sections).forEach(section => {
                    section.classList.add('seccion-oculta');
                    section.classList.remove('seccion-activa');
                });
                sections[sectionId].classList.remove('seccion-oculta');
                sections[sectionId].classList.add('seccion-activa');
                menuLinks.forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('data-page') === sectionId) {
                        link.classList.add('active');
                    }
                });
            }
            menuLinks.forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    const sectionId = this.getAttribute('data-page');
                    showSection(sectionId);
                });
            });
            showSection('ventas');
        });
    </script>
</body>
</html>
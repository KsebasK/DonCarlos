<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />




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
                        <button type="submit" class="boton">
                            <i class="fas fa-save"></i> Registrar Venta
                        </button>
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

<%@ include file="common/footer.jsp" %>
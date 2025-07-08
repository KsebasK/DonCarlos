<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<div class="main-content">
    <div class="top-bar">
        <h1>Gestión de Productos</h1>
    </div>

    <!-- Registrar Producto -->
    <section>
        <div class="card">
            <div class="card-header">
                <h2>Registrar Nuevo Producto</h2>
            </div>
            <div class="card-body">
                <form action="SvProductos" method="POST">
                    <input type="hidden" name="idProducto" value="${productoEditar.idProducto}" />
                    <div>
                        <label>Modelo:</label>
                        <input type="text" name="modeloCelular" value="${productoEditar.nombre}" required />
                    </div>
                    <div>
                        <label>Marca:</label>
                        <select name="marcaCelular" required>
                            <option value="">Seleccione una marca</option>
                            <c:forEach var="marca" items="${['Samsung','Apple','Xiaomi','Motorola','Huawei','Tecno','Honor']}">
                                <option value="${marca}" <c:if test="${productoEditar.marca == marca}">selected</c:if>>${marca}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label>Gama:</label>
                        <select name="gamaCelular" required>
                            <option value="">Seleccione una gama</option>
                            <c:forEach var="gama" items="${['Alta','Media','Baja']}">
                                <option value="${gama}" <c:if test="${productoEditar.gama == gama}">selected</c:if>>${gama}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label>Precio ($):</label>
                        <input type="number" name="precioVenta" step="0.01" value="${productoEditar.precio}" required />
                    </div>
                    <div>
                        <label>Descripción:</label>
                        <textarea name="descripcion">${productoEditar.descripcion}</textarea>
                    </div>
                    <button type="submit">Guardar Producto</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Listar Productos -->
    <section>
        <div class="card">
            <div class="card-header">
                <h2>Lista de Productos</h2>
            </div>
            <div class="card-body">
                <table class="tabla">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Modelo</th>
                            <th>Marca</th>
                            <th>Gama</th>
                            <th>Precio</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${listaProductos}">
                            <tr>
                                <td>${producto.idProducto}</td>
                                <td>${producto.nombre}</td>
                                <td>${producto.marca}</td>
                                <td>${producto.gama}</td>
                                <td>$${producto.precio}</td>
                                <td>
                                    <form action="SvProductos" method="GET" style="display:inline;">
                                        <input type="hidden" name="id" value="${producto.idProducto}" />
                                        <button type="submit">Editar</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>

<jsp:include page="common/footer.jsp" />

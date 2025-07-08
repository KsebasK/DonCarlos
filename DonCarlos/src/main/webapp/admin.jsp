<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<head>
    <meta charset="UTF-8" />
    <title>Gestión de Productos - Don Carlos Celulares</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="css/styleAdmin.css" />
</head>

<div class="main-content">
    <div class="top-bar">
        <h1>Gestión de Productos</h1>
        <div class="user-info">
            <img src="https://ui-avatars.com/api/?name=${usuario.nombre}&background=00f2ff&color=000" alt="Usuario">
            <div>
                <p>${usuario.nombre}</p>
                <small>Don Carlos Celulares</small>
            </div>
        </div>
    </div>

    <!-- Registrar Producto -->
    <section>
        <div class="card">
            <div class="card-header">
                <h2>${productoEditar != null ? "Editar Producto" : "Registrar Nuevo Producto"}</h2>
            </div>
            <div class="card-body">
                <form action="SvProductos" method="POST" class="formulario">
                    <input type="hidden" name="idProducto" value="${productoEditar.idProducto}" />

                    <div class="form-group">
                        <label for="modeloCelular">Modelo:</label>
                        <input type="text" id="modeloCelular" name="modeloCelular" class="controles"
                               value="${productoEditar.nombre}" required />
                    </div>

                    <div class="form-group">
                        <label for="marcaCelular">Marca:</label>
                        <select id="marcaCelular" name="marcaCelular" class="controles" required>
                            <option value="">Seleccione una marca</option>
                            <c:forEach var="marca" items="${['Samsung','Apple','Xiaomi','Motorola','Huawei','Tecno','Honor']}">
                                <option value="${marca}" <c:if test="${productoEditar.marca == marca}">selected</c:if>>${marca}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="gamaCelular">Gama:</label>
                        <select id="gamaCelular" name="gamaCelular" class="controles" required>
                            <option value="">Seleccione una gama</option>
                            <c:forEach var="gama" items="${['Alta','Media','Baja']}">
                                <option value="${gama}" <c:if test="${productoEditar.gama == gama}">selected</c:if>>${gama}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="precioVenta">Precio ($):</label>
                        <input type="number" id="precioVenta" name="precioVenta" class="controles"
                               step="0.01" value="${productoEditar.precio}" required />
                    </div>

                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <textarea id="descripcion" name="descripcion" class="controles" rows="3">${productoEditar.descripcion}</textarea>
                    </div>

                    <button type="submit" class="boton">
                        <i class="fas fa-save"></i> Guardar Producto
                    </button>
                </form>
            </div>
        </div>
    </section>

    <!-- Lista de productos -->
    <!-- Lista de productos -->
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
                            <td style="display: flex; gap: 8px;">
                                <form action="SvProductos" method="GET">
                                    <input type="hidden" name="id" value="${producto.idProducto}" />
                                    <button type="submit" class="btn-primary">
                                        <i class="fas fa-edit"></i> Editar
                                    </button>
                                </form>
                                
                                <form action="SvEliminarProducto" method="POST" onsubmit="return confirm('¿Estás seguro de eliminar este producto?');">
                                    <input type="hidden" name="id" value="${producto.idProducto}" />
                                    <button type="submit" class="btn-limpiar">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </button>
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

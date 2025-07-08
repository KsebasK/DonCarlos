<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<div class="main-content">
    <div class="top-bar">
        <h1>Editar Producto</h1>
    </div>

    <!-- Formulario para editar -->
    <section>
        <div class="card">
            <div class="card-header">
                <h2>Modificar Producto</h2>
            </div>
            <div class="card-body">
                <form action="SvProductos" method="POST">
                    <input type="hidden" name="idProducto" value="${productoEditar.idProducto}" />

                    <div>
                        <label>Modelo:</label>
                        <input type="text" name="modeloCelular" value="${productoEditar.nombre}" class="controles" required />
                    </div>

                    <div>
                        <label>Marca:</label>
                        <select name="marcaCelular" class="controles" required>
                            <c:forEach var="marca" items="${['Samsung','Apple','Xiaomi','Motorola','Huawei','Tecno','Honor']}">
                                <option value="${marca}" <c:if test="${productoEditar.marca == marca}">selected</c:if>>${marca}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label>Gama:</label>
                        <select name="gamaCelular" class="controles" required>
                            <c:forEach var="gama" items="${['Alta','Media','Baja']}">
                                <option value="${gama}" <c:if test="${productoEditar.gama == gama}">selected</c:if>>${gama}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label>Precio ($):</label>
                        <input type="number" name="precioVenta" step="0.01" value="${productoEditar.precio}" class="controles" required />
                    </div>

                    <div>
                        <label>Descripción:</label>
                        <textarea name="descripcion" class="controles">${productoEditar.descripcion}</textarea>
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

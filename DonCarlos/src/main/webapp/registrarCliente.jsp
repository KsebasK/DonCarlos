<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="common/header.jsp" />
<jsp:include page="common/siderbar.jsp" />

<div class="main-content">
    <div class="top-bar">
        <h1>Registrar Cliente</h1>
    </div>

    <section>
        <div class="card">
            <div class="card-header">
                <h2>Nuevo Cliente</h2>
            </div>
            <div class="card-body">
                <form action="SvClientes" method="POST" class="formulario">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" id="apellido" name="apellido" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" id="telefono" name="telefono" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="cedula">Cédula:</label>
                        <input type="text" id="cedula" name="cedula" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" class="controles" required />
                    </div>

                    <div class="form-group">
                        <label for="limiteCredito">Límite de Crédito:</label>
                        <input type="number" step="0.01" id="limiteCredito" name="limiteCredito" class="controles" required />
                    </div>

                    <button type="submit" class="boton">
                        <i class="fas fa-user-plus"></i> Guardar Cliente
                    </button>
                </form>
            </div>
        </div>
    </section>
</div>

<jsp:include page="common/footer.jsp" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Iniciar Sesión | El Vecino Amigo</title>
    <link rel="stylesheet" href="style/style.css" />
</head>
<body>
    <div class="contenedor-principal">

        <div class="logo-contenedor">
            <img src="imagenes/logo.png" alt="Logo de la tienda El Vecino Amigo" class="logo-img"/>
        </div>

        <section class="Formulario">
            <h4>🔐 Iniciar Sesión</h4>
            <form action="SvLogin" method="POST">
                <input class="controles" type="email" name="email" placeholder="📧 Correo electrónico" required>
                <input class="controles" type="password" name="contrasena" placeholder="🔑 Contraseña" required>
                <input class="boton" type="submit" value="Ingresar">
                <p><a href="register.jsp">¿No tienes cuenta? Regístrate</a></p>
            </form>
            <c:if test="${not empty error}">
                <p style="color:red;">${error}</p>
            </c:if>
        </section>

    </div>
</body>
</html>

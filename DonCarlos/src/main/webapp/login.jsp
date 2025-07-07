<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Iniciar Sesión | El Vecino Amigo</title>
    <link rel="stylesheet" href="css/style.css" />

</head>
<body>
<div class="contenedor-principal">

    <!-- Lado izquierdo con logo -->
    <div class="logo-contenedor">
        <img src="imagenes/logo.png" alt="Logo de la tienda El Vecino Amigo"class="logo-img">
    </div>

    <!-- Lado derecho con formulario -->
    <section class="Formulario">
        <h4>🔐 Iniciar Sesión</h4>
        <form action="SvLogin" method="POST">
           <p> <input class="controles" type="email" name="email" placeholder="📧 Correo electrónico" required></p>
           <p> <input class="controles" type="password" name="contrasena" placeholder="🔑 Contraseña" required></p>
           <p> <input class="boton" type="submit" value="Ingresar"></p>
            <p><a href="register.jsp">¿No tienes cuenta? Regístrate</a></p>
        </form>
</section>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    
    </div>
</div>

</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Iniciar Sesión | El Vecino Amigo</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #001f33; /* fondo azul oscuro */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            display: flex;
            background-color: #001f33; /* mismo azul oscuro */
            border: 2px solid #00e5ff; /* borde neon */
            box-shadow: 0 0 25px #00e5ff;
            border-radius: 14px;
            overflow: hidden;
            width: 800px;
            max-width: 90%;
        }

        .login-left {
            background-color: #001f33;
            color: white;
            padding: 40px;
            width: 40%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .login-left img {
            width: 120px;
            height: auto;
            margin-bottom: 20px;
        }

        .login-left h2 {
            font-size: 24px;
            margin: 0;
        }

        .login-right {
            padding: 40px;
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #001f33;
        }

        .login-right h4 {
            font-size: 22px;
            color: #00e5ff;
            margin-bottom: 20px;
            text-align: center;
        }

        .controles {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            background-color: #000d1a;
            border: 1px solid #00e5ff55;
            border-radius: 8px;
            font-size: 16px;
            color: #ffffff;
            outline: none;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .controles:focus {
            border-color: #00e5ff;
            box-shadow: 0 0 12px #00e5ff;
        }

        .boton {
            background-color: transparent;
            border: 2px solid #00e5ff;
            color: #00e5ff;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .boton:hover {
            background-color: #00e5ff22;
            box-shadow: 0 0 10px #00e5ff;
        }

        .login-right p {
            text-align: center;
            margin-top: 15px;
            color: #ccc;
        }

        .login-right a {
            color: #00e5ff;
            text-decoration: none;
        }

        .login-right a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <!-- Lado izquierdo con logo -->
    <div class="login-left">
        <img src="imagenes/logo.png" alt="Logo de la tienda El Vecino Amigo">
        <h2>El Vecino Amigo</h2>
    </div>

    <!-- Lado derecho con formulario -->
    <div class="login-right">
        <h4>🔐 Iniciar Sesión</h4>
        <form action="SvLogin" method="POST">
            <input class="controles" type="email" name="email" placeholder="📧 Correo electrónico" required>
            <input class="controles" type="password" name="contrasena" placeholder="🔑 Contraseña" required>
            <input class="boton" type="submit" value="Ingresar">
            <p><a href="register.jsp">¿No tienes cuenta? Regístrate</a></p>
        </form>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>
</div>

</body>
</html>

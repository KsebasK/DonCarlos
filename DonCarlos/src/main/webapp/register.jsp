<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Registro | El Vecino Amigo</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <div class="contenedor-principal">
    
    <div class="logo-contenedor">
      <img src="imagenes/logo.png" alt="Logo de la tienda El Vecino Amigo" class="logo-img"/>
    </div>

   
    <section class="Formulario">
      <h4>🔒 Registro de Usuario</h4>
      <form action="SvUsuarios" method="POST">
    <input class="controles" type="text" id ="nombres" name="nombres" placeholder="📛 Nombres" required>
    <input class="controles" type="text" id ="apellidos" name="apellidos" placeholder="📛 Apellidos" required>
    <input class="controles" type="email"id ="correo" name="correo" placeholder="📧 Correo electrónico" required>
    <input class="controles" type="password" id = "contrasena" name="contrasena" placeholder="🔐 Contraseña" required>

    <p>Estoy de acuerdo con: <a href="#">Términos y condiciones</a></p>
    <input class="boton" type="submit" value="Registrar"> 
    <p><a href="login.jsp">← Iniciar Sesión</a></p>
</form>
    </section>

  </div>

  <script src="register.jsp"></script>
</body>
</html>
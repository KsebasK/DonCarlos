<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Vendedor - Don Carlos Celulares</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            background: linear-gradient(90deg, #0f0c29, #302b63, #24243e);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
        }

        .app-container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar estilo neon */
        .sidebar {
            width: 250px;
            background: rgba(0, 0, 20, 0.85);
            border-right: 1px solid #00f2ff;
            box-shadow: 0 0 15px #00f2ff8c;
        }

        .sidebar-header {
            padding: 20px;
            background: rgba(0, 225, 255, 0.08);
            text-align: center;
            border-bottom: 1px solid #00f2ff;
        }

        .sidebar-header h2 {
            color: #0ff;
            text-shadow: 0 0 8px #0ff;
            font-size: 1.5rem;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .sidebar-menu ul {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #bdc3c7;
            text-decoration: none;
            transition: all 0.3s;
        }

        .sidebar-menu a:hover {
            background: rgba(0, 225, 255, 0.15);
            color: #0ff;
            text-shadow: 0 0 5px #0ff;
        }

        .sidebar-menu a.active {
            background: rgba(0, 225, 255, 0.2);
            color: #0ff;
            text-shadow: 0 0 8px #0ff;
            border-left: 3px solid #0ff;
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
            color: inherit;
        }

        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 250px;
            padding: 15px;
            border-top: 1px solid rgba(0, 242, 255, 0.3);
        }

        .sidebar-footer a {
            color: #0ff;
            text-shadow: 0 0 5px #0ff;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background: rgba(0, 0, 20, 0.7);
            border-radius: 10px;
            margin-bottom: 20px;
            border: 1px solid #00f2ff;
            box-shadow: 0 0 15px #00f2ff8c;
        }

        .top-bar h1 {
            color: #0ff;
            text-shadow: 0 0 8px #0ff;
            font-size: 1.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            border: 1px solid #0ff;
            box-shadow: 0 0 8px #0ff;
        }

        .user-info p {
            margin: 0;
            font-weight: 600;
            color: #0ff;
        }

        .user-info small {
            color: #7f8c8d;
            font-size: 0.8rem;
        }

        /* Content */
        .content {
            background: rgba(0, 0, 20, 0.7);
            border-radius: 10px;
            box-shadow: 0 0 15px #00f2ff8c;
            padding: 20px;
            border: 1px solid #00f2ff;
        }

        /* Cards */
        .card {
            background: rgba(0, 0, 20, 0.7);
            border-radius: 10px;
            box-shadow: 0 0 15px #00f2ff8c;
            margin-bottom: 20px;
            border: 1px solid #00f2ff;
        }

        .card-header {
            padding: 15px 20px;
            border-bottom: 1px solid rgba(0, 242, 255, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h2 {
            font-size: 1.2rem;
            margin: 0;
            color: #0ff;
            text-shadow: 0 0 5px #0ff;
        }

        .card-body {
            padding: 20px;
        }

        /* Formularios */
        .formulario {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #0ff;
            font-size: 0.9rem;
        }

        .controles {
            width: 100%;
            background: rgba(0, 225, 255, 0.08);
            border: 1px solid #00f2ff;
            padding: 12px;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            margin-bottom: 15px;
            outline: none;
            transition: 0.3s;
        }

        .controles:focus {
            border-color: #00f2ff;
            box-shadow: 0 0 10px #00f2ff;
        }

        select.controles {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background: rgba(0, 0, 20, 0.8);
            color: #00f2ff;
            border: 1px solid #00f2ff;
            padding: 12px;
            border-radius: 10px;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%2300f2ff'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 1em;
}

        /* Estilo para las opciones del dropdown */
        select.controles option {
            background: rgba(0, 0, 30, 0.9);
            color: #00f2ff;
            padding: 10px;
}

/* Estilo cuando el dropdown está abierto */
        select.controles:focus {
            box-shadow: 0 0 10px #00f2ff;
}

/* Estilo para el hover en las opciones */
        select.controles option:hover {
            background: #00f2ff;
            color: #000;
}

        textarea.controles {
            min-height: 100px;
            resize: vertical;
        }

        .boton {
            width: 100%;
            background: #00f2ff;
            border: none;
            padding: 12px;
            color: #000;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            grid-column: span 2;
            font-weight: bold;
        }

        .boton:hover {
            background: #0ff;
            box-shadow: 0 0 12px #0ff;
        }

        /* Tablas */
        .tabla {
            width: 100%;
            border-collapse: collapse;
            color: #fff;
        }

        .tabla th, .tabla td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid rgba(0, 242, 255, 0.2);
        }

        .tabla th {
            background: rgba(0, 225, 255, 0.1);
            color: #0ff;
        }

        .tabla tr:hover {
            background: rgba(0, 225, 255, 0.08);
        }

        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .badge-success {
            background-color: rgba(40, 167, 69, 0.2);
            color: #28a745;
            border: 1px solid #28a745;
        }

        .badge-warning {
            background-color: rgba(255, 193, 7, 0.2);
            color: #ffc107;
            border: 1px solid #ffc107;
        }

        /* Secciones */
        .seccion-oculta {
            display: none;
        }

        .seccion-activa {
            display: block;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .formulario {
                grid-template-columns: 1fr;
            }
            
            .boton {
                grid-column: span 1;
            }
        }

        @media (max-width: 768px) {
            .app-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            
            .sidebar-footer {
                position: relative;
                width: 100%;
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="app-container">
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Don Carlos Celulares</h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="#" class="active" data-page="ventas">
                            <i class="fas fa-cash-register"></i>
                            <span>Registrar Venta</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-page="creditos">
                            <i class="fas fa-credit-card"></i>
                            <span>Créditos</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-page="pagos">
                            <i class="fas fa-money-bill-wave"></i>
                            <span>Registrar Pago</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-footer">
                <a href="#" id="logoutBtn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Cerrar Sesión</span>
                </a>
            </div>
        </div>

        <div class="main-content">
            <div class="top-bar">
                <h1>Panel Vendedor</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=Vendedor&background=00f2ff&color=000" alt="Vendedor">
                    <div>
                        <p>Vendedor</p>
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
                            <form id="formVenta" class="formulario">
                                <div>
                                    <label for="clienteVenta">Nombre del Cliente:</label>
                                    <input type="text" id="clienteVenta" class="controles" required />
                                </div>
                                
                                <div>
                                    <label for="marcaCelular">Marca:</label>
                                    <select id="marcaCelular" class="controles">
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
                                    <select id="gamaCelular" class="controles">
                                        <option value="">Seleccione una gama</option>
                                        <option>Alta</option>
                                        <option>Media</option>
                                        <option>Baja</option>
                                    </select>
                                </div>
                                
                                <div>
                                    <label for="modeloCelular">Modelo:</label>
                                    <input type="text" id="modeloCelular" class="controles" placeholder="Ej. Galaxy A54" required />
                                </div>
                                
                                <div>
                                    <label for="precioVenta">Precio Total ($):</label>
                                    <input type="number" id="precioVenta" class="controles" min="0.01" step="0.01" required />
                                </div>
                                
                                <div>
                                    <label for="cuotas">N° de Cuotas:</label>
                                    <input type="number" id="cuotas" class="controles" min="1" max="36" required />
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
                                <table id="tablaCreditos" class="tabla">
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
                                        <tr>
                                            <td>Juan Pérez</td>
                                            <td>Samsung Galaxy S23</td>
                                            <td>$1,200.00</td>
                                            <td>12</td>
                                            <td>$800.00</td>
                                            <td>15/07/2023</td>
                                            <td><span class="badge badge-success">Al día</span></td>
                                        </tr>
                                        <tr>
                                            <td>María Gómez</td>
                                            <td>iPhone 14</td>
                                            <td>$1,500.00</td>
                                            <td>24</td>
                                            <td>$1,200.00</td>
                                            <td>20/07/2023</td>
                                            <td><span class="badge badge-success">Al día</span></td>
                                        </tr>
                                        <tr>
                                            <td>Carlos López</td>
                                            <td>Xiaomi Redmi Note 12</td>
                                            <td>$350.00</td>
                                            <td>6</td>
                                            <td>$150.00</td>
                                            <td>10/07/2023</td>
                                            <td><span class="badge badge-warning">Por vencer</span></td>
                                        </tr>
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
                            <form id="formPago" class="formulario">
                                <div>
                                    <label for="clientePago">Cliente:</label>
                                    <select id="clientePago" class="controles" required>
                                        <option value="">Seleccione un cliente</option>
                                        <option>Juan Pérez</option>
                                        <option>María Gómez</option>
                                        <option>Carlos López</option>
                                        <option>Ana Martínez</option>
                                    </select>
                                </div>
                                
                                <div>
                                    <label for="montoPago">Monto ($):</label>
                                    <input type="number" id="montoPago" class="controles" min="0.01" step="0.01" required />
                                </div>
                                
                                <div>
                                    <label for="fechaPago">Fecha:</label>
                                    <input type="date" id="fechaPago" class="controles" required />
                                </div>
                                
                                <div>
                                    <label for="descripcionPago">Descripción:</label>
                                    <textarea id="descripcionPago" class="controles" placeholder="Ej. Cuota 1/12, pago parcial, etc."></textarea>
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
        document.addEventListener('DOMContentLoaded', function() {
            // Obtener elementos del DOM
            const menuLinks = document.querySelectorAll('.sidebar-menu a');
            const sections = {
                ventas: document.getElementById('seccionVentas'),
                creditos: document.getElementById('seccionCreditos'),
                pagos: document.getElementById('seccionPagos')
            };
            
            // Función para cambiar de sección
            function showSection(sectionId) {
                // Ocultar todas las secciones
                Object.values(sections).forEach(section => {
                    section.classList.add('seccion-oculta');
                    section.classList.remove('seccion-activa');
                });
                
                // Mostrar la sección seleccionada
                sections[sectionId].classList.remove('seccion-oculta');
                sections[sectionId].classList.add('seccion-activa');
                
                // Actualizar el menú activo
                menuLinks.forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('data-page') === sectionId) {
                        link.classList.add('active');
                    }
                });
            }
            
            // Agregar eventos a los enlaces del menú
            menuLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const sectionId = this.getAttribute('data-page');
                    showSection(sectionId);
                });
            });
            
            // Manejar el envío de formularios
            document.getElementById('formVenta')?.addEventListener('submit', function(e) {
                e.preventDefault();
                alert('Venta registrada correctamente');
                this.reset();
            });
            
            document.getElementById('formPago')?.addEventListener('submit', function(e) {
                e.preventDefault();
                alert('Pago registrado correctamente');
                this.reset();
            });
            
            // Inicializar con la sección de ventas visible
            showSection('ventas');
        });
    </script>
</body>
</html>
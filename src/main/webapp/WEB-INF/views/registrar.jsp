<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
            rel="stylesheet">
    <link rel="stylesheet" href="/css/contact-css.css">
    <link rel="stylesheet" href="/css/login-css.css">
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp" />

<main>
    <section id="register" class="login-section">
        <div class="card shadow rounded-4 p-4 login-card m-5">
            <div class="card-body">
                <h2 class="text-center mb-4">Crear Cuenta</h2>
                <form action="/registrar" method="post" class="row">
                    <!-- Nombre-->
                    <div class="mb-3 col-md-6">
                        <label for="nombre_user" class="form-label">Nombre</label>
                        <input type="text"
                               class="form-control"
                               value=""
                               id="nombre_user"
                               name="nombre_user"
                               placeholder="Ingresa tu nombre"
                               required>
                    </div>

                    <!-- Ap. Paterno-->
                    <div class="mb-3 col-md-6">
                        <label for="apaterno_user" class="form-label">Ap. Paterno</label>
                        <input type="text"
                               class="form-control"
                               value=""
                               id="apaterno_user"
                               name="apaterno_user"
                               placeholder="Ingresa tu apellido paterno"
                               required>
                    </div>

                    <!-- Ap. Materno-->
                    <div class="mb-3 col-md-6">
                        <label for="amaterno_user" class="form-label">Ap. Materno</label>
                        <input type="text"
                               class="form-control"
                               value=""
                               id="amaterno_user"
                               name="amaterno_user"
                               placeholder="Ingresa tu apellido materno"
                               required>
                    </div>

                    <!-- Telefono -->
                    <div class="mb-3 col-md-6">
                        <label for="telefono_user" class="form-label">Teléfono</label>
                        <input type="text"
                               class="form-control"
                               value=""
                               id="telefono_user"
                               name="telefono_user"
                               placeholder="Ingresa tu número de teléfono"
                               required
                               title="Debe tener 9 dígitos numéricos">
                    </div>

                    <!-- Correo -->
                    <div class="mb-3">
                        <label for="correo_user" class="form-label">Correo electrónico</label>
                        <input type="email"
                               class="form-control"
                               id="correo_user"
                               name="correo_user"
                               placeholder="Ingresa tu correo"
                               required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password"
                               class="form-control"
                               id="password"
                               name="password"
                               placeholder="Crea una contraseña"
                               required>
                    </div>

                    <!-- Confirmar pass -->
                    <div class="mb-3">
                        <label for="confirmar" class="form-label">Confirmar contraseña</label>
                        <input type="password"
                               class="form-control"
                               id="confirmar"
                               name="confirmar"
                               placeholder="Repite tu contraseña"
                               required>
                    </div>

                    <!-- Mensaje de error -->
                    <div class="mb-2 text-danger">
                        <label class="form-label">${error}</label>
                    </div>

                    <!-- Btn Registrar -->
                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-person-plus"></i> Registrar
                        </button>
                    </div>

                    <!-- Login-->
                    <div class="text-center">
                        <p>¿Ya tienes cuenta?
                            <a href="/login" class="link-primary">Inicia sesión aquí</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

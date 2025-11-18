<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet" href="/css/contact-css.css">
        <link rel="stylesheet" href="/css/login-css.css">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    </head>
    <body>
        <!-- header -->
        <jsp:include page="header.jsp" />

        <main>
            <section id="login" class="login-section">
                <div class="card shadow rounded-4 p-4 login-card m-5">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Iniciar Sesión</h2>
                        <form action="/login" method="post">
                            <div class="mb-3">
                                <label for="correo"
                                    class="form-label">Correo</label>
                                <input type="email" class="form-control"
                                    id="correo"
                                    name="correo"
                                    placeholder="Ingresa tu Correo"
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="password"
                                    class="form-label">Contraseña</label>
                                <input type="password" class="form-control"
                                    id="password" name="password"
                                    placeholder="Ingresa tu contraseña"
                                    required>
                            </div>
                            <div class="mb-2 text-danger">
                                <label lass="form-label">${error}</label>
                            </div>
                            <div class="d-grid mb-3">
                                <button type="submit"
                                    class="btn btn-primary">Entrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
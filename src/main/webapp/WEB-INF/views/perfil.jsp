<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil del Usuario</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/css/login-css.css">
    </head>
    <body>
        <!-- header -->
        <jsp:include page="header.jsp" />

        <main id="perfil" class="perfil-section p-5">
            <section>
                <div class="container ">
                    <div class="row justify-content-center">
                            <div class="card shadow rounded-4 p-4 perfil-card"  style="max-width: 400px;">
                                <div class="card-body text-center">
                                    <h2 class="mb-4">Mi Perfil</h2>

                                    <!-- Foto de perfil -->
                                    <div class="mb-3">
                                        <img
                                            src="https://www.kamenarstvovaterka.sk/img/uploads/15S9201702-54-20IMG-704.png"
                                            alt="Foto de ${sessionScope.user.nombre_user}"
                                            class="rounded-circle shadow"
                                            width="120" height="120">
                                    </div>

                                    <!-- Información del usuario -->
                                    <div class="text-start mb-3">
                                        <p><strong
                                                class="text-dark">User
                                                ID:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.id_usuario}</span></p>
                                        <p><strong
                                                class="text-dark">Nombre:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.nombre_user}</span></p>
                                        <p><strong
                                                class="text-dark">Ap.
                                                Paterno:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.apaterno_user}</span></p>
                                        <p><strong
                                                class="text-dark">Ap.
                                                Materno:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.amaterno_user}</span></p>
                                        <p><strong
                                                class="text-dark">Correo:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.correo_user}</span></p>
                                        <p><strong
                                                class="text-dark">Teléfono:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.telefono_user}</span></p>
                                        <p><strong
                                                class="text-dark">Tipo:</strong>
                                            <span
                                                class="text-primary">${sessionScope.user.tipo_user.nombre_tipoUsuario}</span></p>
                                    </div>

                                    <!-- Botones de acción -->
                                    <div
                                        class="d-flex justify-content-center gap-3 mt-4">
                                        <a href="#" class="btn btn-primary">
                                            <i
                                                class="bi bi-pencil-square me-1"></i>
                                            Editar Perfil
                                        </a>
                                        <a href="#" class="btn btn-warning">
                                            <i class="bi bi-lock-fill me-1"></i>
                                            Cambiar Contraseña
                                        </a>
                                    </div>

                                </div> 
                            </div> 
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

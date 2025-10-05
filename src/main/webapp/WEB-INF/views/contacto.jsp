<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contacto</title>
        <link rel="stylesheet" href="/css/contact-css.css">
        <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">

    </head>
    <body>
        <!-- header -->
        <jsp:include page="header.jsp" />
        <!-- header -->

        <!-- Texto principal -->
        <section class="main-texto">
            <div class="container text-center py-5 caja">
                <h1 class="titulo-dorado">Contacta con nosotros</h1>
                <p class="lead">
                    Si tienes dudas, sugerencias o quieres más información sobre
                    nuestros productos,
                    completa el formulario y te responderemos lo antes posible.
                </p>
            </div>
        </section>

        <!-- Contacto -->
        <section id="contacto" class="py-5">
            <div class="container">
                <div class="row g-4">
                    <!-- Formulario -->
                    <div class="col-md-6">
                        <div class="card shadow border-1 rounded-3">
                            <div class="card-body p-4">
                                <form>
                                    <div class="mb-3">
                                        <label for="nombre"
                                            class="form-label">Nombre</label>
                                        <input type="text" class="form-control"
                                            id="nombre"
                                            placeholder="Tu nombre completo">
                                    </div>
                                    <div class="mb-3">
                                        <label for="correo"
                                            class="form-label">Correo
                                            electrónico</label>
                                        <input type="email" class="form-control"
                                            id="correo"
                                            placeholder="ejemplo@correo.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="mensaje"
                                            class="form-label">Mensaje</label>
                                        <textarea class="form-control"
                                            id="mensaje" rows="4"
                                            placeholder="Escribe tu mensaje aquí..."></textarea>
                                    </div>
                                    <button type="submit"
                                        class="btn btn-primary w-100">
                                        Enviar mensaje
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Mapa-->
                    <div class="col-md-6">
                        <div
                            class="card shadow border-0 rounded-4 overflow-hidden">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3904.12529021453!2d-77.0292126!3d-11.8963631!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105d14a3d4733f1%3A0x3a79cfd4297605c8!2sLicoreria%20la%20taberna%20de%20roly!5e0!3m2!1ses-419!2spe!4v1757319823114!5m2!1ses-419!2spe"
                                width="100%" height="400" style="border:0;"
                                allowfullscreen loading="lazy">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- <footer> -->
        <jsp:include page="footer.jsp" />
        <!-- <footer> -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
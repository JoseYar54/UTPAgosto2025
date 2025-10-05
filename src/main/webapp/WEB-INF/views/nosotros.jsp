<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nosotros</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet" href="css/contact-css.css">
        <link rel="stylesheet" href="css/nosotros-css.css">

        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">

    </head>
    <body>

        <!-- header -->
        <jsp:include page="header.jsp" />
        <!-- header -->

        <div class="text-center py-5 section-nosotros">
            <h1 class="display-4 fw-bold titulo-dorado">Nosotros</h1>
            <p class="lead mt-3">
                Bienvenido a <strong>La Taberna de Roly</strong>. Aquí
                encontrarás toda la información sobre nuestra empresa,
                nuestra historia, misión, visión y los valores que nos guían
                para ofrecer vinos artesanales de alta calidad.
            </p>
        </div>

        <section id="quienes-somos" class="py-5 bg-gradient">
            <div class="container">
                <h2 class="mb-4 text-center fw-bold">Quiénes Somos</h2>
                <p class="text-center fs-5">
                    <strong>La Taberna de Roly</strong> es una empresa familiar
                    dedicada a la
                    producción de vinos artesanales de alta calidad. Combinamos
                    la tradición
                    vinícola con técnicas modernas para ofrecer una experiencia
                    única en cada botella.
                </p>
            </div>
        </section>

        <section id="historia" class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4 text-center fw-bold">Nuestra Historia</h2>
                <div class="row align-items-center">
                    <div class="col-md-6 mb-4 mb-md-0">
                        <p class="fs-5 text-muted">
                            Fundada en 1985, <strong>La Taberna de Roly</strong>
                            comenzó como un
                            pequeño proyecto familiar en Lima, Perú. A lo largo
                            de los años, hemos crecido
                            manteniendo nuestra filosofía de calidad y pasión
                            por el vino. Cada generación
                            ha aportado innovación y dedicación para mantenernos
                            como referentes del sector.
                        </p>
                    </div>
                    <div class="col-md-6 text-center">
                        <img
                            src="https://elcronista.co/assets/media/fabrica-de-licores-del-tolima-se-encuentra-operando-2024.jpg?u=1721400058"
                            alt="Historia Viñedos Robles"
                            class="img-fluid rounded-4 shadow-lg border border-3 w-75">
                    </div>
                </div>
            </div>
        </section>

        <section id="mision-vision" class="py-5 bg-gradient">
            <div class="container">
                <h2 class="mb-5 text-center fw-bold">Misión y Visión</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-5">
                        <div class="card border-0 shadow-lg h-100 hover-shadow">
                            <div class="card-body text-center">
                                <i
                                    class="bi bi-bullseye fs-1 text-warning mb-3"></i>
                                <h5 class="card-title fw-bold">Misión</h5>
                                <p class="card-text text-muted">
                                    Ofrecer vinos artesanales de alta calidad
                                    que representen la pasión y tradición
                                    vinícola de nuestra familia, garantizando la
                                    satisfacción de nuestros clientes.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card border-0 shadow-lg h-100 hover-shadow">
                            <div class="card-body text-center">
                                <i class="bi bi-eye fs-1 text-warning mb-3"></i>
                                <h5 class="card-title fw-bold">Visión</h5>
                                <p class="card-text text-muted">
                                    Ser reconocidos nacional e
                                    internacionalmente como líderes en vinos
                                    artesanales, preservando la tradición y
                                    fomentando la innovación constante.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="valores" class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-5 text-center fw-bold">Nuestros Valores</h2>
                <div class="row g-4 text-center">
                    <div class="col-md-3">
                        <div class="card border-0 shadow-lg py-4 hover-scale">
                            <div class="card-body">
                                <i
                                    class="bi bi-heart-fill text-danger fs-2 mb-3"></i>
                                <h6 class="fw-bold">Pasión</h6>
                                <p class="text-muted">Amamos lo que hacemos y lo
                                    reflejamos en cada vino.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card border-0 shadow-lg py-4 hover-scale">
                            <div class="card-body">
                                <i
                                    class="bi bi-award-fill text-warning fs-2 mb-3"></i>
                                <h6 class="fw-bold">Calidad</h6>
                                <p class="text-muted">Nuestros vinos cumplen con
                                    los más altos estándares.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card border-0 shadow-lg py-4 hover-scale">
                            <div class="card-body">
                                <i
                                    class="bi bi-people-fill text-primary fs-2 mb-3"></i>
                                <h6 class="fw-bold">Compromiso</h6>
                                <p class="text-muted">Estamos comprometidos con
                                    clientes y comunidad.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card border-0 shadow-lg py-4 hover-scale">
                            <div class="card-body">
                                <i
                                    class="bi bi-lightning-fill text-info fs-2 mb-3"></i>
                                <h6 class="fw-bold">Innovación</h6>
                                <p class="text-muted">Buscamos siempre mejorar e
                                    innovar en nuestros procesos.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        <!-- Footer -->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
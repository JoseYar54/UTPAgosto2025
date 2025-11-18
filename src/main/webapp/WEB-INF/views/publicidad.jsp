<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Ofertas y Promociones | La Taberna de Roly</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- CSS principal -->
    <link href="css/styles.css" rel="stylesheet">
    <!-- CSS específico -->
    <link href="css/publicidad.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>

        <!-- Encabezado -->
        <section class="page-header text-center text-white py-5 mb-5">
            <div class="overlay"></div>
            <div class="container position-relative">
                <h1 class="display-4 fw-bold mb-3">Ofertas y Promociones</h1>
                <p class="lead mb-0">No te pierdas nuestras increíbles ofertas y eventos especiales</p>
            </div>
        </section>

<!-- Contenido Principal -->
<main class="container mb-5">
    <!-- Sección de Ofertas -->
    <h2 class="display-6 fw-bold mb-4 text-center text-danger">
        Ofertas Destacadas
    </h2>

    <div class="row g-4 mb-5">
        <!-- Oferta 1 -->
        <div class="col-lg-6 col-md-12">
            <div class="card promo-card shadow-lg border-0 h-100">
                <div class="position-relative">
                    <img src="https://tse1.mm.bing.net/th/id/OIP.W8x58ZVSMwnTtAUMUwhEVgHaE8?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Promoción Cervezas" class="card-img-top promo-img">
                    <span class="promo-badge bg-danger text-white">¡LIMITADO!</span>
                </div>
                <div class="card-body p-4">
                    <h4 class="card-title fw-bold mb-3">2x1 en Cervezas Seleccionadas</h4>
                    <p class="card-text text-muted mb-4">¡Aprovecha esta oferta por tiempo limitado en tus cervezas
                        favoritas!</p>
                    <div class="d-flex justify-content-between align-items-center small">
                        <p class="mb-1">
                        <i class="bi bi-clock text-danger me-2">
                        </i>
                        <strong>Válido hasta:</strong> 30/10/2025</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Oferta 2 -->
        <div class="col-lg-6 col-md-12">
            <div class="card promo-card shadow-lg border-0 h-100">
                <div class="position-relative">
                    <img src="https://tse3.mm.bing.net/th/id/OIP.gl4DvqP63TA_CfaFddOGZAHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Promoción Vinos" class="card-img-top promo-img">
                    <span class="promo-badge bg-warning text-dark">EXCLUSIVO</span>
                </div>
                <div class="card-body p-4">
                    <h4 class="card-title fw-bold mb-3">Descuento del 20% en Vinos Premium</h4>
                    <p class="card-text text-muted mb-4">Selección exclusiva de vinos con un descuento especial.</p>
                    <div class="d-flex justify-content-between align-items-center small">
                        <p class="mb-1">
                        <i class="bi bi-clock text-danger me-2">
                        </i>
                        <strong>Válido hasta:</strong> 15/11/2025</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Eventos -->
    <section>
        <h2 class="display-6 fw-bold mb-4 text-center text-danger">
            Próximos Eventos
        </h2>

        <div class="row g-4">
            <!-- Evento 1 -->
            <div class="col-12">
                <div class="card event-card shadow-sm border-0">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="event-date text-center bg-warning rounded-3 p-2">
                                    <span class="event-day d-block fs-3 fw-bold text-dark">15</span>
                                    <span class="event-month text-uppercase text-dark">Oct</span>
                                </div>
                            </div>
                            <div class="col">
                                <h5 class="fw-bold mb-2">Degustación de Vinos Peruanos</h5>
                                <p class="mb-1"><i class="bi bi-clock text-danger me-2"></i><strong>Hora:</strong>
                                    19:00 hrs</p>
                                <p class="mb-0"><i
                                        class="bi bi-geo-alt-fill text-danger me-2"></i><strong>Lugar:</strong> Nuestra
                                    tienda principal</p>
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-outline-danger">
                                    <i class="bi bi-info-circle me-1"></i> Más información
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Evento 2 -->
            <div class="col-12">
                <div class="card event-card shadow-sm border-0">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="event-date text-center bg-warning rounded-3 p-2">
                                    <span class="event-day d-block fs-3 fw-bold text-dark">22</span>
                                    <span class="event-month text-uppercase text-dark">Oct</span>
                                </div>
                            </div>
                            <div class="col">
                                <h5 class="fw-bold mb-2">Noche de Cócteles con Bartender Invitado</h5>
                                <p class="mb-1"><i class="bi bi-clock text-danger me-2"></i><strong>Hora:</strong>
                                    20:00 hrs</p>
                                <p class="mb-0"><i
                                        class="bi bi-geo-alt-fill text-danger me-2"></i><strong>Lugar:</strong> Bar
                                    anexo</p>
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-outline-danger">
                                    <i class="bi bi-info-circle me-1"></i> Más información
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- <footer> -->
        <jsp:include page="footer.jsp" />
        <!-- <footer> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
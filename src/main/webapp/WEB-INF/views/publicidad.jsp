<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ofertas y Promociones</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="/css/styles.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Main Content -->
        <div class="container mt-4"><br><br><br>
            <h1 class="page-title">Ofertas y Promociones</h1>
            <p class="lead page-subtitle">No te pierdas nuestras increíbles
                ofertas y eventos especiales.</p>

            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card mb-4 promo-card">
                        <img src="/img/cerveza2x1.jpg"
                            class="card-img-top promo-img" alt="Promoción 1">
                        <div class="card-body">
                            <h5 class="card-title promo-title">2x1 en Cervezas
                                Seleccionadas</h5>
                            <p class="card-text promo-text">¡Aprovecha esta
                                oferta por tiempo limitado en tus cervezas
                                favoritas!</p>
                            <div class="promo-badge">¡LIMITADO!</div>
                            <a href="#" class="btn btn-success promo-btn">Ver
                                Oferta</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card mb-4 promo-card">
                        <img src="/img/descuentovino.jpg"
                            class="card-img-top promo-img" alt="Promoción 2">
                        <div class="card-body">
                            <h5 class="card-title promo-title">Descuento del 20%
                                en Vinos Premium</h5>
                            <p class="card-text promo-text">Selección exclusiva
                                de vinos con un descuento especial.</p>
                            <div class="promo-badge">EXCLUSIVO</div>
                            <a href="#" class="btn btn-success promo-btn">Ver
                                Oferta</a>
                        </div>
                    </div>
                </div>
            </div>

            <h2 class="mt-5 section-title">Próximos Eventos</h2>
            <div class="events-container mt-3">
                <div class="event-item">
                    <div class="event-date">
                        <span class="event-day">15</span>
                        <span class="event-month">Setiembre</span>
                    </div>
                    <div class="event-details">
                        <h5 class="event-title">Degustación de Vinos
                            Peruanos</h5>
                        <p class="event-info"><i class="fas fa-clock"></i> 19:00
                            hrs</p>
                        <p class="event-info"><i
                                class="fas fa-map-marker-alt"></i> Nuestra
                            tienda principal</p>
                    </div>
                    <div class="event-actions">
                        <button class="btn btn-outline-primary event-btn">Más
                            información</button>
                    </div>
                </div>

                <div class="event-item"><br>
                    <div class="event-date">
                        <span class="event-day">22</span>
                        <span class="event-month">Setiembre</span>
                    </div>
                    <div class="event-details">
                        <h5 class="event-title">Noche de Cócteles con Bartender
                            Invitado</h5>
                        <p class="event-info"><i class="fas fa-clock"></i> 20:00
                            hrs</p>
                        <p class="event-info"><i
                                class="fas fa-map-marker-alt"></i> Bar anexo</p>
                    </div>
                    <div class="event-actions">
                        <button class="btn btn-outline-primary event-btn">Más
                            información</button>
                    </div>
                </div>
            </div>
        </div><br><br>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        <!-- JS -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"
            crossorigin="anonymous"></script>
        <script src="/js/script_main.js"></script>
    </body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La Taberna de Roly</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/png"
          href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
</head>
<body class="bg-light">

<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- Header -->
<style>
.vh-100.bg-dark {
    background: linear-gradient(rgba(60, 20, 35, 5), rgba(45, 15, 25, 5)) !important;
}
</style>

<!-- HERO -->
<section id="inicio"
         class="vh-100 d-flex align-items-center text-center text-white position-relative overflow-hidden bg-dark">
    <img src="/img/taberna_fondo.png"
         alt="Interior de La Taberna"
         class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover opacity-50">
    <div class="container position-relative z-1">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h1 class="display-3 fw-bold mb-3">
                    LA TABERNA <br><span class="bs-yellow">DE ROLY</span>
                </h1>
                <p class="lead fw-semibold mb-5">
                    Donde cada copa cuenta una historia y cada momento se celebra.
                </p>
                <div class="d-flex justify-content-center gap-3 flex-wrap">
                    <a href="#productos" class="btn btn-outline-light btn-lg fw-bold">Explorar</a>
                    <a href="#historia" class="btn btn-outline-light btn-lg fw-bold">Nuestra Historia</a>
                    <a href="#ofertas" class="btn btn-outline-light btn-lg fw-bold">Ofertas Especiales</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- PRODUCTOS -->
<section id="productos" class="py-5 bg-white">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold display-6 text-uppercase">
                Algunos de Nuestros <span class="text-danger">Productos</span>
            </h2>
            <p class="text-muted fs-5 mb-3">
                Explora nuestra selección de bebidas, vinos y cervezas elaboradas con la mejor calidad y tradición.
            </p>
        </div>

        <div class="row g-4">
            <c:forEach var="producto" items="${listaProductos}" begin="0" end="7">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="position-relative">
                            <img src="${producto.url_pro}" alt="${producto.nombre_pro}"
                                 class="card-img-top" style="height:250px; object-fit:cover;">
                            <span class="badge bg-dark position-absolute top-0 start-0 m-2">${producto.anio_pro}</span>
                            <span class="badge bg-success position-absolute top-0 end-0 m-2">
                                Stock: ${producto.stock_pro}
                            </span>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="badge bg-secondary mb-2">${producto.categoria_pro.nombre_cate}</span>
                            <h6 class="fw-bold">${producto.nombre_pro}</h6>
                            <p class="text-muted small flex-grow-1">${producto.descrip_pro}</p>
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <span class="fw-bold text-danger">S/ ${producto.precio_pro}</span>
                                <button class="btn btn-sm btn-outline-danger rounded-pill px-3 modalito"
                                        data-bs-toggle="modal" data-bs-target="#wineModal"
                                        data-id="${producto.id_producto}"
                                        data-nombre="${producto.nombre_pro}"
                                        data-precio="${producto.precio_pro}"
                                        data-stock="${producto.stock_pro}"
                                        data-anio="${producto.anio_pro}"
                                        data-categoria="${producto.categoria_pro.nombre_cate}"
                                        data-descripcion="${producto.descrip_pro}"
                                        data-imagen="${producto.url_pro}">
                                    <i class="bi bi-eye"></i> Ver
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- CARRUSEL CERVEZAS -->
<section class="my-5">
    <div class="container">
        <h2 class="mb-3 text-center fw-bold text-uppercase">
            <i class="bi bi-beer me-2"></i>Destacados de la categoría <span class="text-danger">Cerveza</span>
        </h2>
        <p class="text-muted text-center fs-5 mb-4">
            Una selección especial de nuestras mejores cervezas artesanales, elaboradas con pasión y tradición.
        </p>
        <div id="carruselCervezas" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:set var="contador" value="0"/>
                <c:forEach var="producto" items="${listaProductos}">
                    <c:if test="${producto.categoria_pro.nombre_cate == 'Cerveza'}">
                        <c:if test="${contador % 3 == 0}">
                            <div class="carousel-item ${contador == 0 ? 'active' : ''}">
                                <div class="row justify-content-center g-4">
                        </c:if>

                        <div class="col-10 col-sm-6 col-md-4 col-lg-3">
                            <div class="card h-100 shadow-lg border-0 rounded-3">
                                <div class="position-relative">
                                    <img src="${producto.url_pro}" class="card-img-top rounded-top"
                                         alt="${producto.nombre_pro}" style="height:250px; object-fit:cover;">
                                    <span class="badge bg-dark position-absolute top-0 start-0 m-2">${producto.anio_pro}</span>
                                    <span class="badge bg-success position-absolute top-0 end-0 m-2">
                                        Stock: ${producto.stock_pro}
                                    </span>
                                </div>
                                <div class="card-body d-flex flex-column p-3">
                                    <span class="badge bg-secondary small mb-2">${producto.categoria_pro.nombre_cate}</span>
                                    <h6 class="fw-bold mb-2">${producto.nombre_pro}</h6>
                                    <p class="text-muted small flex-grow-1">${producto.descrip_pro}</p>
                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <span class="fw-bold text-danger">S/ ${producto.precio_pro}</span>
                                        <button type="button" class="btn btn-sm btn-outline-danger modalito"
                                                data-bs-toggle="modal" data-bs-target="#wineModal"
                                                data-id="${producto.id_producto}"
                                                data-nombre="${producto.nombre_pro}"
                                                data-precio="${producto.precio_pro}"
                                                data-stock="${producto.stock_pro}"
                                                data-anio="${producto.anio_pro}"
                                                data-categoria="${producto.categoria_pro.nombre_cate}"
                                                data-descripcion="${producto.descrip_pro}"
                                                data-imagen="${producto.url_pro}">
                                            <i class="bi bi-eye"></i> Ver
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:set var="contador" value="${contador + 1}"/>
                        <c:if test="${contador % 3 == 0}">
            </div>
        </div>
        </c:if>
        </c:if>
        </c:forEach>

        <c:if test="${contador % 3 != 0}">
    </div>
    </div>
    </c:if>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carruselCervezas" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bg-dark rounded-circle p-3"></span>
        <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carruselCervezas" data-bs-slide="next">
        <span class="carousel-control-next-icon bg-dark rounded-circle p-3"></span>
        <span class="visually-hidden">Siguiente</span>
    </button>
    </div>
    </div>
</section>

<!-- SECCIÓN DE OFERTAS -->
<section id="ofertas" class="py-5 bg-light">
    <div class="container">
        <!-- Encabezado -->
        <div class="text-center mb-5">
            <h2 class="fw-bold display-6 text-uppercase">
                Ofertas y <span class="text-danger">Promociones</span>
            </h2>
            <p class="text-muted fs-5 mb-3">
                Disfruta de descuentos y combos exclusivos por tiempo limitado.
            </p>
        </div>

        <!-- Cards de resumen -->
        <div class="row g-4 justify-content-center">
            <!-- Oferta 1 -->
            <div class="col-12 col-md-6 col-lg-5">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100">
                    <div class="ratio ratio-16x9">
                        <img src="https://tse1.mm.bing.net/th/id/OIP.W8x58ZVSMwnTtAUMUwhEVgHaE8?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3"
                             alt="Promo cervezas" class="img-fluid object-fit-cover w-100 h-100">
                    </div>
                    <div class="card-body text-center p-4">
                        <h5 class="fw-bold text-danger mb-2">2x1 en Cervezas Seleccionadas</h5>
                        <p class="text-muted small mb-3">Solo hasta el 30/10/2025</p>
                    </div>
                </div>
            </div>

            <!-- Oferta 2 -->
            <div class="col-12 col-md-6 col-lg-5">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100">
                    <div class="ratio ratio-16x9">
                        <img src="https://tse3.mm.bing.net/th/id/OIP.gl4DvqP63TA_CfaFddOGZAHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3"
                             alt="Promo vinos" class="img-fluid object-fit-cover w-100 h-100">
                    </div>
                    <div class="card-body text-center p-4">
                        <h5 class="fw-bold text-danger mb-2">20% OFF en Vinos Premium</h5>
                        <p class="text-muted small mb-3">Válido hasta el 15/11/2025</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Botón general -->
        <div class="text-center mt-5">
            <a href="/publicidad" class="btn btn-danger px-4 py-2 fw-bold rounded-pill shadow-sm">
                <i class="bi bi-ticket-perforated me-2"></i> Ver todas las promociones
            </a>
        </div>
    </div>
</section>


<!-- HISTORIA -->
<section id="historia" class="py-5 bg-white">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold display-6 text-uppercase">
                Conoce Nuestra <span class="text-danger">Historia</span>
            </h2>
            <p class="text-muted fs-5">
                Más de tres décadas de pasión, tradición y excelencia en cada botella.
            </p>
        </div>

        <div class="row align-items-center gy-4">
            <div class="col-lg-6">
                <p class="fs-5 text-muted mb-4">
                    Fundada en <strong>1985</strong>, <strong>La Taberna de Roly</strong> nació como un pequeño
                    emprendimiento familiar en Lima. Con esfuerzo, dedicación y amor por el buen licor,
                    nos convertimos en un referente nacional para los amantes del vino, la cerveza artesanal
                    y los destilados premium.
                </p>
                <p class="fs-5 text-muted mb-4">
                    Cada botella cuenta una historia: la de nuestros clientes, la de nuestros productores locales
                    y la de un equipo que sigue innovando sin perder su esencia tradicional.
                </p>
                <div class="row text-center g-3 mt-4">
                    <div class="col-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="fw-bold text-danger mb-0">1985</h5>
                            <small class="text-muted">Inicio Familiar</small>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="fw-bold text-danger mb-0">2005</h5>
                            <small class="text-muted">Primera Sede Propia</small>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="p-3 border rounded bg-light">
                            <h5 class="fw-bold text-danger mb-0">2020</h5>
                            <small class="text-muted">Expansión Nacional</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 text-center">
                <div class="position-relative">
                    <img src="https://elcronista.co/assets/media/fabrica-de-licores-del-tolima-se-encuentra-operando-2024.jpg"
                         alt="Historia de la Taberna"
                         class="img-fluid rounded shadow-lg border border-3 border-danger w-75">
                    <div class="position-absolute bottom-0 start-50 translate-middle-x bg-danger text-white px-4 py-2 rounded-top shadow-sm">
                        <i class="bi bi-award-fill me-2"></i>Tradición desde 1985
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- MODAL PRODUCTO -->
<div class="modal fade" id="wineModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content shadow border-0 rounded-3">
            <div class="modal-header bg-light border-0">
                <h5 class="modal-title fw-bold text-danger" id="modal-name"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-12 col-md-5 text-center">
                        <img id="modal-image" src="" alt="Producto"
                             class="img-fluid rounded shadow-sm mb-2 border border-light">
                    </div>
                    <div class="col-12 col-md-7">
                        <ul class="list-unstyled text-muted mb-2 small">
                            <li><strong>Año:</strong> <span id="modal-year"></span></li>
                            <li><strong>Stock:</strong> <span id="modal-stock"></span></li>
                            <li><strong>Categoría:</strong> <span id="modal-category"></span></li>
                        </ul>
                        <p id="modal-description" class="text-muted mb-3 small"></p>
                        <div class="mb-3">
                            <span id="modal-price" class="text-danger fw-bold fs-5"></span>
                        </div>
                        <form id="modal-form" action="/carrito/agregarProducto" method="POST"
                              class="d-flex flex-column flex-sm-row align-items-center gap-2">
                            <input type="hidden" name="id_producto" id="modal-id-producto">
                            <input type="number" name="cantidad" class="form-control" min="1" value="1"
                                   style="width: 100px;">
                            <button type="submit" class="btn btn-danger w-100 w-sm-auto">
                                <i class="bi bi-cart-fill me-2"></i> Añadir
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/modal.js"></script>
</body>
</html>

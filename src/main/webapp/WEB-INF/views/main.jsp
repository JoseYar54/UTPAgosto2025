<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>La Taberna de Roly</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/css/index-css.css">
        <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- Header -->

        <!-- Hero Section -->
        <section id="inicio"
            class="vh-100 d-flex align-items-center text-center bg-dark text-white position-relative">

            <img src="/img/taberna_fondo.png"
                alt="Interior de La Taberna"
                class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover opacity-75">

            <div class="container position-relative z-1">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h1 class="display-3 fw-bold">
                            LA TABERNA <br>
                            <span class="text-danger">DE ROLY</span>
                        </h1>
                        <p class="lead mb-5 fw-bold">
                            Donde cada copa cuenta una historia y cada momento
                            se celebra
                        </p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="#productos"
                                class="btn btn-outline-light btn-lg fw-bold">
                                Explorar
                            </a>
                            <a href="#historia"
                                class="btn btn-outline-light btn-lg fw-bold">
                                Nuestra Historia
                            </a>
                            <a href="#ofertas"
                                class="btn btn-outline-light btn-lg fw-bold">
                                Ofertas Especiales
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!-- Productos Section -->
        <section id="productos" class="py-5 bg-light">
            <div class="container py-5">

                <!-- PRODUCTOS -->
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-8 text-center">
                        <h2 class="fw-bold">
                            Algunos de Nuestros <span
                                class="text-danger">Productos</span>
                        </h2>
                        <p class="text-muted">
                            Descubre nuestras diferentes secciones de bebidas y
                            vinos, de lo mejor para ofrecerte una experiencia
                            única.
                        </p>
                    </div>
                </div>

                <!-- Filtros
                <div class="row mb-4">
                    <div
                        class="col-12 d-flex flex-wrap justify-content-center gap-2">
                        <button class="btn btn-outline-dark active"
                            data-filter="todos">Todos</button>
                        <button class="btn btn-outline-dark"
                            data-filter="Tinto Reserva">Tinto Reserva</button>
                        <button class="btn btn-outline-dark"
                            data-filter="Tinto Gran Reserva">Tinto Gran
                            Reserva</button>
                        <button class="btn btn-outline-dark"
                            data-filter="Blanco Joven">Blanco</button>
                        <button class="btn btn-outline-dark"
                            data-filter="Rosado">Rosado</button>
                        <button class="btn btn-outline-dark"
                            data-filter="Espumoso">Espumoso</button>
                    </div>
                </div> -->

                <!-- Grid de productos -->
                <div class="row g-4" id="wine-grid">

                    <!-- BUCLE DE PRODUCTOS -->
                    <c:forEach var="producto" items="${listaProductos}"
                        begin="0" end="7">
                        <div class="col-sm-6 col-md-4 col-lg-3 mb-4 wine-item"
                            data-category="${producto.categoria_pro.nombre_cate}">

                            <div
                                class="card h-100 shadow-lg border-0 rounded-3 wine-card hover-card">

                                <!-- Imagen -->
                                <div class="position-relative">
                                    <img src="${producto.url_pro}"
                                        class="card-img-top wine-image rounded-top"
                                        alt="${producto.nombre_pro}">
                                    <!-- Año -->
                                    <span
                                        class="card-year badge bg-dark position-absolute top-0 start-0 m-2 px-3 py-2 rounded-pill shadow">
                                        ${producto.anio_pro}
                                    </span>
                                    <!-- Stock -->
                                    <span class="badge bg-success position-absolute top-0 end-0 m-2 px-3 py-2 rounded-pill shadow">
                                        Stock:<span class="card-stock badge">${producto.stock_pro}</span>        
                                    </span>
                                </div>

                                <!-- Cuerpo  -->
                                <div class="card-body d-flex flex-column p-3">

                                    <!-- Cate -->
                                    <div class="mb-2">
                                        <span
                                            class="card-category badge bg-secondary small">
                                            ${producto.categoria_pro.nombre_cate}
                                        </span>
                                    </div>

                                    <!-- Nombre -->
                                    <h6
                                        class="card-title fw-bold text-dark mb-2">
                                        ${producto.nombre_pro}
                                    </h6>

                                    <!-- Descrip -->
                                    <p
                                        class="card-text text-muted small flex-grow-1 line-clamp-3">
                                        ${producto.descrip_pro}
                                    </p>

                                    <!-- Precio y botoncito-->
                                    <div
                                        class="d-flex justify-content-between align-items-center mt-3">
                                        <span
                                            class="card-price fw-bold text-danger fs-6">
                                            S/ ${producto.precio_pro}
                                        </span>
                                        <button type="button"
                                            class="btn btn-sm btn-outline-danger rounded-pill px-3 modalito">
                                            <i class="bi bi-eye"></i> Ver
                                            Detalles
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- OFERTAS -->
            <section id="ofertas" class="py-5 bg-light">
                <div class="container">
                    <h2 class="fw-bold text-center mb-4">Ofertas Especiales</h2>

                    <div id="carouselOfertas" class="carousel slide"
                        data-bs-ride="carousel">
                        <div class="carousel-inner">

                            <!-- Producto 1 -->
                            <div class="carousel-item active text-center">
                                <div class="card mx-auto"
                                    style="max-width: 400px;">
                                    <img
                                        src="https://descorcha.com/mx/269170-large_default/reservado-cabernet-sauvignon-de-750-ml.jpg"
                                        class="card-img-top fixed-img"
                                        alt="Vino Tinto">
                                    <div class="card-body">
                                        <h5 class="card-title fw-bold">Vino
                                            Tinto Reserva</h5>
                                        <p class="card-text text-muted">Un
                                            clásico con 20% OFF</p>
                                        <span class="fw-bold text-danger">S/
                                            69.9</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Producto 2 -->
                            <div class="carousel-item text-center">
                                <div class="card mx-auto"
                                    style="max-width: 400px;">
                                    <img
                                        src="https://tse2.mm.bing.net/th/id/OIP.BiTUyYUqeDWLGEy3o_A66wHaLx?rs=1&pid=ImgDetMain&o=7&rm=3"
                                        class="card-img-top fixed-img"
                                        alt="Vino Blanco">
                                    <div class="card-body">
                                        <h5 class="card-title fw-bold">Vino
                                            Blanco Premium</h5>
                                        <p class="card-text text-muted">Ideal
                                            para el verano</p>
                                        <span class="fw-bold text-danger">S/
                                            59.9</span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- botones -->
                        <button class="carousel-control-prev" type="button"
                            data-bs-target="#carouselOfertas"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button"
                            data-bs-target="#carouselOfertas"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </section>

            <!-- HISTORIA -->
            <div class="row justify-content-center mb-5">
                <div class="col-lg-8 text-center">
                    <h2 class="fw-bold" id="historia">
                        Conoce Nuestra<span
                            class="text-danger"> Historia</span>
                    </h2>
                    <p class="text-muted p-4">
                        Desde nuestros inicios, hemos buscado transmitir la
                        pasión por el vino y las bebidas que acompañan momentos
                        especiales.
                        Cada etiqueta seleccionada refleja dedicación, tradición
                        y un compromiso constante por la calidad.
                    </p>
                </div>
            </div>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 mb-4 mb-md-0">
                        <p class="fs-5 text-muted p-4">
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
        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        <!-- Footer -->

        <!-- MODAL PRODUCTO -->
        <jsp:include page="modal.jsp" />
        <!-- MODAL PRODUCTO -->

        <!-- JS -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
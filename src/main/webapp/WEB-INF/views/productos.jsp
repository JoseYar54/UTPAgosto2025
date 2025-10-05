<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos</title>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="/css/productos-css.css">
        <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
    </head>
    <body>
        <!-- header -->
        <jsp:include page="header.jsp" />
        <!-- header -->

        <!-- Contenido principal -->
        <div class="container mt-4">
            <h1>Nuestros Productos</h1>
            <p class="lead">Explora nuestra colección completa de licores.</p>

            <!-- Filtros y búsqueda -->
            <form method="get" action="/productos">
                <div class="row mb-3">
                    <div class="col-md-4">
                        <input type="text" name="nombre" class="form-control"
                            placeholder="Buscar producto..." value="${param.nombre}">
                    </div>
                    <div class="col-md-4">
                        <select name="categoria" class="form-select">
                            <option value="">Filtrar por Categoría</option>
                            <c:forEach var="c" items="${categorias}">
                                <option value="${c.nombre_cate}" ${param.categoria == c.nombre_cate ? 'selected' : ''}>
                                ${c.nombre_cate}
                                </option>
                            </c:forEach>
                        </select>


                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-outline-secondary">Aplicar Filtros</button>
                    </div>
                </div>
            </form>

            
            <div class="row g-4" id="wine-grid">
                <!-- BUCLE DE PRODUCTOS -->
                    <c:forEach var="producto" items="${listaProductos}">
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
            <!-- Paginacion -->
            <nav aria-label="Navegación de páginas" class="mt-4">
                <ul class="pagination justify-content-center">

                    <!-- Botón Anterior -->
                    <li class="page-item ${paginaActual == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${paginaActual - 1}&nombre=${nombreFiltro}&categoria=${categoriaFiltro}">
                            Anterior
                        </a>
                    </li>

                    <!-- Números de página -->
                    <c:forEach var="i" begin="1" end="${totalDePaginas}">
                        <li class="page-item ${i == paginaActual ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}&nombre=${nombreFiltro}&categoria=${categoriaFiltro}">
                                ${i}
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Botón Siguiente -->
                    <li class="page-item ${paginaActual == totalDePaginas ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${paginaActual + 1}&nombre=${nombreFiltro}&categoria=${categoriaFiltro}">
                            Siguiente
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- MODAL PRODUCTO -->
        <jsp:include page="modal.jsp" />
        <!-- MODAL PRODUCTO -->

        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        <!-- Footer -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
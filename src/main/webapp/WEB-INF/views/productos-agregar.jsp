<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Añadir Producto</title>
        <link rel="stylesheet" href="css/gestion-css.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="icon" type="image/png"
            href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
        <script type="text/javascript"
            src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">

                <!-- BARRITA LATERAL :D ----------------------------------------------------------->
                <!-- Botón para móviles -->
                <button class="btn btn-dark d-md-none mb-3" type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#sidebarMenu"
                    aria-controls="sidebarMenu" style="border-radius: 0px;">
                    <i class="bi bi-list"></i> Menú
                </button>
                <div
                    class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90"
                    tabindex="-1"
                    id="sidebarMenu" aria-labelledby="sidebarLabel">
                    <div class="offcanvas-header">
                        <button type="button" class="btn-close text-reset"
                            data-bs-dismiss="offcanvas"
                            aria-label="Cerrar"></button>
                    </div>
                    <div class="offcanvas-body p-0">
                        <jsp:include page="gestion-panel-lateral.jsp" />
                    </div>
                </div>
                <!-- SOLO APARECE SI ES PANTALLA GRANDE -->
                <div class="d-none d-md-block col-md-2 p-0 vh-100">
                    <jsp:include page="gestion-panel-lateral.jsp" />
                </div>
                <!-- FIN BARRITA LATAREAL :D ----------------------------------------------------------->

                <!-- TODO EL MAIN ES EL APARTADO DE AGREGAR -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
                    <h1 class="mt-2 mb-2 text-center p-1">Crear Nuevo Producto</h1>
                    <div class="container mt-3">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="card shadow-lg">
                                    <div
                                        class="card-header bg-dark text-white text-center">
                                        <h3>Nuevo Producto</h3>
                                    </div>
                                    <div class="card-body">

                                    <!-- FORMULARIO PARA AGREGAR PRODUCTOS -->
                                        <form action="/gestion/productos/guardar"
                                            method="post"
                                            modelAttribute="nuevoProducto"
                                            >
                                            <!-- NOMBRE DEL PRODUCTO -->
                                            <div class="mb-3">
                                                <label for="nombre_pro"
                                                    class="form-label">Nombre
                                                    del Producto</label>
                                                <input type="text"
                                                    class="form-control"
                                                    id="nombre_pro"
                                                    name="nombre_pro"
                                                    placeholder="Ej. Vino Tinto"
                                                    required>
                                            </div>

                                            <!-- DESCRIPCIÓN -->
                                            <div class="mb-3">
                                                <label for="descrip_pro"
                                                    class="form-label">Descripción</label>
                                                <textarea class="form-control"
                                                    id="descrip_pro"
                                                    name="descrip_pro" rows="3"
                                                    placeholder="Descripción del producto"
                                                    required></textarea>
                                            </div>

                                            <!-- CATEGORÍA -->
                                            <div class="mb-3">
                                                <label for="categoria_pro"
                                                    class="form-label">Categoría</label>
                                                <select class="form-select"
                                                    id="categoria_pro"
                                                    name="categoria_pro.id_categoria"
                                                    required>
                                                    <option value selected
                                                        disabled>Selecciona una
                                                        categoría</option>
                                                    <c:forEach var="cat"
                                                        items="${categorias}">
                                                        <option
                                                            value="${cat.id_categoria}">${cat.nombre_cate}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <!-- AÑO -->
                                            <div class="mb-3">
                                                <label for="anio_pro"
                                                    class="form-label">Año</label>
                                                <input type="number"
                                                    class="form-control"
                                                    id="anio_pro"
                                                    name="anio_pro"
                                                    placeholder="Ej. 2022"
                                                    min="1900" max="2099"
                                                    required>
                                            </div>

                                            <!-- PRECIO -->
                                            <div class="mb-3">
                                                <label for="precio_pro"
                                                    class="form-label">Precio
                                                    (S/)</label>
                                                <input type="number"
                                                    class="form-control"
                                                    id="precio_pro"
                                                    name="precio_pro"
                                                    placeholder="Ej. 99.99"
                                                    step="0.01" required>
                                            </div>

                                            <!-- STOCK -->
                                            <div class="mb-3">
                                                <label for="stock_pro"
                                                    class="form-label">Stock</label>
                                                <input type="number"
                                                    class="form-control"
                                                    id="stock_pro"
                                                    name="stock_pro"
                                                    placeholder="Cantidad disponible"
                                                    required>
                                            </div>

                                            <!-- IMAGEN -->
                                            <div class="mb-3">
                                                <label for="url_pro"
                                                    class="form-label">URL de la
                                                    imagen del producto</label>
                                                <input type="text"
                                                    class="form-control"
                                                    id="url_pro"
                                                    name="url_pro"
                                                    placeholder="http://ejemplo.com.jpg"
                                                    required>
                                            </div>

                                            <!-- Btns -->
                                            <div class="d-flex justify-content-between">
                                                <a href="/gestion/productos" class="btn btn-secondary btn-lg rounded-pill">
                                                    <i class="bi bi-arrow-left"></i> Volver
                                                </a>

                                                <button type="submit" class="btn btn-dark btn-lg">
                                                    Agregar Producto
                                                </button>
                                            </div>
                                        </form>
                                        <!-- FORMULARIO PARA AGREGAR PRODUCTOS -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-2">
            <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i>
                Derechos reservados</div>
        </footer>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

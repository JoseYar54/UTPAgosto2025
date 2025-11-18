<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión - Productos</title>
        <link rel="stylesheet" href="css/gestion-css.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <script type="text/javascript"
            src="https://www.gstatic.com/charts/loader.js"></script>

        <link rel="icon" type="image/png"
            href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
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

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mt-5 mb-4">
                        <div class="titulo-panel text-center text-md-start flex-grow-1 mb-4">
                            <h1 class="border-start border-4 border-black ps-3 fw-bold d-inline-flex align-items-center mb-0">
                                <i class="bi bi-box-seam-fill me-2"></i>
                                Gestión de Productos
                            </h1>
                        </div>

                        <!-- Switch para mostrar eliminados -->
                        <div class="form-check form-switch d-flex align-items-center bg-dark bg-opacity-75 px-3 py-2 rounded-3 shadow-sm">
                            <label class="form-check-label text-white fw-semibold small me-3 mb-0" for="activador">
                                <i class="bi bi-trash3 me-2"></i>Ver Eliminados
                            </label>
                            <input
                                    class="form-check-input mx-1"
                                    type="checkbox"
                                    id="activador"
                                    onchange="window.location.href='/gestion/productos?activador='+this.checked"
                            <c:if test="${estado}">checked</c:if>
                            >
                        </div>

                        <!-- Btn Agregar -->
                        <a href="/gestion/productos/NuevoProducto"
                           class="btn btn-success btn-lg shadow-sm ms-md-3"
                        <i class="bi bi-plus-circle me-2"></i>Agregar Producto
                        </a>
                    </div>

                    <!-- Productos -->
                    <div class="row g-4">
                        <c:forEach var="p" items="${productos}">
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="card h-100 shadow border-0 rounded-4 producto-card"
                                     style="transition: transform 0.3s ease, box-shadow 0.3s ease;">

                                    <!-- ID -->
                                    <span class="badge bg-dark bg-opacity-75 mb-2 d-block">
                                        ID: ${p.id_producto}
                                    </span>

                                    <!-- Estado -->
                                    <c:choose>
                                        <c:when test="${p.activo_pro}">
                                            <span class="badge bg-success bg-opacity-75 mb-3 d-block">
                                                <i class="bi bi-check-circle me-1"></i> Activo
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger bg-opacity-75 mb-3 d-block">
                                                <i class="bi bi-x-circle me-1"></i> Eliminado
                                            </span>
                                        </c:otherwise>
                                    </c:choose>

                                    <!-- Imagen -->
                                    <img src="${p.url_pro}"
                                         class="card-img-top rounded-top-4"
                                         alt="ID: ${p.id_producto} - ${p.nombre_pro}"
                                         style="height: 180px; object-fit: cover;">

                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title text-center fw-bold text-primary mb-2">
                                            ${p.nombre_pro}
                                        </h5>

                                        <p class="card-text text-muted small mb-2">
                                            ${p.descrip_pro}
                                        </p>

                                        <ul class="list-unstyled mb-3">
                                            <li><strong>Categoría:</strong> ${p.categoria_pro.nombre_cate}</li>
                                            <li><strong>Año:</strong> ${p.anio_pro}</li>
                                            <li><strong>Precio:</strong> S/. ${p.precio_pro}</li>
                                            <li><strong>Stock:</strong> ${p.stock_pro}</li>
                                        </ul>
                                        
                                        <c:if test="${not empty sessionScope.user and sessionScope.user.tipo_user.nombre_tipoUsuario == 'Administrador'}">
                                            <div class="mt-auto d-flex justify-content-around">
                                                <!-- Btn Editar -->
                                                <a href="/gestion/productos/editar/${p.id_producto}"
                                                   class="btn btn-warning btn-sm rounded-pill shadow-sm px-3">
                                                    <i class="bi bi-pencil-square me-1"></i> Editar
                                                </a>

                                                <!-- Btn Eliminar -->
                                                <form action="/gestion/productos/eliminarProducto" method="post"
                                                      onsubmit="return confirm('¿Estás seguro de eliminar este producto?');">
                                                    <input type="hidden" name="id_producto" value="${p.id_producto}">
                                                    <button type="submit"
                                                            class="btn btn-danger btn-sm rounded-pill shadow-sm px-3">
                                                        <i class="bi bi-trash me-1"></i> Eliminar
                                                    </button>
                                                </form>
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </main>
            </div>
        </div>

        <c:if test="${not empty verificar}">
            <script type="text/javascript">
                <c:choose>
                    <c:when test="${verificar == 1}">
                        alert("Se agregó un producto correctamente :D");
                    </c:when>
                    <c:when test="${verificar == 2}">
                        alert("Se editó un producto correctamente :D");
                    </c:when>
                    <c:when test="${verificar == 3}">
                        alert("Se eliminó un producto correctamente :D");
                    </c:when>
                    <c:otherwise>
                        alert("La operación no se pudo realizar D:");
                    </c:otherwise>
                </c:choose>
            </script>
        </c:if>

        <!--Fotter-->
        <footer class="bg-dark text-white text-center py-2">
            <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i>
                Derechos reservados</div>
        </footer>

        <script type="text/javascript" src="js/gestion-graficos.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
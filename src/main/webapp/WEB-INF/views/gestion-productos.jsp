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

                <!-- TODO EL MAIN ES EL APARTADO DE ELIMINAR PRODUCTOS -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
                    <div class="d-flex justify-content-between align-items-center mt-4 mb-3">
                        <h1 class="text-center p-3 flex-grow-1">Gestión de Productos</h1>

                        <!-- Btn Agregar -->
                        <a href="/gestion/productos/NuevoProducto"
                           class="btn btn-success btn-lg shadow-sm"
                           style="border-radius: 50px; transition: all 0.3s;">
                            <i class="bi bi-plus-circle me-2"></i> Agregar Producto
                        </a>
                    </div>

                    <!-- Tabla de productos -->
                    <div class="table-responsive shadow-sm rounded">
                        <table class="table table-striped table-bordered align-middle">
                            <thead class="table-dark text-center">
                            <tr>
                                <th>ID</th>
                                <th>Imagen</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Categoría</th>
                                <th>Año</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="p" items="${productos}">
                                <tr class="align-middle text-center">
                                    <td>${p.id_producto}</td>
                                    <td>
                                        <img src="${p.url_pro}"
                                             alt="ID: ${p.id_producto} - P: ${p.nombre_pro}"
                                             width="50" height="50" class="rounded shadow-sm">
                                    </td>
                                    <td>${p.nombre_pro}</td>
                                    <td>${p.descrip_pro}</td>
                                    <td>${p.categoria_pro.nombre_cate}</td>
                                    <td>${p.anio_pro}</td>
                                    <td>${p.precio_pro}</td>
                                    <td>${p.stock_pro}</td>
                                    <td>
                                        <!-- Btn Editar -->
                                        <a href="/gestion/productos/editar/${p.id_producto}"
                                           class="btn btn-warning btn-sm btn-editar mb-1">
                                            <i class="bi bi-pencil-square me-2"></i>Editar
                                        </a>

                                        <!-- Btn Eliminar -->
                                        <form action="/gestion/productos/eliminarProducto" method="post"
                                              onsubmit="return confirm('¿Estás seguro de eliminar este producto?');">
                                            <input type="hidden" name="id_producto" value="${p.id_producto}">
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="bi bi-trash me-1"></i>Eliminar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
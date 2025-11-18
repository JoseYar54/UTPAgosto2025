<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión - Ventas</title>
    <link rel="stylesheet" href="css/gestion-css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- BARRITA LATERAL -->
        <button class="btn btn-dark d-md-none mb-3" type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#sidebarMenu"
                aria-controls="sidebarMenu" style="border-radius: 0px;">
            <i class="bi bi-list"></i> Menú
        </button>

        <div class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90"
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

        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp" />
        </div>

        <!-- CONTENIDO PRINCIPAL -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">

            <!-- CABECERA -->
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mt-5 mb-4">
                <div class="titulo-panel text-center text-md-start flex-grow-1 mb-3 mb-md-0">
                    <h1 class="border-start border-4 border-black ps-3 fw-bold d-inline-flex align-items-center mb-0">
                        <i class="bi bi-cart-check me-2"></i> Gestión de Ventas
                    </h1>
                </div>

                <!-- SWITCH PARA VER ELIMINADOS -->
                <div class="form-check form-switch d-flex align-items-center bg-dark bg-opacity-75 px-3 py-2 rounded-3 shadow-sm">
                    <label class="form-check-label text-white fw-semibold small me-3 mb-0" for="activador">
                        <i class="bi bi-eye-slash me-2"></i>Ver Eliminadas
                    </label>
                    <input
                            class="form-check-input mx-1"
                            type="checkbox"
                            id="activador"
                            onchange="window.location.href='/gestion/ventas?activador='+this.checked"
                    <c:if test="${estado}">checked</c:if>
                    >
                </div>

                <!-- BTN NUEVA VENTA -->
                <a href="/gestion/ventas/NuevaVenta"
                   class="btn btn-success btn-lg shadow-sm ms-md-3">
                    <i class="bi bi-plus-circle me-2"></i> Nueva Venta
                </a>
            </div>

            <!-- TARJETAS DE VENTAS -->
            <div class="row g-4">
                <c:forEach var="v" items="${ventas}">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card border-0 rounded-4 h-100 shadow">

                            <!-- Encabezado -->
                            <div class="card-header bg-secondary bg-opacity-50 border-0 rounded-top-4">
                                <span class="badge bg-dark bg-opacity-75 mb-2 d-block">ID: ${v.id_venta}</span>

                                <!-- Estado -->
                                <c:choose>
                                    <c:when test="${v.estado_venta}">
                                        <span class="badge bg-success bg-opacity-75 mb-2 d-block">
                                            <i class="bi bi-check-circle me-1"></i> Activa
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger bg-opacity-75 mb-2 d-block">
                                            <i class="bi bi-x-circle me-1"></i> Eliminada
                                        </span>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Datos del cliente -->
                                <h5 class="mb-1 fw-bold">
                                    <i class="bi bi-person-circle me-2"></i>
                                    ${v.id_usuario.apaterno_user} ${v.id_usuario.amaterno_user},
                                    ${v.id_usuario.nombre_user}
                                </h5>
                                <p class="mb-0 small fw-bold">
                                    <i class="bi bi-calendar3 me-1"></i> ${v.fechaFormateada}
                                </p>
                                <p class="mb-0 small fw-bold">
                                    <i class="bi bi-envelope me-1"></i> ${v.id_usuario.correo_user}<br>
                                    <i class="bi bi-telephone me-1"></i> ${v.id_usuario.telefono_user}
                                </p>
                            </div>

                            <!-- Detalles -->
                            <div class="card-body">
                                <button class="btn btn-outline-primary w-100 text-start mb-2 fw-semibold d-flex justify-content-between align-items-center"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#c${v.id_venta}"
                                        aria-controls="c${v.id_venta}">
                                    <span class="fs-5">
                                        <i class="bi bi-receipt me-2 fs-5"></i> Ver Detalles
                                    </span>
                                </button>

                                <div class="collapse" id="c${v.id_venta}">
                                    <ul class="list-group list-group-flush small border-top mt-2">
                                        <c:forEach var="d" items="${v.detalles_Venta}">
                                            <li class="list-group-item px-2 py-2 d-flex justify-content-between align-items-center">
                                                <div>
                                                    <span class="fw-semibold">${d.producto.nombre_pro}</span><br>
                                                    <small class="text-muted">
                                                        Cant: ${d.cantidad_det} × S/${d.producto.precio_pro}
                                                    </small>
                                                </div>
                                                <span class="badge bg-primary bg-opacity-75 rounded-pill">
                                                    S/${d.subtotal_det}
                                                </span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                            <div class="card-footer bg-light rounded-bottom-4 d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-success fs-5">
                                    Total: S/${v.total_venta}
                                </span>
                                <div class="d-flex">
                                    <c:if test="${not empty sessionScope.user and sessionScope.user.tipo_user.nombre_tipoUsuario == 'Administrador'}">
                                        <!-- Editar -->
                                        <a href="/gestion/ventas/editar/${v.id_venta}"
                                           class="btn btn-warning btn-sm rounded-pill shadow-sm me-2">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>

                                        <!-- Eliminar -->
                                        <form action="/gestion/ventas/eliminarVenta" method="post"
                                              onsubmit="return confirm('¿Seguro que deseas eliminar esta venta?');">
                                            <input type="hidden" name="id_venta" value="${v.id_venta}">
                                            <button type="submit" class="btn btn-danger btn-sm rounded-pill shadow-sm me-2">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                    <!-- Boleta -->
                                    <a href="/generar/generarBoleta/${v.id_venta}"
                                       class="btn btn-success btn-sm rounded-pill shadow-sm"
                                       target="_blank">
                                        <i class="bi bi-file-earmark-pdf"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
</div>

<!-- ALERTAS -->
<c:if test="${not empty verificar}">
    <script type="text/javascript">
        <c:choose>
            <c:when test="${verificar == 1}">alert("Venta registrada correctamente");</c:when>
            <c:when test="${verificar == 2}">alert("Venta editada correctamente");</c:when>
            <c:when test="${verificar == 3}">alert("Venta eliminada correctamente");</c:when>
            <c:otherwise>alert("La operación no se pudo realizar");</c:otherwise>
        </c:choose>
    </script>
</c:if>

<!-- FOOTER -->
<footer class="bg-dark text-white text-center py-2 mt-4">
    <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i> Derechos reservados</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

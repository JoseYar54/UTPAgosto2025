<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="icon" type="image/png"
          href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
</head>

<body class="bg-light">

<!-- Header -->
<jsp:include page="header.jsp"/>

<main class="container py-5">

    <div class="row g-4 justify-content-center">

        <!-- Perfil -->
        <div class="col-12 col-md-4">
            <div class="card shadow-lg rounded-4 border-0">
                <div class="card-body text-center p-4">

                    <h2 class="mb-4 fw-bold text-primary">Mi Perfil</h2>

                    <!-- Img -->
                    <img src="https://www.kamenarstvovaterka.sk/img/uploads/15S9201702-54-20IMG-704.png"
                         alt="Foto de ${sessionScope.user.nombre_user}"
                         class="rounded-circle shadow-sm mb-3" width="120" height="120">

                    <!-- Datos -->
                    <ul class="list-group list-group-flush text-start mb-4">
                        <li class="list-group-item"><strong>ID:</strong> ${sessionScope.user.id_usuario}</li>
                        <li class="list-group-item"><strong>Nombre:</strong> ${sessionScope.user.nombre_user}</li>
                        <li class="list-group-item"><strong>Ap. Paterno:</strong> ${sessionScope.user.apaterno_user}
                        </li>
                        <li class="list-group-item"><strong>Ap. Materno:</strong> ${sessionScope.user.amaterno_user}
                        </li>
                        <li class="list-group-item"><strong>Correo:</strong> ${sessionScope.user.correo_user}</li>
                        <li class="list-group-item"><strong>Teléfono:</strong> ${sessionScope.user.telefono_user}</li>
                        <li class="list-group-item"><strong>Tipo:</strong>
                            ${sessionScope.user.tipo_user.nombre_tipoUsuario}
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Historial -->
        <div class="col-12 col-md-8">
            <div class="card shadow-lg rounded-4 border-0">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4 fw-bold">
                        <i class="bi bi-cart-check-fill text-success me-2"></i>Historial de Compras
                    </h3>

                    <!-- Si no hay compras -->
                    <c:if test="${empty compras}">
                        <div class="alert alert-secondary text-center mb-0">
                            Aún no has realizado ninguna compra.
                        </div>
                    </c:if>

                    <!-- Si hay compras -->
                    <c:if test="${not empty compras}">
                        <div class="overflow-auto" style="max-height: 600px;">
                            <c:forEach var="venta" items="${compras}" varStatus="statusVenta">
                                <div class="card mb-3 border-0 shadow-sm">
                                    <div class="card-body">
                                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                                            <h5 class="card-title mb-2 mb-md-0 fw-semibold">
                                                Compra #${statusVenta.index + 1}
                                                <small class="text-muted">(ID: ${venta.id_venta})</small>
                                            </h5>
                                            <div class="d-flex gap-2">
                                                <a class="btn btn-outline-primary btn-sm"
                                                   data-bs-toggle="collapse"
                                                   href="#collapseDetalles${statusVenta.index}"
                                                   role="button"
                                                   aria-expanded="false"
                                                   aria-controls="collapseDetalles${statusVenta.index}">
                                                    Ver productos
                                                </a>
                                                <a href="/generar/generarBoleta/${venta.id_venta}"
                                                   class="btn btn-success btn-sm"
                                                   target="_blank">
                                                    <i class="bi bi-file-earmark-pdf"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <hr>

                                        <p class="mb-1"><strong>Fecha:</strong> ${venta.fechaFormateada}</p>
                                        <p><strong>Total:</strong> <span class="fw-bold text-success">S/ ${venta.total_venta}</span>
                                        </p>

                                        <div class="collapse" id="collapseDetalles${statusVenta.index}">
                                            <div class="card card-body bg-light border-0">
                                                <c:forEach var="detalles" items="${venta.detalles_Venta}">
                                                    <div class="card mb-2 shadow-sm border-0">
                                                        <div class="row g-0 align-items-center">
                                                            <div class="col-md-8 p-3">
                                                                <h6 class="fw-bold mb-1">
                                                                    ${detalles.producto.nombre_pro}</h6>
                                                                <p class="mb-1"><strong>Cantidad:</strong>
                                                                    ${detalles.cantidad_det}</p>
                                                                <p class="mb-1"><strong>Precio unitario:</strong>
                                                                    S/${detalles.producto.precio_pro}</p>
                                                                <p class="mb-0"><strong>Subtotal:</strong>
                                                                    S/${detalles.subtotal_det}</p>
                                                            </div>
                                                            <div class="col-md-4 text-center p-2">
                                                                <img src="${detalles.producto.url_pro}"
                                                                     alt="Producto"
                                                                     class="img-fluid rounded"
                                                                     style="max-width: 80px;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

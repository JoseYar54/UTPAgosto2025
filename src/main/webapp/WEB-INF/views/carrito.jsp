<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="/css/contact-css.css">
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/891/891462.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- /Header -->

<!-- Encabezado -->
<section class="page-header text-center text-white py-5 mb-5 position-relative">
    <div class="overlay"></div>
    <div class="container position-relative">
        <h1 class="display-4 fw-bold mb-3">Tu carrito de compras</h1>
        <p class="lead mb-0">Revisa tus productos antes de finalizar la compra</p>
    </div>
</section>

<!-- Carrito -->
<section id="carrito" class="py-5">
    <div class="container">
        <div class="card shadow border-0 rounded-4 overflow-hidden">
            <c:choose>

                <%-- SI EL CARRITO ESTÁ VACÍO --%>
                <c:when test="${venta == null || venta.detalles_Venta == null || venta.detalles_Venta.size() == 0}">
                    <div class="card-body text-center py-5">
                        <img src="https://cdn-icons-png.flaticon.com/512/102/102661.png"
                             width="120" class="mb-3" alt="Carrito vacío">
                        <h3 class="fw-bold">Tu carrito está vacío</h3>
                        <p class="text-muted">Agrega productos para continuar con tu compra.</p>
                        <a href="/productos" class="btn btn-primary mt-3 px-4">Ver productos</a>
                    </div>
                </c:when>

                <%-- SI HAY PRODUCTOS EN EL CARRITO --%>
                <c:otherwise>
                    <div class="card-body p-4">
                        <div class="table-responsive">
                            <table class="table align-middle">
                                <thead class="table-dark text-center">
                                <tr>
                                    <th>#</th>
                                    <th>Img. Referencia</th>
                                    <th>Producto</th>
                                    <th>Precio Unitario</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th>Acción</th>
                                </tr>
                                </thead>
                                <tbody class="text-center">
                                <c:forEach var="det" items="${venta.detalles_Venta}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>
                                            <img src="${det.producto.url_pro}"
                                                 alt="(${det.producto.id_producto}) ${det.producto.nombre_pro}"
                                                 style="width: 80px; height: 80px; object-fit: cover;">
                                        </td>
                                        <td>${det.producto.nombre_pro}</td>
                                        <td>S/${det.producto.precio_pro}</td>
                                        <td>${det.cantidad_det}</td>
                                        <td>S/${det.subtotal_det}</td>
                                        <td>
                                            <form action="/carrito/eliminar/${det.id_detalle}" method="POST">
                                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                            </form>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Total -->
                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <h4>Total: <span class="text-primary fw-bold">S/${venta.total_venta}</span></h4>
                            <form action="/carrito/finalizar" method="POST">
                                <button type="submit" class="btn btn-success btn-lg">
                                    Compra
                                </button>
                            </form>
                        </div>
                    </div>
                </c:otherwise>

            </c:choose>
        </div>
    </div>
</section>

<!-- Modal de Venta Exitosa -->
<div class="modal fade" id="modalVentaExitosa" tabindex="-1" aria-labelledby="ventaExitosaLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header bg-success text-white rounded-top-4">
                <h5 class="modal-title fw-bold" id="ventaExitosaLabel">¡Venta Exitosa!</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body text-center py-4">
                <img src="https://cdn-icons-png.flaticon.com/512/845/845646.png"
                     alt="Success" width="90" class="mb-3">
                <h5 class="fw-semibold">Tu compra se procesó correctamente</h5>
                <p class="text-muted mb-0">Gracias por confiar en nosotros.</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success px-4" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>
<!-- /Footer -->

<c:if test="${ventaEnviada == true}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var modal = new bootstrap.Modal(document.getElementById('modalVentaExitosa'));
            modal.show();
        });
    </script>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

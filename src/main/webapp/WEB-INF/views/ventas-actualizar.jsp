<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
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

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100 py-4">

            <!-- Encabezado -->
            <h1 class="border-start border-4 border-warning ps-3 fw-bold mb-4">
                <i class="bi bi-pencil-square me-2"></i>Editar Venta
            </h1>

            <!-- Info de la venta -->
            <div class="card shadow-lg border-0 rounded-4 mb-4">
                <div class="card-body">
                    <form action="/gestion/ventas/actualizarVenta" method="post">

                        <!-- ID -->
                        <input type="hidden" name="id_venta" value="${venta.id_venta}">

                        <div class="row g-3">

                            <!-- Usuario -->
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Usuario</label>
                                <input type="text" class="form-control" name="nombre_usuario"
                                       value="${venta.id_usuario.nombre_user} ${venta.id_usuario.apaterno_user} ${venta.id_usuario.amaterno_user}"
                                       readonly>
                            </div>

                            <!-- Fecha -->
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Fecha de Venta</label>
                                <input type="datetime-local"
                                       class="form-control"
                                       name="fecha_venta"
                                       value="${venta.fecha_venta}"
                                       required>
                            </div>

                        </div>

                        <!-- Estado -->
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Estado</label>
                            <select class="form-select" name="estado_venta" required>
                                <option value="true"  ${venta.estado_venta ? 'selected' : ''}>Activa</option>
                                <option value="false" ${!venta.estado_venta ? 'selected' : ''}>Anulada</option>
                            </select>
                        </div>

                        <!-- Detalles -->
                        <div class="mt-4">
                            <h5 class="fw-bold">
                                <i class="bi bi-basket me-2"></i>Detalles de la Venta
                            </h5>
                            <div class="table-responsive">
                                <table class="table table-striped align-middle mt-2">
                                    <thead class="table-dark text-center">
                                    <tr>
                                        <th>Imagen</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio U. (S/)</th>
                                        <th>Subtotal (S/)</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tablaDetalles">
                                    <c:forEach var="d" items="${venta.detalles_Venta}">
                                        <tr>
                                            <!-- ID -->
                                            <td style="display: none;">
                                                <input
                                                    type="hidden"
                                                    class="id_producto"
                                                    name="id_producto[]"
                                                    value="${d.producto.id_producto}"
                                                    >
                                            </td>

                                            <!-- Imagen -->
                                            <td>
                                                <img src="${d.producto.url_pro}"
                                                     alt="${d.producto.nombre_pro}"
                                                     class="img-thumbnail"
                                                     style="width: 60px; height: 60px; object-fit: cover;">
                                            </td>

                                            <!-- Nombre -->
                                            <td class="fw-semibold">
                                                ${d.producto.nombre_pro}
                                            </td>

                                            <!-- Cantidad --->
                                            <td>
                                                <input type="number"
                                                       name="cantidades[]"
                                                       class="form-control text-center"
                                                       value="${d.cantidad_det}"
                                                       style="max-width:55px;"
                                                       min="1">
                                            </td>


                                            <!-- Precio unidad --->
                                            <td>
                                                <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0;">
                                                    <span style="font-weight: 500;">S/</span>
                                                    <input type="text"
                                                           value="${d.subtotal_det}"
                                                           name="precios[]"
                                                           readonly
                                                           style="background: transparent; border: none; text-align: right; width: 35px; padding: 0; margin: 0;">
                                                </div>
                                            </td>

                                            <!-- SubTotal -->
                                            <td>
                                                <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0;">
                                                    <span style="font-weight: 500;">S/</span>
                                                    <input type="text"
                                                           name="subtotales[]"
                                                           value="${d.subtotal_det}"
                                                           readonly
                                                           style="background: transparent; border: none; text-align: right; width: 50px; padding: 0; margin: 0;">
                                                </div>
                                            </td>

                                            <!-- Btn Eliminar Detalle -->
                                            <td class="text-center">
                                                <button type="button" class="btn btn-danger btn-sm eliminarFila"
                                                    onclick="if(confirm('¿Estás seguro de eliminar este producto?')) eliminarFila(this)">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Btn modal -->
                            <button type="button" class="btn btn-outline-primary mt-2" data-bs-toggle="modal" data-bs-target="#modalProductos">
                                <i class="bi bi-plus-circle"></i> Agregar Producto
                            </button>
                        </div>

                        <!-- Btn principales -->
                        <div class="mt-4 d-flex justify-content-between">
                            <a href="/gestion/ventas" class="btn btn-secondary rounded-pill px-4">
                                <i class="bi bi-arrow-left"></i> Volver
                            </a>
                            <button type="submit" class="btn btn-success rounded-pill px-4 shadow-sm">
                                <i class="bi bi-save"></i> Guardar Cambios
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </main>
    </div>
</div>

<footer class="bg-dark text-white text-center py-2 mt-4">
    <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i> Derechos reservados</div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/actualizar-ventas-js.js"></script>

<!-- Modal -->
<div class="modal fade" id="modalProductos" tabindex="-1" aria-labelledby="modalProductosLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalProductosLabel">Seleccionar Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <table class="table table-hover" id="tablaModalProductos">
                    <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Precio (S/)</th>
                        <th>Acción</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Se llena con JS -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>

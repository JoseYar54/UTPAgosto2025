<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="wineModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered"> <!-- Tamaño mediano -->
        <div class="modal-content shadow border-0 rounded-3">

            <!-- Header -->
            <div class="modal-header bg-light border-0">
                <h5 class="modal-title fw-bold text-danger">Detalle del Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>

            <!-- Body -->
            <div class="modal-body">
                <div class="row g-3">

                    <!-- Imagen del producto -->
                    <div class="col-12 col-md-5 text-center">
                        <div class="position-relative">
                            <img id="modal-image" src="" alt="Producto"
                                class="img-fluid rounded shadow-sm mb-2 border border-light">
                        </div>
                    </div>

                    <!-- Información del producto -->
                    <div class="col-12 col-md-7">
                        <!-- Nombre -->
                        <h4 id="modal-name" class="fw-bold mb-2"></h4>

                        <!-- Detalles -->
                        <ul class="list-unstyled text-muted mb-2 small">
                            <li><strong>Año:</strong> <span id="modal-year"></span></li>
                            <li><strong>Stock:</strong> <span id="modal-stock"></span></li>
                            <li><strong>Categoría:</strong> <span id="modal-category"></span></li>
                        </ul>
                        
                        <!-- Descripción -->
                        <p id="modal-description" class="text-muted mb-3 small"></p>
                        <!-- Precio -->
                        <div class="mb-3">
                            <span id="modal-price" class="text-danger fw-bold fs-5"></span>
                        </div>

                        <!-- Cantidad y añadir al carrito -->
                        <form id="addToCartForm" action="/carrito" method="GET"
                            class="d-flex flex-column flex-sm-row align-items-center gap-2">
                            <input type="hidden" id="modal-id" name="id_producto">
                            <input type="number" name="cantidad" class="form-control" min="1" value="1" style="width: 100px;">
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

<!-- Scripts -->
<script src="/js/modal.js"></script>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>

    <link rel="icon" type="image/png"
          href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/gestion-css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        .campo-antiguo { background-color: #f8f9fa; }
        .campo-nuevo { background-color: #fff; }
        .campo-label { font-weight: 600; color: #495057; }
        .img-thumb {
            max-width: 80px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        table td {
            vertical-align: middle;
        }
    </style>
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
        <div class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90"
             tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarLabel">
            <div class="offcanvas-header">
                <button type="button" class="btn-close text-reset"
                        data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
            </div>
            <div class="offcanvas-body p-0">
                <jsp:include page="gestion-panel-lateral.jsp" />
            </div>
        </div>
        <!-- SOLO APARECE SI ES PANTALLA GRANDE -->
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp" />
        </div>
        <!-- FIN BARRITA LATERAL :D ------------------------------------------------------->

        <!-- CONTENIDO PRINCIPAL -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-4 py-4">
            <h1 class="border-start border-4 border-warning ps-3 fw-bold mb-4">
                <i class="bi bi-pencil-square me-2"></i>Editar Producto
            </h1>

            <div class="card shadow-lg">
                <div class="card-header bg-warning text-dark fw-semibold text-center">
                    Recuerda que los cambios se verán reflejados en la exposición del catálogo
                </div>
                <div class="card-body p-4">
                    <form action="/gestion/productos/aplicarEdicion" method="post">
                        <input type="hidden" name="id_producto" value="${producto.id_producto}">

                        <div class="table-responsive">
                            <table class="table table-bordered text-center align-middle table-striped">
                                <thead class="table-dark">
                                <tr>
                                    <th class="w-25">Campo</th>
                                    <th class="w-25">Valor Actual</th>
                                    <th class="w-50">Nuevo Valor</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Nombre</td>
                                    <td>${producto.nombre_pro}</td>
                                    <td><input type="text" name="nombre_pro" class="form-control" value="${producto.nombre_pro}"></td>
                                </tr>
                                <tr>
                                    <td>Descripción</td>
                                    <td class="text-start">${producto.descrip_pro}</td>
                                    <td><textarea name="descrip_pro" class="form-control">${producto.descrip_pro}</textarea></td>
                                </tr>
                                <tr>
                                    <td>Categoría</td>
                                    <td>${producto.categoria_pro.nombre_cate}</td>
                                    <td>
                                        <select name="categoria_pro.id_categoria" class="form-select">
                                            <c:forEach var="cat" items="${categorias}">
                                                <option value="${cat.id_categoria}"
                                                        ${cat.id_categoria == producto.categoria_pro.id_categoria ? 'selected' : ''}>
                                                ${cat.nombre_cate}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Año</td>
                                    <td>${producto.anio_pro}</td>
                                    <td><input type="number" name="anio_pro" class="form-control" value="${producto.anio_pro}"></td>
                                </tr>
                                <tr>
                                    <td>Precio</td>
                                    <td>S/ ${producto.precio_pro}</td>
                                    <td><input type="number" step="0.01" name="precio_pro" class="form-control" value="${producto.precio_pro}"></td>
                                </tr>
                                <tr>
                                    <td>Stock</td>
                                    <td>${producto.stock_pro}</td>
                                    <td><input type="number" name="stock_pro" class="form-control" value="${producto.stock_pro}"></td>
                                </tr>

                                <tr>
                                    <td>Estado</td>
                                    <td>
                                        <span class="badge ${producto.activo_pro ? 'bg-success' : 'bg-danger'}">
                                            ${producto.activo_pro ? 'Activo' : 'Eliminado'}
                                        </span>
                                    </td>
                                    <td>
                                        <select name="activo_pro" class="form-select text-center fw-semibold">
                                            <option value="true" ${producto.activo_pro ? 'selected' : ''}>Activo</option>
                                            <option value="false" ${!producto.activo_pro ? 'selected' : ''}>Eliminado</option>
                                        </select>
                                    </td>
                                </tr>


                                <tr>
                                    <td>Imagen</td>
                                    <td>
                                        <img src="${producto.url_pro}" alt="Imagen actual" class="img-thumb mb-2"><br>
                                        <span class="small text-break">${producto.url_pro}</span>
                                    </td>
                                    <td><input type="text" name="url_pro" class="form-control" value="${producto.url_pro}"></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>


                        <div class="d-flex flex-column flex-sm-row justify-content-between mt-4 gap-2">
                            <a href="/gestion/productos" class="btn btn-secondary rounded-pill px-4">
                                <i class="bi bi-arrow-left"></i> Volver
                            </a>
                            <button type="submit" class="btn btn-warning rounded-pill px-5 text-dark fw-semibold">
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
    <div>© 2025 - Panel de Gestión | Todos los derechos reservados</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

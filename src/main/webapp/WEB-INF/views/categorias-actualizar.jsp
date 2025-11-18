<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Categoría</title>

    <link rel="icon" type="image/png"
          href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- BARRITA LATERAL RESPONSIVE -->
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
                <jsp:include page="gestion-panel-lateral.jsp"/>
            </div>
        </div>

        <!-- BARRA LATERAL EN PANTALLAS GRANDES -->
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp"/>
        </div>

        <!-- CONTENIDO PRINCIPAL -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-4 py-4">
            <h1 class="border-start border-4 border-warning ps-3 fw-bold mb-4">
                <i class="bi bi-pencil-square me-2"></i>Editar Categoría
            </h1>

            <div class="card shadow-lg">
                <div class="card-header bg-warning text-dark fw-semibold text-center">
                    Los cambios se aplicarán inmediatamente al catálogo de productos
                </div>
                <div class="card-body p-4">
                    <form action="/gestion/categoria/aplicarEdicion" method="post">
                        <input type="hidden" name="id_categoria" value="${categoria.id_categoria}">

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
                                    <td>${categoria.nombre_cate}</td>
                                    <td>
                                        <input type="text" name="nombre_cate" class="form-control"
                                               value="${categoria.nombre_cate}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Descripción</td>
                                    <td class="text-start">${categoria.descrip_cate}</td>
                                    <td><textarea name="descrip_cate" class="form-control" required>${categoria.descrip_cate}</textarea></td>
                                </tr>

                                <tr>
                                    <td>Estado</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${categoria.activo_cate}">
                                                Activo
                                            </c:when>
                                            <c:otherwise>
                                                Inactivo
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <select name="activo_cate" class="form-select" required>
                                            <option value="true"
                                            <c:if test="${categoria.activo_cate}">selected</c:if>>
                                            Activo
                                            </option>
                                            <option value="false"
                                            <c:if test="${!categoria.activo_cate}">selected</c:if>>
                                            Inactivo
                                            </option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex flex-column flex-sm-row justify-content-between mt-4 gap-2">
                            <a href="/gestion/categoria" class="btn btn-secondary rounded-pill px-4">
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

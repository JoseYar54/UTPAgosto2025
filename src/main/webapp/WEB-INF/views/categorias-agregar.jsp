<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir Categoría</title>
    <link rel="stylesheet" href="css/gestion-css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- BARRA LATERAL -->
        <button class="btn btn-dark d-md-none mb-3" type="button"
                data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
                style="border-radius: 0px;">
            <i class="bi bi-list"></i> Menú
        </button>
        <div class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90" tabindex="-1" id="sidebarMenu">
            <div class="offcanvas-header">
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Cerrar"></button>
            </div>
            <div class="offcanvas-body p-0">
                <jsp:include page="gestion-panel-lateral.jsp"/>
            </div>
        </div>
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp"/>
        </div>

        <!-- MAIN -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
            <h1 class="mt-2 mb-2 text-center p-1">Crear Nueva Categoría</h1>
            <div class="container mt-3">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card shadow-lg">
                            <div class="card-header bg-dark text-white text-center">
                                <h3>Nueva Categoría</h3>
                            </div>
                            <div class="card-body">
                                <!-- FORMULARIO PARA AGREGAR CATE -->
                                <form action="/gestion/categoria/guardar"
                                      method="post" modelAttribute="nuevaCategoria">

                                    <!-- NOMBRE -->
                                    <div class="mb-3">
                                        <label for="nombre_cate" class="form-label">Nombre de la Categoría</label>
                                        <input type="text" class="form-control" id="nombre_cate" name="nombre_cate"
                                               placeholder="Ej. Vinos" required>
                                    </div>

                                    <!-- DESCRIPCION -->
                                    <div class="mb-3">
                                        <label for="descrip_cate" class="form-label">Descripción</label>
                                        <textarea class="form-control" id="descrip_cate" name="descrip_cate" rows="3"
                                                  placeholder="Descripción de la categoría" required></textarea>
                                    </div>

                                    <!-- BTN GUARDAR -->
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-dark btn-lg">Agregar Categoría</button>
                                    </div>
                                </form>
                                <!-- FIN FORMULARIO -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<footer class="bg-dark text-white text-center py-2">
    <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i> Derechos reservados</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

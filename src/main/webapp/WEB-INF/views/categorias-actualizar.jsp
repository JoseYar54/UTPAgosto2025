<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir Categoría</title>
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Barra lateral -->
        <div class="d-none d-md-block col-md-2 p-0 vh-100 bg-dark text-white">
            <jsp:include page="gestion-panel-lateral.jsp"/>
        </div>

        <!-- Contenido principal -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
            <h1 class="mt-4 mb-4 text-center">Editar Categoría</h1>

            <div class="row">
                <!-- Datos antiguos -->
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-secondary text-white">
                            Datos Actuales
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" class="form-control" value="${categoria.nombre_cate}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Descripción</label>
                                    <textarea class="form-control" readonly>${categoria.descrip_cate}</textarea>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Datos nuevos -->
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-warning">
                            Ingresar Nuevos Datos
                        </div>
                        <div class="card-body">
                            <form action="/gestion/categoria/aplicarEdicion" method="post" modelAttribute="categoriaEditada">
                                <input type="hidden" name="id_categoria" value="${categoria.id_categoria}">

                                <div class="mb-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" name="nombre_cate" class="form-control"
                                           value="${categoria.nombre_cate}" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Descripción</label>
                                    <textarea name="descrip_cate" class="form-control" required>${categoria.descrip_cate}</textarea>
                                </div>

                                <button type="submit" class="btn btn-warning">Guardar Cambios</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<footer class="bg-dark text-white text-center py-2 mt-4">
    <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i> Derechos reservados</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

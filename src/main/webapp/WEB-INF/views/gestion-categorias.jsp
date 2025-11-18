<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión - Categorías</title>
    <link rel="stylesheet" href="css/gestion-css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- BARRA LATERAL -->
        <button class="btn btn-dark d-md-none mb-3" type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#sidebarMenu"
                aria-controls="sidebarMenu" style="border-radius: 0px;">
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

        <!-- CONTENIDO -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">

            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mt-5 mb-4">
                <div class="titulo-panel text-center text-md-start flex-grow-1 mb-4">
                    <h1 class="border-start border-4 border-black ps-3 fw-bold d-inline-flex align-items-center mb-0">
                        <i class="bi bi-tags-fill me-2"></i> Gestión de Categorías
                    </h1>
                </div>

                <!-- SWITCH para mostrar inactivas -->
                <div class="form-check form-switch d-flex align-items-center bg-dark bg-opacity-75 px-3 py-2 rounded-3 shadow-sm">
                    <label class="form-check-label text-white fw-semibold small me-3 mb-0" for="activador">
                        <i class="bi bi-eye-slash me-2"></i>Ver Inactivas
                    </label>
                    <input
                            class="form-check-input mx-1"
                            type="checkbox"
                            id="activador"
                            onchange="window.location.href='/gestion/categoria?activador='+this.checked"
                    <c:if test="${estado}">checked</c:if>
                    >
                </div>

                <!-- Botón Agregar -->
                <a href="/gestion/categoria/NuevaCategoria"
                   class="btn btn-success btn-lg shadow-sm ms-md-3">
                    <i class="bi bi-plus-circle me-2"></i> Agregar Categoría
                </a>
            </div>

            <!-- Tarjetas de Categorías -->
            <div class="row g-4">
                <c:forEach var="c" items="${categorias}">
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 shadow border-0 rounded-4 p-3 d-flex flex-column"
                             style="transition: transform 0.3s ease, box-shadow 0.3s ease;">

                            <!-- ID -->
                            <span class="badge bg-dark bg-opacity-75 mb-2 d-block">
                                ID: ${c.id_categoria}
                            </span>

                            <!-- Estado -->
                            <c:choose>
                                <c:when test="${c.activo_cate}">
                                    <span class="badge bg-success bg-opacity-75 mb-3 d-block">
                                        <i class="bi bi-check-circle me-1"></i> Activa
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger bg-opacity-75 mb-3 d-block">
                                        <i class="bi bi-x-circle me-1"></i> Inactiva
                                    </span>
                                </c:otherwise>
                            </c:choose>

                            <!-- Ícono -->
                            <div class="text-center mb-3">
                                <i class="bi bi-folder-fill" style="font-size: 4rem; color: #5c5c5c;"></i>
                            </div>

                            <!-- Información -->
                            <div class="card-body text-center d-flex flex-column">
                                <h5 class="fw-bold text-primary mb-2 text-truncate">${c.nombre_cate}</h5>
                                <p class="text-muted small mb-3">${c.descrip_cate}</p>

                                <c:if test="${not empty sessionScope.user and sessionScope.user.tipo_user.nombre_tipoUsuario == 'Administrador'}">
                                    <div class="mt-auto d-flex justify-content-around">
                                        <!-- Editar -->
                                        <a href="/gestion/categoria/editar/${c.id_categoria}"
                                           class="btn btn-warning btn-sm rounded-pill shadow-sm px-3">
                                            <i class="bi bi-pencil-square me-1"></i> Editar
                                        </a>

                                        <!-- Eliminar -->
                                        <form action="/gestion/categoria/eliminarCategoria" method="post"
                                              onsubmit="return confirm('¿Estás seguro de eliminar esta categoría?');">
                                            <input type="hidden" name="id_categoria" value="${c.id_categoria}">
                                            <button type="submit"
                                                    class="btn btn-danger btn-sm rounded-pill shadow-sm px-3">
                                                <i class="bi bi-trash me-1"></i> Eliminar
                                            </button>
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
</div>

<!-- Mensajes de alerta -->
<c:if test="${not empty verificar}">
    <script type="text/javascript">
        <c:choose>
            <c:when test="${verificar == 1}">
                alert("Se agregó una categoría correctamente :D");
            </c:when>
            <c:when test="${verificar == 2}">
                alert("Se editó una categoría correctamente :D");
            </c:when>
            <c:when test="${verificar == 3}">
                alert("Se eliminó una categoría correctamente :D");
            </c:when>
            <c:otherwise>
                alert("La operación no se pudo realizar D:");
            </c:otherwise>
        </c:choose>
    </script>
</c:if>

<footer class="bg-dark text-white text-center py-2">
    <div>© 2025 - Panel de Gestión | <i class="bi bi-shield-lock"></i> Derechos reservados</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="css/gestion-css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <!-- BARRA LATERAL -->
        <button class="btn btn-dark d-md-none mb-3" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" style="border-radius: 0px;">
            <i class="bi bi-list"></i> Menú
        </button>
        <div class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90" tabindex="-1"
             id="sidebarMenu" aria-labelledby="sidebarLabel">
            <div class="offcanvas-header">
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Cerrar"></button>
            </div>
            <div class="offcanvas-body p-0">
                <jsp:include page="gestion-panel-lateral.jsp" />
            </div>
        </div>
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp" />
        </div>

        <!-- MAIN -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 min-vh-100">
            <h1 class="mt-4 mb-4 text-center p-3">Usuarios Registrados</h1>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Tipo Usuario</th>
                        <th>Estado</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="u" items="${usuarios}">
                        <tr>
                            <td>${u.id_usuario}</td>
                            <td>${u.nombre_user}</td>
                            <td>${u.apaterno_user}</td>
                            <td>${u.amaterno_user}</td>
                            <td>${u.correo_user}</td>
                            <td>${u.telefono_user}</td>
                            <td>${u.tipo_user.nombre_tipoUsuario}</td>
                             <td>
                                <c:choose>
                                    <c:when test="${u.estado_user}">Activo</c:when>
                                    <c:otherwise>Desactivado</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
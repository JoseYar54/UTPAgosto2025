<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario</title>

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

        <!-- BARRA LATERAL PANTALLAS GRANDES -->
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp"/>
        </div>

        <!-- CONTENIDO PRINCIPAL -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-4 py-4">
            <h1 class="border-start border-4 border-warning ps-3 fw-bold mb-4">
                <i class="bi bi-person-gear me-2"></i>Editar Usuario
            </h1>

            <div class="card shadow-lg">
                <div class="card-header bg-warning text-dark fw-semibold text-center">
                    Los cambios en la información del usuario se aplicarán de inmediato
                </div>

                <div class="card-body p-4">
                    <form action="/gestion/usuarios/editarUsuario" method="post">
                        <input type="hidden" name="id_usuario" value="${usuario.id_usuario}">

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
                                    <td>${usuario.nombre_user}</td>
                                    <td><input type="text" name="nombre_user" class="form-control" value="${usuario.nombre_user}" required></td>
                                </tr>
                                <tr>
                                    <td>Apellido Paterno</td>
                                    <td>${usuario.apaterno_user}</td>
                                    <td><input type="text" name="apaterno_user" class="form-control" value="${usuario.apaterno_user}" required></td>
                                </tr>
                                <tr>
                                    <td>Apellido Materno</td>
                                    <td>${usuario.amaterno_user}</td>
                                    <td><input type="text" name="amaterno_user" class="form-control" value="${usuario.amaterno_user}" required></td>
                                </tr>
                                <tr>
                                    <td>Correo</td>
                                    <td>${usuario.correo_user}</td>
                                    <td><input type="email" name="correo_user" class="form-control" value="${usuario.correo_user}" required></td>
                                </tr>
                                <tr>
                                    <td>Teléfono</td>
                                    <td>${usuario.telefono_user}</td>
                                    <td><input type="tel" name="telefono_user" class="form-control" value="${usuario.telefono_user}" pattern="[0-9]{9}" required></td>
                                </tr>
                                <tr>
                                    <td>Contraseña</td>
                                    <td>••••••••</td>
                                    <td><input type="password" name="password" class="form-control" placeholder="Nueva contraseña (opcional)"></td>
                                </tr>
                                <tr>
                                    <td>Tipo de Usuario</td>
                                    <td>${usuario.tipo_user.nombre_tipoUsuario}</td>
                                    <td>
                                        <select name="tipo_user.id_tipoUsuario" class="form-select" required>
                                            <c:forEach var="tipo" items="${tipos}">
                                                <option value="${tipo.id_tipoUsuario}"
                                                        ${tipo.id_tipoUsuario == usuario.tipo_user.id_tipoUsuario ? 'selected' : ''}>
                                                ${tipo.nombre_tipoUsuario}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Estado</td>
                                    <td>
                                        <span class="badge ${usuario.estado_user ? 'bg-success' : 'bg-danger'}">
                                            ${usuario.estado_user ? 'Activo' : 'Inactivo'}
                                        </span>
                                    </td>
                                    <td>
                                        <select name="estado_user" class="form-select">
                                            <option value="true" ${usuario.estado_user ? 'selected' : ''}>Activo</option>
                                            <option value="false" ${!usuario.estado_user ? 'selected' : ''}>Inactivo</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex flex-column flex-sm-row justify-content-between mt-4 gap-2">
                            <a href="/gestion/usuarios" class="btn btn-secondary rounded-pill px-4">
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

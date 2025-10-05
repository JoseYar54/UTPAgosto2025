<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="stylesheet"
              href="${pageContext.request.contextPath}/css/gestion-css.css">
</header>

<!-- PANEL LATERAL -->
<nav class="sidebar pt-3 bg-dark bg-opacity-90 shadow-sm">
    <ul class="nav flex-column">

        <!-- PANEL PRINCIPAL -->
        <li class="nav-item mb-4 text-center">
            <span class="text-white fw-bold fs-5">
                <i class="bi bi-speedometer2 me-2"></i> Panel de Gestión
            </span>
        </li>

        <!-- Sesión activa -->
        <li class="nav-item mb-2">
            <span class="nav-link text-white d-flex flex-column align-items-start">
                <strong><i class="bi bi-person-circle me-2"></i> Usuario:</strong>
                <span class="badge bg-primary">${sessionScope.user.nombre_user}</span>
            </span>
        </li>
        <li class="nav-item mb-2">
            <span class="nav-link text-white d-flex flex-column align-items-start">
                <strong><i class="bi bi-shield-lock-fill me-2"></i> Tipo:</strong>
                <span class="badge bg-success">${sessionScope.user.tipo_user.nombre_tipoUsuario}</span>
            </span>
        </li>

        <hr class="text-light opacity-25">

        <!-- Panel Principal -->
        <li class="nav-item mb-2">
            <a class="nav-link active btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center"
               href="/gestion">
                <i class="bi bi-house-door-fill me-2"></i> Panel Principal
            </a>
        </li>

        <!-- Separador -->
        <hr class="text-light opacity-25">

        <!-- Perfil -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center"
               href="/perfil">
                <i class="bi bi-person-circle me-2"></i> Perfil
            </a>
        </li>

        <hr class="text-light opacity-25">

        <!-- Reportes -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center justify-content-between"
               data-bs-toggle="collapse" href="#subReporte">
                <span><i class="bi bi-file-earmark-text me-2"></i> Reportes</span>
                <i class="bi bi-chevron-down"></i>
            </a>
            <div class="collapse ps-3" id="subReporte">
                <a href="#" class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center">
                    <i class="bi bi-circle-fill fs-6 me-2"></i> Reporte 1
                </a>
                <a href="#" class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center">
                    <i class="bi bi-circle-fill fs-6 me-2"></i> Reporte 2
                </a>
            </div>
        </li>

        <!-- Productos -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center justify-content-between"
                    href="/gestion/productos">
                <span><i class="bi bi-box-seam me-2"></i> Productos</span>
            </a>
        </li>

        <!-- Categorías -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center justify-content-between"
               href="/gestion/categoria">
                <span><i class="bi bi-tags-fill me-2"></i> Categorías</span>
            </a>
        </li>

        <hr class="text-light opacity-25">

        <!-- Usuarios -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center justify-content-between"
               href="/gestion/usuarios">
                <span><i class="bi bi-people-fill me-2"></i> Usuarios</span>
            </a>
        </li>

        <hr class="text-light opacity-25">

        <!-- Volver y Logout -->
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center"
               href="/">
                <i class="bi bi-box-arrow-left me-2"></i> Volver a Tienda
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link btn btn-outline-light rounded-pill m-lg-1 d-flex align-items-center"
               href="/logout">
                <i class="bi bi-box-arrow-right me-2"></i> Cerrar Sesión
            </a>
        </li>
    </ul>
</nav>

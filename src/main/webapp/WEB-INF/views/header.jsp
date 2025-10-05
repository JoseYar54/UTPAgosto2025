<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/header-footer.css">    
</head>
<header class="header-vino">
    <nav
        class="navbar navbar-expand-lg navbar-dark navbar-transparente py-3">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">LA TABERNA
                <span>DE ROLY</span></a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="menu">
                <ul
                    class="navbar-nav ms-auto align-items-lg-center gap-1 pb-1">
                    <li class="nav-item"><a class="nav-link"
                            href="/publicidad">Ofertas</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="/productos">Productos</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="#">Servicios</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="/contacto">Contacto</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="/nosotros">Nosotros</a></li>

                    <!--Primero verifica que no este vacia la sesion en servidor-->
                    <c:if test="${not empty sessionScope.user}">
                        <c:choose>
                            <c:when test="${sessionScope.user.tipo_user.nombre_tipoUsuario == 'Administrador'
                                        or sessionScope.user.tipo_user.nombre_tipoUsuario == 'Auxiliar'}">
                                <li class="nav-item"><a class="nav-link" href="/gestion">Panel de Gestión</a></li>

                                <ul class="navbar-nav ms-auto">
                                  <li class="nav-item">
                                    <span class="nav-link text-white">
                                      <i class="bi bi-person-circle"></i>
                                      Usuario: <span class="badge bg-primary">${sessionScope.user.nombre_user}</span>
                                    </span>
                                  </li>
                                  <li class="nav-item">
                                    <span class="nav-link text-white">
                                      <i class="bi bi-shield-lock-fill"></i>
                                      Tipo: <span class="badge bg-success">${sessionScope.user.tipo_user.nombre_tipoUsuario}</span>
                                    </span>
                                  </li>
                                </ul>
                            </c:when>

                            <c:when test="${sessionScope.user.tipo_user.nombre_tipoUsuario eq 'Cliente'}">
                                <ul class="navbar-nav ms-auto">
                                  <li class="nav-item">
                                    <span class="nav-link text-white">
                                      <i class="bi bi-person-circle"></i>
                                      Usuario: <span class="badge bg-primary">${sessionScope.user.nombre_user}</span>
                                    </span>
                                  </li>
                                  <li class="nav-item">
                                    <span class="nav-link text-white">
                                      <i class="bi bi-shield-lock-fill"></i>
                                      Tipo: <span class="badge bg-success">${sessionScope.user.tipo_user.nombre_tipoUsuario}</span>
                                    </span>
                                  </li>
                                </ul>
                            </c:when>
                        </c:choose>
                        <a href="/perfil" class="btn btn-outline-light m-2">Perfil</a>
                        <a href="/logout" class="btn btn-outline-light m-2">Logout</a>
                    </c:if>

                    <c:if test="${empty sessionScope.user}">
                        <a href="/login" class="btn btn-outline-light m-2">Ingresar</a>
                        <a href="/registro" class="btn btn-outline-light m-2">Registrarse</a>
                    </c:if>


                </ul>
            </div>
        </div>
    </nav>
    
</header>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión</title>

        <link rel="icon" type="image/png"
            href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">

        <link rel="stylesheet"
            href="${pageContext.request.contextPath}/css/gestion-css.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <script type="text/javascript"
            src="https://www.gstatic.com/charts/loader.js"></script>
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
                <div
                    class="offcanvas offcanvas-start d-md-none bg-dark bg-opacity-90"
                    tabindex="-1"
                    id="sidebarMenu" aria-labelledby="sidebarLabel">
                    <div class="offcanvas-header">
                        <button type="button" class="btn-close text-reset"
                            data-bs-dismiss="offcanvas"
                            aria-label="Cerrar"></button>
                    </div>
                    <div class="offcanvas-body p-0">
                        <jsp:include page="gestion-panel-lateral.jsp" />
                    </div>
                </div>
                <!-- SOLO APARECE SI ES PANTALLA GRANDE -->
                <div class="d-none d-md-block col-md-2 p-0 vh-100">
                    <jsp:include page="gestion-panel-lateral.jsp" />
                </div>
                <!-- FIN BARRITA LATAREAL :D ----------------------------------------------------------->

                <!-- Main -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-4 py-4">
                    <h1 class="text-center mb-4">Panel Principal</h1>

                    <!-- Panelitos de resumen -->
                    <div class="row g-3 mb-4">
                        <div class="col-md-4">
                            <div class="card text-white bg-primary h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Venta del mes</h5>
                                    <p class="card-text">S/ 10,000</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-success h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Ventas Mensuales</h5>
                                    <p class="card-text">75</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-warning h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Productos</h5>
                                    <p class="card-text">25</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Gráficos -->
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="chart-container h-100">
                                <div id="chart1" class="h-100"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="chart-container h-100">
                                <div id="chart2" class="h-100"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="chart-container h-100">
                                <div id="chart3" class="h-100"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="chart-container h-100">
                                <div id="chart4" class="h-100"></div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="chart-container" style="height: 400px;">
                                <div id="chart5" class="h-100"></div>
                            </div>
                        </div>
                    </div>

                </main>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-2 mt-4">
            <div>© 2025 - Panel de Gestión | Todos los derechos reservados</div>
        </footer>

        <!-- Scripts -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript"
            src="/js/gestion-graficos.js"></script>
    </body>
</html>

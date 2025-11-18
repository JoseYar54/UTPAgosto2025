<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes</title>

    <link rel="icon" type="image/png"
          href="https://cdn-icons-png.flaticon.com/512/5186/5186031.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">

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
                <jsp:include page="gestion-panel-lateral.jsp"/>
            </div>
        </div>
        <!-- SOLO APARECE SI ES PANTALLA GRANDE -->
        <div class="d-none d-md-block col-md-2 p-0 vh-100">
            <jsp:include page="gestion-panel-lateral.jsp"/>
        </div>
        <!-- FIN BARRITA LATAREAL :D ----------------------------------------------------------->

        <!-- Contenido principal -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-4 py-4">

            <h1 class="border-start border-4 border-primary ps-3 fw-bold mb-4">
                <i class="bi bi-file-earmark-bar-graph me-2"></i>Generar Reportes
            </h1>

            <div class="card shadow-sm rounded-4 mb-4">
                <div class="card-body d-flex flex-column flex-md-row align-items-center justify-content-between p-4">
                    <div class="d-flex align-items-center mb-3 mb-md-0">
                        <i class="bi bi-file-earmark-pdf-fill text-danger fs-1 me-3"></i>
                        <div>
                            <h5 class="fw-bold mb-1">Generación de Reportes</h5>
                            <p class="mb-0 text-muted">
                                Selecciona el tipo de reporte que deseas generar. Se descargará en formato <b>PDF</b>.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección de reportes -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

                <!-- Reporte de Boleta -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-receipt-cutoff display-4 text-primary"></i>
                            <h5 class="card-title mt-3 fw-bold">Boleta de Venta</h5>
                            <p class="text-muted">Genera una boleta individual por ID de venta.</p>

                            <form class="d-flex justify-content-center mt-3" id="formBoleta">
                                <input type="number" class="form-control w-50 me-2 shadow-sm"
                                       id="idVenta" placeholder="ID Venta">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-file-earmark-pdf-fill"></i> Generar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Reporte de Ventas de Hoy -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-calendar-date-fill display-4 text-success"></i>
                            <h5 class="card-title mt-3 fw-bold">Ventas de Hoy</h5>
                            <p class="text-muted">Genera un reporte con todas las ventas del día actual.</p>

                            <form action="/generar/reporte/ventas-hoy" method="get">
                                <button type="submit" class="btn btn-success mt-3">
                                    <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Reporte por Stock -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-box-seam display-4 text-secondary"></i>
                            <h5 class="card-title mt-3 fw-bold">Reporte por Stock</h5>
                            <p class="text-muted">Lista todos los productos y el stock físico disponible.</p>

                            <a href="/generar/reporte/stock" class="btn btn-secondary mt-3">
                                <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Reporte de Ventas General -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-bar-chart-fill display-4 text-warning"></i>
                            <h5 class="card-title mt-3 fw-bold">Reporte de Ventas</h5>
                            <p class="text-muted">Genera un resumen general de todas las ventas.</p>

                            <a href="/generar/reporte/ventas" class="btn btn-warning text-white mt-3">
                                <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Reporte de Usuarios -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-people-fill display-4 text-info"></i>
                            <h5 class="card-title mt-3 fw-bold">Reporte por Usuarios</h5>
                            <p class="text-muted">Ventas agrupadas por vendedor.</p>

                            <a href="/generar/reporte/ventas-por-usuario"
                               class="btn btn-info text-white mt-3">
                                <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Reporte de Ventas por Fecha -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-calendar-range-fill display-4 text-danger"></i>
                            <h5 class="card-title mt-3 fw-bold">Ventas por Lapso de Fechas</h5>
                            <p class="text-muted">Genera un reporte entre dos fechas específicas.</p>

                            <form action="/generar/reporte/ventas-entre-fechas" id="formReporteFechas"
                                  class="mt-3" method="get">
                                <div class="row g-2 justify-content-center">
                                    <div class="col-5">
                                        <input type="datetime-local" class="form-control shadow-sm"
                                               id="fecha1" name="fecha1" required>
                                    </div>
                                    <div class="col-5">
                                        <input type="datetime-local" class="form-control shadow-sm"
                                               id="fecha2" name="fecha2" required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-danger mt-3">
                                    <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Productos Vendidos -->
                <div class="col">
                    <div class="card h-100 shadow-lg border-0 rounded-4">
                        <div class="card-body text-center">
                            <i class="bi bi-bag-check-fill display-4 text-success"></i>
                            <h5 class="card-title mt-3 fw-bold">Productos Vendidos</h5>
                            <p class="text-muted">Listado de productos y estadísticas.</p>

                            <a href="/generar/reporte/productos-vendidos" class="btn btn-success mt-3">
                                <i class="bi bi-file-earmark-pdf-fill"></i> Descargar
                            </a>
                        </div>
                    </div>
                </div>

            </div>

        </main>
    </div>
</div>

<footer class="bg-dark text-white text-center py-2 mt-4">
    <div>© 2025 - Panel de Gestión | Reportes del Sistema</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.getElementById('formBoleta').addEventListener('submit', function(e) {
        e.preventDefault();
        const id = document.getElementById('idVenta').value;
        if (id.trim() !== '') {
            window.location.href = '/generar/generarBoleta/' + id;
        } else {
            alert('Por favor ingrese un ID de venta válido.');
        }
    });
</script>

<!-- Esto de aca evita que el usuario pase de poner el día de hoy -->
<script>
    const hoy = new Date();
    hoy.setHours(23, 59, 59, 999);

    const formato = hoy.toISOString().slice(0, 16);

    document.getElementById("fecha1").setAttribute("max", formato);
    document.getElementById("fecha2").setAttribute("max", formato);
</script>

</body>
</html>

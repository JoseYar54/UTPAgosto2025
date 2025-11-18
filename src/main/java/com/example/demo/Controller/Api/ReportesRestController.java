package com.example.demo.Controller.Api;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Producto;
import com.example.demo.Model.Venta;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.ProductoService;
import com.example.demo.Service.VentaService;
import com.example.demo.Tools.GenerarBoletaPDF;
import com.example.demo.Tools.ReportesProductoPDF;
import com.example.demo.Tools.ReportesVentaPDF;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
@RestController
@RequestMapping("/generar")
public class ReportesRestController {

    private final VentaService ventaService;
    private final ProductoService productoService;
    private final DetalleVentaService detalleVentaService;

    @Autowired
    public ReportesRestController(
            VentaService ventaService,
            ProductoService productoService,
            DetalleVentaService detalleVentaService) {
        this.ventaService = ventaService;
        this.productoService = productoService;
        this.detalleVentaService = detalleVentaService;

    }

    @GetMapping
    public String showReportsPage(){
        return "reportes";
    }

    //GENERAR BOLETA
    @GetMapping("/generarBoleta/{id_venta}")
    public void generarBoleta(@PathVariable Integer id_venta, HttpServletResponse response) {
        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=boleta_" + id_venta + ".pdf");

            Venta venta = ventaService.obtenerVentaPorId(id_venta);
            GenerarBoletaPDF.generarBoleta(venta, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GENERAR REPORTE POR STOCK
    @GetMapping("/reporte/stock")
    public void reportePorStock(HttpServletResponse response) {
        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reporte_por_stock.pdf");

            List<Producto> productos = productoService.getTodosLosProductos();
            ReportesProductoPDF.generarReporteStock(productos, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GENERAR REPORTE DE VENTAS
    @GetMapping("/reporte/ventas")
    public void reporteVentas(HttpServletResponse response) {
        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reporte_ventas.pdf");

            List<Venta> listaVentas = ventaService.obtenerVentasActivas();
            ReportesVentaPDF.generarReporteVentas("REPORTE GENERAL DE VENTAS",listaVentas, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GENERAR REPORTE DE VENTAS
    @GetMapping("/reporte/ventas-entre-fechas")
    public void reporteVentasPorFechas(
            @RequestParam(name = "fecha1")LocalDateTime fecha1,
            @RequestParam(name = "fecha2")LocalDateTime fecha2,
            HttpServletResponse response) {

        List<Venta> listaVentas = ventaService.obtenerVentasPorFecha(fecha1,fecha2);

        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reporte_ventas_entre_fechas.pdf");

            ReportesVentaPDF.generarReporteVentas("REPORTE DE VENTAS ENTRE FECHAS",listaVentas, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GENERAR REPORTE DE VENTAS POR USUARIO
    @GetMapping("/reporte/ventas-por-usuario")
    public void reporteVentasPorUsuario(HttpServletResponse response) {

        List<Venta> listaVentas = ventaService.obtenerVentasActivas();

        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reporte_ventas_por_usuario.pdf");

            ReportesVentaPDF.generarReporteVentasPorUsuario(listaVentas,response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GENERAR REPORTE DE PRODUCTOS VENDIDOS
    @GetMapping("/reporte/productos-vendidos")
    public void reporteProductosVendidos(HttpServletResponse response) {

        List<DetalleVenta> detalles = detalleVentaService.obtenerDetalles();

        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=reporte_productos_vendidos.pdf");

            ReportesProductoPDF.generarReportePorProductoVendido(detalles, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/reporte/ventas-hoy")
    public void reporteVentasHoy(HttpServletResponse response) {

        LocalDate hoy = LocalDate.now();

        LocalDateTime fechaInicio = hoy.atStartOfDay();
        LocalDateTime fechaFin = hoy.atTime(23, 59, 59);

        List<Venta> listaVentas = ventaService.obtenerVentasPorFecha(fechaInicio, fechaFin);

        try {
            response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION,
                    "attachment; filename=reporte_ventas_hoy.pdf");

            ReportesVentaPDF.generarReporteVentas(
                    "REPORTE DE VENTAS DE HOY",
                    listaVentas,
                    response.getOutputStream()
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

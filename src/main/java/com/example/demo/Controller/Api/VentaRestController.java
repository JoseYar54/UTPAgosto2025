package com.example.demo.Controller.Api;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Venta;
import com.example.demo.Service.DashBoardService;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.VentaService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/ventas")
public class VentaRestController {

    private final VentaService ventaService;
    private final DetalleVentaService detalleVentaService;
    private final DashBoardService dashBoardService;

    private final String[] meses = {
            "Enero", "Febrero", "Marzo", "Abril",
            "Mayo", "Junio", "Julio", "Agosto",
            "Septiembre", "Octubre", "Noviembre", "Diciembre"
    };

    private final int nroMes = LocalDate.now().getMonthValue();
    private final int nroAnio = LocalDate.now().getYear();

    public VentaRestController(VentaService ventaService,
                               DetalleVentaService detalleVentaService,
                               DashBoardService dashBoardService) {
        this.ventaService = ventaService;
        this.detalleVentaService = detalleVentaService;
        this.dashBoardService = dashBoardService;
    }

    @GetMapping("/total-ventas")
    public double totalVentas() {
        List<Venta> ventas = ventaService.obtenerVentasActivas();
        if (ventas.isEmpty()) return 0;

        return ventas.stream()
                .mapToDouble(Venta::getTotal_venta)
                .sum();
    }

    @GetMapping("/promedio-por-ticket")
    public double promedioPorTicket() {
        List<Venta> ventas = ventaService.obtenerVentasActivas();
        if (ventas.isEmpty()) return 0.0;

        double total = ventas.stream()
                .mapToDouble(Venta::getTotal_venta)
                .average()
                .orElse(0.0);

        return total;
    }

    @GetMapping("/cantidad-productos-por-mes")
    public Map<String, Integer> cantidadVendidaPorMes() {

        Map<String, Integer> resultado = new LinkedHashMap<>();

        for (int i = 0; i < nroMes; i++) {

            int cantidad = dashBoardService.ventaPorMes((i + 1), nroAnio)
                    .stream()
                    .flatMap(venta -> venta.getDetalles_Venta().stream())
                    .mapToInt(DetalleVenta::getCantidad_det)
                    .sum();

            resultado.put(meses[i], cantidad);
        }
        return resultado;
    }

    @GetMapping("/promedio-ticket-mensual")
    public Map<String, Double> promedioTicketMensaul() {

        Map<String, Double> grafico = new LinkedHashMap<>();

        for (int i = 0; i < nroMes; i++) {
            double cantidad = dashBoardService.ventaPorMes((i + 1), nroAnio)
                    .stream()
                    .mapToDouble(Venta::getTotal_venta)
                    .average()
                    .orElse(0.0);
            grafico.put(meses[i], cantidad);
        }
        return grafico;
    }

    @GetMapping("/cant-ventas-por-mes")
    public Map<String, Integer> pasterDash() {
        Map<String, Integer> grafico = new LinkedHashMap<>();

        for (int i = 0; i < nroMes; i++) {
            int cantidad = dashBoardService.ventaPorMes((i + 1), nroAnio).size();
            grafico.put(meses[i], cantidad);
        }
        return grafico;
    }

    @GetMapping("/venta-por-mes")
    public Map<String, Double> lineDash() {
        Map<String, Double> grafico = new LinkedHashMap<>();

        for (int i = 0; i < nroMes; i++) {
            double monto = dashBoardService.ventaPorMes((i + 1), nroAnio)
                    .stream()
                    .mapToDouble(Venta::getTotal_venta)
                    .sum();
            grafico.put(meses[i], monto);
        }

        return grafico;
    }
}
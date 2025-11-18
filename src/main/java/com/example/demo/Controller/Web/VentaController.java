package com.example.demo.Controller.Web;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Venta;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.ProductoService;
import com.example.demo.Service.UsuarioService;
import com.example.demo.Service.VentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/gestion/ventas")
public class VentaController {

    private VentaService ventaService;
    private ProductoService productoService;
    private DetalleVentaService detalleVentaService;
    private UsuarioService usuarioService;

    @Autowired
    public VentaController(
            VentaService ventaService,
            ProductoService productoService,
            DetalleVentaService detalleVentaService,
            UsuarioService usuarioService) {
        this.ventaService = ventaService;
        this.productoService = productoService;
        this.detalleVentaService = detalleVentaService;
        this.usuarioService = usuarioService;
    }

    @GetMapping
    public String showSellPage(
            @RequestParam(name="activador", required = false, defaultValue = "false") boolean verEliminados
            ,Model model) {

        List<Venta> ventas = verEliminados? ventaService.obtenerTodasLasVentas():ventaService.obtenerVentasActivas();

        model.addAttribute("estado",verEliminados);
        model.addAttribute("ventas", ventas);

        return "gestion-ventas";
    }


    @GetMapping("/NuevaVenta")
    public String showAddSellPage(Model model) {
        model.addAttribute("productoNuevo", new Venta());
        return "ventas-agregar";
    }

    @GetMapping("/editar/{id}")
    public String showEditSellPage(@PathVariable Integer id, Model model) {

        Venta venta = ventaService.obtenerVentaPorId(id);
        model.addAttribute("venta", venta);

        return "ventas-actualizar";
    }

    @PostMapping("/guardarVenta")
    public String guardarVenta(
            @RequestParam("id_usuario") Integer id_usuario,
            @RequestParam("id_producto") List<Integer> ids_productos,
            @RequestParam("cantidades") List<Integer> cantidades,
            @RequestParam("fecha_venta") LocalDateTime fecha_venta,
            RedirectAttributes redirigir) {

        if (ids_productos.size() != cantidades.size() || ids_productos.isEmpty()) {
            return "redirect:/gestion/ventas";
        }

        try {
            Venta ventaNueva = new Venta();
            ventaNueva.setId_usuario(usuarioService.obtenerUsuarioPorId(id_usuario));
            ventaNueva.setFecha_venta(fecha_venta);
            ventaNueva.setTotal_venta(0.0);
            ventaNueva.setEstado_venta(true);

            int idGenerada = ventaService.guardarVenta(ventaNueva);

            List<DetalleVenta> detallesVenta = new ArrayList<>();
            for (int i = 0; i < ids_productos.size(); i++) {
                DetalleVenta detalle = new DetalleVenta();
                detalle.setVenta(ventaNueva);
                detalle.setProducto(productoService.getProductoPorId(ids_productos.get(i)));
                detalle.setCantidad_det(cantidades.get(i));
                detalle.establecerSubtotal_det();
                detallesVenta.add(detalle);
            }

            ventaNueva.setDetalles_Venta(detallesVenta);
            ventaNueva.establecerTotal_venta();

            ventaService.actualizarVenta(ventaNueva);

            redirigir.addFlashAttribute("verificar", 1);
            return "redirect:/gestion/ventas";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/gestion/ventas";
        }
    }


    @PostMapping("/actualizarVenta")
    public String actualizarVenta(
            @RequestParam(name="id_venta") Integer id_venta,
            @RequestParam("id_producto") List<Integer> productos,
            @RequestParam("cantidades") List<Integer> cantidades,
            @RequestParam("fecha_venta") LocalDateTime fecha_venta,
            @RequestParam(name="estado_venta") boolean estado,
            RedirectAttributes redirigir) {

        detalleVentaService.eliminarDetallesVenta(id_venta);

        Venta venta = ventaService.obtenerVentaPorId(id_venta);
        venta.setFecha_venta(fecha_venta);
        venta.setEstado_venta(estado);

        List<DetalleVenta> detalles = new ArrayList<>();

        for (int i = 0; i < productos.size(); i++) {
            DetalleVenta d = new DetalleVenta();
            d.setVenta(venta);
            d.setProducto(productoService.getProductoPorId(productos.get(i)));
            d.setCantidad_det(cantidades.get(i));

            detalles.add(d);
        }

        venta.setDetalles_Venta(detalles);
        ventaService.actualizarVenta(venta);

        redirigir.addFlashAttribute("verificar", 2);
        return "redirect:/gestion/ventas";
    }

    @PostMapping("/eliminarVenta")
    public String eliminarVenta(
            @RequestParam("id_venta") Integer id_venta,
            RedirectAttributes redirigir) {
        ventaService.eliminarVenta(id_venta);
        redirigir.addFlashAttribute("verificar", 3);
        return "redirect:/gestion/ventas";
    }
}
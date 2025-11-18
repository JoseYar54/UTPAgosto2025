package com.example.demo.Controller.Web;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Producto;
import com.example.demo.Model.Venta;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.ProductoService;
import com.example.demo.Service.VentaService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;

@Controller
@RequestMapping("/carrito")
public class CarritoController {

    private final ProductoService productoService;
    private final VentaService ventaService;
    private final DetalleVentaService detalleVentaService;

    @Autowired
    public CarritoController(
            ProductoService productoService,
            VentaService ventaService,
            DetalleVentaService detalleVentaService
    ){
        this.ventaService = ventaService;
        this.productoService = productoService;
        this.detalleVentaService = detalleVentaService;
    }

    @GetMapping
    public String showBuyPage(Model model, HttpSession session) {
        Venta ventaActiva = (Venta) session.getAttribute("ventaActiva");

        if (ventaActiva != null) {
            ventaActiva.establecerTotal_venta();
            model.addAttribute("venta", ventaActiva);
        } else {
            Venta nuevaVenta = new Venta();
            nuevaVenta.setDetalles_Venta(new ArrayList<>());
            session.setAttribute("ventaActiva", nuevaVenta);
            model.addAttribute("venta", nuevaVenta);
        }

        return "/carrito";
    }

    @PostMapping("/agregarProducto")
    public String agregarAlCarrito(
            @RequestParam Integer id_producto,
            @RequestParam Integer cantidad,
            HttpSession session
    ){
        Producto producto = productoService.getProductoPorId(id_producto);
        if (producto == null) {
            return "redirect:/productos";
        }

        DetalleVenta detalle = new DetalleVenta();
        detalle.setProducto(producto);
        detalle.setCantidad_det(cantidad);
        detalle.establecerSubtotal_det();

        Venta ventaActiva = (Venta) session.getAttribute("ventaActiva");
        if (ventaActiva == null) {
            ventaActiva = new Venta();
            ventaActiva.setDetalles_Venta(new ArrayList<>());
        }

        ventaActiva.getDetalles_Venta().add(detalle);
        session.setAttribute("ventaActiva", ventaActiva);

        return "redirect:/carrito";
    }

    @PostMapping("/eliminar/{idDetalle}")
    public String eliminarDetalle(@PathVariable("idDetalle") int idDetalle, HttpSession session) {
        Venta ventaActiva = (Venta) session.getAttribute("ventaActiva");

        if (ventaActiva != null && ventaActiva.getDetalles_Venta() != null) {
            ventaActiva.getDetalles_Venta().removeIf(d -> d.getId_detalle() == idDetalle);
            session.setAttribute("ventaActiva", ventaActiva);
        }

        return "redirect:/carrito";
    }

    @PostMapping("/finalizar")
    public String finalizarCompra(RedirectAttributes redirigir, HttpSession session) {
        Venta ventaActiva = (Venta) session.getAttribute("ventaActiva");

        if (ventaActiva == null || ventaActiva.getDetalles_Venta() == null || ventaActiva.getDetalles_Venta().isEmpty()) {
            redirigir.addFlashAttribute("ventaEnviada", false);
            return "redirect:/carrito";
        }

        int idVenta = ventaService.guardarVenta(ventaActiva);
        ventaActiva.setId_venta(idVenta);

        ventaActiva.getDetalles_Venta().forEach(det -> {
            det.setVenta(ventaActiva); // Relación correcta
            detalleVentaService.agregarDetalleVenta(det);

            Producto p = productoService.getProductoPorId(det.getProducto().getId_producto());
            if (p != null) {
                p.setStock_pro(p.getStock_pro() - det.getCantidad_det());
                productoService.actualizarProducto(p);
            }
        });

        Venta nuevaVenta = new Venta();
        nuevaVenta.setId_usuario(ventaActiva.getId_usuario());
        nuevaVenta.setDetalles_Venta(new ArrayList<>());
        session.setAttribute("ventaActiva", nuevaVenta);

        redirigir.addFlashAttribute("ventaEnviada", true);
        return "redirect:/carrito";
    }
}
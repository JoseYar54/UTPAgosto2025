package com.example.demo.Controller.Web;

import com.example.demo.Model.Categoria;
import com.example.demo.Model.Producto;
import com.example.demo.Service.CategoriaService;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.Impl.ProductoServiceImpl;
import com.example.demo.Service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/gestion/productos")
public class ProductoController {


    private final ProductoService productoService;
    private final CategoriaService categoriaService;
    private final DetalleVentaService detalleVentaService;


    @Autowired
    public ProductoController(ProductoServiceImpl productoServiceImpl, CategoriaService categoriaService, DetalleVentaService detalleVentaService) {
        this.productoService = productoServiceImpl;
        this.categoriaService = categoriaService;
        this.detalleVentaService = detalleVentaService;
    }

    @GetMapping
    public String showManagementProduct(
            @RequestParam(name="activador", required = false, defaultValue = "false") boolean verEliminados
            ,Model model) {

        List<Producto> productos = verEliminados? productoService.getTodosLosProductos():productoService.getProductosActivos();

        model.addAttribute("estado",verEliminados);
        model.addAttribute("productos", productos);
        return "gestion-productos";
    }

    @GetMapping("/NuevoProducto")
    public String showCreateProductPage(Model model) {
        List<Categoria> categorias = categoriaService.obtenerCategorias();
        model.addAttribute("categorias", categorias);
        model.addAttribute("nuevoProducto", new Producto());
        return "productos-agregar";
    }

    // EDITAR
    @GetMapping("/editar/{id}")
    public String obtenerProducto(@PathVariable Integer id, Model model) {
        Producto producto = productoService.getProductoPorId(id);
        List<Categoria> categorias = categoriaService.obtenerCategorias();

        model.addAttribute("producto", producto);
        model.addAttribute("categorias", categorias);
        model.addAttribute("productoEditado", new Producto());

        return "productos-actualizar";
    }

    // GUARDAR - GUARDAR NUEVO PRODUCTO
    @PostMapping("/guardar")
    public String guardarProducto(@ModelAttribute Producto producto,
                                  RedirectAttributes redirigir) {
        Categoria c = categoriaService.obtenerCategoriaPorId(producto.getCategoria_pro().getId_categoria());
        producto.setCategoria_pro(c);
        productoService.agregarProducto(producto);

        redirigir.addFlashAttribute("verificar", 1);
        return "redirect:/gestion/productos";
    }

    // EDITAR - GUARDAR CAMBIOS PRODUCTO
    @PostMapping("/aplicarEdicion")
    public String editarProducto(@ModelAttribute Producto producto,
                                 RedirectAttributes redirigir) {
        Categoria c = categoriaService.obtenerCategoriaPorId(producto.getCategoria_pro().getId_categoria());
        producto.setCategoria_pro(c);
        productoService.actualizarProducto(producto);

        redirigir.addFlashAttribute("verificar", 2);
        return "redirect:/gestion/productos";
    }

    // ELIMINAR - ELIMINAR PRODCUTO
    @PostMapping("/eliminarProducto")
    public String eliminarProducto(@RequestParam Integer id_producto, RedirectAttributes redirigir) {
        detalleVentaService.eliminarDetallePorProducto(id_producto);
        productoService.eliminarProducto(id_producto);
        redirigir.addFlashAttribute("verificar", 3);
        return "redirect:/gestion/productos";
    }

}
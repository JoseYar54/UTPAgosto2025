package com.example.demo.Controller.Web;

import com.example.demo.Model.Categoria;
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
@RequestMapping("/gestion/categoria")
public class CategoriaController {
    private final ProductoService productoService;
    private final CategoriaService categoriaService;
    private final DetalleVentaService detalleVentaService;


    @Autowired
    public CategoriaController(ProductoServiceImpl productoServiceImpl, CategoriaService categoriaService, DetalleVentaService detalleVentaService) {
        this.productoService = productoServiceImpl;
        this.categoriaService = categoriaService;
        this.detalleVentaService = detalleVentaService;
    }

    @GetMapping
    public String showManagementCategory(
            @RequestParam(name="activador", required = false, defaultValue = "false") boolean verEliminados,
            Model model) {

        List<Categoria> categorias = verEliminados? categoriaService.obtenerCategoriasTodas():categoriaService.obtenerCategorias();

        model.addAttribute("estado",verEliminados);
        model.addAttribute("categorias", categorias);
        return "gestion-categorias";
    }

    @GetMapping("/NuevaCategoria")
    public String showCreateCategoryPage(Model model) {
        model.addAttribute("nuevaCategoria", new Categoria());
        return "categorias-agregar";
    }

    // EDITAR
    @GetMapping("/editar/{id}")
    public String obtenerCategoria(@PathVariable Integer id, Model model) {
        Categoria categoria = categoriaService.obtenerCategoriaPorId(id);

        model.addAttribute("categoria",categoria);
        model.addAttribute("categoriaEditada", new Categoria());

        return "categorias-actualizar";
    }

    // GUARDAR - GUARDAR NUEVA CATEGORIA
    @PostMapping("/guardar")
    public String guardarCategoria(@ModelAttribute Categoria categoria,
                                  RedirectAttributes redirigir) {
        categoriaService.agregarCategoria(categoria);
        redirigir.addFlashAttribute("verificar", 1);
        return "redirect:/gestion/categoria";
    }

    // EDITAR - GUARDAR CAMBIOS PRODUCTO
    @PostMapping("/aplicarEdicion")
    public String editarCategoria(@ModelAttribute Categoria categoria,
                                 RedirectAttributes redirigir) {
        categoriaService.actualizarCategoria(categoria);

        if (categoria.isActivo_cate()) {
            productoService.getProductosPorCategoria(categoria.getId_categoria())
                    .forEach(p -> productoService.activarProducto(p.getId_producto()));
        } else {
            productoService.getProductosPorCategoria(categoria.getId_categoria())
                    .forEach(p -> productoService.eliminarProducto(p.getId_producto()));
        }

        redirigir.addFlashAttribute("verificar", 2);
        return "redirect:/gestion/categoria";
    }

    // ELIMINAR - ELIMINAR CATEGORIA
    @PostMapping("/eliminarCategoria")
    public String eliminarCategoria(@RequestParam Integer id_categoria, RedirectAttributes redirigir) {

        productoService.getProductosPorCategoria(id_categoria)
                        .forEach(p->{
                            productoService.eliminarProducto(p.getId_producto());
                        });

        categoriaService.eliminarCategoria(id_categoria);
        redirigir.addFlashAttribute("verificar", 3);
        return "redirect:/gestion/categoria";
    }
}

package com.example.demo.Controller;

import com.example.demo.Model.Categoria;
import com.example.demo.Model.Producto;
import com.example.demo.Service.CategoriaService;
import com.example.demo.Service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private ProductoService productoService;
    @Autowired
    private CategoriaService categoriaService;

    public MainController(ProductoService productoService, CategoriaService categoriaService) {
        this.productoService = productoService;
        this.categoriaService = categoriaService;
    }

    @GetMapping("/")
    public String redirectToMain(Model model) {
        List<Producto> productos = productoService.getTodosLosProductos();
        model.addAttribute("listaProductos", productos);
        return "main";
    }

    @GetMapping("/productos")
    public String listarProductos(@RequestParam(name = "page", defaultValue = "1") int paginaActual,
                                  @RequestParam(name = "nombre", required = false) String nombreFiltro,
                                  @RequestParam(name = "categoria", required = false) String categoriaFiltro,

                                  Model model) {

        List<Categoria> categorias = categoriaService.obtenerCategorias();

        int productosPorPagina = 16;

        List<Producto> productos = productoService.getProductosFiltrados(paginaActual, productosPorPagina, nombreFiltro, categoriaFiltro);
        int totalProductos = productoService.getProductCountFiltered(nombreFiltro, categoriaFiltro);
        int totalDePaginas = (int) Math.ceil((double) totalProductos / productosPorPagina);

        model.addAttribute("listaProductos", productos);
        model.addAttribute("paginaActual", paginaActual);
        model.addAttribute("totalDePaginas", totalDePaginas);
        model.addAttribute("nombreFiltro", nombreFiltro != null ? nombreFiltro : "");
        model.addAttribute("categoriaFiltro", categoriaFiltro != null ? categoriaFiltro : "");

        model.addAttribute("categorias", categorias);

        return "productos";
    }

    @GetMapping("/publicidad")
    public String showPublicityPage() {
        return "/publicidad";
    }

    @GetMapping("/perfil")
    public String showPerfil() {
        return "/perfil";
    }

    @GetMapping("/contacto")
    public String showContactPage() {
        return "/contacto";
    }

    @GetMapping("/gestion")
    public String showManagementPage() {
        return "/gestion";
    }

    @GetMapping("/nosotros")
    public String showAboutUsPage() {
        return "/nosotros";
    }
}

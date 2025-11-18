package com.example.demo.Controller.Web;

import com.example.demo.Model.Categoria;
import com.example.demo.Model.Producto;
import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.example.demo.Service.CategoriaService;
import com.example.demo.Service.ProductoService;
import com.example.demo.Service.VentaService;
import jakarta.servlet.http.HttpSession;
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
    private VentaService ventaService;

    public MainController(ProductoService productoService,
                          CategoriaService categoriaService,
                          VentaService ventaService) {
        this.productoService = productoService;
        this.categoriaService = categoriaService;
        this.ventaService = ventaService;
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

    @GetMapping("/servicios")
    public String showServicesPage() {
        return "/servicios";
    }

    @GetMapping("/perfil")
    public String showPerfil(HttpSession session, Model model) {
        Usuario usuarioActual = (Usuario) session.getAttribute("user");

        if (usuarioActual == null) {
            return "redirect:/login";
        }

        List<Venta> compras = ventaService.obtenerVentasPorUsuario(usuarioActual.getId_usuario());

        model.addAttribute("usuario", usuarioActual);
        model.addAttribute("compras", compras);

        return "/perfil";
    }

    @GetMapping("/saltar-error")
    public String showErrorPage() {
        return "/error";
    }

    @GetMapping("/error")
    public String redirectError() {
        return "forward:/saltar-error";
    }
}

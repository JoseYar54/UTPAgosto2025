package com.example.demo.Controller.Api;

import com.example.demo.Model.Producto;
import com.example.demo.Model.Usuario;
import com.example.demo.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/productos")
public class ProductosRestController {

    private ProductoService productoService;
    private UsuarioService usuarioService;

    @Autowired
    public ProductosRestController(
            ProductoService productoService,
            UsuarioService usuarioService
    ){
        this.productoService = productoService;
        this.usuarioService = usuarioService;
    }

    @GetMapping("/todos-productos")
    public List<Producto> getAllProducts() {
        List<Producto> lista = productoService.getTodosLosProductos();
        return lista;
    }

    @GetMapping("/top-10-stock-alto")
    public Map<String,Integer> top10StockAlto(){

        Map<String, Integer> filtro1 = new LinkedHashMap<>();
        filtro1 = productoService.getTodosLosProductos()
                .stream()
                .collect(Collectors.groupingBy(
                        p -> p.getNombre_pro(),
                        Collectors.summingInt(Producto::getStock_pro)
                ));

        Map<String, Integer> datos = new LinkedHashMap<>();

        datos = filtro1
                .entrySet()
                .stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .limit(10)
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        (a, b) -> a,
                        LinkedHashMap::new
                ));
        return datos;
    }

}

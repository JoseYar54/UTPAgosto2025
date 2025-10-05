package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.Producto;

public interface ProductoService {

    List<Producto> getTodosLosProductos();

    Producto getProductoPorId(int id);

    int agregarProducto(Producto producto);

    int actualizarProducto(Producto producto);

    int eliminarProducto(int id);

    boolean existeId(int id);

    List<Producto> getProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoria);

    int getProductCountFiltered(String nombre, String categoria);

    public List<Producto> getProductosPorCategoria(int id_categoria);
}

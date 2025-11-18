package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.Producto;

public interface ProductoService {

    public List<Producto> getTodosLosProductos();

    public List<Producto> getProductosActivos();

    public Producto getProductoPorId(int id);

    public int agregarProducto(Producto producto);

    public int actualizarProducto(Producto producto);

    public int eliminarProducto(int id);

    public boolean existeId(int id);

    public List<Producto> getProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoria);

    public int getProductCountFiltered(String nombre, String categoria);

    public List<Producto> getProductosPorCategoria(int id_categoria);

    public int activarProducto(int id);
}

package com.example.demo.Repository;

import java.util.List;

import com.example.demo.Model.Producto;

public interface ProductoRepository {

    public List<Producto> obtenerProductos();

    public Producto obtenerProductoPorId(int id);

    public int agregarProducto(Producto producto);

    public int actualizarProducto(Producto producto);


    public boolean existeId(int id);

    public List<Producto> obtenerProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoriaNombre);

    public int getCantidadDeDatosObtenidos(String nombre, String categoriaNombre);

    public int eliminarProducto(int idDetalle);

    public List<Producto> obtenerProductosPorCategoria(int id_categoria);
}

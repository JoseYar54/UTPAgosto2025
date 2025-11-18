package com.example.demo.Service.Impl;

import java.util.List;

import com.example.demo.Repository.DAO.ProductoDAO;
import com.example.demo.Service.ProductoService;
import org.springframework.stereotype.Service;

import com.example.demo.Model.Producto;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO productoDAO;

    public ProductoServiceImpl(ProductoDAO productoDAO) {
        this.productoDAO = productoDAO;
    }

    public List<Producto> getTodosLosProductos() {
        return productoDAO.obtenerTodosProductos();
    }

    public int activarProducto(int id){
        return productoDAO.activarProducto(id);
    }

    @Override
    public List<Producto> getProductosActivos() {
        return productoDAO.obtenerProductosActivos();
    }

    public Producto getProductoPorId(int id) {
        return productoDAO.obtenerProductoPorId(id);
    }

    public int agregarProducto(Producto producto) {
        return productoDAO.agregarProducto(producto);
    }

    public int actualizarProducto(Producto producto) {
        return productoDAO.actualizarProducto(producto);
    }

    public int eliminarProducto(int id) {
        return productoDAO.eliminarProducto(id);
    }

    public boolean existeId(int id) {
        return productoDAO.existeId(id);
    }

    public List<Producto> getProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoria) {
        return productoDAO.obtenerProductosFiltrados(pagina, productosPorPagina, nombre, categoria);
    }

    public int getProductCountFiltered(String nombre, String categoria) {
        return productoDAO.getCantidadDeDatosObtenidos(nombre,categoria);
    }

    public List<Producto> getProductosPorCategoria(int id_categoria) {
        return productoDAO.obtenerProductosPorCategoria(id_categoria);
    }

}

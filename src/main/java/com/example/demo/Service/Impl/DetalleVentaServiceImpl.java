package com.example.demo.Service.Impl;

import java.util.List;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Repository.DAO.DetalleVentaDAO;
import com.example.demo.Service.DetalleVentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetalleVentaServiceImpl implements DetalleVentaService {

    @Autowired
    private DetalleVentaDAO detalleVentaDAO;

    // Obtener todos los detalles
    public List<DetalleVenta> obtenerDetalles() {
        return detalleVentaDAO.obtenerDetalles();
    }

    // Obtener detalles por venta
    public List<DetalleVenta> obtenerDetallesPorVenta(int idVenta) {
        return detalleVentaDAO.obtenerDetallesPorVenta(idVenta);
    }

    // Obtener detalle por id
    public DetalleVenta obtenerDetallePorId(int idDetalle) {
        return detalleVentaDAO.obtenerDetallePorId(idDetalle);
    }

    // Obtener detalles por producto (para reportes)
    public List<DetalleVenta> obtenerDetallesPorProducto(int idProducto) {
        return detalleVentaDAO.obtenerDetallesPorProducto(idProducto);
    }

    // Agregar un detalle de venta
    public void agregarDetalleVenta(DetalleVenta detalle) {
        detalleVentaDAO.agregarDetalleVenta(detalle);
    }

    // Actualizar un detalle de venta
    public void actualizarDetalleVenta(DetalleVenta detalle) {
        detalleVentaDAO.actualizarDetalleVenta(detalle);
    }

    // Eliminar detalles de una venta
    public void eliminarDetallesVenta(int idVenta) {
        detalleVentaDAO.eliminarDetallesVenta(idVenta);
    }

    // Eliminar un detalle por su ID de Producto
    public void eliminarDetallePorProducto(int idProducto) {
        detalleVentaDAO.eliminarDetallePorProducto(idProducto);
    }
}

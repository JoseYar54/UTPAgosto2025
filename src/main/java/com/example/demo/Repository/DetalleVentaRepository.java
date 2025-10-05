package com.example.demo.Repository;

import java.util.List;

import com.example.demo.Model.DetalleVenta;

public interface DetalleVentaRepository {

    List<DetalleVenta> obtenerDetalles();

    List<DetalleVenta> obtenerDetallesPorVenta(int idVenta);

    void eliminarDetallesVenta(int idVenta);

    void agregarDetalleVenta(DetalleVenta detalle);

    void actualizarDetalleVenta(DetalleVenta detalle);

    DetalleVenta obtenerDetallePorId(int idDetalle);

    List<DetalleVenta> obtenerDetallesPorProducto(int idProducto);
}

package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.DetalleVenta;

public interface DetalleVentaService {

    public List<DetalleVenta> obtenerDetalles();

    public List<DetalleVenta> obtenerDetallesPorVenta(int idVenta);

    public DetalleVenta obtenerDetallePorId(int idDetalle);

    public List<DetalleVenta> obtenerDetallesPorProducto(int idProducto);

    public void agregarDetalleVenta(DetalleVenta detalle);

    public void actualizarDetalleVenta(DetalleVenta detalle);

    public void eliminarDetallesVenta(int idVenta);

    public void eliminarDetallePorProducto(int idProducto);
}

package com.example.demo.Service;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Venta;

import java.time.LocalDateTime;
import java.util.List;

public interface VentaService {

    public List<Venta> obtenerTodasLasVentas();

    public List<Venta> obtenerVentasActivas();

    public Venta obtenerVentaPorId(int id);

    public int guardarVenta(Venta venta);

    public void actualizarVenta(Venta venta);

    public void eliminarVenta(int id);

    public boolean existeVenta(int id);

    public List<Venta> obtenerVentasPorUsuario(int idUsuario);

    public List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin);
}

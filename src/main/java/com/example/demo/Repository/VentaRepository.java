package com.example.demo.Repository;

import java.time.LocalDateTime;
import java.util.List;

import com.example.demo.Model.Venta;

public interface VentaRepository {

    public List<Venta> obtenerTodasVentas();

    public List<Venta> obtenerVentasActivas();

    public Venta obtenerVentaPorId(int id);

    public int guardarVenta(Venta venta);

    public void actualizarVenta(Venta venta);

    public void eliminarVenta(int id);

    public boolean existeVenta(int id);

    public List<Venta> obtenerVentasPorUsuario(int idUsuario);

    public List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin);
}

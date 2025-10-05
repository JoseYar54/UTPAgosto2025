package com.example.demo.Repository;

import java.time.LocalDateTime;
import java.util.List;

import com.example.demo.Model.Venta;

public interface VentaRepository {

    List<Venta> obtenerVentas();

    Venta obtenerVentaPorId(int id);

    void guardarVenta(Venta venta);

    void actualizarVenta(Venta venta);

    void eliminarVenta(int id);

    boolean existeVenta(int id);

    List<Venta> obtenerVentasPorUsuario(int idUsuario);

    List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin);
}

package com.example.demo.Service.Impl;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Venta;
import com.example.demo.Repository.DAO.VentaDAO;
import com.example.demo.Service.CategoriaService;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.VentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class VentaServiceImpl implements VentaService {

    private final VentaDAO ventaDAO;
    private final DetalleVentaService detalleVentaService;
    private final CategoriaService categoriaService;

    @Autowired
    public VentaServiceImpl(
            VentaDAO ventaDAO,
            DetalleVentaService detalleVentaService,
            CategoriaService categoriaService) {
        this.ventaDAO = ventaDAO;
        this.detalleVentaService = detalleVentaService;
        this.categoriaService = categoriaService;
    }

    @Override
    public List<Venta> obtenerTodasLasVentas() {
        return ventaDAO.obtenerTodasVentas();
    }

    @Override
    public List<Venta> obtenerVentasActivas() {
        return ventaDAO.obtenerVentasActivas();
    }

    @Override
    public Venta obtenerVentaPorId(int id) {
        return ventaDAO.obtenerVentaPorId(id);
    }

    @Override
    public int guardarVenta(Venta venta) {
        return ventaDAO.guardarVenta(venta);
    }

    @Override
    public void actualizarVenta(Venta venta) {
        ventaDAO.actualizarVenta(venta);
    }

    @Override
    public void eliminarVenta(int id) {
        ventaDAO.eliminarVenta(id);
    }

    @Override
    public boolean existeVenta(int id) {
        return ventaDAO.existeVenta(id);
    }

    @Override
    public List<Venta> obtenerVentasPorUsuario(int idUsuario) {
        return ventaDAO.obtenerVentasPorUsuario(idUsuario);
    }

    @Override
    public List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin) {
        return ventaDAO.obtenerVentasPorFecha(inicio, fin);
    }
}

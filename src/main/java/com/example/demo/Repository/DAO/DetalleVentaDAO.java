package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Model.Venta;
import com.example.demo.Model.DetalleVenta;
import com.example.demo.Repository.DetalleVentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DetalleVentaDAO implements DetalleVentaRepository {

    private final JdbcTemplate jdbcTemplate;
    private final VentaDAO ventaDAO;
    private final ProductoDAO productoDAO;

    @Autowired
    public DetalleVentaDAO(
            JdbcTemplate jdbcTemplate,
            VentaDAO ventaDAO,
            ProductoDAO productoDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.ventaDAO = ventaDAO;
        this.productoDAO = productoDAO;
    }

    public List<DetalleVenta> obtenerDetalles() {
        String sql = "SELECT * FROM Detalle_Venta";
        return jdbcTemplate.query(sql, (rs, i) -> mapDetalle(rs));
    }

    public List<DetalleVenta> obtenerDetallesPorVenta(int idVenta) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_venta = ?";
        return jdbcTemplate.query(sql, new Object[]{idVenta}, (rs, i) -> mapDetalle(rs));
    }

    public List<DetalleVenta> obtenerDetallesPorProducto(int idProducto) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_producto = ?";
        return jdbcTemplate.query(sql, new Object[]{idProducto}, (rs, i) -> mapDetalle(rs));
    }

    public DetalleVenta obtenerDetallePorId(int idDetalle) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_detalle = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{idDetalle}, (rs, i) -> mapDetalle(rs));
    }

    public void agregarDetalleVenta(DetalleVenta detalle) {
        detalle.establecerSubtotal_det();
        String sql = "INSERT INTO Detalle_Venta (id_venta, id_producto, cantidad_det, subtotal_det) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                detalle.getVenta().getId_venta(),
                detalle.getProducto().getId_producto(),
                detalle.getCantidad_det(),
                detalle.getSubtotal_det());
    }

    public void actualizarDetalleVenta(DetalleVenta detalle) {
        detalle.establecerSubtotal_det();
        String sql = "UPDATE Detalle_Venta SET id_producto = ?, cantidad_det = ?, subtotal_det = ? WHERE id_detalle = ?";
        jdbcTemplate.update(sql,
                detalle.getProducto().getId_producto(),
                detalle.getCantidad_det(),
                detalle.getSubtotal_det(),
                detalle.getId_detalle());
    }

    public void eliminarDetallesVenta(int idVenta) {
        String sql = "DELETE FROM Detalle_Venta WHERE id_venta = ?";
        jdbcTemplate.update(sql, idVenta);
    }

    public void eliminarDetallePorProducto(int idProducto) {
        String sql = "DELETE FROM Detalle_Venta WHERE id_producto = ?";
        jdbcTemplate.update(sql, idProducto);
    }

    private DetalleVenta mapDetalle(java.sql.ResultSet rs) throws java.sql.SQLException {
        DetalleVenta d = new DetalleVenta();
        d.setId_detalle(rs.getInt("id_detalle"));

        Venta v = new Venta();
        v.setId_venta(rs.getInt("id_venta"));
        d.setVenta(v);

        d.setProducto(productoDAO.obtenerProductoPorId(rs.getInt("id_producto")));
        d.setCantidad_det(rs.getInt("cantidad_det"));
        d.establecerSubtotal_det();
        return d;
    }
}
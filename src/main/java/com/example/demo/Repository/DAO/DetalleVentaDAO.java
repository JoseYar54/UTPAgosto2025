package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Repository.DetalleVentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.DetalleVenta;

@Repository
public class DetalleVentaDAO implements DetalleVentaRepository {

    private JdbcTemplate jdbcTemplate;
    private VentaDAO ventaDAO;
    private ProductoDAO productoDAO;

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
        return jdbcTemplate.query(sql, (rs, i) -> {
            DetalleVenta d = new DetalleVenta();
            d.setId_detalle(rs.getInt("id_detalle"));
            d.setVenta(ventaDAO.obtenerVentaPorId(rs.getInt("id_venta")));
            d.setProducto(productoDAO.obtenerProductoPorId(rs.getInt("id_producto")));
            d.setCantidad_det(rs.getInt("cantidad_det"));
            d.establecerSubtotal_det();
            return d;
        });
    }

    public List<DetalleVenta> obtenerDetallesPorVenta(int idBuscada) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_venta = ?";
        return jdbcTemplate.query(sql, new Object[]{idBuscada}, (rs, i) -> {
            DetalleVenta d = new DetalleVenta();
            d.setId_detalle(rs.getInt("id_detalle"));
            d.setVenta(ventaDAO.obtenerVentaPorId(rs.getInt("id_venta")));
            d.setProducto(productoDAO.obtenerProductoPorId(rs.getInt("id_producto")));
            d.setCantidad_det(rs.getInt("cantidad_det"));
            d.establecerSubtotal_det();
            return d;
        });
    }

    /**
     * Metodo para eliminar los detalles de una venta en la BD
     * @param idVenta venta a la cual se le eliminaran sus detalles
     * */
    public void eliminarDetallesVenta(int idVenta) {
        String sql =
                "DELETE FROM Detalle_venta WHERE id_venta = ?";

        jdbcTemplate.update(sql,idVenta);
    }

    public void agregarDetalleVenta(DetalleVenta detalle) {
        detalle.establecerSubtotal_det();
        String sql = "INSERT INTO Detalle_Venta (id_venta, id_producto, cantidad_det, subtotal_det) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(
                sql,
                detalle.getVenta().getId_venta(),
                detalle.getProducto().getId_producto(),
                detalle.getCantidad_det(),
                detalle.getSubtotal_det()
        );
    }

    /**
     * Elimina todos los detalles de venta asociados a un producto específico
     * @param idProducto ID del producto cuyos detalles se eliminarán
     */
    public void eliminarDetallePorProducto(int idProducto) {
        String sql = "DELETE FROM Detalle_Venta WHERE id_producto = ?";
        jdbcTemplate.update(sql, idProducto);
    }

    public void actualizarDetalleVenta(DetalleVenta detalle) {
        detalle.establecerSubtotal_det(); // recalcular subtotal
        String sql = "UPDATE Detalle_Venta SET id_producto = ?, cantidad_det = ?, subtotal_det = ? WHERE id_detalle = ?";
        jdbcTemplate.update(
                sql,
                detalle.getProducto().getId_producto(),
                detalle.getCantidad_det(),
                detalle.getSubtotal_det(),
                detalle.getId_detalle()
        );
    }

    public DetalleVenta obtenerDetallePorId(int idDetalle) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_detalle = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{idDetalle}, (rs, i) -> {
            DetalleVenta d = new DetalleVenta();
            d.setId_detalle(rs.getInt("id_detalle"));
            d.setVenta(ventaDAO.obtenerVentaPorId(rs.getInt("id_venta")));
            d.setProducto(productoDAO.obtenerProductoPorId(rs.getInt("id_producto")));
            d.setCantidad_det(rs.getInt("cantidad_det"));
            d.establecerSubtotal_det();
            return d;
        });
    }

    /**
     * Esta clase se usara para reportes :D
     * @param idProducto id del producto a buscar detalles, sin importar la venta a la que pertenece
     * */
    public List<DetalleVenta> obtenerDetallesPorProducto(int idProducto) {
        String sql = "SELECT * FROM Detalle_Venta WHERE id_producto = ?";
        return jdbcTemplate.query(sql, new Object[]{idProducto}, (rs, i) -> {
            DetalleVenta d = new DetalleVenta();
            d.setId_detalle(rs.getInt("id_detalle"));
            d.setVenta(ventaDAO.obtenerVentaPorId(rs.getInt("id_venta")));
            d.setProducto(productoDAO.obtenerProductoPorId(rs.getInt("id_producto")));
            d.setCantidad_det(rs.getInt("cantidad_det"));
            d.establecerSubtotal_det();
            return d;
        });
    }
}

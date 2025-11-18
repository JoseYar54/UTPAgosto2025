package com.example.demo.Repository.DAO;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.List;

import com.example.demo.Model.Venta;
import com.example.demo.Repository.VentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class VentaDAO implements VentaRepository {

    private final JdbcTemplate jdbcTemplate;
    private final UsuarioDAO usuarioDAO;
    private final DetalleVentaDAO detalleVentaDAO;

    @Autowired
    @Lazy
    public VentaDAO(JdbcTemplate jdbcTemplate, UsuarioDAO usuarioDAO, DetalleVentaDAO detalleVentaDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.usuarioDAO = usuarioDAO;
        this.detalleVentaDAO = detalleVentaDAO;
    }

    public List<Venta> obtenerTodasVentas() {
        String sql = "SELECT * FROM Venta";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapReutilizable(rs));
    }

    public List<Venta> obtenerVentasActivas() {
        String sql = "SELECT * FROM Venta WHERE estado_venta = TRUE";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapReutilizable(rs));
    }

    public Venta obtenerVentaPorId(int id) {
        String sql = "SELECT * FROM Venta WHERE id_venta = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> mapReutilizable(rs));
    }

    public int guardarVenta(Venta venta) {
        String sql = "INSERT INTO Venta (id_usuario, total_venta, estado_venta, fecha_venta) VALUES (?, ?, TRUE, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();

        if (venta.getFecha_venta() == null) {
            venta.setFecha_venta(LocalDateTime.now());
        }

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, venta.getId_usuario().getId_usuario());
            ps.setDouble(2, venta.getTotal_venta());
            ps.setTimestamp(3, java.sql.Timestamp.valueOf(venta.getFecha_venta()));
            return ps;
        }, keyHolder);

        Number idGenerado = keyHolder.getKey();
        if (idGenerado != null) {
            venta.setId_venta(idGenerado.intValue());
        }
        return venta.getId_venta();
    }


    public void actualizarVenta(Venta venta) {
        if (venta.getDetalles_Venta() != null && !venta.getDetalles_Venta().isEmpty()) {
            venta.getDetalles_Venta().forEach(d -> {
                d.establecerSubtotal_det();
                detalleVentaDAO.agregarDetalleVenta(d);
            });
        }
        venta.establecerTotal_venta();

        String sql = "UPDATE Venta SET fecha_venta = ?, id_usuario = ?, total_venta = ?, estado_venta = ? WHERE id_venta = ?";
        jdbcTemplate.update(sql,
                venta.getFecha_venta(),
                venta.getId_usuario().getId_usuario(),
                venta.getTotal_venta(),
                venta.isEstado_venta(),
                venta.getId_venta());
    }

    public void eliminarVenta(int id) {
        String sql = "UPDATE Venta SET estado_venta = FALSE WHERE id_venta = ?";
        jdbcTemplate.update(sql, id);
    }

    public void reactivarVenta(int id) {
        String sql = "UPDATE Venta SET estado_venta = TRUE WHERE id_venta = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean existeVenta(int id) {
        String sql = "SELECT COUNT(*) FROM Venta WHERE id_venta = ? AND estado_venta = TRUE";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

    public List<Venta> obtenerVentasPorUsuario(int idUsuario) {
        String sql = "SELECT * FROM Venta WHERE id_usuario = ? AND estado_venta = TRUE";
        return jdbcTemplate.query(sql, new Object[]{idUsuario}, (rs, rowNum) -> mapReutilizable(rs));
    }

    public List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin) {
        String sql = "SELECT * FROM Venta WHERE fecha_venta BETWEEN ? AND ? AND estado_venta = TRUE";
        return jdbcTemplate.query(sql, new Object[]{inicio, fin}, (rs, rowNum) -> mapReutilizable(rs));
    }

    private Venta mapReutilizable(java.sql.ResultSet rs) throws java.sql.SQLException {
        Venta venta = new Venta();
        venta.setId_venta(rs.getInt("id_venta"));
        venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
        venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
        venta.setTotal_venta(rs.getDouble("total_venta"));
        venta.setDetalles_Venta(detalleVentaDAO.obtenerDetallesPorVenta(rs.getInt("id_venta")));
        venta.setEstado_venta(rs.getBoolean("estado_venta"));
        return venta;
    }
}
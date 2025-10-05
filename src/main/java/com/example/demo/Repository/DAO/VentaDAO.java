package com.example.demo.Repository.DAO;

import java.time.LocalDateTime;
import java.util.List;

import com.example.demo.Repository.VentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Venta;

@Repository
public class VentaDAO implements VentaRepository {
    
    private JdbcTemplate jdbcTemplate;
    private UsuarioDAO usuarioDAO;

    @Autowired
    public VentaDAO(JdbcTemplate jdbcTemplate, UsuarioDAO usuarioDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.usuarioDAO = usuarioDAO;
    }

    public List<Venta> obtenerVentas() {
        String sql = "SELECT * FROM Venta";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setId_venta(rs.getInt("id_venta"));
            venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
            venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
            venta.setTotal_venta(rs.getDouble("total_venta"));
            
            return venta;
        });
    }

    public Venta obtenerVentaPorId(int id) {
        String sql = "SELECT * FROM Venta WHERE id_venta = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setId_venta(rs.getInt("id_venta"));
            venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
            venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
            venta.setTotal_venta(rs.getDouble("total_venta"));
            return venta;
        });
    }

    public void guardarVenta(Venta venta) {
        String sql = "INSERT INTO Venta (fecha_venta, id_usuario, total_venta) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, venta.getFecha_venta(), venta.getId_usuario().getId_usuario(), venta.getTotal_venta());
    }

    public void actualizarVenta(Venta venta) {
        String sql = "UPDATE Venta SET fecha_venta = ?, id_usuario = ?, total_venta = ? WHERE id_venta = ?";
        jdbcTemplate.update(sql, venta.getFecha_venta(), venta.getId_usuario().getId_usuario(), venta.getTotal_venta(), venta.getId_venta());
    }

    public void eliminarVenta(int id) {
        String sql = "DELETE FROM Venta WHERE id_venta = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean existeVenta(int id) {
        String sql = "SELECT COUNT(*) FROM Venta WHERE id_venta = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

    public List<Venta> obtenerVentasPorUsuario(int idUsuario) {
        String sql = "SELECT * FROM Venta WHERE id_usuario = ?";
        return jdbcTemplate.query(sql, new Object[]{idUsuario}, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setId_venta(rs.getInt("id_venta"));
            venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
            venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
            venta.setTotal_venta(rs.getDouble("total_venta"));
            return venta;
        });
    }

    public List<Venta> obtenerVentasPorFecha(LocalDateTime inicio, LocalDateTime fin) {
        String sql = "SELECT * FROM Venta WHERE fecha_venta BETWEEN ? AND ?";
        return jdbcTemplate.query(sql, new Object[]{inicio, fin}, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setId_venta(rs.getInt("id_venta"));
            venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
            venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
            venta.setTotal_venta(rs.getDouble("total_venta"));
            return venta;
        });
    }

}

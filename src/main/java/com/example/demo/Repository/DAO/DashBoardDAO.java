package com.example.demo.Repository.DAO;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Venta;
import com.example.demo.Repository.DashBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DashBoardDAO implements DashBoardRepository {

    private JdbcTemplate jdbcTemplate;
    private UsuarioDAO usuarioDAO;
    private DetalleVentaDAO detalleVentaDAO;

    @Autowired
    public DashBoardDAO(
            JdbcTemplate jdbcTemplate,
            UsuarioDAO usuarioDAO,
            DetalleVentaDAO detalleVentaDAO
    ){
        this.jdbcTemplate = jdbcTemplate;
        this.usuarioDAO = usuarioDAO;
        this.detalleVentaDAO = detalleVentaDAO;
    }

    @Override
    public List<Venta> ventaPorMes(int mes, int anio){
        String query = "SELECT * FROM VENTA " +
                "WHERE MONTH(fecha_venta) = ? " +
                "AND YEAR(fecha_venta) = ?";

        return jdbcTemplate.query(query,new Object[]{mes,anio},(rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setId_venta(rs.getInt("id_venta"));
            venta.setFecha_venta(rs.getTimestamp("fecha_venta").toLocalDateTime());
            venta.setId_usuario(usuarioDAO.obtenerUsuarioPorId(rs.getInt("id_usuario")));
            venta.setTotal_venta(rs.getDouble("total_venta"));
            venta.setDetalles_Venta(detalleVentaDAO.obtenerDetallesPorVenta(rs.getInt("id_venta")));
            venta.setEstado_venta(rs.getBoolean("estado_venta"));

            System.out.println("--------------------------------------------");
            System.out.println(venta);

            return venta;
        });
    }
}

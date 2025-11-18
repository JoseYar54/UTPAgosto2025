package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Repository.TipoUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.TipoUsuario;

@Repository
public class TipoUsuarioDAO implements TipoUsuarioRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TipoUsuarioDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<TipoUsuario> obtenerTiposUsuario() {
        String sql = "SELECT * FROM Tipo_Usuario WHERE estado_tipo = TRUE";
        return jdbcTemplate.query(sql, (rs, i) -> {
            TipoUsuario tu = new TipoUsuario();
            tu.setId_tipoUsuario(rs.getInt("id_tipousuario"));
            tu.setNombre_tipoUsuario(rs.getString("nombre_tipo"));
            tu.setDescrip_tipoUsuario(rs.getString("descrip_tipo"));
            tu.setActivo_tipoUsuario(rs.getBoolean("estado_tipo"));
            return tu;
        });
    }

    public TipoUsuario obtenerTipoUsuarioPorId(int id) {
        String sql = "SELECT * FROM Tipo_Usuario WHERE id_tipousuario = ? AND estado_tipo = TRUE";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, i) -> {
            TipoUsuario tu = new TipoUsuario();
            tu.setId_tipoUsuario(rs.getInt("id_tipousuario"));
            tu.setNombre_tipoUsuario(rs.getString("nombre_tipo"));
            tu.setDescrip_tipoUsuario(rs.getString("descrip_tipo"));
            tu.setActivo_tipoUsuario(rs.getBoolean("estado_tipo"));
            return tu;
        });
    }

    public void crearTipoUsuario(TipoUsuario tipoUsuario) {
        String sql = "INSERT INTO Tipo_Usuario (nombre_tipo, descrip_tipo, estado_tipo) VALUES (?, ?, TRUE)";
        jdbcTemplate.update(sql, tipoUsuario.getNombre_tipoUsuario(), tipoUsuario.getDescrip_tipoUsuario());
    }

    public void actualizarTipoUsuario(TipoUsuario tipoUsuario) {
        String sql = "UPDATE Tipo_Usuario SET nombre_tipo = ?, descrip_tipo = ?, estado_tipo = ? WHERE id_tipousuario = ?";
        jdbcTemplate.update(sql,
                tipoUsuario.getNombre_tipoUsuario(),
                tipoUsuario.getDescrip_tipoUsuario(),
                tipoUsuario.isActivo_tipoUsuario(),  // ahora es boolean
                tipoUsuario.getId_tipoUsuario());
    }

    public void eliminarTipoUsuario(int id) {
        String sql = "UPDATE Tipo_Usuario SET estado_tipo = FALSE WHERE id_tipousuario = ?";
        jdbcTemplate.update(sql, id);
    }

    public void reactivarTipoUsuario(int id) {
        String sql = "UPDATE Tipo_Usuario SET estado_tipo = TRUE WHERE id_tipousuario = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean existeId(int id) {
        String sql = "SELECT COUNT(*) FROM Tipo_Usuario WHERE id_tipousuario = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }
}

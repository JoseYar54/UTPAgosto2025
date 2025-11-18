package com.example.demo.Repository.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.example.demo.Repository.UsuarioRepository;
import com.example.demo.Model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO implements UsuarioRepository {

    private final JdbcTemplate jdbcTemplate;
    private final TipoUsuarioDAO tipoUsuarioDAO;

    @Autowired
    public UsuarioDAO(JdbcTemplate jdbcTemplate, TipoUsuarioDAO tipoUsuarioDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.tipoUsuarioDAO = tipoUsuarioDAO;
    }

    public List<Usuario> obtenerUsuariosTodos() {
        String sql = "SELECT * FROM Usuario";
        return jdbcTemplate.query(sql, (rs, i) -> mapUsuario(rs));
    }

    public List<Usuario> obtenerUsuariosValidos() {
        String sql = "SELECT * FROM Usuario WHERE estado_user = TRUE";
        return jdbcTemplate.query(sql, (rs, i) -> mapUsuario(rs));
    }

    public Usuario obtenerUsuarioPorId(int id) {
        String sql = "SELECT * FROM Usuario WHERE id_usuario = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, i) -> mapUsuario(rs));
    }

    public boolean crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuario (nombre_user, apaterno_user, amaterno_user, correo_user, password, telefono_user, estado_user, tipo_user) " +
                "VALUES (?, ?, ?, ?, ?, ?, TRUE, ?)";
        int registrados = jdbcTemplate.update(sql,
                usuario.getNombre_user(),
                usuario.getApaterno_user(),
                usuario.getAmaterno_user(),
                usuario.getCorreo_user(),
                usuario.getPassword(),
                usuario.getTelefono_user(),
                usuario.getTipo_user().getId_tipoUsuario()
        );
        return registrados > 0;
    }

    public void actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE Usuario SET nombre_user = ?, apaterno_user = ?, amaterno_user = ?, correo_user = ?, telefono_user = ?, password = ?, tipo_user = ?, estado_user = ? " +
                "WHERE id_usuario = ?";
        jdbcTemplate.update(sql,
                usuario.getNombre_user(),
                usuario.getApaterno_user(),
                usuario.getAmaterno_user(),
                usuario.getCorreo_user(),
                usuario.getTelefono_user(),
                usuario.getPassword(),
                usuario.getTipo_user().getId_tipoUsuario(),
                usuario.isEstado_user(),
                usuario.getId_usuario());
    }

    public void eliminarUsuario(int id) {
        String sql = "UPDATE Usuario SET estado_user = FALSE WHERE id_usuario = ?";
        jdbcTemplate.update(sql, id);
    }

    public void reactivarUsuario(int id) {
        String sql = "UPDATE Usuario SET estado_user = TRUE WHERE id_usuario = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean existerUsuarioPorCorreo(String correo) {
        String sql = "SELECT COUNT(*) FROM Usuario WHERE correo_user = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{correo}, Integer.class);
        return count != null && count > 0;
    }

    public Usuario buscarPorCorreo(String correo) {
        String sql = "SELECT * FROM Usuario WHERE correo_user = ? AND estado_user = TRUE";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{correo}, (rs, i) -> mapUsuario(rs));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private Usuario mapUsuario(ResultSet rs) throws SQLException {
        Usuario u = new Usuario();
        u.setId_usuario(rs.getInt("id_usuario"));
        u.setNombre_user(rs.getString("nombre_user"));
        u.setApaterno_user(rs.getString("apaterno_user"));
        u.setAmaterno_user(rs.getString("amaterno_user"));
        u.setCorreo_user(rs.getString("correo_user"));
        u.setTelefono_user(rs.getString("telefono_user"));
        u.setEstado_user(rs.getBoolean("estado_user"));
        u.setPassword(rs.getString("password"));
        Integer tipoId = rs.getInt("tipo_user");
        u.setTipo_user(tipoId != 0 ? tipoUsuarioDAO.obtenerTipoUsuarioPorId(tipoId) : null);
        return u;
    }
}
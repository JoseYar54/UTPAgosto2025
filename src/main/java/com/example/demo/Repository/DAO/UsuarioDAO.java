package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Usuario;

@Repository
public class UsuarioDAO implements UsuarioRepository {

    private JdbcTemplate jdbcTemplate;
    private TipoUsuarioDAO tipoUsuarioDAO;

    @Autowired
    public UsuarioDAO(JdbcTemplate jdbcTemplate, TipoUsuarioDAO tipoUsuarioDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.tipoUsuarioDAO = tipoUsuarioDAO;
    }

    // Metodos para operaciones CRUD
    public List<Usuario> obtenerUsuarios() {
        String sql = "SELECT * FROM Usuario";

        return jdbcTemplate.query(sql, (resultSet, i) -> {
            Usuario u = new Usuario();
            u.setId_usuario(resultSet.getInt("id_usuario"));
            u.setNombre_user(resultSet.getString("nombre_user"));
            u.setApaterno_user(resultSet.getString("apaterno_user"));
            u.setAmaterno_user(resultSet.getString("amaterno_user"));
            u.setCorreo_user(resultSet.getString("correo_user"));
            u.setTelefono_user(resultSet.getString("telefono_user"));
            u.setEstado_user(resultSet.getBoolean("estado_user"));
            u.setTipo_user(tipoUsuarioDAO.obtenerTipoUsuarioPorId(resultSet.getInt("tipo_user")));
            return u;
        });
    }

    public Usuario obtenerUsuarioPorId(int id) {
        String sql = "SELECT * FROM Usuario WHERE id_usuario = ?";

        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (resultSet, i) -> {
            Usuario u = new Usuario();
            u.setId_usuario(resultSet.getInt("id_usuario"));
            u.setNombre_user(resultSet.getString("nombre_user"));
            u.setApaterno_user(resultSet.getString("apaterno_user"));
            u.setAmaterno_user(resultSet.getString("amaterno_user"));
            u.setCorreo_user(resultSet.getString("correo_user"));
            u.setTelefono_user(resultSet.getString("telefono_user"));
            u.setEstado_user(resultSet.getBoolean("estado_user"));
            u.setTipo_user(tipoUsuarioDAO.obtenerTipoUsuarioPorId(resultSet.getInt("tipo_user")));
            return u;
        });
    }

    public void crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuario (nombre_user, apaterno_user, amaterno_user, correo_user, telefono_user, estado_user, tipo_user) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, usuario.getNombre_user(), usuario.getApaterno_user(), usuario.getAmaterno_user(), usuario.getCorreo_user(), usuario.getTelefono_user(), usuario.isEstado_user(), usuario.getTipo_user().getId_tipoUsuario());
    }

    public void actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE Usuario SET nombre_user = ?, apaterno_user = ?, amaterno_user = ?, correo_user = ?, telefono_user = ?, estado_user = ?, tipo_user = ? WHERE id_usuario = ?";
        jdbcTemplate.update(sql, usuario.getNombre_user(), usuario.getApaterno_user(), usuario.getAmaterno_user(), usuario.getCorreo_user(), usuario.getTelefono_user(), usuario.isEstado_user(), usuario.getTipo_user().getId_tipoUsuario(), usuario.getId_usuario());
    }

    public void eliminarUsuario(int id) {
        String sql = "DELETE FROM Usuario WHERE id_usuario = ?";
        jdbcTemplate.update(sql, id);
    }

    public boolean existerUsuarioPorCorreo(String correo) {
        String sql = "SELECT COUNT(*) FROM Usuario WHERE correo_user = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{correo}, Integer.class);
        return count != null && count > 0;
    }

    public Usuario buscarPorCorreo(String correo) {
        String sql = "SELECT * FROM Usuario WHERE correo_user = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{correo}, (resultSet, i) -> {
                Usuario u = new Usuario();
                u.setId_usuario(resultSet.getInt("id_usuario"));
                u.setNombre_user(resultSet.getString("nombre_user"));
                u.setApaterno_user(resultSet.getString("apaterno_user"));
                u.setAmaterno_user(resultSet.getString("amaterno_user"));
                u.setCorreo_user(resultSet.getString("correo_user"));
                u.setTelefono_user(resultSet.getString("telefono_user"));
                u.setEstado_user(resultSet.getBoolean("estado_user"));
                u.setPassword(resultSet.getString("password"));
                u.setTipo_user(tipoUsuarioDAO.obtenerTipoUsuarioPorId(resultSet.getInt("tipo_user")));
                return u;
            });
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

}

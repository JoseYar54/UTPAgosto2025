package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Repository.TipoUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.TipoUsuario;

@Repository
public class TipoUsuarioDAO implements TipoUsuarioRepository {
    
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public TipoUsuarioDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Métodos para operaciones CRUD 
    public List<TipoUsuario> obtenerTiposUsuario() {
        String sql = "SELECT * FROM Tipo_Usuario";

        return jdbcTemplate.query(sql, (resultSet, i) -> {
            TipoUsuario tu = new TipoUsuario();
            tu.setId_tipoUsuario(resultSet.getInt("id_tipousuario"));
            tu.setNombre_tipoUsuario(resultSet.getString("nombre_tipo"));
            tu.setDescrip_tipoUsuario(resultSet.getString("descrip_tipo"));
            return tu;
        });
    }

    public TipoUsuario obtenerTipoUsuarioPorId(int id) {
        String sql = "SELECT * FROM Tipo_Usuario WHERE id_tipousuario = ?";

        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (resultSet, i) -> {
            TipoUsuario tu = new TipoUsuario();
            tu.setId_tipoUsuario(resultSet.getInt("id_tipousuario"));
            tu.setNombre_tipoUsuario(resultSet.getString("nombre_tipo"));
            tu.setDescrip_tipoUsuario(resultSet.getString("descrip_tipo"));
            return tu;
        });
    }

    public void crearTipoUsuario(TipoUsuario tipoUsuario) {
        String sql = "INSERT INTO Tipo_Usuario (nombre_tipo, descrip_tipo) VALUES (?, ?)";
        jdbcTemplate.update(sql, tipoUsuario.getNombre_tipoUsuario(), tipoUsuario.getDescrip_tipoUsuario());
    }

    public void actualizarTipoUsuario(TipoUsuario tipoUsuario) {
        String sql = "UPDATE Tipo_Usuario SET nombre_tipo = ?, descrip_tipo = ? WHERE id_tipousuario = ?";
        jdbcTemplate.update(sql, tipoUsuario.getNombre_tipoUsuario(), tipoUsuario.getDescrip_tipoUsuario(), tipoUsuario.getId_tipoUsuario());
    }

    public void eliminarTipoUsuario(int id) {
        String sql = "DELETE FROM Tipo_Usuario WHERE id_tipousuario = ?";
        jdbcTemplate.update(sql, id);
    }

}

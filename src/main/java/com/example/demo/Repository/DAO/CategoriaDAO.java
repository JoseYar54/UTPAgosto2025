package com.example.demo.Repository.DAO;

import java.util.List;

import com.example.demo.Repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Categoria;

@Repository
public class CategoriaDAO implements CategoriaRepository {

    
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public CategoriaDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Método para obtener todas las categorías
    public List<Categoria> obtenerCategorias() {
        String sql = "SELECT * FROM Categoria";

        return jdbcTemplate.query(sql, (resultSet, i) -> {
            Categoria c = new Categoria();
            c.setId_categoria(resultSet.getInt("id_categoria"));
            c.setNombre_cate(resultSet.getString("nombre_cate"));
            c.setDescrip_cate(resultSet.getString("descrip_cate"));
            return c;
        });
    }

    // Método para obtener una categoría por su ID
    public Categoria obtenerCategoriaPorId(int id) {
        String sql = "SELECT * FROM Categoria WHERE id_categoria = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (resultSet, i) -> {
            Categoria c = new Categoria();
            c.setId_categoria(resultSet.getInt("id_categoria"));
            c.setNombre_cate(resultSet.getString("nombre_cate"));
            c.setDescrip_cate(resultSet.getString("descrip_cate"));
            return c;
        });
    }

    // Método para agregar una nueva categoría
    public int agregarCategoria(Categoria categoria) {
        String sql = "INSERT INTO Categoria (nombre_cate, descrip_cate) VALUES (?, ?)";
        return jdbcTemplate.update(sql, categoria.getNombre_cate(), categoria.getDescrip_cate());
    }

    // Método para actualizar una categoría existente
    public int actualizarCategoria(Categoria categoria) {
        String sql = "UPDATE Categoria SET nombre_cate = ?, descrip_cate = ? WHERE id_categoria = ?";
        return jdbcTemplate.update(sql, categoria.getNombre_cate(), categoria.getDescrip_cate(), categoria.getId_categoria());
    }

    // Método para eliminar una categoría por su ID
    public int eliminarCategoria(int id) {
        String sql = "DELETE FROM Categoria WHERE id_categoria = ?";
        return jdbcTemplate.update(sql, id);
    }

    // Método para verificar si una categoría existe por su ID
    public boolean existeId(int id) {
        String sql = "SELECT COUNT(*) FROM Categoria WHERE id_categoria = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

}
package com.example.demo.Repository.DAO;

import com.example.demo.Model.Categoria;
import com.example.demo.Repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoriaDAO implements CategoriaRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public CategoriaDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Categoria> obtenerCategorias() {
        String sql = "SELECT * FROM Categoria WHERE estado_cate = TRUE";
        return jdbcTemplate.query(sql, (rs, i) -> mapCategoria(rs));
    }

    public List<Categoria> obtenerCategoriasTodas() {
        String sql = "SELECT * FROM Categoria";
        return jdbcTemplate.query(sql, (rs, i) -> mapCategoria(rs));
    }

    @Override
    public Categoria obtenerCategoriaPorId(int id) {
        String sql = "SELECT * FROM Categoria WHERE id_categoria = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, i) -> mapCategoria(rs));
    }

    @Override
    public int agregarCategoria(Categoria categoria) {
        String sql = "INSERT INTO Categoria (nombre_cate, descrip_cate, estado_cate) VALUES (?, ?, TRUE)";
        return jdbcTemplate.update(sql, categoria.getNombre_cate(), categoria.getDescrip_cate());
    }

    @Override
    public int actualizarCategoria(Categoria categoria) {
        String sql = "UPDATE Categoria SET nombre_cate = ?, descrip_cate = ?, estado_cate = ? WHERE id_categoria = ?";
        return jdbcTemplate.update(sql,
                categoria.getNombre_cate(),
                categoria.getDescrip_cate(),
                categoria.isActivo_cate(),
                categoria.getId_categoria());
    }

    @Override
    public int eliminarCategoria(int id) {
        String sql = "UPDATE Categoria SET estado_cate = FALSE WHERE id_categoria = ?";
        return jdbcTemplate.update(sql, id);
    }

    public int activarCategoria(int id) {
        String sql = "UPDATE Categoria SET estado_cate = TRUE WHERE id_categoria = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public boolean existeId(int id) {
        String sql = "SELECT COUNT(*) FROM Categoria WHERE id_categoria = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

    public List<Categoria> obtenerCategoriasFiltradas(int pagina, int categoriasPorPagina, String nombre, boolean incluirInactivas) {
        int offset = (pagina - 1) * categoriasPorPagina;
        String sql = "SELECT * FROM Categoria WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (!incluirInactivas) {
            sql += " AND estado_cate = TRUE";
        }

        // Filtro por nombre
        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND nombre_cate LIKE ?";
            params.add("%" + nombre + "%");
        }

        sql += " LIMIT ? OFFSET ?";
        params.add(categoriasPorPagina);
        params.add(offset);

        return jdbcTemplate.query(sql, params.toArray(), (rs, i) -> mapCategoria(rs));
    }

    public int getCantidadDeCategorias(String nombre, boolean incluirInactivas) {
        String sql = "SELECT COUNT(*) FROM Categoria WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (!incluirInactivas) {
            sql += " AND estado_cate = TRUE";
        }

        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND nombre_cate LIKE ?";
            params.add("%" + nombre + "%");
        }

        return jdbcTemplate.queryForObject(sql, params.toArray(), Integer.class);
    }

    private Categoria mapCategoria(java.sql.ResultSet rs) throws java.sql.SQLException {
        Categoria c = new Categoria();
        c.setId_categoria(rs.getInt("id_categoria"));
        c.setNombre_cate(rs.getString("nombre_cate"));
        c.setDescrip_cate(rs.getString("descrip_cate"));
        c.setActivo_cate(rs.getBoolean("estado_cate"));
        return c;
    }
}

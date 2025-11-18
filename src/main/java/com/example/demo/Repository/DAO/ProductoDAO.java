package com.example.demo.Repository.DAO;

import com.example.demo.Model.Producto;
import com.example.demo.Repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductoDAO implements ProductoRepository {
    private final JdbcTemplate jdbcTemplate;
    private final CategoriaDAO categoriaDAO;

    @Autowired
    public ProductoDAO(JdbcTemplate jdbcTemplate, CategoriaDAO categoriaDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.categoriaDAO = categoriaDAO;
    }

    public List<Producto> obtenerTodosProductos() {
        String sql = "SELECT * FROM Producto";
        return jdbcTemplate.query(sql, (rs, i) -> mapProducto(rs));
    }

    @Override
    public List<Producto> obtenerProductosActivos() {
        String sql = "SELECT * FROM Producto WHERE estado_pro = TRUE";
        return jdbcTemplate.query(sql, (rs, i) -> mapProducto(rs));
    }

    public Producto obtenerProductoPorId(int id) {
        String sql = "SELECT * FROM Producto WHERE id_producto = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, i) -> mapProducto(rs));
    }

    public List<Producto> obtenerProductosPorCategoria(int id_categoria) {
        String sql = "SELECT * FROM Producto WHERE categoria_pro = ?";
        return jdbcTemplate.query(sql, new Object[]{id_categoria}, (rs, i) -> mapProducto(rs));
    }

    public int agregarProducto(Producto producto) {
        String sql = "INSERT INTO Producto (nombre_pro, descrip_pro, categoria_pro, stock_pro, anio_pro, precio_pro, url_pro, estado_pro) VALUES (?, ?, ?, ?, ?, ?, ?, TRUE)";
        return jdbcTemplate.update(sql,
                producto.getNombre_pro(),
                producto.getDescrip_pro(),
                producto.getCategoria_pro().getId_categoria(),
                producto.getStock_pro(),
                producto.getAnio_pro(),
                producto.getPrecio_pro(),
                producto.getUrl_pro());
    }

    public int actualizarProducto(Producto producto) {
        String sql = "UPDATE Producto SET nombre_pro = ?, descrip_pro = ?, categoria_pro = ?, stock_pro = ?, anio_pro = ?, precio_pro = ?, url_pro = ?, estado_pro = ? WHERE id_producto = ?";
        return jdbcTemplate.update(sql,
                producto.getNombre_pro(),
                producto.getDescrip_pro(),
                producto.getCategoria_pro().getId_categoria(),
                producto.getStock_pro(),
                producto.getAnio_pro(),
                producto.getPrecio_pro(),
                producto.getUrl_pro(),
                producto.isActivo_pro(),
                producto.getId_producto());
    }

    public int eliminarProducto(int id) {
        String sql = "UPDATE Producto SET estado_pro = FALSE WHERE id_producto = ?";
        return jdbcTemplate.update(sql, id);
    }

    public int activarProducto(int id) {
        String sql = "UPDATE Producto SET estado_pro = TRUE WHERE id_producto = ?";
        return jdbcTemplate.update(sql, id);
    }

    public boolean existeId(int id) {
        String sql = "SELECT COUNT(*) FROM Producto WHERE id_producto = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

    public List<Producto> obtenerProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoriaNombre) {
        int indice = (pagina - 1) * productosPorPagina;
        String sql = "SELECT p.* FROM Producto p";
        List<Object> parametros = new ArrayList<>();

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " INNER JOIN Categoria c ON p.categoria_pro = c.id_categoria";
        }

        sql += " WHERE p.estado_pro = TRUE";

        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND p.nombre_pro LIKE ?";
            parametros.add("%" + nombre + "%");
        }

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " AND LOWER(c.nombre_cate) = ? AND c.estado_cate = TRUE";
            parametros.add(categoriaNombre.toLowerCase());
        }

        sql += " LIMIT ? OFFSET ?";
        parametros.add(productosPorPagina);
        parametros.add(indice);

        return jdbcTemplate.query(sql, parametros.toArray(), (rs, i) -> mapProducto(rs));
    }

    public int getCantidadDeDatosObtenidos(String nombre, String categoriaNombre) {
        String sql = "SELECT COUNT(*) FROM Producto p";
        List<Object> params = new ArrayList<>();

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " INNER JOIN Categoria c ON p.categoria_pro = c.id_categoria";
        }

        sql += " WHERE p.estado_pro = TRUE";

        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND p.nombre_pro LIKE ?";
            params.add("%" + nombre + "%");
        }

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " AND LOWER(c.nombre_cate) = ? AND c.estado_cate = TRUE";
            params.add(categoriaNombre.toLowerCase());
        }

        return jdbcTemplate.queryForObject(sql, params.toArray(), Integer.class);
    }

    private Producto mapProducto(java.sql.ResultSet rs) throws java.sql.SQLException {
        Producto p = new Producto();
        p.setId_producto(rs.getInt("id_producto"));
        p.setNombre_pro(rs.getString("nombre_pro"));
        p.setDescrip_pro(rs.getString("descrip_pro"));
        p.setPrecio_pro(rs.getDouble("precio_pro"));
        p.setAnio_pro(rs.getInt("anio_pro"));
        p.setCategoria_pro(categoriaDAO.obtenerCategoriaPorId(rs.getInt("categoria_pro")));
        p.setStock_pro(rs.getInt("stock_pro"));
        p.setUrl_pro(rs.getString("url_pro"));
        p.setActivo_pro(rs.getBoolean("estado_pro"));
        return p;
    }
}
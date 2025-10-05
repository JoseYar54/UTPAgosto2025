package com.example.demo.Repository.DAO;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.Repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.Model.Producto;

@Repository
public class ProductoDAO implements ProductoRepository {
    private JdbcTemplate jdbcTemplate;
    private CategoriaDAO categoriaDAO;
    private DetalleVentaDAO detalleVentaDAO;

    @Autowired
    public ProductoDAO(JdbcTemplate jdbcTemplate, CategoriaDAO categoriaDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.categoriaDAO = categoriaDAO;
    }

    // Aquí puedes agregar métodos para interactuar con la tabla Producto
    public List<Producto> obtenerProductos() {
        String sql = "SELECT * FROM Producto";
        return jdbcTemplate.query(sql, (resultSet, i) -> {
            Producto p = new Producto();
            p.setId_producto(resultSet.getInt("id_producto"));
            p.setNombre_pro(resultSet.getString("nombre_pro"));
            p.setDescrip_pro(resultSet.getString("descrip_pro"));
            p.setPrecio_pro(resultSet.getDouble("precio_pro"));
            p.setAnio_pro(resultSet.getInt("anio_pro"));
            p.setCategoria_pro(categoriaDAO.obtenerCategoriaPorId(resultSet.getInt("categoria_pro")));
            p.setStock_pro(resultSet.getInt("stock_pro"));
            p.setUrl_pro(resultSet.getString("url_pro"));
            return p;
        });
    }

    // Metodo para buscar un producto por su ID
    public Producto obtenerProductoPorId(int id) {
        String sql = "SELECT * FROM Producto WHERE id_producto = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (resultSet, i) -> {
            Producto p = new Producto();
            p.setId_producto(resultSet.getInt("id_producto"));
            p.setNombre_pro(resultSet.getString("nombre_pro"));
            p.setDescrip_pro(resultSet.getString("descrip_pro"));
            p.setPrecio_pro(resultSet.getDouble("precio_pro"));
            p.setAnio_pro(resultSet.getInt("anio_pro"));
            p.setCategoria_pro(categoriaDAO.obtenerCategoriaPorId(resultSet.getInt("categoria_pro")));
            p.setStock_pro(resultSet.getInt("stock_pro"));
            p.setUrl_pro(resultSet.getString("url_pro"));
            return p;
        });
    }

    // Método para obtener productos por categoría
    public List<Producto> obtenerProductosPorCategoria(int id_categoria) {
        String sql = "SELECT * FROM Producto WHERE categoria_pro = ?";
        return jdbcTemplate.query(sql, new Object[]{id_categoria}, (rs, rowNum) -> {
            Producto p = new Producto();
            p.setId_producto(rs.getInt("id_producto"));
            p.setNombre_pro(rs.getString("nombre_pro"));
            p.setDescrip_pro(rs.getString("descrip_pro"));
            p.setPrecio_pro(rs.getDouble("precio_pro"));
            p.setAnio_pro(rs.getInt("anio_pro"));
            p.setCategoria_pro(categoriaDAO.obtenerCategoriaPorId(rs.getInt("categoria_pro")));
            p.setStock_pro(rs.getInt("stock_pro"));
            p.setUrl_pro(rs.getString("url_pro"));
            return p;
        });
    }

    // Metodos para agregar, actualizar y eliminar productos
    public int agregarProducto(Producto producto) {
        String sql = "INSERT INTO Producto (nombre_pro, descrip_pro, categoria_pro, stock_pro, anio_pro, precio_pro, url_pro) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, producto.getNombre_pro(), producto.getDescrip_pro(), producto.getCategoria_pro().getId_categoria(), producto.getStock_pro(), producto.getAnio_pro(), producto.getPrecio_pro(), producto.getUrl_pro());
    }

    public int actualizarProducto(Producto producto) {
        String sql = "UPDATE Producto SET nombre_pro = ?, descrip_pro = ?, categoria_pro = ?, stock_pro = ?, anio_pro = ?, precio_pro = ?, url_pro = ? WHERE id_producto = ?";
        return jdbcTemplate.update(sql, producto.getNombre_pro(), producto.getDescrip_pro(), producto.getCategoria_pro().getId_categoria(), producto.getStock_pro(), producto.getAnio_pro(), producto.getPrecio_pro(), producto.getUrl_pro(), producto.getId_producto());
    }

    public int eliminarProducto(int id) {
        String sql = "DELETE FROM Producto WHERE id_producto = ?";
        return jdbcTemplate.update(sql, id);
    }

    public boolean existeId(int id) {
        String sql = "SELECT COUNT(*) FROM Producto WHERE id_producto = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count != null && count > 0;
    }

    // :D //////////////////////////////////////////////
    //METODOS PARA EL FILTRADO DE PRODUCTOS


    public List<Producto> obtenerProductosFiltrados(int pagina, int productosPorPagina, String nombre, String categoriaNombre) {
        int offset = (pagina - 1) * productosPorPagina;

        String sql = "SELECT p.* FROM Producto p";
        List<Object> params = new ArrayList<>();

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " INNER JOIN Categoria c ON p.categoria_pro = c.id_categoria";
        }

        sql += " WHERE 1=1";

        // Filtro por nombre del producto
        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND p.nombre_pro LIKE ?";
            params.add("%" + nombre + "%");
        }

        // Filtro por nombre de categoría
        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " AND LOWER(c.nombre_cate) = ?";
            params.add(categoriaNombre.toLowerCase());
        }

        // Paginación
        sql += " LIMIT ? OFFSET ?";
        params.add(productosPorPagina);
        params.add(offset);

        return jdbcTemplate.query(sql, params.toArray(), (rs, rowNum) -> {
            Producto p = new Producto();
            p.setId_producto(rs.getInt("id_producto"));
            p.setNombre_pro(rs.getString("nombre_pro"));
            p.setDescrip_pro(rs.getString("descrip_pro"));
            p.setPrecio_pro(rs.getDouble("precio_pro"));
            p.setAnio_pro(rs.getInt("anio_pro"));
            p.setCategoria_pro(categoriaDAO.obtenerCategoriaPorId(rs.getInt("categoria_pro")));
            p.setStock_pro(rs.getInt("stock_pro"));
            p.setUrl_pro(rs.getString("url_pro"));
            return p;
        });
    }

    public int getCantidadDeDatosObtenidos(String nombre, String categoriaNombre) {
        String sql = "SELECT COUNT(*) FROM Producto p";
        List<Object> params = new ArrayList<>();

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " INNER JOIN Categoria c ON p.categoria_pro = c.id_categoria";
        }

        sql += " WHERE 1=1";

        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND p.nombre_pro LIKE ?";
            params.add("%" + nombre + "%");
        }

        if (categoriaNombre != null && !categoriaNombre.isEmpty()) {
            sql += " AND LOWER(c.nombre_cate) = ?";
            params.add(categoriaNombre.toLowerCase());
        }

        return jdbcTemplate.queryForObject(sql, params.toArray(), Integer.class);
    }




}

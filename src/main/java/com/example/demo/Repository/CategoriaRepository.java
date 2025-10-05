package com.example.demo.Repository;

import java.util.List;
import com.example.demo.Model.Categoria;

public interface CategoriaRepository {

    public List<Categoria> obtenerCategorias();

    public Categoria obtenerCategoriaPorId(int id);

    public int agregarCategoria(Categoria categoria);

    public int actualizarCategoria(Categoria categoria);

    public int eliminarCategoria(int id);

    public boolean existeId(int id);
}
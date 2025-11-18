package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.Categoria;

public interface CategoriaService {

    public List<Categoria> obtenerCategorias();

    public List<Categoria> obtenerCategoriasTodas();

    public Categoria obtenerCategoriaPorId(int id);

    public int agregarCategoria(Categoria categoria);

    public int actualizarCategoria(Categoria categoria);

    public int eliminarCategoria(int id);

    public boolean existeId(int id);
}

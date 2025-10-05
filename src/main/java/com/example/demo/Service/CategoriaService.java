package com.example.demo.Service;

import java.util.List;
import com.example.demo.Model.Categoria;

public interface CategoriaService {

    List<Categoria> obtenerCategorias();

    Categoria obtenerCategoriaPorId(int id);

    int agregarCategoria(Categoria categoria);

    int actualizarCategoria(Categoria categoria);

    int eliminarCategoria(int id);

    boolean existeId(int id);
}

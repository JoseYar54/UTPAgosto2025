package com.example.demo.Service.Impl;

import java.util.List;

import com.example.demo.Service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.Model.Categoria;
import com.example.demo.Repository.CategoriaRepository;
import org.springframework.stereotype.Service;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    public List<Categoria> obtenerCategorias(){
        return categoriaRepository.obtenerCategorias();
    }

    public Categoria obtenerCategoriaPorId(int id){
        return categoriaRepository.obtenerCategoriaPorId(id);
    }

    public int agregarCategoria(Categoria categoria){
        return categoriaRepository.agregarCategoria(categoria);
    }

    public int actualizarCategoria(Categoria categoria){
        return categoriaRepository.actualizarCategoria(categoria);
    }

    public int eliminarCategoria(int id){
        return categoriaRepository.eliminarCategoria(id);
    }

    public boolean existeId(int id){
        return categoriaRepository.existeId(id);
    }
}

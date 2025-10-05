package com.example.demo.Repository;

import java.util.List;

import com.example.demo.Model.TipoUsuario;

public interface TipoUsuarioRepository {

    List<TipoUsuario> obtenerTiposUsuario();

    TipoUsuario obtenerTipoUsuarioPorId(int id);

    void crearTipoUsuario(TipoUsuario tipoUsuario);

    void actualizarTipoUsuario(TipoUsuario tipoUsuario);

    void eliminarTipoUsuario(int id);
}

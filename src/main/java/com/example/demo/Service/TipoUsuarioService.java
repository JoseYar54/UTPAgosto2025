package com.example.demo.Service;

import com.example.demo.Model.TipoUsuario;

import java.util.List;

public interface TipoUsuarioService {
    List<TipoUsuario> obtenerTiposUsuario();

    TipoUsuario obtenerTipoUsuarioPorId(int id);

    void crearTipoUsuario(TipoUsuario tipoUsuario);

    void actualizarTipoUsuario(TipoUsuario tipoUsuario);

    void eliminarTipoUsuario(int id);
}

package com.example.demo.Repository;

import java.util.List;

import com.example.demo.Model.Usuario;

public interface UsuarioRepository {

    List<Usuario> obtenerUsuarios();

    Usuario obtenerUsuarioPorId(int id);

    void crearUsuario(Usuario usuario);

    void actualizarUsuario(Usuario usuario);

    void eliminarUsuario(int id);

    boolean existerUsuarioPorCorreo(String correo);

    Usuario buscarPorCorreo(String correo);
}

package com.example.demo.Repository;

import java.util.List;

import com.example.demo.Model.Usuario;

public interface UsuarioRepository {

    public List<Usuario> obtenerUsuariosTodos();

    public List<Usuario> obtenerUsuariosValidos();

    public Usuario obtenerUsuarioPorId(int id);

    public boolean crearUsuario(Usuario usuario);

    public void actualizarUsuario(Usuario usuario);

    public void eliminarUsuario(int id);

    public boolean existerUsuarioPorCorreo(String correo);

    public Usuario buscarPorCorreo(String correo);
}

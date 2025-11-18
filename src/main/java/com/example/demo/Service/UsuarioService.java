package com.example.demo.Service;

import com.example.demo.Model.Usuario;
import jakarta.servlet.http.HttpSession;

import java.util.List;

public interface UsuarioService {

    public Usuario login(String correo, String password);

    public List<Usuario> obtenerUsuariosTodos();

    public List<Usuario> obtenerUsuariosValidos();

    public Usuario obtenerUsuarioPorId(int id);

    public boolean crearUsuario(Usuario usuario);

    public void actualizarUsuario(Usuario usuario);

    public void eliminarUsuario(int id);

    public boolean existeUsuarioPorCorreo(String correo);

    public Usuario buscarPorCorreo(String correo);
}

package com.example.demo.Service;

import com.example.demo.Model.Usuario;
import jakarta.servlet.http.HttpSession;

import java.util.List;

public interface UsuarioService {

    //Logear Usuario
    public boolean login(String correo, String password, HttpSession session);

    // Obtener todos los usuarios
    public List<Usuario> obtenerUsuarios();

    // Obtener usuario por ID
    public Usuario obtenerUsuarioPorId(int id);

    // Crear un nuevo usuario
    public void crearUsuario(Usuario usuario);

    // Actualizar usuario existente
    public void actualizarUsuario(Usuario usuario);

    // Eliminar usuario por ID
    public void eliminarUsuario(int id);

    // Verificar si existe un usuario por correo
    public boolean existeUsuarioPorCorreo(String correo);

    // Buscar usuario por correo
    public Usuario buscarPorCorreo(String correo);
}

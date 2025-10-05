package com.example.demo.Service.Impl;

import com.example.demo.Model.Usuario;
import com.example.demo.Repository.DAO.UsuarioDAO;
import com.example.demo.Service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    private final UsuarioDAO usuarioDAO;

    @Autowired
    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public boolean login(String correo, String password, HttpSession session) {
        Usuario usuario = usuarioDAO.buscarPorCorreo(correo);
        if (usuario != null && usuario.getPassword().equals(password)) {
            session.setAttribute("user", usuario);
            session.setMaxInactiveInterval(30*60);
            return true;
        }
        return false;
    }

    // Obtener todos los usuarios
    public List<Usuario> obtenerUsuarios() {
        return usuarioDAO.obtenerUsuarios();
    }

    // Obtener usuario por ID
    public Usuario obtenerUsuarioPorId(int id) {
        return usuarioDAO.obtenerUsuarioPorId(id);
    }

    // Crear un nuevo usuario
    public void crearUsuario(Usuario usuario) {
        usuarioDAO.crearUsuario(usuario);
    }

    // Actualizar usuario existente
    public void actualizarUsuario(Usuario usuario) {
        usuarioDAO.actualizarUsuario(usuario);
    }

    // Eliminar usuario por ID
    public void eliminarUsuario(int id) {
        usuarioDAO.eliminarUsuario(id);
    }

    // Verificar si existe un usuario por correo
    public boolean existeUsuarioPorCorreo(String correo) {
        return usuarioDAO.existerUsuarioPorCorreo(correo);
    }

    // Buscar usuario por correo
    public Usuario buscarPorCorreo(String correo) {
        return usuarioDAO.buscarPorCorreo(correo);
    }
}

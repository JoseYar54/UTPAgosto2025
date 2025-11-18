package com.example.demo.Service.Impl;

import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.example.demo.Repository.DAO.UsuarioDAO;
import com.example.demo.Service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UsuarioServiceImpl implements UsuarioService {
    private final UsuarioDAO usuarioDAO;

    @Autowired
    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public Usuario login(String correo, String password) {
        Usuario usuario = usuarioDAO.buscarPorCorreo(correo);
        if (usuario != null && usuario.getPassword().equals(password)) {
            return usuario;
        }
        return null;
    }


    public List<Usuario> obtenerUsuariosTodos() {
        return usuarioDAO.obtenerUsuariosTodos();
    }

    public List<Usuario> obtenerUsuariosValidos() {
        return usuarioDAO.obtenerUsuariosValidos();
    }

    public Usuario obtenerUsuarioPorId(int id) {
        return usuarioDAO.obtenerUsuarioPorId(id);
    }

    public boolean crearUsuario(Usuario usuario) {
        return usuarioDAO.crearUsuario(usuario);
    }

    public void actualizarUsuario(Usuario usuario) {
        usuarioDAO.actualizarUsuario(usuario);
    }

    public void eliminarUsuario(int id) {
        usuarioDAO.eliminarUsuario(id);
    }

    public boolean existeUsuarioPorCorreo(String correo) {
        return usuarioDAO.existerUsuarioPorCorreo(correo);
    }

    public Usuario buscarPorCorreo(String correo) {
        return usuarioDAO.buscarPorCorreo(correo);
    }
}

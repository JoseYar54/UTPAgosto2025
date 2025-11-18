package com.example.demo.Controller.Api;

import com.example.demo.Model.Usuario;
import com.example.demo.Service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioRestController {
    private UsuarioService usuarioService;

    @Autowired
    public UsuarioRestController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/listar-usuarios")
    public List<Usuario> listarUsuarios() {
        List<Usuario> usuarios = usuarioService.obtenerUsuariosValidos();
        return usuarios;
    }

    @GetMapping("/total-usuarios")
    public int totalUsuarios() {
        List<Usuario> usuarios = usuarioService.obtenerUsuariosValidos();
        if (usuarios.isEmpty()) return 0;
        return usuarios.size();
    }
}

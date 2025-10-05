package com.example.demo.Controller;

import com.example.demo.Model.Usuario;
import com.example.demo.Service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/gestion/usuarios")
public class UsuarioController {

    private UsuarioService usuarioService;
    @Autowired
    public UsuarioController(UsuarioService usuarioService){
        this.usuarioService = usuarioService;
    }

    @GetMapping
    public String showViewUsers(Model model){
        List<Usuario> listaUsuarios = usuarioService.obtenerUsuarios();
        model.addAttribute("usuarios",listaUsuarios);
        return "gestion-usuarios";
    }
}

package com.example.demo.Controller;

import com.example.demo.Service.Impl.UsuarioServiceImpl;
import com.example.demo.Service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SesionController {

    private UsuarioService usuarioService;

    @Autowired
    public SesionController(UsuarioServiceImpl usuarioServiceImpl) {
        this.usuarioService = usuarioServiceImpl;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "/login";
    }

    @PostMapping("/login")
    public String postLogin(
            @RequestParam(name = "correo", required = true) String correo,
            @RequestParam(name = "password", required = true) String password,
            HttpSession session,
            Model model) {
        if (usuarioService.login(correo, password, session)) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "Correo o contraseña incorrectos");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}

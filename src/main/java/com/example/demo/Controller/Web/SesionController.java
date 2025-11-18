package com.example.demo.Controller.Web;

import com.example.demo.Model.TipoUsuario;
import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.example.demo.Service.Impl.UsuarioServiceImpl;
import com.example.demo.Service.TipoUsuarioService;
import com.example.demo.Service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class SesionController {

    private UsuarioService usuarioService;
    private TipoUsuarioService tipoUsuarioService;

    @Autowired
    public SesionController(
            UsuarioService usuarioService,
            TipoUsuarioService tipoUsuarioService) {
        this.usuarioService = usuarioService;
        this.tipoUsuarioService = tipoUsuarioService;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "/login";
    }

    @PostMapping("/login")
    public String postLogin(
            @RequestParam(name = "correo") String correo,
            @RequestParam(name = "password") String password,
            HttpSession session,
            Model model) {

        Usuario usuario = usuarioService.login(correo, password);
        if (usuario != null) {
            session.setAttribute("user", usuario);

            Venta venta = new Venta();
            venta.setDetalles_Venta(new ArrayList<>());
            venta.setId_usuario(usuario);
            session.setAttribute("ventaActiva", venta);

            session.setMaxInactiveInterval(60*60);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Correo o contraseña incorrectos");
            return "/login";
        }
    }

    @GetMapping("/registrar")
    public String showRegisterPage() {
        return "/registrar";
    }

    @PostMapping("/registrar")
    public String postRegister(
            @RequestParam String nombre_user,
            @RequestParam String apaterno_user,
            @RequestParam String amaterno_user,
            @RequestParam String correo_user,
            @RequestParam String telefono_user,
            @RequestParam String password,
            @RequestParam String confirmar,
            HttpSession session,
            Model model
    ) {
        if (usuarioService.existeUsuarioPorCorreo(correo_user)) {
            model.addAttribute("error", "El correo ya está registrado");
            return "/registrar";
        }

        if (!password.equals(confirmar)) {
            model.addAttribute("error", "Las contraseñas no coinciden");
            return "/registrar";
        }

        Usuario user = Usuario.builder()
                .nombre_user(nombre_user)
                .apaterno_user(apaterno_user)
                .amaterno_user(amaterno_user)
                .correo_user(correo_user)
                .telefono_user(telefono_user)
                .estado_user(true)
                .password(password)
                .tipo_user(tipoUsuarioService.obtenerTipoUsuarioPorId(2))
                .build();

        usuarioService.crearUsuario(user);
        usuarioService.login(user.getCorreo_user(), user.getPassword());
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}

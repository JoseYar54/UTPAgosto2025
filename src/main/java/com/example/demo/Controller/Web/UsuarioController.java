package com.example.demo.Controller.Web;

import com.example.demo.Model.TipoUsuario;
import com.example.demo.Model.Usuario;
import com.example.demo.Service.DetalleVentaService;
import com.example.demo.Service.TipoUsuarioService;
import com.example.demo.Service.UsuarioService;
import com.example.demo.Service.VentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/gestion/usuarios")
public class UsuarioController {

    private UsuarioService usuarioService;
    private VentaService ventaService;
    private TipoUsuarioService tipoUsuarioService;
    private DetalleVentaService detalleVentaService;
    @Autowired
    public UsuarioController(
            UsuarioService usuarioService,
            VentaService ventaService,
            TipoUsuarioService tipoUsuarioService,
            DetalleVentaService detalleVentaService) {
        this.usuarioService = usuarioService;
        this.ventaService = ventaService;
        this.tipoUsuarioService = tipoUsuarioService;
        this.detalleVentaService = detalleVentaService;
    }

    @GetMapping
    public String showViewUsers(
            @RequestParam(name="activador", required = false, defaultValue = "false") boolean verEliminados,
                                Model model){

        List<Usuario> listaUsuarios = verEliminados? usuarioService.obtenerUsuariosTodos(): usuarioService.obtenerUsuariosValidos();

        model.addAttribute("estado",verEliminados);
        model.addAttribute("usuarios",listaUsuarios);
        return "gestion-usuarios";
    }


    @GetMapping("/NuevoUsuario")
    public String showAddUser(
            Model model) {
        List<TipoUsuario> tipoUsuarios = tipoUsuarioService.obtenerTiposUsuario();

        model.addAttribute("tipos", tipoUsuarios);
        model.addAttribute("nuevoUsuario", new Usuario());
        return "usuarios-agregar";
    }

    @GetMapping("/editar/{id}")
    public String userEditPage(@PathVariable Integer id, Model model) {
        Usuario user = usuarioService.obtenerUsuarioPorId(id);
        List<TipoUsuario> tipoUsuarios = tipoUsuarioService.obtenerTiposUsuario();

        model.addAttribute("usuario", user);
        model.addAttribute("tipos", tipoUsuarios);
        model.addAttribute("usuarioEditado", new Usuario());

        return "usuarios-actualizar";
    }

    @PostMapping("/agregarUsuario")
    public String agregarUsuario(
            @ModelAttribute Usuario usuario,
            RedirectAttributes redirigir) {

        if (usuarioService.existeUsuarioPorCorreo(usuario.getCorreo_user()) == false) {
            TipoUsuario tipo = tipoUsuarioService.obtenerTipoUsuarioPorId(usuario.getTipo_user().getId_tipoUsuario());
            usuario.setTipo_user(tipo);
            usuarioService.crearUsuario(usuario);
            redirigir.addFlashAttribute("verificar", 1);
            return "redirect:/gestion/usuarios";
        }else{
            redirigir.addFlashAttribute("msj","El correo ingresado ya esta registrado");
            redirigir.addFlashAttribute("verificar", 0);
            return "redirect:/gestion/usuarios";
        }
    }

    @PostMapping("/editarUsuario")
    public String editarUsuario(
            @ModelAttribute Usuario usuario,
            RedirectAttributes redirigir) {

        TipoUsuario tipo = tipoUsuarioService.obtenerTipoUsuarioPorId(usuario.getTipo_user().getId_tipoUsuario());
        usuario.setTipo_user(tipo);
        usuarioService.actualizarUsuario(usuario);

        redirigir.addFlashAttribute("verificar", 2);
        return "redirect:/gestion/usuarios";
    }

    @PostMapping("/eliminarUsuario")
    public String eliminarUsuario(
            @RequestParam("id_usuario") int id,
            RedirectAttributes redirigir) {
        usuarioService.eliminarUsuario(id);
        redirigir.addFlashAttribute("verificar", 3);
        return "redirect:/gestion/usuarios";
    }

}

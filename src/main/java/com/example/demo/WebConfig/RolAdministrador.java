package com.example.demo.WebConfig;

import com.example.demo.Model.TipoUsuario;
import com.example.demo.Model.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class RolAdministrador implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession sesion = request.getSession(false);

        //Si no hay sesion, el objeto response manda redireccion a "/"
        if(sesion == null || sesion.getAttribute("user") == null){
            response.sendRedirect("/");
            return false;
        }


        Usuario user = (Usuario) sesion.getAttribute("user");
        TipoUsuario tipoUser = user.getTipo_user();

        //Uri es una parte de la url, por ejm /gestion, es parte del path
        String direccion = request.getRequestURI();

        if (direccion.startsWith("/gestion")){
            //A los clientes mandalos al main
            if(tipoUser.getId_tipoUsuario() == 2){
                response.sendRedirect("/");
                return false;
            }
        }

        if (direccion.contains("/editar") || direccion.contains("/eliminar")) {
            if (tipoUser.getId_tipoUsuario() != 1) {
                response.sendRedirect("/gestion");
                return false;
            }
        }

        return true;
    }
}

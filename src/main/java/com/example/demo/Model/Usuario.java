package com.example.demo.Model;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

    @Id
    private int id_usuario;
    private String nombre_user;
    private String apaterno_user;
    private String amaterno_user;
    private String correo_user;
    private String telefono_user;
    private boolean estado_user;
    private String password;
    private TipoUsuario tipo_user;

    @Override
    public String toString() {
        return "Usuario{" +
                "id_usuario=" + id_usuario +
                ", nombre_user='" + nombre_user + '\'' +
                ", apaterno_user='" + apaterno_user + '\'' +
                ", amaterno_user='" + amaterno_user + '\'' +
                ", correo_user='" + correo_user + '\'' +
                ", telefono_user='" + telefono_user + '\'' +
                ", estado_user=" + estado_user +
                ", password=" + password +
                ", tipo_user=" + tipo_user +
                '}';
    }
}

package com.example.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

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
                ", password='" + password + '\'' +
                ", tipo_user=" + tipo_user +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return id_usuario == usuario.id_usuario;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id_usuario);
    }
}

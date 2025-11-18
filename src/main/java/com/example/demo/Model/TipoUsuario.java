package com.example.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class TipoUsuario {

    private int id_tipoUsuario;
    private String nombre_tipoUsuario;
    private String descrip_tipoUsuario;
    private boolean activo_tipoUsuario;

    @Override
    public String toString() {
        return "TipoUsuario{" +
                "id_tipoUsuario=" + id_tipoUsuario +
                ", nombre_tipoUsuario='" + nombre_tipoUsuario + '\'' +
                ", descrip_tipoUsuario='" + descrip_tipoUsuario + '\'' +
                ", activo_tipoUsuario=" + activo_tipoUsuario +
                '}';
    }
}

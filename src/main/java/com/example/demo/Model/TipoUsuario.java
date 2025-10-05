package com.example.demo.Model;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class TipoUsuario {

    @Id
    private int id_tipoUsuario;
    private String nombre_tipoUsuario;
    private String descrip_tipoUsuario;

    @Override
    public String toString() {
        return "TipoUsuario{" +
                "id_tipoUsuario=" + id_tipoUsuario +
                ", nombre_tipoUsuario='" + nombre_tipoUsuario + '\'' +
                ", descrip_tipoUsuario='" + descrip_tipoUsuario + '\'' +
                '}';
    }
}
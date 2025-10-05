package com.example.demo.Model;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Categoria {

    @Id
    private int id_categoria;
    private String nombre_cate;
    private String descrip_cate;

    @Override
    public String toString() {
        return "Categoria{" +
                "id_categoria=" + id_categoria +
                ", nombre_cate='" + nombre_cate + '\'' +
                ", descrip_cate='" + descrip_cate + '\'' +
                '}';
    }
}

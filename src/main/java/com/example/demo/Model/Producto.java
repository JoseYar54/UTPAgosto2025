package com.example.demo.Model;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producto {

    private int id_producto;

    @Id
    private String nombre_pro;
    private String descrip_pro;
    private Categoria categoria_pro;
    private int stock_pro;
    private int anio_pro;
    private double precio_pro;
    private String url_pro;

    @Override
    public String toString() {
        return "Producto{" +
                "id_producto=" + id_producto +
                ", nombre_pro='" + nombre_pro + '\'' +
                ", descrip_pro='" + descrip_pro + '\'' +
                ", categoria_pro=" + categoria_pro +
                ", stock_pro=" + stock_pro +
                ", anio_pro=" + anio_pro +
                ", precio_pro=" + precio_pro +
                ", url_pro='" + url_pro + '\'' +
                '}';
    }    
}
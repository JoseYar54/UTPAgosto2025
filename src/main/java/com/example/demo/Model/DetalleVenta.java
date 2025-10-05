package com.example.demo.Model;

import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetalleVenta {

    @Id
    private int id_detalle;
    private Venta venta;
    private Producto producto;
    private int cantidad_det;
    private double subtotal_det;

    @Override
    public String toString() {
        return "DetalleVenta{" +
                "id_detalle=" + id_detalle +
                ", id_venta=" + venta +
                ", id_producto=" + producto +
                ", cantidad_det=" + cantidad_det +
                ", subtotal_det=" + subtotal_det +
                '}';
    }

    public void establecerSubtotal_det() {
        subtotal_det = cantidad_det * producto.getPrecio_pro();
    }
}

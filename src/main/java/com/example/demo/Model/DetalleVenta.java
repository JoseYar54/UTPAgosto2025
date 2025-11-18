package com.example.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetalleVenta {

    private int id_detalle;
    private Venta venta;
    private Producto producto;
    private int cantidad_det;
    private double subtotal_det;

    @Override
    public String toString() {
        return "DetalleVenta{" +
                "id_detalle=" + id_detalle +
                ", venta=" + venta +
                ", producto=" + producto +
                ", cantidad_det=" + cantidad_det +
                ", subtotal_det=" + subtotal_det +
                '}';
    }

    public void establecerSubtotal_det() {
        if (producto != null) {
            subtotal_det = cantidad_det * producto.getPrecio_pro();
        } else {
            subtotal_det = 0;
        }
    }
}

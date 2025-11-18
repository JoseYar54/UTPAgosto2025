package com.example.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Venta {

    private int id_venta;
    private LocalDateTime fecha_venta;
    private Usuario id_usuario;
    private double total_venta;
    private boolean estado_venta;
    private List<DetalleVenta> detalles_Venta;

    @Override
    public String toString() {
        return "Venta{" +
                "id_venta=" + id_venta +
                ", fecha_venta=" + getFechaFormateada() +
                ", id_usuario=" + id_usuario +
                ", total_venta=" + total_venta +
                ", estado_venta=" + estado_venta +
                ", detalles_Venta=" + detalles_Venta +
                '}';
    }

    public String getFechaFormateada() {
        if (fecha_venta == null) return "";
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        return fecha_venta.format(formato);
    }

    public void establecerTotal_venta() {
        if (detalles_Venta != null && !detalles_Venta.isEmpty()) {
            this.total_venta = detalles_Venta.stream()
                    .mapToDouble(DetalleVenta::getSubtotal_det)
                    .sum();
        } else {
            this.total_venta = 0.0;
        }
    }
}

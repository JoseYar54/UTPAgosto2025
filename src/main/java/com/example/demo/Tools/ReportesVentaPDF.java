package com.example.demo.Tools;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReportesVentaPDF {

    public static void generarReporteVentas(String mensaje, List<Venta> listaVentas, OutputStream puntoSalida) throws Exception {
        Document pdf = new Document(PageSize.A4, 36, 36, 54, 36);
        PdfWriter.getInstance(pdf, puntoSalida);
        pdf.open();

        pdf.add(CellTools.crearEncabezado(mensaje));
        pdf.add(Chunk.NEWLINE);

        PdfPTable tablaDetalles = new PdfPTable(5);
        tablaDetalles.setWidthPercentage(100);
        tablaDetalles.setWidths(new float[]{0.7f, 2.2f, 3.3f, 1.3f, 1.5f});

        String[] encabezadosDetalle = {"ID", "Fecha de Venta", "Cliente", "Cant. Productos", "Total"};
        CellTools.agregarEncabezados(tablaDetalles, encabezadosDetalle, CellTools.fuenteEncabezado);

        for (Venta v : listaVentas) {
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(v.getId_venta()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(v.getFechaFormateada(), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(v.getId_usuario().getApaterno_user() + " " + v.getId_usuario().getAmaterno_user() + " " + v.getId_usuario().getNombre_user(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(v.getDetalles_Venta().stream().mapToInt(DetalleVenta::getCantidad_det).sum()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(CellTools.formatearMoneda(v.getTotal_venta()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
        }

        pdf.add(tablaDetalles);

        double sumaTotal = listaVentas.stream().mapToDouble(Venta::getTotal_venta).sum();

        PdfPTable tablaTotal = new PdfPTable(2);
        tablaTotal.setWidthPercentage(30);
        tablaTotal.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaTotal.setSpacingBefore(10f);

        tablaTotal.addCell(CellTools.crearCeldaSinBordes("TOTAL GENERAL:", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaTotal.addCell(CellTools.crearCelda(CellTools.formatearMoneda(sumaTotal), CellTools.fuenteContenido, Element.ALIGN_CENTER));

        pdf.add(tablaTotal);

        pdf.close();
    }

    public static void generarReporteVentasPorUsuario(List<Venta> listaVentas, OutputStream puntoSalida) throws Exception {
        Document pdf = new Document(PageSize.A4, 36, 36, 54, 36);
        PdfWriter.getInstance(pdf, puntoSalida);
        pdf.open();

        pdf.add(CellTools.crearEncabezado("VENTAS POR USUARIO"));
        pdf.add(Chunk.NEWLINE);

        PdfPTable tablaDetalles = new PdfPTable(5);
        tablaDetalles.setWidthPercentage(100);
        tablaDetalles.setWidths(new float[]{0.7f, 2.2f, 3.3f, 1.3f, 1.5f});

        String[] encabezadosDetalle = {"ID", "Usuario", "Tipo Usuario", "Cant. Compras", "Total"};
        CellTools.agregarEncabezados(tablaDetalles, encabezadosDetalle, CellTools.fuenteEncabezado);

        Map<Usuario, List<Venta>> ventasPorUsuario = listaVentas
                .stream()
                .collect(Collectors.groupingBy(v -> v.getId_usuario()));

        for (Map.Entry<Usuario, List<Venta>> entry : ventasPorUsuario.entrySet()) {
            Usuario user = entry.getKey();
            List<Venta> ventasUsuario = entry.getValue();

            String nombreCompleto = user.getApaterno_user() + " " + user.getAmaterno_user() + " " + user.getNombre_user();
            Integer cantCompras = ventasUsuario.size();
            Double totalVendido = ventasUsuario.stream().mapToDouble(Venta::getTotal_venta).sum();

            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(user.getId_usuario()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(nombreCompleto, CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCelda(user.getTipo_user().getNombre_tipoUsuario(), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(cantCompras), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(CellTools.formatearMoneda(totalVendido), CellTools.fuenteContenido, Element.ALIGN_CENTER));
        }

        pdf.add(tablaDetalles);

        double sumaTotal = listaVentas.stream().mapToDouble(Venta::getTotal_venta).sum();

        PdfPTable tablaTotal = new PdfPTable(2);
        tablaTotal.setWidthPercentage(30);
        tablaTotal.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaTotal.setSpacingBefore(10f);

        tablaTotal.addCell(CellTools.crearCeldaSinBordes("TOTAL GENERAL:", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaTotal.addCell(CellTools.crearCelda(CellTools.formatearMoneda(sumaTotal), CellTools.fuenteContenido, Element.ALIGN_CENTER));

        pdf.add(tablaTotal);
        pdf.close();
    }
}

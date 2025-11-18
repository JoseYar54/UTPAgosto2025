package com.example.demo.Tools;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Producto;
import com.example.demo.Model.Venta;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.OutputStream;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReportesProductoPDF {

    public static void generarReporteStock(List<Producto> listaProductos, OutputStream puntoSalida) throws Exception {
        Document pdf = new Document(PageSize.A4, 36, 36, 54, 36);
        PdfWriter.getInstance(pdf, puntoSalida);
        pdf.open();

        pdf.add(CellTools.crearEncabezado("REPORTE DE PRODUCTOS POR STOCK"));
        pdf.add(Chunk.NEWLINE);

        PdfPTable tablaDetalles = new PdfPTable(5);
        tablaDetalles.setWidthPercentage(100);
        tablaDetalles.setWidths(new float[]{0.7f, 3.8f, 2.5f, 1.5f, 1.5f});

        String[] encabezadosDetalle = {"ID", "Nombre", "Categoría", "Precio", "Stock"};
        CellTools.agregarEncabezados(tablaDetalles, encabezadosDetalle, CellTools.fuenteEncabezado);

        for (Producto p : listaProductos) {
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(p.getId_producto()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(p.getNombre_pro(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCelda(p.getCategoria_pro().getNombre_cate(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCelda(CellTools.formatearMoneda(p.getPrecio_pro()), CellTools.fuenteContenido, Element.ALIGN_RIGHT));
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(p.getStock_pro()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
        }

        pdf.add(tablaDetalles);
        pdf.close();
    }

    public static void generarReportePorProductoVendido(List<DetalleVenta> listaDeDetalles, OutputStream puntoSalida) throws Exception {
        Document pdf = new Document(PageSize.A4, 36, 36, 54, 36);
        PdfWriter.getInstance(pdf, puntoSalida);
        pdf.open();

        pdf.add(CellTools.crearEncabezado("REPORTE DE PRODUCTOS VENDIDOS"));
        pdf.add(Chunk.NEWLINE);

        PdfPTable tablaDetalles = new PdfPTable(6);
        tablaDetalles.setWidthPercentage(100);
        tablaDetalles.setWidths(new float[]{0.7f, 3.8f, 2.5f, 1.5f, 1.5f, 2f});
        String[] encabezadosDetalle = {"ID", "Nombre", "Categoría", "Precio", "Cant. Vendida", "SubTotal Generado"};
        CellTools.agregarEncabezados(tablaDetalles, encabezadosDetalle, CellTools.fuenteEncabezado);

        Map<Producto, List<DetalleVenta>> detallesPorProducto = listaDeDetalles
                .stream()
                .collect(Collectors.groupingBy(d -> d.getProducto()));

        Map<Producto, List<DetalleVenta>> ordenado = detallesPorProducto.entrySet()
                .stream()
                .sorted(Comparator.comparingInt(e -> e.getKey().getId_producto()))
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        (a,b) -> a,
                        LinkedHashMap::new
                ));


        for (Map.Entry<Producto, List<DetalleVenta>> detallesDeProducto : ordenado.entrySet()) {
            Producto producto = detallesDeProducto.getKey();
            List<DetalleVenta> detalles = detallesDeProducto.getValue();

            Integer cant = detalles
                    .stream()
                    .mapToInt(DetalleVenta::getCantidad_det)
                    .sum();
            Double subTotal = detalles
                    .stream()
                    .mapToDouble(DetalleVenta::getSubtotal_det)
                    .sum();

            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(producto.getId_producto()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(producto.getNombre_pro(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCelda(producto.getCategoria_pro().getNombre_cate(), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(CellTools.formatearMoneda(producto.getPrecio_pro()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(String.valueOf(cant), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCelda(CellTools.formatearMoneda(subTotal), CellTools.fuenteContenido, Element.ALIGN_CENTER));
        }

        pdf.add(tablaDetalles);

        //Basicamente flatmap hace que los valores pasen a ser una lista entera de detalles cada uno de sus valores
        double sumaTotal = detallesPorProducto.values().stream()
                .flatMap(List::stream)
                .mapToDouble(DetalleVenta::getSubtotal_det)
                .sum();

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
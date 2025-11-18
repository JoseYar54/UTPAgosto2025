package com.example.demo.Tools;

import com.example.demo.Model.DetalleVenta;
import com.example.demo.Model.Usuario;
import com.example.demo.Model.Venta;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.OutputStream;

public class GenerarBoletaPDF {

    public static void generarBoleta(Venta venta, OutputStream puntoSalida) throws Exception {
        venta.establecerTotal_venta();
        // Creando documento
        Document pdf = new Document(PageSize.A4, 36, 36, 54, 36);
        PdfWriter.getInstance(pdf, puntoSalida);
        pdf.open();

        //ENCABEZADO
        PdfPTable tablaEncabezado = new PdfPTable(2);
        tablaEncabezado.setWidthPercentage(100);
        tablaEncabezado.setWidths(new float[]{2f, 5f});

        //Logo
        PdfPCell celdaLogo = CellTools.celdaLogo();
        tablaEncabezado.addCell(celdaLogo);

        //Info
        PdfPTable tablaDatosEncabezado = new PdfPTable(1);
        tablaDatosEncabezado.setWidthPercentage(100);

        PdfPCell celdaRUC = new PdfPCell(new Phrase("RUC: 10777944890", CellTools.fuenteEncabezado));
        celdaRUC.setBorder(PdfPCell.NO_BORDER);
        celdaRUC.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaDatosEncabezado.addCell(celdaRUC);

        String mensaje = venta.isEstado_venta()? "BOLETA DE VENTA":"BOLETA ANULADA";

        PdfPCell celdaBoleta = new PdfPCell(new Phrase(mensaje, CellTools.fuenteTitulo));
        celdaBoleta.setBorder(PdfPCell.NO_BORDER);
        celdaBoleta.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaDatosEncabezado.addCell(celdaBoleta);

        String correlativo = String.format("N°%08d", venta.getId_venta());
        PdfPCell celdaCorrelativo = new PdfPCell(new Phrase(correlativo, CellTools.fuenteContenido));
        celdaCorrelativo.setBorder(PdfPCell.NO_BORDER);
        celdaCorrelativo.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaDatosEncabezado.addCell(celdaCorrelativo);

        PdfPCell celdaDatosEncabezado = new PdfPCell(tablaDatosEncabezado);
        celdaDatosEncabezado.setBorder(PdfPCell.NO_BORDER);
        tablaEncabezado.addCell(celdaDatosEncabezado);

        pdf.add(tablaEncabezado);
        pdf.add(Chunk.NEWLINE);

        //TABLA PRINCIPAL
        PdfPTable tablaPrincipal = new PdfPTable(1);
        tablaPrincipal.setWidthPercentage(100);

        //Tabla de detalles
        PdfPTable tablaDetalles = new PdfPTable(6);
        tablaDetalles.setWidthPercentage(100);
        tablaDetalles.setWidths(new float[]{0.7f, 2.5f, 4f, 1.5f, 1f, 2f});

        //Encabezados detalles
        String[] encabezadosDetalle = {"ID", "Nombre", "Descripción", "Precio U.", "Cant.", "Subtotal"};
        CellTools.agregarEncabezados(tablaDetalles,encabezadosDetalle,CellTools.fuenteEncabezado);

        //Tabla datos generales
        PdfPTable tablaDatosGenerales = new PdfPTable(2);
        tablaDatosGenerales.setWidthPercentage(70);
        tablaDatosGenerales.setWidths(new float[]{3f, 7f});

        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes("Fecha de Emisión: ", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes(venta.getFechaFormateada(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes("ID Cliente: ", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes(String.valueOf(venta.getId_usuario().getId_usuario()), CellTools.fuenteContenido, Element.ALIGN_LEFT));

        Usuario user = venta.getId_usuario();
        String nombreCompleto = user.getApaterno_user() + " " + user.getAmaterno_user() + " " + user.getNombre_user();
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes("Cliente: ", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes(nombreCompleto, CellTools.fuenteContenido, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes("Teléfono: ", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaDatosGenerales.addCell(CellTools.crearCeldaSinBordes(venta.getId_usuario().getTelefono_user(), CellTools.fuenteContenido, Element.ALIGN_LEFT));

        PdfPCell cellContenedorDatoGenerales = new PdfPCell(tablaDatosGenerales);
        cellContenedorDatoGenerales.setBorderWidthBottom(1);
        cellContenedorDatoGenerales.setPaddingTop(6f);
        cellContenedorDatoGenerales.setPaddingBottom(6f);
        cellContenedorDatoGenerales.setPaddingLeft(4f);
        cellContenedorDatoGenerales.setPaddingRight(4f);

        // DETALLES DE COMPRA
        for (DetalleVenta detalle : venta.getDetalles_Venta()) {
            tablaDetalles.addCell(CellTools.crearCeldaBordesLaterales(String.valueOf(detalle.getProducto().getId_producto()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCeldaSinBordes(detalle.getProducto().getNombre_pro(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCeldaSinBordes(detalle.getProducto().getDescrip_pro(), CellTools.fuenteContenido, Element.ALIGN_LEFT));
            tablaDetalles.addCell(CellTools.crearCeldaSinBordes(CellTools.formatearMoneda(detalle.getProducto().getPrecio_pro()), CellTools.fuenteContenido, Element.ALIGN_RIGHT));
            tablaDetalles.addCell(CellTools.crearCeldaSinBordes(String.valueOf(detalle.getCantidad_det()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
            tablaDetalles.addCell(CellTools.crearCeldaBordesLaterales(CellTools.formatearMoneda(detalle.getSubtotal_det()), CellTools.fuenteContenido, Element.ALIGN_CENTER));
        }

        PdfPCell cellContenedorDetalles = new PdfPCell(tablaDetalles);
        cellContenedorDetalles.setBorderWidthBottom(1);
        cellContenedorDetalles.setPadding(0f);

        // Espacio entre tablas
        PdfPCell celdaEspacio = new PdfPCell(new Paragraph(" "));
        celdaEspacio.setBorder(PdfPCell.NO_BORDER);
        celdaEspacio.setFixedHeight(8f);

        // TABLA RESUMEN
        PdfPTable tablaResumen = new PdfPTable(2);
        tablaResumen.setWidthPercentage(40f);
        tablaResumen.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaResumen.setSpacingBefore(8f);
        tablaResumen.setWidths(new float[]{2f, 1f});

        double costoBruto = venta.getTotal_venta() - venta.getTotal_venta()*0.18;
        double igv = venta.getTotal_venta()*0.18;
        double total = venta.getTotal_venta();

        tablaResumen.addCell(CellTools.crearCeldaSinBordes("Costo Bruto:", CellTools.fuenteContenido, Element.ALIGN_LEFT));
        tablaResumen.addCell(CellTools.crearCeldaSinBordes(CellTools.formatearMoneda(costoBruto), CellTools.fuenteContenido, Element.ALIGN_RIGHT));
        tablaResumen.addCell(CellTools.crearCeldaSinBordes("IGV (18%):", CellTools.fuenteContenido, Element.ALIGN_LEFT));
        tablaResumen.addCell(CellTools.crearCeldaSinBordes(CellTools.formatearMoneda(igv), CellTools.fuenteContenido, Element.ALIGN_RIGHT));
        tablaResumen.addCell(CellTools.crearCeldaSinBordes("Importe Total:", CellTools.fuenteEncabezado, Element.ALIGN_LEFT));
        tablaResumen.addCell(CellTools.crearCeldaSinBordes(CellTools.formatearMoneda(total), CellTools.fuenteEncabezado, Element.ALIGN_RIGHT));

        // Agregar todo a la tabla principal
        tablaPrincipal.addCell(cellContenedorDatoGenerales);
        tablaPrincipal.addCell(celdaEspacio);
        tablaPrincipal.addCell(cellContenedorDetalles);
        tablaPrincipal.addCell(tablaResumen);

        pdf.add(tablaPrincipal);
        pdf.close();
    }
}
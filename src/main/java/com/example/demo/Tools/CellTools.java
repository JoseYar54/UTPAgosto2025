package com.example.demo.Tools;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

public class CellTools {

    public static Font fuenteTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
    public static Font fuenteEncabezado = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD);
    public static Font fuenteContenido = new Font(Font.FontFamily.HELVETICA, 10);

    public static PdfPCell celdaLogo() throws Exception {
        Image logo = Image.getInstance("https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png");
        logo.scaleAbsolute(60, 60);
        PdfPCell celdaLogo = new PdfPCell(logo, false);
        celdaLogo.setBorder(PdfPCell.NO_BORDER);
        celdaLogo.setVerticalAlignment(Element.ALIGN_MIDDLE);
        celdaLogo.setPaddingRight(10f);
        return celdaLogo;
    }

    public static void agregarEncabezados(PdfPTable tabla, String[] encabezados, Font fuente) {
        for (String texto : encabezados) {
            PdfPCell celda = new PdfPCell(new Phrase(texto, fuente));
            celda.setBackgroundColor(BaseColor.LIGHT_GRAY);
            celda.setHorizontalAlignment(Element.ALIGN_CENTER);
            celda.setPadding(5f);
            tabla.addCell(celda);
        }
    }

    public static PdfPCell crearCelda(String texto, Font fuente, int alineacion) {
        PdfPCell celda = new PdfPCell(new Phrase(texto, fuente));
        celda.setHorizontalAlignment(alineacion);
        celda.setPadding(4f);
        return celda;
    }

    public static PdfPCell crearCeldaSinBordes(String texto, Font fuente, int alineacion) {
        PdfPCell celda = new PdfPCell(new Phrase(texto, fuente));
        celda.setHorizontalAlignment(alineacion);
        celda.setBorder(PdfPCell.NO_BORDER);
        celda.setPadding(4f);
        return celda;
    }

    public static PdfPCell crearCeldaBordesLaterales(String texto, Font fuente, int alineacion) {
        PdfPCell celda = new PdfPCell(new Phrase(texto, fuente));
        celda.setHorizontalAlignment(alineacion);
        celda.setBorderWidthLeft(1);
        celda.setBorderWidthRight(1);
        celda.setBorderWidthTop(0);
        celda.setBorderWidthBottom(0);
        celda.setPadding(4f);
        return celda;
    }

    public static PdfPCell crearCeldaBordesSupInf(String texto, Font fuente, int alineacion) {
        PdfPCell celda = new PdfPCell(new Phrase(texto, fuente));
        celda.setHorizontalAlignment(alineacion);
        celda.setBorderWidthTop(1);
        celda.setBorderWidthBottom(1);
        celda.setBorderWidthLeft(0);
        celda.setBorderWidthRight(0);
        celda.setPadding(4f);
        return celda;
    }

    public static String formatearMoneda(double valor) {
        return String.format("S/. %.2f", valor);
    }

    // Crea tabla de encabezado reutilizable
    public static PdfPTable crearEncabezado(String mensaje) throws Exception {
        PdfPTable tablaEncabezado = new PdfPTable(2);
        tablaEncabezado.setWidthPercentage(100);
        tablaEncabezado.setWidths(new float[]{2f, 5f});

        tablaEncabezado.addCell(celdaLogo());

        PdfPTable tablaDatos = new PdfPTable(1);
        tablaDatos.setWidthPercentage(100);

        PdfPCell celdaTitulo1 = new PdfPCell(new Phrase("REPORTE GENERADO", fuenteEncabezado));
        celdaTitulo1.setBorder(PdfPCell.NO_BORDER);
        celdaTitulo1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaDatos.addCell(celdaTitulo1);

        PdfPCell celdaTitulo2 = new PdfPCell(new Phrase(mensaje, fuenteTitulo));
        celdaTitulo2.setBorder(PdfPCell.NO_BORDER);
        celdaTitulo2.setHorizontalAlignment(Element.ALIGN_RIGHT);
        tablaDatos.addCell(celdaTitulo2);

        PdfPCell celdaDatos = new PdfPCell(tablaDatos);
        celdaDatos.setBorder(PdfPCell.NO_BORDER);
        tablaEncabezado.addCell(celdaDatos);

        return tablaEncabezado;
    }

}

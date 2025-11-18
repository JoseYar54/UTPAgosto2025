// =======================
// COLORES
// =======================
const colores = [
    "#AEC6CF",
    "#FFB347",
    "#B39EB5",
    "#77DD77",
    "#FF6961",
    "#FDFD96",
    "#CFCFC4",
    "#B0E0E6",
    "#FFD1DC",
    "#C1E1C1",
    "#F9CB9C",
    "#A2C2E0",
    "#D7BDE2",
    "#FAD7A0",
    "#ABEBC6",
    "#F5B7B1",
    "#FDEBD0",
    "#E8DAEF",
    "#FCF3CF"];


function obtenerColores(arrayColores, cantidad) {
    if (cantidad > arrayColores.length) {
        cantidad = arrayColores.length;
    }

    const seleccionados = [];

    for (let i = 0; i < cantidad; i++) {
        const indiceAleatorio = Math.floor(Math.random() * arrayColores.length);
        const color = arrayColores[indiceAleatorio];
        seleccionados.push(color);
    }

    return seleccionados;
}


// =======================
// PANELES
// =======================
function generarPanelitos() {
    crearPanelito("/api/ventas/promedio-por-ticket", "promedio", true);
    crearPanelito("/api/usuarios/total-usuarios", "cant_users", false);
    crearPanelito("/api/ventas/total-ventas", "total_venta", true);
}

function crearPanelito(dataURL, div_contenedor, habilitar_decimales) {
    fetch(dataURL)
        .then(rpta => rpta.json())
        .then(data => {
            const numero = parseFloat(data);

            let formateado;

            if (habilitar_decimales == true) {
                formateado = numero.toLocaleString("es-PE", {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                });
            } else {
                formateado = numero.toLocaleString("es-PE", {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 0
                });
            }

            document.getElementById(div_contenedor).textContent = formateado;
            console.log("Panelito generado :D");
        })
        .catch(error => {
            console.log("Error capturado al crear panelito");
            console.error("Error generado", error);
        });
}


// =======================
// GRAFICOS
// =======================
function crearGraficos() {

    function dibujarGrafico(tipoGrafico, detallesGrafico, dataURL, Valor1, Valor2, div_contenedor) {
        fetch(dataURL)
            .then(rpta => rpta.json())
            .then(data => {
                let dataGrafico = [[Valor1, Valor2]];
                for (const key in data) {
                    dataGrafico.push([key, data[key]]);
                }

                let dataTransformada = google.visualization.arrayToDataTable(dataGrafico);

                const cantidadColores = dataGrafico.length - 1;
                const coloresSeleccionados = obtenerColores(colores, cantidadColores);

                detallesGrafico.colors = coloresSeleccionados;

                if (!google.visualization[tipoGrafico]) {
                    throw new Error("Tipo de gráfico no válido D:");
                }

                let graficoGenerado = new google.visualization[tipoGrafico](
                    document.getElementById(div_contenedor)
                );

                graficoGenerado.draw(dataTransformada, detallesGrafico);

                window.addEventListener('resize', () => {
                    graficoGenerado.draw(dataTransformada, detallesGrafico);
                });

                console.log(`Gráfico "${div_contenedor}" generado :D`);
            })
            .catch(error => {
                console.log("Error capturado al crear gráfico");
                console.error("Error generado", error);
            });
    }

    // Grafico #1: Cantidad total de productos vendidos por mes
    dibujarGrafico(
        "ColumnChart",
        {
            title: "Cantidad Total de Productos Vendidos por Mes",
            legend: { position: "none" },
            chartArea: { width: "75%", left: 100, height: "80%" },
            annotations: { alwaysOutside: true, textStyle: { fontSize: 12 } },
        },
        "/api/ventas/cantidad-productos-por-mes",
        "Mes",
        "Unidades Vendidas",
        "chart1"
    );

    // Grafico #2: Promedio del ticket mensual
    dibujarGrafico(
        "LineChart",
        {
            title: "Promedio del Ticket Mensual",
            legend: { position: "none" },
            curveType: "function",
            chartArea: { width: "75%", left: 100, height: "80%" },
            annotations: { alwaysOutside: true, textStyle: { fontSize: 12 } },
                    lineWidth: 5,
                    pointSize: 6,
                    curveType: "function"
                  },
        "/api/ventas/promedio-ticket-mensual",
        "Mes",
        "Promedio (S/.)",
        "chart2"
    );


    // Grafico #3: Ventas mensuales
    dibujarGrafico(
      "LineChart",
      {
        title: "Ventas Mensuales",
        legend: { position: "bottom" },
        chartArea: { width: "75%", left: 100, height: "80%" },
        annotations: { alwaysOutside: true, textStyle: { fontSize: 12 } },
        lineWidth: 5,
        pointSize: 6,
        curveType: "function"
      },
      "/api/ventas/venta-por-mes",
      "Mes",
      "Se vendió: S/",
      "chart3"
    );



    // Grafico #4: Cantidad de Ventas por categoria
    dibujarGrafico(
        "ColumnChart",
        {
            title: "Cantidad de Ventas por Mes",
            legend: { position: "none" },
            chartArea: { width: "75%", left: 100, height: "80%" },
            vAxis: { title: "Cantidad", textStyle: { fontSize: 12 } },
            hAxis: { title: "Mes", textStyle: { fontSize: 12 } },
            annotations: { alwaysOutside: true, textStyle: { fontSize: 12 } }
        },
        "/api/ventas/cant-ventas-por-mes",
        "Meses",
        "Cantidad",
        "chart4"
    );

}

// =======================
// EJECUTAR
// =======================
document.addEventListener("DOMContentLoaded", () => {
    generarPanelitos();

    google.charts.load("current", {
        packages: ["corechart", "bar", "line", "table"]
    });
    google.charts.setOnLoadCallback(crearGraficos);
});

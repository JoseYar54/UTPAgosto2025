<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="icon" type="image/png" href="https://static.vecteezy.com/system/resources/previews/036/331/638/original/bottle-of-wine-icon-png.png">
</head>
<body>
    <!-- header -->
    <jsp:include page="header.jsp" />
    <!-- header -->

    <!-- Encabezado -->
    <section class="page-header text-center text-white">
        <div class="container position-relative">
            <h1 class="display-4 fw-bold mb-3">Algo salio mal D:</h1>
            <h2 class="titulo-dorado mb-3">Ha ocurrido un error inesperado.</h2>
            <p class="lead mb-0 fw-bold">Regresar a la Página Principal</p>
        </div>
        <div class="container">

            <a href="/" class="btn btn-success mt-2">Regresar</a>
        </div>
    </section>

    <style>
        :root {
            --color1: #2c0b17;
            --color2: #80666e;
            --color3: #272727;
            --color4: #ffffff;
            --color5: #723659af;
        }

        .page-header {
          position: relative;
              background-image:
                      linear-gradient(rgba(97, 34, 55, 0.7),
                      rgba(97, 34, 55, 0.7)),
                      url('https://www.losvinos.com.ar/wp-content/uploads/2019/10/bartender.jpeg');
              background-position: center;
              background-size: cover;
              background-repeat: no-repeat;
              color: var(--marfil);
              padding: 100px 20px;
              text-align: center;
        }

        .main-texto h1 {
            color: var(--color4);
            font-weight: bold;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
        }

        .main-texto p {
            color: var(--color4);
            font-weight: 600;
        }

        .btn-primary {
            background-color: var(--color1);
            border: none;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary:hover {
            background-color: var(--color2);
            transform: scale(1.05);
        }
    </style>

    <!-- footer -->
    <jsp:include page="footer.jsp" />
    <!-- footer -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



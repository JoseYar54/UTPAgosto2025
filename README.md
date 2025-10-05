<<<<<<< HEAD
>> # La Taberna de Roly

Proyecto personal de E-commerce desarrollado con Java, Spring Boot, Bootstrap, JavaScript, CSS y JSP, inspirado en una tienda de vinos y licores.
Nació como parte de mis estudios universitarios en Ingeniería de Sistemas, y con el tiempo se convirtió en un proyecto de práctica para mejorar mis habilidades, arquitectura MVC y manejo de bases de datos.
--------------------------------

> ## Sobre el proyecto

La Taberna de Roly es una aplicación web que simula una tienda online de productos de licorería.
El proyecto combina varios conceptos del desarrollo con Java, como:

 - *Arquitectura MVC*

 - *Framework Spring Boot*

 - *Conexión a bases de datos relacionales*

 - *JSP y controladores*

 - *Principios SOLID*
--------------------------------

> ## Tecnologías utilizadas



| Categoría|Tecnologías|
|----------|----------|
|Lenguaje principal|Java 17|
|Framework Backend|Spring Boot|
|Base de datos|Se utilizó la BD integrada H2|
|Frontend|HTML, CSS, JSP|
|Framework Frontend|Bootstrap|


	
----------------------------------



---------------------
> ## Estructura del proyecto
```
La-taberna/
├───.idx
├───.mvn
│   └───wrapper
├───src
│   ├───main
│   │   ├───java
│   │   │   └───com
│   │   │       └───example
│   │   │           └───demo
│   │   │               ├───Controller
│   │   │               ├───Model
│   │   │               ├───Repository
│   │   │               │   └───DAO
│   │   │               └───Service
│   │   │                   └───Impl
│   │   ├───resources
│   │   │   └───static
│   │   │       ├───css
│   │   │       ├───img
│   │   │       └───js
│   │   └───webapp
│   │       └───WEB-INF
│   │           └───views
│   └───test
│       └───java
│           └───com
│               └───example
│                   └───demo
└───target
    ├───classes
    │   ├───com
    │   │   └───example
    │   │       └───demo
    │   │           ├───Controller
    │   │           ├───Model
    │   │           ├───Repository
    │   │           │   └───DAO
    │   │           └───Service
    │   │               └───Impl
    │   └───static
    │       ├───css
    │       ├───img
    │       └───js
    ├───generated-sources
    │   └───annotations
    ├───generated-test-sources
    │   └───test-annotations
    ├───maven-status
    │   └───maven-compiler-plugin
    │       ├───compile
    │       │   └───default-compile
    │       └───testCompile
    │           └───default-testCompile
    └───test-classes
        └───com
            └───example
                └───demo
```
---------------------
> ## Estado del proyecto

En desarrollo continuo. Cada nueva versión incluye mejoras, optimización del código y experimentos con nuevas funcionalidades para el ecosistema del proyecto. 

------------------------
> ## Datos generales:
### Autor: De la Cruz Yarleque, José Raúl
### Curso: Diseño Web Integrado - Ciclo Agosto 2025
### Docente: Mg. Zarate Mendoza Roberto Geronimo 
=======

# La Taberna de Roly

Este es un proyecto de E-commerce para una tienda de vinos y licores.

## Cómo ejecutar la aplicación

Para ejecutar esta aplicación Spring Boot, sigue estos pasos:

1.  Abre una terminal en la raíz del proyecto.
2.  Ejecuta el siguiente comando:

    ```bash
    mvn spring-boot:run
    ```

3.  Una vez que la aplicación se haya iniciado, puedes acceder a ella en tu navegador web en la siguiente dirección: [http://localhost:8080](http://localhost:8080)

### Posible problema: El puerto 8080 ya está en uso

Si recibes un error indicando que el puerto 8080 ya está en uso, significa que otra aplicación (posiblemente una instancia anterior de esta misma aplicación) ya está usando ese puerto.

Para solucionarlo, puedes hacer lo siguiente:

1.  **Cambiar el puerto de la aplicación:**
    *   Abre el archivo `src/main/resources/application.properties`.
    *   Añade la siguiente línea para cambiar el puerto a, por ejemplo, 8081:
        ```properties
        server.port=8081
        ```
    *   Guarda el archivo y vuelve a ejecutar la aplicación. Ahora estará disponible en `http://localhost:8081`.

o

2.  **Detener el proceso que usa el puerto 8080:**
    *   En la terminal, puedes usar el siguiente comando para encontrar el ID del proceso (PID) que está usando el puerto 8080:
        ```bash
        lsof -i :8080
        ```
    *   Una vez que tengas el PID, puedes detener ese proceso con el siguiente comando (reemplaza `PID` con el número que obtuviste):
        ```bash
        kill PID
        ```
    *   Después de detener el proceso, puedes intentar ejecutar tu aplicación de nuevo con `mvn spring-boot:run`.

>>>>>>> db73030985d450032bc1078fb0b8f59c1a55f991

# Sistema de Gestión de Ventas - Minimarket "La Rotonda"

### Descripción del Proyecto
Este proyecto tiene como objetivo el desarrollo de un sistema de gestión de ventas para el minimarket "La Rotonda". El sistema permite registrar productos mediante un escáner, gestionar el stock en cada venta, manejar turnos y aceptar múltiples medios de pago. El proyecto fue diseñado para mejorar la eficiencia operativa del minimarket, asegurando un control detallado de las ventas y el stock en tiempo real.

### Tecnologías Utilizadas
* Backend: Java
* Base de Datos: MySQL
  * Recomendación: Utilizar PhpMyAdmin por medio de [XAMPP](https://www.apachefriends.org/download.html) para la óptima ejecuación.
* Diagrama de Despliegue UML: Describiendo la infraestructura de red para el proyecto, con la base de datos y el servidor de aplicación.
* IDE utilizado en la elaboración del proyecto:
  * [IntelliJ IDEA Community Edition](https://www.jetbrains.com/idea/download/?section=windows)

### Arquitectura del Sistema
El sistema está compuesto por las siguientes tablas principales:
* productos: Almacena la información de los productos disponibles en el minimarket.
* ventas: Registra cada transacción realizada.
* venta_productos: Relaciona los productos vendidos en cada venta.
* usuarios: Almacena la información de los usuarios del sistema (empleados del minimarket).

### Modelo de la Base de Datos
La base de datos se ha diseñado de manera eficiente para manejar relaciones one-to-many entre los productos, las ventas y los usuarios. Un diagrama de entidad-relación describe estas relaciones de forma detallada.

### Consulta SQL de Reporte de Ventas
Se puede generar un reporte detallado de ventas utilizando la siguiente consulta SQL:
```
SELECT 
    u.name AS usuario_encargado,
    v.id AS numero_venta,
    v.price AS precio_venta,
    GROUP_CONCAT(p.name SEPARATOR ', ') AS productos_venta,
    v.created_at AS fecha_venta
FROM
    la_rotonda.ventas v
JOIN
    la_rotonda.usuarios u ON v.id_user = u.id
JOIN
    la_rotonda.venta_productos vp ON v.id = vp.id_venta
JOIN
    la_rotonda.productos p ON vp.id_producto = p.id
GROUP BY 
    v.id;
```
Este query permite extraer información clave sobre las ventas, incluyendo el nombre del usuario responsable, el número de la venta, el precio total, los productos vendidos y la fecha en que se realizó la transacción.

### Etapa de Pruebas
La etapa de pruebas del sistema incluye los siguientes artefactos:
* Plan de pruebas: Define los casos de prueba a implementar.
* Modelo de pruebas: Comprende los casos de prueba, procedimientos y componentes a evaluar.
* Tratamiento de defectos: Establece las estrategias para la detección y resolución de errores.
* Evaluación de pruebas: Analiza la efectividad del sistema basado en los resultados obtenidos de las pruebas.

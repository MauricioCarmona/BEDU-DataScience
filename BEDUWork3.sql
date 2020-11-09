# RETO 1: Subconsultas
USE tienda;
#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre, apellido_paterno FROM empleado WHERE id_puesto IN
(SELECT id_puesto
	FROM puesto
    WHERE salario > 10000);
# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
	(SELECT clave, id_empleado, count(*) total_ventas
		FROM venta
        GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;
# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave, id_articulo FROM venta
	WHERE id_articulo IN (
    SELECT id_articulo FROM
    articulo WHERE precio > 5000);
    
    
    
#RETO 2: Joins
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave, nombre, apellido_paterno
FROM venta
JOIN empleado
ON venta.id_empleado = empleado.id_empleado
ORDER BY clave;
# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre
FROM venta
JOIN articulo
ON venta.id_articulo = a.id_articulo
ORDER BY clave;
# ¿Cuál es el total de cada venta?
SELECT clave, round(sum(precio),2) AS total
FROM venta
JOIN articulo
ON venta.id_articulo = articulo.id_articulo
GROUP BY clave
ORDER BY clave;


# VISTAS

SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN articulo AS a
ON v.id_articulo = a.id_articulo;

CREATE VIEW tickets050 AS 
(SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN articulo AS a
ON v.id_articulo = a.id_articulo);
